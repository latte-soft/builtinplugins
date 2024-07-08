local l_RunService_0 = game:GetService("RunService");
local l_HttpService_0 = game:GetService("HttpService");
local v2 = require(script.Parent.Parent.Parent.Packages.Framework);
local l_Cryo_0 = v2.Util.Cryo;
local v4 = require(script.Parent.BacktraceInterfaces);
local v5 = require(script.Parent.BacktraceReport);
local v6 = require(script.Parent.Parent.ErrorQueue);
local l_Url_0 = v2.RobloxAPI.Url;
local l_IAnnotations_0 = v5.IAnnotations;
local l_IAttributes_0 = v5.IAttributes;
local v10 = l_RunService_0:IsStudio();
local v11 = {};
v11.__index = v11;
v11.new = function(v12)
    assert(v4.IBacktraceReporter(v12));
    assert(#v12.accessToken > 0, "Expected accessToken to be a non-empty string");
    local v13 = {
        _errorQueue = nil, 
        _networking = v12.networking, 
        _accessToken = v12.accessToken, 
        _processErrorReportMethod = v12.processErrorReportMethod, 
        _generateLogMethod = v12.generateLogMethod, 
        _sharedAttributes = {}, 
        _sharedAnnotations = {}, 
        _logIntervalInSeconds = v12.logIntervalInSeconds or 10, 
        _lastLogTime = 0, 
        _isEnabled = true
    };
    setmetatable(v13, v11);
    v13._errorQueue = v6.new(function(_, v15, v16)
        local l_log_0 = v15.log;
        local l_backtraceReport_0 = v15.backtraceReport;
        l_backtraceReport_0:addAttributes({
            ErrorCount = v16
        });
        v13:sendErrorReport(l_backtraceReport_0, l_log_0);
    end, v12.queueOptions);
    if not _G.__TESTEZ_RUNNING_TEST__ then
        v13._errorQueue:startTimer();
    end;
    return v13;
end;
v11.getUploadUrl = function(v19, v20)
    return l_Url_0.composeUrl("https://upload.crashes.rbxinfra.com", "post", l_Cryo_0.Dictionary.join({
        token = v19._accessToken
    }, v20));
end;
v11.sendErrorReport = function(v21, v22, v23)
    if _G.__TESTEZ_RUNNING_TEST__ then
        assert(v22:validate());
    end;
    local l_status_0, l_result_0 = pcall(function()
        return l_HttpService_0:JSONEncode(v22);
    end);
    if l_status_0 then
        v21._networking:parseJson((v21._networking:post(v21:getUploadUrl({
            format = "json"
        }), l_result_0, {
            ["Content-Type"] = "application/json"
        }))):andThen(function(v26)
            if not (type(v23) == "string") or #v23 == 0 then
                return ;
            else
                local l__rxid_0 = v26.responseBody._rxid;
                if l__rxid_0 == nil then
                    return ;
                else
                    v21._networking:post(v21:getUploadUrl({
                        object = l__rxid_0, 
                        attachment_name = "log.txt"
                    }), v23, {
                        ["Content-Type"] = "text/plain"
                    }):catch(function(v28)
                        warn("Failed to report a log with message : ", (tostring(v28)));
                    end);
                    return ;
                end;
            end;
        end):catch(function(v29)
            warn("Failed to send a report with message : ", (tostring(v29)));
        end);
        return ;
    else
        warn("Cannot convert report to JSON");
        return ;
    end;
end;
v11._generateLog = function(v30)
    local v31 = v30._logIntervalInSeconds < tick() - v30._lastLogTime;
    if not (not (v30._generateLogMethod ~= nil) or not v31) then
        v30._lastLogTime = tick();
        local l_status_1, l_result_1 = pcall(v30._generateLogMethod);
        if (l_status_1 and type(l_result_1) == "string") and #l_result_1 > 0 then
            return l_result_1;
        end;
    end;
    return nil;
end;
v11._generateErrorReport = function(v34, v35, v36, v37)
    local v38 = v5.fromMessageAndStack(v35, v36);
    v38:addAttributes(v34._sharedAttributes);
    v38:addAnnotations(v34._sharedAnnotations);
    if type(v37) == "string" and v37 ~= "" then
        v38:addAnnotations({
            stackDetails = v37
        });
    end;
    return v38;
end;
v11.reportErrorImmediately = function(v39, v40, v41, v42)
    if v39._isEnabled then
        local v43 = v39:_generateErrorReport(v40, v41, v42);
        if v39._processErrorReportMethod ~= nil then
            v43 = v39._processErrorReportMethod(v43);
        end;
        v39:sendErrorReport(v43, (v39:_generateLog()));
        return ;
    else
        return ;
    end;
end;
v11.reportErrorDeferred = function(v44, v45, v46, v47, v48)
    if v44._isEnabled then
        local v49 = string.format("%s | %s | %s", v45, v46, not not v48 and l_HttpService_0:GenerateGUID(false) or "");
        local v50 = {};
        if not v44._errorQueue:hasError(v49) then
            local v51 = v44:_generateErrorReport(v45, v46, v47);
            if v44._processErrorReportMethod ~= nil then
                v51 = v44._processErrorReportMethod(v51);
            end;
            v50 = {
                backtraceReport = v51, 
                log = v44:_generateLog()
            };
        end;
        v44._errorQueue:addError(v49, v50);
        return ;
    else
        return ;
    end;
end;
v11.updateSharedAttributes = function(v52, v53)
    local v54 = l_Cryo_0.Dictionary.join(v52._sharedAttributes, v53);
    local v55, v56 = l_IAttributes_0(v54);
    if not v55 then
        if not _G.__TESTEZ_RUNNING_TEST__ then
            return ;
        else
            assert(v55, v56);
        end;
    end;
    v52._sharedAttributes = v54;
end;
v11.updateSharedAnnotations = function(v57, v58)
    local v59 = l_Cryo_0.Dictionary.join(v57._sharedAnnotations, v58);
    local v60, v61 = l_IAnnotations_0(v59);
    if not v60 then
        if not v10 and not _G.__TESTEZ_RUNNING_TEST__ then
            return ;
        else
            assert(v60, v61);
        end;
    end;
    v57._sharedAnnotations = v59;
end;
v11.reportAllErrors = function(v62)
    if v62._errorQueue ~= nil then
        v62._errorQueue:reportAllErrors();
    end;
end;
v11.stop = function(v63)
    v63._isEnabled = false;
    if v63._errorQueue ~= nil then
        v63._errorQueue:stopTimer();
    end;
end;
return v11;
