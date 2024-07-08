local l_StudioErrorReporterFilterJunkCallstacks_0 = game:GetFastFlag("StudioErrorReporterFilterJunkCallstacks");
local l_ReportOTAPluginVersionToBacktrace2_0 = game:GetFastFlag("ReportOTAPluginVersionToBacktrace2");
local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local l_ContentProvider_0 = game:GetService("ContentProvider");
local l_HttpService_0 = game:GetService("HttpService");
local l_RunService_0 = game:GetService("RunService");
local l_ScriptContext_0 = game:GetService("ScriptContext");
local l_PluginManagementService_0 = game:GetService("PluginManagementService");
local l_Parent_0 = script.Parent.Parent;
local v9 = require(l_Parent_0.Packages.Framework);
local v10 = require(l_Parent_0.Packages.React);
local l_Networking_0 = v9.Http.Networking;
local l_t_0 = v9.Util.Typecheck.t;
local v13 = require(script.Parent.Backtrace.BacktraceReporter);
local l_FVariable_0 = settings():GetFVariable("StudioPluginsBacktraceToken");
local v15 = l_t_0.strictInterface({
    expectedSecurityLevel = l_t_0.integer, 
    expectedPrefix = l_t_0.string, 
    networking = l_t_0.optional(l_t_0.interface({
        request = l_t_0.callback
    })), 
    errorSignal = l_t_0.optional(l_t_0.interface({
        Connect = l_t_0.callback
    })), 
    services = l_t_0.optional(l_t_0.interface({
        HttpService = l_t_0.optional(l_t_0.interface({
            GetUserAgent = l_t_0.callback
        })), 
        RunService = l_t_0.optional(l_t_0.interface({
            GetRobloxVersion = l_t_0.callback
        })), 
        ContentProvider = l_t_0.optional(l_t_0.interface({
            BaseUrl = l_t_0.string
        }))
    }))
});
local function _(v16, v17)
    return string.format("%s.%s", v16, v17);
end;
local v19 = {};
v19.__index = v19;
v19.new = function(v20)
    assert(v15(v20), "Expected the correct args");
    local l_expectedSecurityLevel_0 = v20.expectedSecurityLevel;
    local l_expectedPrefix_0 = v20.expectedPrefix;
    assert(l_expectedPrefix_0 ~= "", "expectedPrefix must not be an empty string");
    local v23 = v20.networking or l_Networking_0.new({
        isInternal = true
    });
    local v24 = v20.errorSignal or l_ScriptContext_0.ErrorDetailed;
    local v25 = v20.services or {};
    local v26 = v25.AnalyticsService or l_RbxAnalyticsService_0;
    local v27 = v25.RunService or l_RunService_0;
    local v28 = v25.HttpService or l_HttpService_0;
    local v29 = v25.ContentProvider or l_ContentProvider_0;
    local l_v27_RobloxVersion_0 = v27:GetRobloxVersion();
    local l_v28_UserAgent_0 = v28:GetUserAgent();
    local l_BaseUrl_0 = v29.BaseUrl;
    local v33 = setmetatable({
        _hasReported = {}
    }, v19);
    v33.errorSignal = v24;
    v33.analyticsService = v26;
    v33.staticAttributes = {
        StudioVersion = l_v27_RobloxVersion_0, 
        UserAgent = l_v28_UserAgent_0, 
        BaseUrl = l_BaseUrl_0
    };
    v33.reporter = v13.new({
        networking = v23, 
        accessToken = l_FVariable_0, 
        processErrorReportMethod = function(v34)
            v34:addAttributes(v33.staticAttributes);
            return v34;
        end
    });
    v33.getOTAPluginVersion = not not l_ReportOTAPluginVersionToBacktrace2_0 and function(v35)
        local v36 = string.sub(v35, #l_expectedPrefix_0 + 2, #v35 - 5);
        local l_l_PluginManagementService_0_OTAPluginVersion_0 = l_PluginManagementService_0:GetOTAPluginVersion(v36);
        game:GetService("RbxAnalyticsService"):reportInfluxSeries("PluginOTAErrorAnalytics", {
            eventName = "ErrorReporter", 
            longPluginName = v35, 
            pluginName = v36, 
            otaVersion = l_l_PluginManagementService_0_OTAPluginVersion_0
        }, game:GetFastInt("PluginOTAErrorAnalyticsHundredthsPercentage"));
        return l_l_PluginManagementService_0_OTAPluginVersion_0;
    end or nil;
    if l_v27_RobloxVersion_0 ~= "0.0.0.1" then
        v33.errorToken = v33.errorSignal:Connect(function(v38, v39, _, v41, v42)
            if v42 ~= l_expectedSecurityLevel_0 then
                return ;
            elseif string.find(v39, l_expectedPrefix_0) ~= 1 then
                return ;
            elseif not l_StudioErrorReporterFilterJunkCallstacks_0 or not string.match(v38, "Requested module experienced an error while loading") then
                local v43 = string.match(v39, (string.format("^(%s_%%a+%%.rbxm)", l_expectedPrefix_0)));
                if v43 == nil then
                    return ;
                else
                    local v44, v45 = v10.unstable_parseReactError(v38);
                    v38 = v44.message;
                    if v44.stack then
                        v39 = v44.stack;
                    end;
                    v33:_reportError(v43, v38, v39, v41 or v45);
                    return ;
                end;
            else
                return ;
            end;
        end);
    end;
    return v33;
end;
v19._reportError = function(v46, v47, v48, v49, v50)
    local v51 = not v46._hasReported[v47];
    v46.reporter:updateSharedAttributes({
        PluginName = v47, 
        FirstErrorInSession = not v51 and "false" or "true", 
        OTAPluginVersion = not not l_ReportOTAPluginVersionToBacktrace2_0 and v46.getOTAPluginVersion(v47) or nil
    });
    v46.reporter:reportErrorDeferred(v48, v49, v50, v51);
    v46.analyticsService:ReportCounter(string.format("%s.%s", "StudioPluginErrors", v47), 1);
    if not v46._hasReported[v47] then
        v46._hasReported[v47] = true;
        v46.analyticsService:ReportCounter(string.format("%s.%s", "StudioPluginErrorsBySession", v47), 1);
    end;
end;
v19.report = function(v52, v53, v54)
    assert(type(v53) == "string", "Expected pluginName to be a string");
    assert(type(v54) == "string", "Expected errorMessage to be a string");
    v52:_reportError(v53, v54, debug.traceback(), nil);
end;
v19.stop = function(v55)
    v55.reporter:stop();
    if v55.errorToken ~= nil then
        v55.errorToken:Disconnect();
        v55.errorToken = nil;
    end;
end;
return v19;
