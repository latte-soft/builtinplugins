local l_script_FirstAncestor_0 = script:FindFirstAncestor("Toolbox");
local l_Actions_0 = l_script_FirstAncestor_0.Core.Actions;
local v2 = require(l_Actions_0.NetworkError);
local v3 = require(l_Actions_0.SetAssetId);
local v4 = require(l_Actions_0.SetProgressBarInfo);
local v5 = require(l_Actions_0.UploadResult);
local l_Requests_0 = l_script_FirstAncestor_0.Core.Networking.Requests;
local v7 = require(l_Requests_0.PollForBundleCreationStatus);
local l_Util_0 = l_script_FirstAncestor_0.Core.Util;
local v9 = require(l_Util_0.Analytics.Analytics);
local v10 = require(l_Util_0.AssetConfigUtil);
local v11 = require(l_Util_0.DebugFlags);
local v12 = require(l_Util_0.SharedFlags.getFFlagEnableUGCUploadFlowAnalytics);
local v13 = game:DefineFastFlag("EnableAddedCreateUGCBundleErrorCodes", false);
local v14 = require(l_Util_0.SharedFlags.getFFlagEnableCreateUGCBundleCreationFeeErrorCodes);
local v15 = require(l_script_FirstAncestor_0.Core.Util.SharedFlags.getFFlagEnableUGCUploadingDataSharing);
local v16 = if not v15() then nil else require(l_Requests_0.UGCBundleUploadDataSharingRequest);
local v17 = require(l_Util_0.SharedFlags.getFFlagEnableUnknownErrorCreatorDashboardMessage);
local v18 = require(l_Util_0.getRobuxMessageToAppend);
local function v23(v19)
    if not (not v19 or not v19.Body) and v19.Body.errors then
        local v20 = nil;
        for _, v22 in v19.Body.errors, nil, nil do
            if v20 ~= nil then
                v20 = v20 .. "\n" .. v22.code .. ": " .. v22.message;
            else
                v20 = v22.code .. ": " .. v22.message;
            end;
        end;
        return v20;
    else
        return nil;
    end;
end;
local _ = function(v24)
    if v24 then
        local _ = nil;
        if type(v24) == "table" then
            return (table.concat(v24, ", "));
        else
            return (tostring(v24));
        end;
    else
        return nil;
    end;
end;
local function v40(v27, v28, v29, v30, v31, v32, v33)
    local v34 = {
        [400] = {
            [2] = "CreateBundleInvalidBundleName", 
            [3] = "CreateBundleInvalidAssetIds", 
            [4] = "CreateBundleInvalidOperationId", 
            [5] = "CreateBundleInvalidBundleType", 
            [6] = "CreateBundleInvalidCreateBundleRequest", 
            [7] = if not v13 then nil else "CreateBundleInvalidBundleDescription", 
            [11] = if not v13 then nil else "CreateBundleGroupCreatorNotSupported", 
            [13] = if not v14() then nil else "CreateBundleInvalidCreationFee"
        }, 
        [401] = {
            [0] = "CreateBundleAuthorizationDenied"
        }, 
        [403] = {
            [0] = "CreateBundleTokenValidationFailed", 
            [9] = if not v13 then nil else "CreateBundleItemNotAllowedInBundle", 
            [12] = if not v13 then nil else "CreateBundleCreatorMismatch"
        }, 
        [412] = if not v13 then nil else if not v13 then nil else {
            [10] = "CreateBundleInvalidState"
        }, 
        [501] = if not v13 then nil else if not v13 then nil else {
            [8] = "CreateBundleUnsupportedBundleType"
        }, 
        [503] = {
            [1] = "CreateBundleServiceUnavailable"
        }
    };
    local v35 = nil;
    local v36 = v34[v29.StatusCode];
    if (v36 ~= nil and v29.Body ~= nil) and v29.Body.errors ~= nil then
        for _, v38 in v29.Body.errors, nil, nil do
            local v39 = v36[v38.code];
            if v39 ~= nil then
                if v35 == nil then
                    v35 = v28:getText("AssetConfig", v39);
                else
                    v35 = v35 .. "\n" .. v28:getText("AssetConfig", v39);
                end;
            end;
        end;
        if v14() and v35 ~= nil then
            v35 = v35 .. v18(v33, v28);
        end;
    end;
    if v12() then
        v9.UGCUploadRequestBundleCreationStatusEvent(v9.Status.Failure, v30, v31, v32, nil, (v23(v29)));
    end;
    if v11.shouldDebugWarnings() then
        warn("Could not create UGC Bundle and received response:", v29);
    end;
    if v35 ~= nil then
        v27:dispatch(v2(v35));
    else
        v27:dispatch(v2(if not v14() then v28:getText("AssetConfig", "CreateBundleGenericError") else v28:getText("AssetConfig", "CreateBundleGenericError") .. v18(v33, v28)));
    end;
    v27:dispatch(v5(false));
end;
return function(v41, v42, v43, v44, v45, v46, v47, v48, v49)
    return function(v50)
        local v51 = if not v14() then nil else {
            [3] = "BundleCreationValidationFailed", 
            [4] = "BundleCreationInsufficientFunds", 
            [6] = "BundleCreationFeeMismatch"
        };
        local v52 = nil;
        if v12() then
            v52 = v10.getAvatarAssetTypeAsString(v42);
        end;
        local v53;
        if not v12() then
            v53 = nil;
        else
            local l_v45_0 = v45;
            if l_v45_0 then
                local _ = nil;
                v53 = if type(l_v45_0) == "table" then table.concat(l_v45_0, ", ") else tostring(l_v45_0);
            else
                v53 = nil;
            end;
        end;
        local function v60(v56)
            local l_creationStatusId_0 = v56.creationStatusId;
            if not l_creationStatusId_0 then
                if v12() then
                    v9.UGCUploadRequestBundleCreationStatusEvent(v9.Status.Failure, v52, v46, v53, nil, (v23(v56)));
                end;
                if v11.shouldDebugWarnings() then
                    warn("Unexpected UGCCreateBundleRequest respoonse:", v56);
                end;
                v50:dispatch(v2(v47:getText("AssetConfig", "CreateBundleGenericError")));
                v50:dispatch(v5(false));
                return ;
            else
                if v12() then
                    v9.UGCUploadRequestBundleCreationStatusEvent(v9.Status.Success, v52, v46, v53, l_creationStatusId_0);
                end;
                if v11.shouldDebugWarnings() then
                    warn("Received a creationStatusId to create a bundle:", l_creationStatusId_0);
                end;
                v50:dispatch(v4(0.9, v47:getText("AssetConfig", "BundleUploadStepNumber", {
                    currentStep = 4, 
                    totalSteps = 4
                }), v47:getText("AssetConfig", "BundleUploadGenerateBundleIdStep")));
                if v12() then
                    v9.UGCUploadGetBundleCreationStatusEvent(v9.Status.Start, v52, v46, v53, l_creationStatusId_0);
                end;
                v50:dispatch(v7(v41, l_creationStatusId_0, function(v58, v59)
                    v50:dispatch(v4(1, v47:getText("AssetConfig", "BundleUploadStepNumber", {
                        currentStep = 4, 
                        totalSteps = 4
                    }), v47:getText("AssetConfig", "BundleUploadCompleteStep")));
                    if not v58 then
                        if v12() then
                            v9.UGCUploadGetBundleCreationStatusEvent(v9.Status.Failure, v52, v46, v53, l_creationStatusId_0, nil, (v23(v59)));
                        end;
                        if not v13 then
                            v50:dispatch(v2(if not v59 then if v14() then v47:getText("AssetConfig", "ValidationErrorUnknown") .. v18(v48, v47, not not v17() or nil) else v47:getText("AssetConfig", "ValidationErrorUnknown") else v59));
                        else
                            if v11.shouldDebugWarnings() then
                                warn("UGC bundled creation failed and returned the response body:", v59);
                            end;
                            v50:dispatch(v2(if not v14() then v47:getText("AssetConfig", "ValidationErrorUnknown") else if v51 ~= nil and v51[v59.status] ~= nil then v47:getText("AssetConfig", v51[v59.status]) .. v18(v48, v47) else v47:getText("AssetConfig", "ValidationErrorUnknown") .. v18(v48, v47, not not v17() or nil)));
                        end;
                        v50:dispatch(v5(false));
                        return ;
                    else
                        if v12() then
                            v9.UGCUploadGetBundleCreationStatusEvent(v9.Status.Success, v52, v46, v53, l_creationStatusId_0, v58);
                        end;
                        if v11.shouldDebugWarnings() then
                            warn("UGC bundled creation succeeded with returned bundleId:", v58);
                        end;
                        if v15() and v49 ~= nil then
                            v50:dispatch(v16(v41, v58, v49, v47));
                        end;
                        v50:dispatch(v3(v58));
                        v50:dispatch(v5(true));
                        return ;
                    end;
                end));
                return ;
            end;
        end;
        local function v62(v61)
            if not v12() then
                v40(v50, v47, v61);
                return ;
            else
                v40(v50, v47, v61, v52, v46, v53, v48);
                return ;
            end;
        end;
        v50:dispatch(v4(0.85, v47:getText("AssetConfig", "BundleUploadStepNumber", {
            currentStep = 3, 
            totalSteps = 4
        }), v47:getText("AssetConfig", "BundleUploadCreateBundleStep")));
        if v12() then
            v9.UGCUploadRequestBundleCreationStatusEvent(v9.Status.Start, v52, v46, v53);
        end;
        return v41:postCreateBundle(v42, v43, v44, v45, v46, v48):andThen(v60, v62);
    end;
end;
