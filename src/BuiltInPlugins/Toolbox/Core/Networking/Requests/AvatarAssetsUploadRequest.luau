local l_HttpService_0 = game:GetService("HttpService");
local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_CMSUploadAccessoryMeshPartFormat2_0 = game:GetFastFlag("CMSUploadAccessoryMeshPartFormat2");
local v3 = game:getFastFlag("AssetConfigLayeredClothingBoxCollisions");
local l_ToolboxAccessoryNameFix_0 = game:GetFastFlag("ToolboxAccessoryNameFix");
local v5 = require(l_Parent_0.Core.Actions.SetAssetId);
local v6 = require(l_Parent_0.Core.Actions.NetworkError);
local v7 = require(l_Parent_0.Core.Actions.SetCurrentScreen);
local v8 = require(l_Parent_0.Core.Actions.UploadResult);
local l_Util_0 = l_Parent_0.Core.Util;
local v10 = require(l_Util_0.DebugFlags);
local v11 = require(l_Util_0.getUserId);
local v12 = require(l_Util_0.AssetConfigConstants);
local v13 = require(l_Util_0.SerializeInstances);
local v14 = require(l_Util_0.Analytics.Analytics);
local v15 = require(l_Util_0.createMultipartFormDataBody);
local v16 = require(l_Util_0.isLayeredClothing);
local v17 = require(l_Util_0.fixMeshPartAccessory);
local v18 = require(l_Parent_0.Core.Networking.Requests.ConfigureItemTagsRequest);
local v19 = require(l_Parent_0.Core.Networking.Requests.UploadCatalogItemMeshPartFormatRequest);
local _ = function(v20, _, v22, v23)
    return {
        name = v20, 
        description = v22, 
        creatorType = v23 ~= nil and "Group" or "User", 
        creatorTargetId = v23 ~= nil and v23 or v11()
    };
end;
local function _(v25)
    if not string.match(v25, "Accessory %(.+%)$") then
        return (("Accessory (%*)"):format(v25));
    else
        return v25;
    end;
end;
return function(v27, v28, v29, v30, v31, v32, v33, v34)
    return function(v35, v36)
        local l_v32_0 = v32;
        v28 = string.sub(v28 or "", 1, v12.NAME_CHARACTER_LIMIT);
        v30 = string.sub(v30 or "", 1, v12.DESCRIPTION_CHARACTER_LIMIT);
        v35:dispatch(v7(v12.SCREENS.UPLOADING_ASSET));
        local function v41(v38)
            local l_status_0, l_result_0 = pcall(function()
                return l_HttpService_0:JSONDecode(v38.Body);
            end);
            if not l_status_0 or not l_result_0.assetId then
                warn("Unexpected AvatarAssetsUploadRequest response body:", v38.Body);
                v35:dispatch(v6("Unknown Error"));
                v35:dispatch(v8(false));
                return ;
            else
                v35:dispatch(v5(l_result_0.assetId));
                if not l_CMSUploadAccessoryMeshPartFormat2_0 then
                    v35:dispatch(v18(v27, l_result_0.assetId, {}, v33));
                else
                    v35:dispatch(v19(v27, l_result_0.assetId, v31, v28, v30, l_v32_0, v33));
                end;
                v14.incrementUploadAssetSuccess(v31);
                return ;
            end;
        end;
        local function v43(v42)
            if v10.shouldDebugWarnings() then
                warn("Lua toolbox: SerializeInstances failed");
            end;
            v35:dispatch(v6((tostring(v42))));
            v35:dispatch(v8(false));
            v14.incrementUploadAssetFailure(v31);
        end;
        local function v45(v44)
            if v10.shouldDebugWarnings() then
                warn("Lua toolbox: Could not upload catalog item");
            end;
            v35:dispatch(v6(v44.Body));
            v35:dispatch(v8(false));
            v14.incrementUploadAssetFailure(v31);
        end;
        if v3 then
            local v46 = l_v32_0[1];
            if v16(v46) then
                v17(v46);
            end;
            if l_ToolboxAccessoryNameFix_0 then
                local l_Name_0 = v46.Name;
                v46.Name = if not string.match(l_Name_0, "Accessory %(.+%)$") then ("Accessory (%*)"):format(l_Name_0) else l_Name_0;
            end;
        end;
        return v13(l_v32_0, v36.StudioAssetService):andThen(function(v48)
            local l_v28_0 = v28;
            local _ = v31;
            local l_v30_0 = v30;
            local l_v34_0 = v34;
            return v27:avatarAssetsUpload(v31, v15({
                {
                    type = "application/json", 
                    disposition = {
                        name = "config", 
                        filename = "config.json"
                    }, 
                    value = v27:jsonEncode({
                        name = l_v28_0, 
                        description = l_v30_0, 
                        creatorType = l_v34_0 ~= nil and "Group" or "User", 
                        creatorTargetId = l_v34_0 ~= nil and l_v34_0 or v11()
                    })
                }, 
                {
                    type = "application/octet-stream", 
                    disposition = {
                        name = v28, 
                        filename = v28 .. "." .. v29
                    }, 
                    value = v48
                }
            }), v12.MULTIPART_FORM_BOUNDARY):andThen(v41, v45);
        end, v43);
    end;
end;
