local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Src.Util.Constants);
local l_Actions_0 = l_Parent_0.Src.Actions;
local v3 = require(l_Actions_0.NetworkError);
local v4 = require(l_Actions_0.SetCurrentScreen);
local v5 = require(l_Actions_0.UploadResult);
local v6 = require(l_Parent_0.Src.Util.Urls);
local l_sendResultToKibana_0 = require(l_Parent_0.Packages.Framework).Util.sendResultToKibana;
local l_NewPackageAnalyticsWithRefactor2_0 = game:GetFastFlag("NewPackageAnalyticsWithRefactor2");
local l_MigratePackagesOffOfWWWPart2_0 = game:GetFastFlag("MigratePackagesOffOfWWWPart2");
local _ = game:GetService("PackageUIService") or nil;
local v11 = game:GetService("PublishService") or nil;
local v12 = game:GetService("PackageUIService") or nil;
local l_StudioAssetService_0 = game:GetService("StudioAssetService");
local l_StudioService_0 = game:GetService("StudioService");
return function(v15, v16, v17, v18, v19, v20, v21, v22, v23)
    return function(v24)
        v24:dispatch(v4(v1.SCREENS.UPLOADING_ASSET));
        local v25 = if not l_MigratePackagesOffOfWWWPart2_0 then v6.constructPostUploadAssetUrl(v15, "Model", v16 or "", v17 or "", v18, v19, v20, v21) else "https://apis.roblox.com/assets/user-auth/v1/assets";
        local function v28(v26, v27)
            v24:dispatch(v5(v26));
            if l_NewPackageAnalyticsWithRefactor2_0 then
                l_sendResultToKibana_0({
                    url = v25, 
                    responseCode = not v26 and -1 or 200, 
                    responseBody = v27
                });
            end;
            if v27 then
                v24:dispatch(v3(v27, "uploadRequest"));
            end;
        end;
        if not l_MigratePackagesOffOfWWWPart2_0 then
            local v29 = nil;
            v29 = v12.OnConvertToPackageResult:Connect(function(v30, v31)
                v29:Disconnect();
                v28(v30, v31);
            end);
            v12:ConvertToPackageUpload(v25, v22, v23);
            return ;
        else
            local l_status_0, l_result_0 = pcall(function()
                return l_StudioAssetService_0:SerializeInstances(v22);
            end);
            if not l_status_0 then
                v28(false, "Asset serialization failed during convert to package");
                return ;
            else
                local l_status_1, l_result_1 = pcall(function()
                    local l_l_StudioService_0_UserId_0 = l_StudioService_0:GetUserId();
                    local l_User_0 = Enum.AssetCreatorType.User;
                    if v21 ~= nil and v21 > 0 then
                        l_l_StudioService_0_UserId_0 = v21;
                        l_User_0 = Enum.AssetCreatorType.Group;
                    end;
                    if not (v17 ~= nil) or v17 == "" then
                        v17 = v16;
                    end;
                    return v11:CreateAssetOrAssetVersionAndPollAssetWithTelemetryAsync(l_result_0, l_User_0, l_l_StudioService_0_UserId_0, "Model", 0, v16, v17, "", "model/x-rbxm", 0);
                end);
                if not l_status_1 then
                    v28(false, "Publish failed during convert to package");
                    return ;
                else
                    l_StudioAssetService_0:UpdatePublishedPackage(l_result_1, v22[1], true, true);
                    v28(true, "Successfully convert to package, assetid: " .. l_result_1.AssetId);
                    return ;
                end;
            end;
        end;
    end;
end;
