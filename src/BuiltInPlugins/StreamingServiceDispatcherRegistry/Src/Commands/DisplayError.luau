local l_script_FirstAncestor_0 = script:FindFirstAncestor("StreamingServiceDispatcherRegistry");
local v1 = require(l_script_FirstAncestor_0.Src.Utils.CliAdapter);
local v2 = v1.GetService("ChatbotUIService");
local v3 = v1.GetService("ConversationalAIAcceptanceService");
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v5 = require(l_script_FirstAncestor_0.Src.Localization.Localization);
local v6 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagEndRequestWhenDisplayErrorMessage);
local v7 = require(l_script_FirstAncestor_0.Src.Flags.getFIntConvAIMaxQuotaTimeout);
local v8 = require(l_script_FirstAncestor_0.Src.Flags.getFIntConvAIServersAtMaxCapacityTimeout);
local function _(v9, v10)
    return v5:getText("ErrorMessage", v9[math.random(1, #v9)], v10);
end;
local function _(v12, v13)
    v2:DisplayContent("StreamText", {
        requestId = v12, 
        content = v13
    });
end;
local function _(v15, v16, v17)
    v2:DisplayContent("SetErrorMessage", {
        message = v15, 
        disableInput = v16, 
        timeout = v17
    });
end;
local v42 = {
    function(v19, v20)
        if v20.errorId == "RawErrorMessage" then
            v2:DisplayContent("StreamText", {
                requestId = v19, 
                content = v20.content
            });
            return true;
        else
            return false;
        end;
    end, 
    function(_, v22)
        if v22.errorId == "RawErrorStatusBar" then
            v2:DisplayContent("SetStatusBarMessage", {
                message = v22.content or "", 
                disableInput = v22.disableInput or false, 
                timeout = v22.timeout or 0
            });
            return true;
        else
            return false;
        end;
    end, 
    function(v23, v24)
        if v24.errorId == "InappropriateRequest" then
            local v25 = string.format("<br/><a href=\"%s\">%s</a>", "https://en.help.roblox.com/hc/en-us/articles/203313410-Roblox-Community-Standards", "https://en.help.roblox.com/hc/en-us/articles/203313410-Roblox-Community-Standards");
            local v26 = {
                "InappropriateRequestOne1", 
                "InappropriateRequestTwo1"
            };
            v2:DisplayContent("StreamText", {
                requestId = v23, 
                content = v5:getText("ErrorMessage", v26[math.random(1, #v26)], {
                    url = v25
                })
            });
            return true;
        else
            return false;
        end;
    end, 
    function(_, v28)
        if v28.errorId == "QuotaError" then
            local v29 = {
                "QuotaErrorOne", 
                "QuotaErrorTwo", 
                "QuotaErrorThree"
            };
            v2:DisplayContent("SetErrorMessage", {
                message = v5:getText("ErrorMessage", v29[math.random(1, #v29)], nil), 
                disableInput = true, 
                timeout = v7()
            });
            return true;
        else
            return false;
        end;
    end, 
    function(v30, v31)
        if v31.errorId == "ConnectionLost" then
            local v32 = {
                "ConnectionLostOne", 
                "ConnectionLostTwo"
            };
            v2:DisplayContent("StreamText", {
                requestId = v30, 
                content = v5:getText("ErrorMessage", v32[math.random(1, #v32)], nil)
            });
            return true;
        else
            return false;
        end;
    end, 
    function(_, v34)
        if v34.errorId == "ServersAtMaxCapacity" then
            local v35 = {
                "ServersAtMaxCapacity"
            };
            v2:DisplayContent("SetErrorMessage", {
                message = v5:getText("ErrorMessage", v35[math.random(1, #v35)], nil), 
                disableInput = true, 
                timeout = v8()
            });
            return true;
        else
            return false;
        end;
    end, 
    function(v36, v37)
        if v37.errorId == "GeneralError" then
            local v38 = {
                "GeneralError"
            };
            v2:DisplayContent("StreamText", {
                requestId = v36, 
                content = v5:getText("ErrorMessage", v38[math.random(1, #v38)], nil)
            });
            return true;
        else
            return false;
        end;
    end, 
    function(v39, v40)
        if v40.errorId == "StreamingServiceError" then
            if v40.errorType == "HttpFailed" and tonumber(v40.errorMessage) ~= 200 then
                local v41 = {
                    "ConnectionLostOne", 
                    "ConnectionLostTwo"
                };
                v2:DisplayContent("StreamText", {
                    requestId = v39, 
                    content = v5:getText("ErrorMessage", v41[math.random(1, #v41)], nil)
                });
            end;
            return true;
        else
            return false;
        end;
    end
};
return function(v43)
    local l_arguments_0 = v43.arguments;
    for _, v46 in ipairs(v42) do
        if v46(v43.requestId or "", l_arguments_0) then
            v3:ErrorTelemetry(v43.requestId or "", l_arguments_0.errorId or "UnknownError");
            break;
        end;
    end;
    if v6() then
        v2:DisplayContent("EndRequest", {
            requestId = v43.requestId
        });
    end;
end;
