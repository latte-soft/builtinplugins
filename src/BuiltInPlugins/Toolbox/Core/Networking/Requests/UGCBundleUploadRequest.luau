local _ = game:GetService("LocalizationService");
local l_PublishService_0 = game:GetService("PublishService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("Toolbox");
local l_Actions_0 = l_script_FirstAncestor_0.Core.Actions;
local v4 = require(l_Actions_0.NetworkError);
local v5 = require(l_Actions_0.SetCurrentScreen);
local v6 = require(l_Actions_0.UploadResult);
local v7 = require(l_Actions_0.SetProgressBarInfo);
local v8 = require(l_script_FirstAncestor_0.Core.Localization.getLocalizedAssetTextMap);
local v9 = require(l_script_FirstAncestor_0.Core.Networking.Requests.UGCCreateBundleRequest);
local l_Util_0 = l_script_FirstAncestor_0.Core.Util;
local v11 = require(l_Util_0.Analytics.Analytics);
local v12 = require(l_Util_0.AssetConfigConstants);
local v13 = require(l_Util_0.AssetConfigUtil);
local v14 = require(l_Util_0.DebugFlags);
local v15 = require(l_Util_0.getUserId);
local l_Packages_0 = l_script_FirstAncestor_0.Packages;
local l_Promise_0 = require(l_Packages_0.Framework).Util.Promise;
local v18 = require(l_Packages_0.UGCValidation);
local v19 = require(l_Util_0.SharedFlags.getFFlagEnableUGCUploadFlowAnalytics);
local v20 = require(l_Util_0.SharedFlags.getFFlagEnableCreateUGCBundleCreationFeeErrorCodes);
local v21 = require(l_script_FirstAncestor_0.Core.Flags.getFFlagEnableUGCIndividualAssetUploadAnalytics);
local v22 = require(l_Util_0.SharedFlags.getFFlagEnableNewToolboxCreationContextErrors);
local v23 = require(l_Util_0.getRobuxMessageToAppend);
local function v28(v24)
    if not (not v24 or not v24.Body) and v24.Body.errors then
        local v25 = nil;
        for _, v27 in v24.Body.errors, nil, nil do
            if v25 ~= nil then
                v25 = v25 .. "\n" .. v27.code .. ": " .. v27.message;
            else
                v25 = v27.code .. ": " .. v27.message;
            end;
        end;
        return v25;
    else
        return nil;
    end;
end;
local _ = function(v29)
    if v29 then
        local _ = nil;
        if type(v29) == "table" then
            return (table.concat(v29, ", "));
        else
            return (tostring(v29));
        end;
    else
        return nil;
    end;
end;
local function _(v32)
    return (tonumber(string.match(v32, "(%d+)$")));
end;
local function _(v34, v35)
    if v35 ~= nil then
        v34[v35] = true;
    end;
end;
local function v48(v37)
    local v38 = {};
    for _, v40 in v37, nil, nil do
        local l_v40_Descendants_0 = v40:GetDescendants();
        table.insert(l_v40_Descendants_0, v40);
        for _, v43 in l_v40_Descendants_0, nil, nil do
            if not v43:IsA("MeshPart") then
                if v43:IsA("WrapTarget") then
                    local v44 = tonumber(string.match(v43.CageMeshId, "(%d+)$"));
                    if v44 ~= nil then
                        v38[v44] = true;
                    end;
                end;
            else
                local v45 = tonumber(string.match(v43.MeshId, "(%d+)$"));
                if v45 ~= nil then
                    v38[v45] = true;
                end;
            end;
        end;
    end;
    local v46 = {};
    for v47 in v38, nil, nil do
        table.insert(v46, v47);
    end;
    return v46;
end;
local function v63(v49, v50, v51, v52, v53)
    local v54 = {
        [2] = "CreationContextInvalidAssetQuantities", 
        [3] = "CreationContextInvalidBundleType", 
        [4] = "CreationContextInvalidCreateBundleRequest", 
        [5] = "CreationContextInvalidBundleDescription", 
        [6] = "CreationContextInvalidBundleName", 
        [7] = "CreationContextInappropriateBundleDescription", 
        [8] = "CreationContextInappropriateBundleName"
    };
    local v55 = {
        [0] = "CreationContextAuthorizationDenied", 
        [10] = "CreationContextUserNotFound"
    };
    local v56 = {
        [0] = "CreationContextTokenValidationFailed", 
        [9] = "CreationContextDoesNotHavePermission"
    };
    if v22() then
        v56[106] = "CreationContextMissingIDVerification";
        v56[107] = "CreationContextAccessBlocked";
    end;
    local v57 = {
        [400] = v54, 
        [401] = v55, 
        [403] = v56, 
        [412] = {
            [11] = "CreationContextDailyLimitReached"
        }, 
        [503] = {
            [1] = "CreationContextServiceUnavailable"
        }
    };
    local v58 = nil;
    local v59 = v57[v51.StatusCode];
    if (v59 ~= nil and v51.Body ~= nil) and v51.Body.errors ~= nil then
        for _, v61 in v51.Body.errors, nil, nil do
            local v62 = v59[v61.code];
            if v62 ~= nil then
                if v58 == nil then
                    v58 = v50:getText("AssetConfig", v62);
                else
                    v58 = v58 .. "\n" .. v50:getText("AssetConfig", v62);
                end;
            end;
        end;
        if v20() and v58 ~= nil then
            v58 = v58 .. v23(v53, v50);
        end;
    end;
    if v19() then
        v11.UGCUploadRequestOperationIdEvent(v11.Status.Failure, v52, nil, (v28(v51)));
    end;
    if v14.shouldDebugWarnings() then
        warn("Could not create UGC Bundle context and received response:", v51);
    end;
    if v58 ~= nil then
        v49:dispatch(v4(v58));
    else
        v49:dispatch(v4(if not v20() then v50:getText("AssetConfig", "BundleContextCreationError") else v50:getText("AssetConfig", "BundleContextCreationError") .. v23(v53, v50)));
    end;
    v49:dispatch(v6(false));
end;
return function(v64, v65, v66, v67, v68, v69, v70, v71, v72)
    return function(v73)
        local v74 = v13.getAvatarAssetTypeAsString(v66);
        local v75 = v65:Clone();
        v67 = not v67 and "" or v67:sub(1, v12.NAME_CHARACTER_LIMIT);
        v68 = not v68 and "" or v68:sub(1, v12.DESCRIPTION_CHARACTER_LIMIT);
        local function v105(v76)
            if not v76 or not v76.operationId then
                if v14.shouldDebugWarnings() then
                    warn("Unexpected UGCBundleUploadRequest response:", v76);
                end;
                if v19() then
                    v11.UGCUploadRequestOperationIdEvent(v11.Status.Failure, v74, nil, (v28(v76)));
                end;
                v73:dispatch(v4(if not v20() then v70:getText("AssetConfig", "ValidationErrorUnknown") else v70:getText("AssetConfig", "ValidationErrorUnknown") .. v23(v71, v70)));
                v73:dispatch(v6(false));
                return ;
            else
                local l_operationId_0 = v76.operationId;
                local v78 = v15();
                if v14.shouldDebugWarnings() then
                    warn("operationId received for UGC bundle upload:", l_operationId_0);
                end;
                if v19() then
                    v11.UGCUploadRequestOperationIdEvent(v11.Status.Success, v74, l_operationId_0);
                end;
                v13.sanitizeForValidation(v75);
                local v79 = v18.util.createUGCBodyPartFolders(v75, v69, v74, true);
                v73:dispatch(v7(0.05, v70:getText("AssetConfig", "BundleUploadStepNumber", {
                    currentStep = 2, 
                    totalSteps = 4
                }), v70:getText("AssetConfig", "BundleUploadAssetsStep")));
                if v19() then
                    v11.UGCUploadAssetsEvent(v11.Status.Start, v74, l_operationId_0);
                end;
                local v80 = {};
                local v81 = 0;
                local v82 = {};
                for v83, v84 in pairs(v79) do
                    local v85 = v8(v70)[v83] or v83.Name;
                    v81 = v81 + 1;
                    local v86 = ("%* - %*"):format(v67, v85);
                    table.insert(v82, l_Promise_0.new(function(v87, v88)
                        task.spawn(function()
                            local l_status_0, l_result_0 = pcall(function()
                                return l_PublishService_0:createAssetAndWaitForAssetId(v84, l_operationId_0, Enum.AssetCreatorType.User, v78, v83.Name, v86, v68);
                            end);
                            if (l_status_0 and l_result_0 ~= nil) and l_result_0 ~= 0 then
                                if v14.shouldDebugWarnings() then
                                    warn("Received an assetId for an uploaded UGC bundle body part:", l_result_0);
                                end;
                                if v21() then
                                    local v91 = v48(v84);
                                    local l_UGCIndividualAssetUploadEvent_0 = v11.UGCIndividualAssetUploadEvent;
                                    local l_l_result_0_0 = l_result_0;
                                    local v94;
                                    if v91 then
                                        local _ = nil;
                                        v94 = if type(v91) == "table" then table.concat(v91, ", ") else tostring(v91);
                                    else
                                        v94 = nil;
                                    end;
                                    l_UGCIndividualAssetUploadEvent_0(l_l_result_0_0, v94);
                                end;
                                table.insert(v80, l_result_0);
                                v73:dispatch(v7(0.05 + (0.8 * #v80) / v81, v70:getText("AssetConfig", "BundleUploadStepNumber", {
                                    currentStep = 2, 
                                    totalSteps = 4
                                }), v70:getText("AssetConfig", "BundleUploadAssetsStep")));
                                v87(l_result_0);
                                return ;
                            else
                                v88(l_result_0);
                                return ;
                            end;
                        end);
                    end));
                end;
                l_Promise_0.all(v82):andThen(function(_)
                    if v81 > 0 and v81 == #v80 then
                        if v19() then
                            local l_UGCUploadAssetsEvent_0 = v11.UGCUploadAssetsEvent;
                            local l_Success_0 = v11.Status.Success;
                            local l_v74_0 = v74;
                            local l_l_operationId_0_0 = l_operationId_0;
                            local l_v80_0 = v80;
                            local v102;
                            if l_v80_0 then
                                local _ = nil;
                                v102 = if type(l_v80_0) == "table" then table.concat(l_v80_0, ", ") else tostring(l_v80_0);
                            else
                                v102 = nil;
                            end;
                            l_UGCUploadAssetsEvent_0(l_Success_0, l_v74_0, l_l_operationId_0_0, v102);
                        end;
                        v73:dispatch(v9(v64, v66, v67, v68, v80, l_operationId_0, v70, v71, v72));
                        return ;
                    else
                        if v19() then
                            v11.UGCUploadAssetsEvent(v11.Status.Failure, v74, l_operationId_0, nil, "Bundle Upload Assets Error");
                        end;
                        if v14.shouldDebugWarnings() then
                            warn("Unexpected UGCBundleUploadRequest: Incorrect number of asset ids ");
                        end;
                        v73:dispatch(v4(if not v20() then v70:getText("AssetConfig", "BundlePartsUploadError") else v70:getText("AssetConfig", "BundlePartsUploadError") .. v23(v71, v70)));
                        v73:dispatch(v6(false));
                        return ;
                    end;
                end, function(v104)
                    if v19() then
                        v11.UGCUploadAssetsEvent(v11.Status.Failure, v74, l_operationId_0, nil, v104);
                    end;
                    if v14.shouldDebugWarnings() then
                        warn("Unexpected UGCBundleUploadRequest error:", v104);
                    end;
                    v73:dispatch(v4(if not v20() then v70:getText("AssetConfig", "BundlePartsUploadError") else v70:getText("AssetConfig", "BundlePartsUploadError") .. v23(v71, v70)));
                    v73:dispatch(v6(false));
                end);
                return ;
            end;
        end;
        local function v107(v106)
            if not v19() then
                v63(v73, v70, v106);
                return ;
            else
                v63(v73, v70, v106, v74, v71);
                return ;
            end;
        end;
        v73:dispatch(v7(0, v70:getText("AssetConfig", "BundleUploadStepNumber", {
            currentStep = 1, 
            totalSteps = 4
        }), v70:getText("AssetConfig", "BundleUploadPrepareStep")));
        v73:dispatch(v5(v12.SCREENS.UPLOADING_ASSET));
        local v108 = v13.getUGCBodyBundleAssetQuantities(v75, v69, v66);
        if v108 == nil then
            v73:dispatch(v4(if not v20() then v70:getText("AssetConfig", "ValidationErrorUnknown") else v70:getText("AssetConfig", "ValidationErrorUnknown") .. v23(v71, v70)));
            v73:dispatch(v6(false));
            return ;
        else
            if v19() then
                v11.UGCUploadRequestOperationIdEvent(v11.Status.Start, v74);
            end;
            return v64:postBundleCreationContext(v66, v108, v67, v68):andThen(v105, v107);
        end;
    end;
end;
