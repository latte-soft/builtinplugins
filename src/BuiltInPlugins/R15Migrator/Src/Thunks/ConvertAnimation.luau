local l_script_FirstAncestor_0 = script:FindFirstAncestor("R15Migrator");
local l_deepCopy_0 = require(l_script_FirstAncestor_0.Packages.Framework).Util.deepCopy;
local v2 = require(l_script_FirstAncestor_0.Src.Actions.SetAnimations);
local v3 = require(l_script_FirstAncestor_0.Src.Actions.SetAnimation);
local l_Thunks_0 = l_script_FirstAncestor_0.Src.Thunks;
local v5 = require(l_Thunks_0.UpdateScriptSuggestion);
local v6 = require(l_Thunks_0.ReplaceAnimation);
local l_AnimationConversion_0 = l_script_FirstAncestor_0.Src.Util.AnimationConversion;
local v8 = require(l_AnimationConversion_0.serializeInstances);
local v9 = require(l_AnimationConversion_0.AnimationConversionManager);
local v10 = require(l_AnimationConversion_0.constants);
local l_AssetType_0 = v10.AssetType;
local l_AnimationStatus_0 = v10.AnimationStatus;
local v13 = require(l_script_FirstAncestor_0.Src.Util.SaveInterface);
local l_MarketplaceService_0 = game:GetService("MarketplaceService");
local l_PublishService_0 = game:GetService("PublishService");
local l_StudioService_0 = game:GetService("StudioService");
local function v26(v17, v18, v19, v20, v21)
    local v22 = l_deepCopy_0(v17:getState().AnimationConversion.animations);
    local v23 = 0;
    for v24, _ in v18, nil, nil do
        if v22[v24] then
            v22[v24].status = v19;
            v22[v24].errCode = v21;
            v22[v24].converted = v20;
            v23 = v23 + 1;
        end;
    end;
    if v23 == 1 then
        v17:dispatch(v3(next(v18), v22[next(v18)]));
        return ;
    else
        v17:dispatch(v2(v22));
        return ;
    end;
end;
local function v46(v27, v28, v29, v30, _)
    local l_id_0 = v28.id;
    local l_status_0, l_result_0 = pcall(function()
        return l_MarketplaceService_0:GetProductInfo(l_id_0);
    end);
    if l_status_0 then
        local v35 = l_result_0.Name .. " R15";
        local l_Description_0 = l_result_0.Description;
        local v37 = nil;
        if l_result_0.Creator.CreatorType == Enum.CreatorType.Group.Name then
            v37 = l_result_0.Creator.CreatorTargetId;
        end;
        local v38 = {};
        table.insert(v38, v27);
        local l_status_1, l_result_1 = pcall(function()
            return v8(v38);
        end);
        if l_status_1 then
            local v41 = if not v37 then Enum.AssetCreatorType.User else Enum.AssetCreatorType.Group;
            local v42 = if not v37 then l_StudioService_0:GetUserId() else v37;
            local l_status_2, l_result_2 = pcall(function()
                return l_PublishService_0:CreateAssetOrAssetVersionAndPollAssetWithTelemetryAsync(l_result_1, v41, v42, "Animation", 0, v35, l_Description_0, "", "model/x-rbxm", 0);
            end);
            if l_status_2 then
                local l_AssetId_0 = l_result_2.AssetId;
                v9.addCacheEntry(l_id_0, l_AssetId_0);
                v13.setTargetAssetId(tonumber(l_id_0), (tonumber(l_AssetId_0)));
                v26(v30, {
                    [l_id_0] = true
                }, nil, l_AssetId_0);
                v30:dispatch(v5(l_id_0, v9.getAnimationId(l_AssetId_0), v29));
                return true;
            else
                v26(v30, {
                    [l_id_0] = true
                }, l_AnimationStatus_0.FailedWithError, nil, l_result_2);
                return false;
            end;
        else
            v26(v30, {
                [l_id_0] = true
            }, l_AnimationStatus_0.FailedSerialization);
            return false;
        end;
    else
        v26(v30, {
            [l_id_0] = true
        }, l_AnimationStatus_0.FailedToGetProductInfo);
        return false;
    end;
end;
return function(v47, v48)
    return function(v49)
        local v50 = v49:getState();
        local v51 = {};
        local v52 = {};
        for v53 in v50.AnimationConversion.selection, nil, nil do
            local v54 = v9.getAnimationAssetInfo(v53);
            if v54:IsA(l_AssetType_0.RobloxAsset) and not v50.AnimationConversion.animations[v53].converted then
                local l_status_3 = v50.AnimationConversion.animations[v53].status;
                if not (not (l_status_3 ~= l_AnimationStatus_0.Uploading and l_status_3 ~= l_AnimationStatus_0.Done) or not v9.getConvertedKeyframeSequence(v54)) then
                    v51[v53] = v54;
                end;
            else
                table.insert(v52, v54);
            end;
        end;
        v26(v49, v51, l_AnimationStatus_0.Uploading);
        for _, v57 in v51, nil, nil do
            if v46(v9.getConvertedKeyframeSequence(v57):Clone(), v57, v47, v49, v48) then
                table.insert(v52, v57);
            end;
        end;
        v49:dispatch(v6(v52, v47, v48));
        v48:getHandler("onAnimationsConverted")(v50.AnimationConversion.animations, v50.AnimationConversion.selection);
    end;
end;
