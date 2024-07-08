local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v1 = require(l_script_FirstAncestor_0.Packages.Cryo);
local v2 = require(l_script_FirstAncestor_0.Packages.Dash);
local v3 = require(l_script_FirstAncestor_0.Packages.React);
local v4 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local v5 = require(l_script_FirstAncestor_0.Src.Util.EquipmentStateContext);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v7 = require(l_script_FirstAncestor_0.Src.Util.copyHumanoidScaleToHumanoidDescription);
local v8 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAvatarPreviewerEditingTools);
local v9 = v8();
local v10 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAvatarPreviewerReplicateEditorStateOnWorldModel);
local v11 = game:DefineFastFlag("HumanoidDescriptionResetIncludesBodyParts", false);
local v12 = Color3.fromRGB(205, 205, 204);
local function _(v13, v14)
    v13.HeadColor = v14;
    v13.TorsoColor = v14;
    v13.LeftArmColor = v14;
    v13.RightArmColor = v14;
    v13.LeftLegColor = v14;
    v13.RightLegColor = v14;
end;
local function _(v16)
    return v2.map(v16, function(v17)
        return {
            AccessoryType = assert(v4.ASSET_TYPE_TO_ACCESSORY_TYPE[v17.AssetType], (("No known accessory type for %*"):format(v17.AssetType))), 
            AssetId = v17.AssetId, 
            Order = v17.Order
        };
    end);
end;
local function _(v19, v20, v21)
    local v22 = v19:Clone();
    for v23, v24 in v20, nil, nil do
        v22[v23.Name] = v24;
    end;
    v22:SetAccessories(v2.map(v21, function(v25)
        return {
            AccessoryType = assert(v4.ASSET_TYPE_TO_ACCESSORY_TYPE[v25.AssetType], (("No known accessory type for %*"):format(v25.AssetType))), 
            AssetId = v25.AssetId, 
            Order = v25.Order
        };
    end), true);
    return v22;
end;
return function(v27, v28, v29)
    local v30 = v3.useContext(v5);
    local v35 = if not v9 then v1.List.join(v30.avatarAssets.clothing, v2.collectArray(v30.avatarAssets.accessories, function(v31, v32)
        return {
            AssetId = v32, 
            AssetType = v31
        };
    end)) else v3.useMemo(function()
        if not (v29 ~= nil) or v29.includeAccessories then
            return v1.List.join(v30.avatarAssets.clothing, v2.collectArray(v30.avatarAssets.accessories, function(v33, v34)
                return {
                    AssetId = v34, 
                    AssetType = v33
                };
            end));
        else
            return {};
        end;
    end, {
        v29 and v29.includeAccessories, 
        v30.avatarAssets.clothing, 
        v30.avatarAssets.accessories
    });
    return v3.useMemo(function()
        local l_HumanoidDescription_0 = Instance.new("HumanoidDescription");
        if v30.avatarAssets.skinTone ~= nil then
            local l_l_HumanoidDescription_0_0 = l_HumanoidDescription_0;
            local l_skinTone_0 = v30.avatarAssets.skinTone;
            l_l_HumanoidDescription_0_0.HeadColor = l_skinTone_0;
            l_l_HumanoidDescription_0_0.TorsoColor = l_skinTone_0;
            l_l_HumanoidDescription_0_0.LeftArmColor = l_skinTone_0;
            l_l_HumanoidDescription_0_0.RightArmColor = l_skinTone_0;
            l_l_HumanoidDescription_0_0.LeftLegColor = l_skinTone_0;
            l_l_HumanoidDescription_0_0.RightLegColor = l_skinTone_0;
        else
            local l_BodyColors_0 = v27.WorldModel:FindFirstChildWhichIsA("BodyColors");
            if l_BodyColors_0 == nil then
                local l_l_HumanoidDescription_0_1 = l_HumanoidDescription_0;
                local l_v12_0 = v12;
                l_l_HumanoidDescription_0_1.HeadColor = l_v12_0;
                l_l_HumanoidDescription_0_1.TorsoColor = l_v12_0;
                l_l_HumanoidDescription_0_1.LeftArmColor = l_v12_0;
                l_l_HumanoidDescription_0_1.RightArmColor = l_v12_0;
                l_l_HumanoidDescription_0_1.LeftLegColor = l_v12_0;
                l_l_HumanoidDescription_0_1.RightLegColor = l_v12_0;
            else
                assert(l_BodyColors_0:IsA("BodyColors"), v4.LUAU_ANALYZE_ERROR);
                l_HumanoidDescription_0.HeadColor = l_BodyColors_0.HeadColor3;
                l_HumanoidDescription_0.TorsoColor = l_BodyColors_0.TorsoColor3;
                l_HumanoidDescription_0.LeftArmColor = l_BodyColors_0.LeftArmColor3;
                l_HumanoidDescription_0.RightArmColor = l_BodyColors_0.RightArmColor3;
                l_HumanoidDescription_0.LeftLegColor = l_BodyColors_0.LeftLegColor3;
                l_HumanoidDescription_0.RightLegColor = l_BodyColors_0.RightLegColor3;
            end;
        end;
        local l_l_HumanoidDescription_0_2 = l_HumanoidDescription_0;
        local l_patches_0 = v30.avatarAssets.patches;
        local l_v35_0 = v35;
        local v45 = l_l_HumanoidDescription_0_2:Clone();
        for v46, v47 in l_patches_0, nil, nil do
            v45[v46.Name] = v47;
        end;
        v45:SetAccessories(v2.map(l_v35_0, function(v48)
            return {
                AccessoryType = assert(v4.ASSET_TYPE_TO_ACCESSORY_TYPE[v48.AssetType], (("No known accessory type for %*"):format(v48.AssetType))), 
                AssetId = v48.AssetId, 
                Order = v48.Order
            };
        end), true);
        l_HumanoidDescription_0 = v45;
        v7(l_HumanoidDescription_0, v27.WorldModel.Humanoid);
        if ((not (not v11 or not v8()) and (v29 and v29.resetIncludesBodyParts) ~= nil) and v29 ~= nil) and v29.resetIncludesBodyParts ~= nil then
            l_HumanoidDescription_0.ResetIncludesBodyParts = v29.resetIncludesBodyParts;
        end;
        return l_HumanoidDescription_0;
    end, v1.List.join({
        if not v10() then v30 else v30.avatarAssets, 
        if not v9 then nil else v35, 
        if not v9 then nil else v29 and v29.resetIncludesBodyParts
    }, v28));
end;
