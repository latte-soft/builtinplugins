local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Util_0 = l_Parent_0.Core.Util;
local v2 = require(l_Util_0.AssetConfigUtil);
local v3 = require(l_Util_0.DebugFlags);
local v4 = require(l_Util_0.AssetConfigConstants);
local v5 = require(l_Util_0.Analytics.Analytics);
local l_sendResultToKibana_0 = require(l_Parent_0.Packages.Framework).Util.sendResultToKibana;
local l_Actions_0 = l_Parent_0.Core.Actions;
local v8 = require(l_Actions_0.NetworkError);
local v9 = require(l_Actions_0.SetCurrentScreen);
local v10 = require(l_Actions_0.UploadResult);
local v11 = require(l_Actions_0.SetAssetId);
local v12 = require(l_Actions_0.SetIsPackage);
local v13 = require(l_Parent_0.Core.Networking.Requests.TrySaveSalesThumbnailAssetMediaRequest);
local _ = require(l_Parent_0.Core.Types.PublishInfoType);
local l_DebugAssetConfigNetworkError_0 = game:GetFastFlag("DebugAssetConfigNetworkError");
local l_UnifyModelPackagePublish3_0 = game:GetFastFlag("UnifyModelPackagePublish3");
local l_ToolboxSetMarketplaceModelsAsPackagesForAll_0 = game:GetFastFlag("ToolboxSetMarketplaceModelsAsPackagesForAll");
local l_ToolboxSetMarketplaceModelsAsPackagesForIXP3_0 = game:GetFastFlag("ToolboxSetMarketplaceModelsAsPackagesForIXP3");
local _ = function(v19)
    local _ = nil;
    if #v19 > 1 then
        local l_Folder_0 = Instance.new("Folder");
        for _, v23 in v19, nil, nil do
            v23.Parent = l_Folder_0;
        end;
        return l_Folder_0;
    else
        return v19[1];
    end;
end;
return function(v25)
    return function(v26, v27)
        v26:dispatch(v9(v4.SCREENS.UPLOADING_ASSET));
        local l_Name_0 = v25.assetTypeEnum.Name;
        local v29 = nil;
        local v30 = if l_ToolboxSetMarketplaceModelsAsPackagesForAll_0 or l_ToolboxSetMarketplaceModelsAsPackagesForIXP3_0 then v25.isMarketplaceModelsAsPackagesEnabled else nil;
        local v31 = nil;
        if v30 and v25.sourceInstances ~= nil then
            v31 = v2.isPackagePublishAllowed(v25.sourceInstances);
        end;
        local v32 = {
            Name = v25.name, 
            AssetType = l_Name_0, 
            Description = v25.description, 
            IsPackage = if not v31 then v25.packageOn or false else v25.copyOn, 
            PublishToMarketplace = v25.copyOn, 
            AllowComments = v25.allowComments or false, 
            GroupId = v25.groupId, 
            OrigInstance = if v25.sourceInstances ~= nil then v25.sourceInstances[1] else nil
        };
        local function v38(v33, v34)
            if not (not (l_UnifyModelPackagePublish3_0 and v25.packageOn) and ((not v30 or not v31) or not v25.copyOn)) then
                l_sendResultToKibana_0({
                    url = v33.url, 
                    responseCode = v33.statusCode, 
                    responseBody = v34
                });
            end;
            local v35 = not v33;
            if not v35 then
                v35 = true;
                if next(v33) ~= nil then
                    v35 = v33.responseBody:find("Error") or v34 ~= "";
                end;
            end;
            if not v35 then
                v29 = v33.responseBody;
                v26:dispatch(v11(v29));
                if not (not l_UnifyModelPackagePublish3_0 or not v25.packageOn) then
                    v26:dispatch(v12(true));
                end;
                v5.incrementUploadAssetSuccess(l_Name_0);
                local l_saleStatus_0 = v25.saleStatus;
                if not l_DebugAssetConfigNetworkError_0 then
                    if not (l_saleStatus_0 or v25.iconFile) and not v25.assetMediaUpdateData then
                        v26:dispatch(v9(v4.SCREENS.UPLOADING_ASSET));
                        v26:dispatch(v10(true));
                        return ;
                    else
                        v25.assetId = v29;
                        v26:dispatch(v13(v25));
                        return ;
                    end;
                else
                    v25.assetId = v29;
                    v26:dispatch(v13(v25));
                    return ;
                end;
            else
                if v3.shouldDebugWarnings() then
                    warn("Got false response from PostInsertAsset");
                end;
                v26:dispatch(v10(false));
                local _ = nil;
                v26:dispatch(v8(if (not not v33 and v33.responseBody) and v33.responseBody:find("statusMessage") then v33.responseBody:find("statusMessage") else if v34 ~= "" then v34 else "Upload failed with unknown error"));
                v5.incrementUploadAssetFailure(l_Name_0);
                return ;
            end;
        end;
        local l_instances_0 = v25.instances;
        local v40 = nil;
        if #l_instances_0 > 1 then
            local l_Folder_1 = Instance.new("Folder");
            for _, v43 in l_instances_0, nil, nil do
                v43.Parent = l_Folder_1;
            end;
            v40 = l_Folder_1;
        else
            v40 = l_instances_0[1];
        end;
        local l_v40_0 = v40;
        v27.StudioAssetService.OnPublishPackageResult:Once(v38);
        v27.StudioAssetService:PublishPackage(l_v40_0, v32);
    end;
end;
