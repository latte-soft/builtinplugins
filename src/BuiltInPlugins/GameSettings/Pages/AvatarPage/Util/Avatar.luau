local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Util.AvatarRigManager);
local v2 = require(l_Parent_0.Networking.AvatarWebAPI);
local v3 = require(l_Parent_0.Util.ConstantAvatar);
local v4 = {};
v4.__index = v4;
local v5 = nil;
local v6 = nil;
local v7 = nil;
v4.loadWithTemplates = function(v8, v9, v10)
    local v11 = setmetatable({}, v4);
    v11.avatarData = v5();
    if v11.avatarData then
        v11.playerChoiceAvatarType = v3.AvatarType[v11.avatarData.playerAvatarType];
        v11.characterManager = v1.new(v8, v9);
        v11:applyTemplates(v10);
        return v11;
    else
        return ;
    end;
end;
v4.applyTemplates = function(v12, v13)
    local v14 = v7(v12);
    local v15 = v13 and v13[next(v13)];
    v6(v12, v15);
    if v15 then
        v15:apply(v14);
    end;
    spawn(function()
        if v12.characterManager then
            v12.characterManager:applyDescription(v14);
        end;
    end);
end;
v4.setPosition = function(v16, v17)
    v16.characterManager:setPosition(v17);
end;
v4.destroy = function(v18)
    v18.characterManager:stop();
end;
local function v23(v19, v20)
    if v20 then
        for _, v22 in ipairs(v20) do
            if v3.AssetTypes.Hat == v22.assetType.id then
                v19.HatAccessory = v19.HatAccessory .. "," .. tostring(v22.id);
            elseif v3.AssetTypes.Hair == v22.assetType.id then
                v19.HairAccessory = v19.HairAccessory .. "," .. tostring(v22.id);
            elseif v3.AssetTypes.FaceAccessory == v22.assetType.id then
                v19.FaceAccessory = v19.FaceAccessory .. "," .. tostring(v22.id);
            elseif v3.AssetTypes.Neck == v22.assetType.id then
                v19.NeckAccessory = v19.NeckAccessory .. "," .. tostring(v22.id);
            elseif v3.AssetTypes.Shoulder == v22.assetType.id then
                v19.ShouldersAccessory = v19.ShouldersAccessory .. "," .. tostring(v22.id);
            elseif v3.AssetTypes.Front == v22.assetType.id then
                v19.FrontAccessory = v19.FrontAccessory .. "," .. tostring(v22.id);
            elseif v3.AssetTypes.Back == v22.assetType.id then
                v19.BackAccessory = v19.BackAccessory .. "," .. tostring(v22.id);
            elseif v3.AssetTypes.Waist == v22.assetType.id then
                v19.WaistAccessory = v19.WaistAccessory .. "," .. tostring(v22.id);
            elseif v3.AssetTypes.Shirt == v22.assetType.id then
                v19.Shirt = v22.id;
            elseif v3.AssetTypes.ShirtGraphic == v22.assetType.id then
                v19.GraphicTShirt = v22.id;
            elseif v3.AssetTypes.Pants == v22.assetType.id then
                v19.Pants = v22.id;
            elseif v3.AssetTypes.Face == v22.assetType.id then
                v19.Face = v22.id;
            elseif v3.AssetTypes.Head == v22.assetType.id then
                v19.Head = v22.id;
            elseif v3.AssetTypes.Torso == v22.assetType.id then
                v19.Torso = v22.id;
            elseif v3.AssetTypes.LeftArm == v22.assetType.id then
                v19.LeftArm = v22.id;
            elseif v3.AssetTypes.RightArm == v22.assetType.id then
                v19.RightArm = v22.id;
            elseif v3.AssetTypes.LeftLeg == v22.assetType.id then
                v19.LeftLeg = v22.id;
            elseif v3.AssetTypes.RightLeg == v22.assetType.id then
                v19.RightLeg = v22.id;
            end;
        end;
    end;
end;
local function _(v24, v25)
    if v25 then
        v24.HeightScale = v25.height or v24.HeightScale;
        v24.WidthScale = v25.width or v24.WidthScale;
        v24.HeadScale = v25.head or v24.HeadScale;
        v24.DepthScale = v25.depth or v24.DepthScale;
        v24.BodyTypeScale = v25.bodyType or v24.BodyTypeScale;
        v24.ProportionScale = v25.proportion or v24.ProportionScale;
    end;
end;
local function v29(v27, v28)
    if v28 then
        v27.HeadColor = not not v28.headColorId and BrickColor.new(v28.headColorId).Color or v27.HeadColor;
        v27.TorsoColor = not not v28.torsoColorId and BrickColor.new(v28.torsoColorId).Color or v27.TorsoColor;
        v27.RightArmColor = not not v28.rightArmColorId and BrickColor.new(v28.rightArmColorId).Color or v27.RightArmColor;
        v27.LeftArmColor = not not v28.leftArmColorId and BrickColor.new(v28.leftArmColorId).Color or v27.LeftArmColor;
        v27.RightLegColor = not not v28.rightLegColorId and BrickColor.new(v28.rightLegColorId).Color or v27.RightLegColor;
        v27.LeftLegColor = not not v28.rightLegColorId and BrickColor.new(v28.rightLegColorId).Color or v27.LeftLegColor;
    end;
end;
v7 = function(v30)
    local l_HumanoidDescription_0 = Instance.new("HumanoidDescription");
    v23(l_HumanoidDescription_0, v30.avatarData.assets);
    local l_scales_0 = v30.avatarData.scales;
    if l_scales_0 then
        l_HumanoidDescription_0.HeightScale = l_scales_0.height or l_HumanoidDescription_0.HeightScale;
        l_HumanoidDescription_0.WidthScale = l_scales_0.width or l_HumanoidDescription_0.WidthScale;
        l_HumanoidDescription_0.HeadScale = l_scales_0.head or l_HumanoidDescription_0.HeadScale;
        l_HumanoidDescription_0.DepthScale = l_scales_0.depth or l_HumanoidDescription_0.DepthScale;
        l_HumanoidDescription_0.BodyTypeScale = l_scales_0.bodyType or l_HumanoidDescription_0.BodyTypeScale;
        l_HumanoidDescription_0.ProportionScale = l_scales_0.proportion or l_HumanoidDescription_0.ProportionScale;
    end;
    v29(l_HumanoidDescription_0, v30.avatarData.bodyColors);
    return l_HumanoidDescription_0;
end;
v6 = function(v33, v34)
    if v34 ~= nil and not v34:isRigTypePlayerChoice() then
        v33.characterManager:updateAvatarType(v34.RigTypeValue);
        return ;
    else
        v33.characterManager:updateAvatarType(v33.playerChoiceAvatarType);
        return ;
    end;
end;
v5 = function()
    local v35, v36 = v2.GetAvatarData();
    if v35 ~= v2.Status.OK then
        warn("Avatar:getAvatarData() failure in AvatarWebAPI:GetAvatarData()");
        return ;
    else
        if v36 == nil then
            warn("Avatar:getAvatarData() failure in AvatarWebAPI:GetAvatarData() as result avatar data is nil");
        end;
        return v36;
    end;
end;
return v4;
