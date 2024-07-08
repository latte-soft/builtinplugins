local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Util.ConstantAvatar);
local v2 = require(l_Parent_0.Util.ConstantScaleBoundaries);
local v3 = require(l_Parent_0.Util.ConstantTemplate);
local v4 = require(l_Parent_0.Util.UtilityFunctionsTable);
local v5 = {};
v5.__index = v5;
local v6 = nil;
local v7 = nil;
local v8 = nil;
local v9 = nil;
local v10 = nil;
local v11 = nil;
local v12 = nil;
local v13 = nil;
local v14 = {
    v1.AssetTypes.Face, 
    v1.AssetTypes.Head, 
    v1.AssetTypes.Torso, 
    v1.AssetTypes.LeftArm, 
    v1.AssetTypes.RightArm, 
    v1.AssetTypes.LeftLeg, 
    v1.AssetTypes.RightLeg, 
    v1.AssetTypes.Shirt, 
    v1.AssetTypes.Pants, 
    v1.AssetTypes.ShirtGraphic
};
v5.new = function(v15)
    local v16 = setmetatable({}, v5);
    v6(v16);
    if not v15 then
        v15 = v2;
        v16.ScalesMin = v7(v15.Height.min, v15.Width.min, v15.Head.min, v15.BodyType.min, v15.Proportion.min, 0);
        v16.ScalesMax = v7(v15.Height.max, v15.Width.max, v15.Head.max, v15.BodyType.max, v15.Proportion.max, 0);
    else
        v16.ScalesMin = v7(v15.height.min, v15.width.min, v15.head.min, v15.bodyType.min, v15.proportion.min, 0);
        v16.ScalesMax = v7(v15.height.max, v15.width.max, v15.head.max, v15.bodyType.max, v15.proportion.max, 0);
    end;
    v16.CollisionValue = v3.OuterCollision;
    v16.AnimationValue = v3.PlayerChoice;
    v16.RigTypeValue = v3.PlayerChoice;
    return v16;
end;
v5.makeCopy = function(v17)
    local v18 = v5.new();
    local v19 = {
        AssetsOverrides = v11, 
        ScalesMin = v12, 
        ScalesMax = v12
    };
    if v17 then
        for v20, v21 in pairs(v17) do
            v18[v20] = (v19[v20] or function(v22)
                return v22;
            end)(v21);
        end;
    end;
    return v18;
end;
v5.fromUniverseData = function(v23)
    local v24 = v5.new();
    v24.RigTypeValue = v23.AvatarType or v24.RigTypeValue;
    v24.AnimationValue = v23.AvatarAnimation or v24.AnimationValue;
    v24.CollisionValue = v23.AvatarCollision or v24.CollisionValue;
    v8(v24, v23.AvatarAssetOverrides);
    v9(v24, v23.AvatarScalingMin);
    v10(v24, v23.AvatarScalingMax);
    return v24;
end;
v5.apply = function(v25, v26)
    v26.HeightScale = math.clamp(v26.HeightScale, v25.ScalesMin.height, v25.ScalesMax.height);
    v26.WidthScale = math.clamp(v26.WidthScale, v25.ScalesMin.width, v25.ScalesMax.width);
    v26.HeadScale = math.clamp(v26.HeadScale, v25.ScalesMin.head, v25.ScalesMax.head);
    v26.BodyTypeScale = math.clamp(v26.BodyTypeScale, v25.ScalesMin.bodyType, v25.ScalesMax.bodyType);
    v26.ProportionScale = math.clamp(v26.ProportionScale, v25.ScalesMin.proportion, v25.ScalesMax.proportion);
    for v27, v28 in pairs({
        [v1.AssetTypes.Face] = "Face", 
        [v1.AssetTypes.Head] = "Head", 
        [v1.AssetTypes.Torso] = "Torso", 
        [v1.AssetTypes.LeftArm] = "LeftArm", 
        [v1.AssetTypes.RightArm] = "RightArm", 
        [v1.AssetTypes.LeftLeg] = "LeftLeg", 
        [v1.AssetTypes.RightLeg] = "RightLeg", 
        [v1.AssetTypes.Shirt] = "Shirt", 
        [v1.AssetTypes.Pants] = "Pants", 
        [v1.AssetTypes.ShirtGraphic] = "GraphicTShirt"
    }) do
        if not v25.AssetsOverrides[v27].isPlayerChoice and v25.AssetsOverrides[v27].assetID ~= 0 then
            v26[v28] = v25.AssetsOverrides[v27].assetID;
        end;
    end;
end;
v5.extractAssetOverridesForSaving = function(v29)
    local v30 = {};
    for _, v32 in ipairs(v14) do
        local v33, v34 = v29:getAsset(v32);
        v30[#v30 + 1] = {
            assetTypeID = v32, 
            assetID = v33, 
            isPlayerChoice = v34
        };
    end;
    return v30;
end;
v5.extractScalingMinForSaving = function(v35)
    return v12(v35.ScalesMin);
end;
v5.extractScalingMaxForSaving = function(v36)
    return v12(v36.ScalesMax);
end;
v5.isAvatarTypeEqualTo = function(v37, v38)
    return v37.RigTypeValue == v38.RigTypeValue;
end;
v5.isAnimationEqualTo = function(v39, v40)
    return v39.AnimationValue == v40.AnimationValue;
end;
v5.isCollisionEqualTo = function(v41, v42)
    return v41.CollisionValue == v42.CollisionValue;
end;
v5.areAssetsEqualTo = function(v43, v44)
    for _, v46 in ipairs(v14) do
        local v47, v48 = v43:getAsset(v46);
        local v49, v50 = v44:getAsset(v46);
        if not (v47 == v49) or v48 ~= v50 then
            return false;
        end;
    end;
    return true;
end;
v5.areMinScalesEqualTo = function(v51, v52)
    return v13(v51.ScalesMin, v52.ScalesMin);
end;
v5.areMaxScalesEqualTo = function(v53, v54)
    return v13(v53.ScalesMax, v54.ScalesMax);
end;
v5.isRigTypePlayerChoice = function(v55)
    return v55.RigTypeValue == v3.PlayerChoice;
end;
v5.isRigTypeR6 = function(v56)
    return v56.RigTypeValue == v3.R6;
end;
v5.isRigTypeR15 = function(v57)
    return v57.RigTypeValue == v3.R15;
end;
v5.setRigTypeR6 = function(v58)
    v58.RigTypeValue = v3.R6;
end;
v5.setRigTypeR15 = function(v59)
    v59.RigTypeValue = v3.R15;
end;
v5.setRigTypePlayerChoice = function(v60)
    v60.RigTypeValue = v3.PlayerChoice;
end;
v5.isAnimationStandard = function(v61)
    return v61.AnimationValue == v3.AnimationStandard;
end;
v5.isAnimationPlayerChoice = function(v62)
    return v62.AnimationValue == v3.PlayerChoice;
end;
v5.setAnimationStandard = function(v63)
    v63.AnimationValue = v3.AnimationStandard;
end;
v5.setAnimationPlayerChoice = function(v64)
    v64.AnimationValue = v3.PlayerChoice;
end;
v5.isCollisionInnerBox = function(v65)
    return v65.CollisionValue == v3.InnerCollision;
end;
v5.setCollisionInnerBox = function(v66)
    v66.CollisionValue = v3.InnerCollision;
end;
v5.isCollisionOuterBox = function(v67)
    return v67.CollisionValue == v3.OuterCollision;
end;
v5.setCollisionOuterBox = function(v68)
    v68.CollisionValue = v3.OuterCollision;
end;
v5.setScaleHeightMin = function(v69, v70, v71)
    v69.ScalesMin.height = math.max(v71.height.min, (math.min(v71.height.max, v70)));
end;
v5.setScaleWidthMin = function(v72, v73, v74)
    v72.ScalesMin.width = math.max(v74.width.min, (math.min(v74.width.max, v73)));
end;
v5.setScaleHeadMin = function(v75, v76, v77)
    v75.ScalesMin.head = math.max(v77.head.min, (math.min(v77.head.max, v76)));
end;
v5.setScaleBodyTypeMin = function(v78, v79, v80)
    v78.ScalesMin.bodyType = math.max(v80.bodyType.min, (math.min(v80.bodyType.max, v79)));
end;
v5.setScaleProportionMin = function(v81, v82, v83)
    v81.ScalesMin.proportion = math.max(v83.proportion.min, (math.min(v83.proportion.max, v82)));
end;
v5.setScaleHeightMax = function(v84, v85, v86)
    v84.ScalesMax.height = math.max(v86.height.min, (math.min(v86.height.max, v85)));
end;
v5.setScaleWidthMax = function(v87, v88, v89)
    v87.ScalesMax.width = math.max(v89.width.min, (math.min(v89.width.max, v88)));
end;
v5.setScaleHeadMax = function(v90, v91, v92)
    v90.ScalesMax.head = math.max(v92.head.min, (math.min(v92.head.max, v91)));
end;
v5.setScaleBodyTypeMax = function(v93, v94, v95)
    v93.ScalesMax.bodyType = math.max(v95.bodyType.min, (math.min(v95.bodyType.max, v94)));
end;
v5.setScaleProportionMax = function(v96, v97, v98)
    v96.ScalesMax.proportion = math.max(v98.proportion.min, (math.min(v98.proportion.max, v97)));
end;
v5.getScaleHeightMin = function(v99)
    return v99.ScalesMin.height;
end;
v5.getScaleWidthMin = function(v100)
    return v100.ScalesMin.width;
end;
v5.getScaleHeadMin = function(v101)
    return v101.ScalesMin.head;
end;
v5.getScaleBodyTypeMin = function(v102)
    return v102.ScalesMin.bodyType;
end;
v5.getScaleProportionMin = function(v103)
    return v103.ScalesMin.proportion;
end;
v5.getScaleHeightMax = function(v104)
    return v104.ScalesMax.height;
end;
v5.getScaleWidthMax = function(v105)
    return v105.ScalesMax.width;
end;
v5.getScaleHeadMax = function(v106)
    return v106.ScalesMax.head;
end;
v5.getScaleBodyTypeMax = function(v107)
    return v107.ScalesMax.bodyType;
end;
v5.getScaleProportionMax = function(v108)
    return v108.ScalesMax.proportion;
end;
v5.setAsset = function(v109, v110, v111, v112)
    if v109.AssetsOverrides[v110] then
        if v111 ~= nil then
            v109.AssetsOverrides[v110].assetID = v111;
        end;
        if v112 ~= nil then
            v109.AssetsOverrides[v110].isPlayerChoice = v112;
        end;
    end;
end;
v5.getAsset = function(v113, v114)
    if not v113.AssetsOverrides[v114] then
        return nil, nil;
    else
        return v113.AssetsOverrides[v114].assetID, v113.AssetsOverrides[v114].isPlayerChoice;
    end;
end;
v6 = function(v115)
    v115.AssetsOverrides = {};
    for _, v117 in ipairs(v14) do
        v115.AssetsOverrides[v117] = {
            assetID = 0, 
            isPlayerChoice = true
        };
    end;
end;
v7 = function(v118, v119, v120, v121, v122, v123)
    return {
        height = v118, 
        width = v119, 
        head = v120, 
        bodyType = v121, 
        proportion = v122, 
        depth = v123
    };
end;
v8 = function(v124, v125)
    if v125 then
        for _, v127 in pairs(v125) do
            v124:setAsset(v127.assetTypeID, v127.assetID, v127.isPlayerChoice);
        end;
    end;
end;
v9 = function(v128, v129)
    if v129 then
        v128.ScalesMin = v7(v129.height, v129.width, v129.head, v129.bodyType, v129.proportion, v129.depth);
    end;
end;
v10 = function(v130, v131)
    if v131 then
        v130.ScalesMax = v7(v131.height, v131.width, v131.head, v131.bodyType, v131.proportion, v131.depth);
    end;
end;
v11 = function(v132)
    local v133 = {};
    for v134, v135 in pairs(v132) do
        v133[v134] = {
            assetID = v135.assetID, 
            isPlayerChoice = v135.isPlayerChoice
        };
    end;
    return v133;
end;
v12 = function(v136)
    local v137 = {};
    for v138, v139 in pairs(v136) do
        v137[v138] = v139;
    end;
    return v137;
end;
v13 = function(v140, v141)
    for v142, v143 in pairs(v140) do
        if v143 ~= v141[v142] then
            return false;
        end;
    end;
    return v4.countDictionaryKeys(v140) == v4.countDictionaryKeys(v141);
end;
return v5;
