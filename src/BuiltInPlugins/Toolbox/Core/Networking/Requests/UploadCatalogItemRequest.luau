local l_HttpService_0 = game:GetService("HttpService");
local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_CMSUploadAccessoryMeshPartFormat2_0 = game:GetFastFlag("CMSUploadAccessoryMeshPartFormat2");
local v3 = require(l_Parent_0.Core.Actions.SetAssetId);
local v4 = require(l_Parent_0.Core.Actions.NetworkError);
local v5 = require(l_Parent_0.Core.Actions.SetCurrentScreen);
local v6 = require(l_Parent_0.Core.Actions.UploadResult);
local l_Util_0 = l_Parent_0.Core.Util;
local v8 = require(l_Util_0.DebugFlags);
local v9 = require(l_Util_0.AssetConfigConstants);
local v10 = require(l_Util_0.SerializeInstances);
local v11 = require(l_Util_0.Analytics.Analytics);
local v12 = require(l_Util_0.createMultipartFormDataBody);
local v13 = require(l_Parent_0.Core.Networking.Requests.ConfigureItemTagsRequest);
local v14 = require(l_Parent_0.Core.Networking.Requests.UploadCatalogItemMeshPartFormatRequest);
local function _(v15, v16, v17)
    return {
        [v15] = {
            type = v16.Name, 
            name = v15, 
            description = v17
        }
    };
end;
local function _(v19, v20, v21, v22, v23)
    return "--" .. v23 .. "\r\n" .. "Content-Type: application/json\r\n" .. "Content-Disposition: form-data; name=\"config\"; filename=\"config.json\"\r\n" .. "\r\n" .. v19 .. "\r\n" .. "--" .. v23 .. "\r\n" .. "Content-Disposition: form-data; name=\"" .. v20 .. "\"; filename=\"" .. v20 .. "." .. v21 .. "\"\r\n" .. "Content-Type: application/octet-stream\r\n" .. "\r\n" .. v22 .. "\r\n" .. "--" .. v23 .. "--\r\n";
end;
return function(v25, v26, v27, v28, v29, v30, v31)
    return function(v32, v33)
        v26 = string.sub(v26 or "", 1, v9.NAME_CHARACTER_LIMIT);
        v28 = string.sub(v28 or "", 1, v9.DESCRIPTION_CHARACTER_LIMIT);
        v32:dispatch(v5(v9.SCREENS.UPLOADING_ASSET));
        local function v38(v34)
            local l_status_0, l_result_0 = pcall(function()
                return l_HttpService_0:JSONDecode(v34);
            end);
            if not ((not l_status_0 or not l_result_0) or not l_result_0.AssetDetails) and #l_result_0.AssetDetails > 0 then
                local v37 = l_result_0.AssetDetails[1];
                if not v37.uploadAssetError then
                    if v37.assetId then
                        v32:dispatch(v3(v37.assetId));
                        if not l_CMSUploadAccessoryMeshPartFormat2_0 then
                            v32:dispatch(v13(v25, v37.assetId, {}, v31));
                        else
                            v32:dispatch(v14(v25, v37.assetId, v29, v26, v28, v30, v31));
                        end;
                        v11.incrementUploadAssetSuccess(v29);
                        return ;
                    end;
                else
                    v32:dispatch(v4(v37.uploadAssetError));
                    v32:dispatch(v6(false));
                    v11.incrementUploadAssetFailure(v29);
                    return ;
                end;
            end;
            v32:dispatch(v4("Unknown Error"));
            v32:dispatch(v6(false));
        end;
        local function v40(v39)
            if v8.shouldDebugWarnings() then
                warn("Lua toolbox: SerializeInstances failed");
            end;
            v32:dispatch(v4((tostring(v39))));
            v32:dispatch(v6(false));
            v11.incrementUploadAssetFailure(v29);
        end;
        local function v42(v41)
            if v8.shouldDebugWarnings() then
                warn("Lua toolbox: Could not upload catalog item");
            end;
            v32:dispatch(v4(v41));
            v32:dispatch(v6(false));
            v11.incrementUploadAssetFailure(v29);
        end;
        return v10(v30, v33.StudioAssetService):andThen(function(v43)
            local l_v25_0 = v25;
            local l_v26_0 = v26;
            return v25:uploadCatalogItem(v12({
                {
                    type = "application/json", 
                    disposition = {
                        name = "config", 
                        filename = "config.json"
                    }, 
                    value = l_v25_0:jsonEncode({
                        [l_v26_0] = {
                            type = v29.Name, 
                            name = l_v26_0, 
                            description = v28
                        }
                    })
                }, 
                {
                    type = "application/octet-stream", 
                    disposition = {
                        name = v26, 
                        filename = v26 .. "." .. v27
                    }, 
                    value = v43
                }
            }), v9.MULTIPART_FORM_BOUNDARY):andThen(v38, v42);
        end, v40);
    end;
end;
