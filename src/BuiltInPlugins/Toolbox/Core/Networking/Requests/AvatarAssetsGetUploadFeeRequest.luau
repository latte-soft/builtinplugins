local l_HttpService_0 = game:GetService("HttpService");
local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v2 = require(l_Parent_0.Core.Actions.SetUploadFee);
local v3 = require(l_Parent_0.Core.Actions.NetworkError);
local v4 = require(l_Parent_0.Core.Actions.UploadResult);
local v5 = require(l_Parent_0.Libs.Http.StatusCodes);
local l_Util_0 = l_Parent_0.Core.Util;
local v7 = require(l_Util_0.AssetConfigConstants);
local v8 = require(l_Util_0.SerializeInstances);
local v9 = require(l_Util_0.DebugFlags);
local v10 = require(l_Util_0.createMultipartFormDataBody);
local function _()
    return {
        name = "", 
        description = ""
    };
end;
return function(v12, v13, v14)
    return function(v15, v16)
        local function v20(v17)
            local l_status_0, l_result_0 = pcall(function()
                return l_HttpService_0:JSONDecode(v17.Body);
            end);
            if (l_status_0 and l_result_0.price ~= nil) and l_result_0.canAfford ~= nil then
                v15:dispatch(v2(true, l_result_0.price, l_result_0.canAfford));
                return ;
            else
                warn("Unexpected AvatarAssetsGetUploadFee response body:", v17.Body);
                v15:dispatch(v2(false));
                return ;
            end;
        end;
        local function v22(v21)
            if v9.shouldDebugWarnings() then
                warn("Lua toolbox: SerializeInstances failed");
            end;
            v15:dispatch(v3((tostring(v21))));
            v15:dispatch(v4(false));
        end;
        local function v24(v23)
            if v23.StatusCode == v5.SERVICE_UNAVAILABLE then
                v15:dispatch(v2(false));
                return ;
            else
                v15:dispatch(v3(v23.Body));
                v15:dispatch(v4(false));
                return ;
            end;
        end;
        return v8(v14, v16.StudioAssetService):andThen(function(v25)
            return v12:avatarAssetsGetUploadFee(v13, v10({
                {
                    type = "application/json", 
                    disposition = {
                        name = "config", 
                        filename = "config.json"
                    }, 
                    value = v12:jsonEncode({
                        name = "", 
                        description = ""
                    })
                }, 
                {
                    type = "application/octet-stream", 
                    disposition = {
                        name = "accessory", 
                        filename = "accessory.rbxm"
                    }, 
                    value = v25
                }
            }), v7.MULTIPART_FORM_BOUNDARY):andThen(v20, v24);
        end, v22);
    end;
end;
