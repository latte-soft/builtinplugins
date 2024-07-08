local l_Math_0 = require(script.Parent.Parent.Parent.Parent.Packages.Framework).Util.Math;
local v1 = {};
v1.__index = v1;
local function _(v2)
    return tostring(l_Math_0.round(v2.Min, 2)), (tostring(l_Math_0.round(v2.Max, 2)));
end;
v1.new = function(v4)
    return (setmetatable({
        __networking = v4
    }, v1));
end;
v1.avatarRulesV1GET = function(v5)
    return v5.__networking:get("avatar", "/v1/avatar-rules");
end;
v1.configurationV2GET = function(v6, v7)
    return v6.__networking:get("develop", "/v2/universes/" .. v7 .. "/configuration");
end;
v1.configurationV2PATCH = function(v8, v9, v10)
    return v8.__networking:patch("develop", "/v2/universes/" .. v9 .. "/configuration", {
        Body = v10
    });
end;
v1.getAvatarType = function(v11, v12)
    local l_StarterPlayer_0 = v12:GetService("StarterPlayer");
    local l_GameId_0 = v12.GameId;
    if l_GameId_0 == 0 then
        return l_StarterPlayer_0.GameSettingsAvatar;
    else
        local l_universeAvatarType_0 = v11:configurationV2GET(l_GameId_0):await().responseBody.universeAvatarType;
        if l_universeAvatarType_0 == "MorphToR6" then
            return Enum.GameAvatarType.R6;
        elseif l_universeAvatarType_0 == "MorphToR15" then
            return Enum.GameAvatarType.R15;
        else
            return Enum.GameAvatarType.PlayerChoice;
        end;
    end;
end;
v1.setAvatarType = function(v16, v17, v18)
    local l_StarterPlayer_1 = v17:GetService("StarterPlayer");
    local l_GameId_1 = v17.GameId;
    if l_GameId_1 == 0 then
        l_StarterPlayer_1.GameSettingsAvatar = v18;
        return ;
    else
        local _ = nil;
        v16:configurationV2PATCH(l_GameId_1, {
            universeAvatarType = v18 == Enum.GameAvatarType.R6 and "MorphToR6" or (v18 == Enum.GameAvatarType.R15 and "MorphToR15" or "PlayerChoice")
        }):await();
        return ;
    end;
end;
v1.getAnimationType = function(v22, v23)
    local l_StarterPlayer_2 = v23:GetService("StarterPlayer");
    local l_GameId_2 = v23.GameId;
    if l_GameId_2 == 0 then
        if not l_StarterPlayer_2.AllowCustomAnimations then
            return "Standard";
        else
            return "PlayerChoice";
        end;
    else
        return v22:configurationV2GET(l_GameId_2):await().responseBody.universeAnimationType;
    end;
end;
v1.setAnimationType = function(v26, v27, v28)
    local l_StarterPlayer_3 = v27:GetService("StarterPlayer");
    local l_GameId_3 = v27.GameId;
    if l_GameId_3 == 0 then
        l_StarterPlayer_3.AllowCustomAnimations = v28 == "Standard";
        return ;
    else
        v26:configurationV2PATCH(l_GameId_3, {
            universeAnimationType = v28
        }):await();
        return ;
    end;
end;
v1.getCollisionType = function(v31, v32)
    local l_StarterPlayer_4 = v32:GetService("StarterPlayer");
    local l_GameId_4 = v32.GameId;
    if l_GameId_4 == 0 then
        return l_StarterPlayer_4.GameSettingsR15Collision;
    else
        return Enum.R15CollisionType[v31:configurationV2GET(l_GameId_4):await().responseBody.universeCollisionType];
    end;
end;
v1.setCollisionType = function(v35, v36, v37)
    local l_StarterPlayer_5 = v36:GetService("StarterPlayer");
    local l_GameId_5 = v36.GameId;
    if l_GameId_5 == 0 then
        l_StarterPlayer_5.GameSettingsR15Collision = v37;
        return ;
    else
        v35:configurationV2PATCH(l_GameId_5, {
            universeCollisionType = v37.Name
        }):await();
        return ;
    end;
end;
v1.getHeightRules = function(v40)
    local l_height_0 = v40:avatarRulesV1GET():await().responseBody.scales.height;
    return NumberRange.new(l_height_0.min, l_height_0.max), l_height_0.increment;
end;
v1.getHeightRange = function(v42, v43)
    local l_StarterPlayer_6 = v43:GetService("StarterPlayer");
    local l_GameId_6 = v43.GameId;
    local v46 = nil;
    local v47 = nil;
    if l_GameId_6 == 0 then
        v46 = l_StarterPlayer_6.GameSettingsScaleRangeHeight.Min;
        v47 = l_StarterPlayer_6.GameSettingsScaleRangeHeight.Max;
    else
        local v48 = v42:configurationV2GET(l_GameId_6):await();
        v46 = v48.responseBody.universeAvatarMinScales.height;
        v47 = v48.responseBody.universeAvatarMaxScales.height;
    end;
    return NumberRange.new(v46, v47);
end;
v1.setHeightRange = function(v49, v50, v51)
    local l_StarterPlayer_7 = v50:GetService("StarterPlayer");
    local l_GameId_7 = v50.GameId;
    if l_GameId_7 == 0 then
        l_StarterPlayer_7.GameSettingsScaleRangeHeight = v51;
        return ;
    else
        v49:configurationV2PATCH(l_GameId_7, {
            universeAvatarMinScales = {
                height = tostring(l_Math_0.round(v51.Min, 2))
            }, 
            universeAvatarMaxScales = {
                height = tostring(l_Math_0.round(v51.Max, 2))
            }
        }):await();
        return ;
    end;
end;
v1.getWidthRules = function(v54)
    local l_width_0 = v54:avatarRulesV1GET():await().responseBody.scales.width;
    return NumberRange.new(l_width_0.min, l_width_0.max), l_width_0.increment;
end;
v1.getWidthRange = function(v56, v57)
    local l_StarterPlayer_8 = v57:GetService("StarterPlayer");
    local l_GameId_8 = v57.GameId;
    local v60 = nil;
    local v61 = nil;
    if l_GameId_8 == 0 then
        v60 = l_StarterPlayer_8.GameSettingsScaleRangeWidth.Min;
        v61 = l_StarterPlayer_8.GameSettingsScaleRangeWidth.Max;
    else
        local v62 = v56:configurationV2GET(l_GameId_8):await();
        v60 = v62.responseBody.universeAvatarMinScales.width;
        v61 = v62.responseBody.universeAvatarMaxScales.width;
    end;
    return NumberRange.new(v60, v61);
end;
v1.setWidthRange = function(v63, v64, v65)
    local l_StarterPlayer_9 = v64:GetService("StarterPlayer");
    local l_GameId_9 = v64.GameId;
    if l_GameId_9 == 0 then
        l_StarterPlayer_9.GameSettingsScaleRangeWidth = v65;
        return ;
    else
        v63:configurationV2PATCH(l_GameId_9, {
            universeAvatarMinScales = {
                width = tostring(l_Math_0.round(v65.Min, 2)), 
                depth = 0
            }, 
            universeAvatarMaxScales = {
                width = tostring(l_Math_0.round(v65.Max, 2)), 
                depth = 0
            }
        }):await();
        return ;
    end;
end;
v1.getHeadScaleRules = function(v68)
    local l_head_0 = v68:avatarRulesV1GET():await().responseBody.scales.head;
    return NumberRange.new(l_head_0.min, l_head_0.max), l_head_0.increment;
end;
v1.getHeadScaleRange = function(v70, v71)
    local l_StarterPlayer_10 = v71:GetService("StarterPlayer");
    local l_GameId_10 = v71.GameId;
    local v74 = nil;
    local v75 = nil;
    if l_GameId_10 == 0 then
        v74 = l_StarterPlayer_10.GameSettingsScaleRangeHead.Min;
        v75 = l_StarterPlayer_10.GameSettingsScaleRangeHead.Max;
    else
        local v76 = v70:configurationV2GET(l_GameId_10):await();
        v74 = v76.responseBody.universeAvatarMinScales.head;
        v75 = v76.responseBody.universeAvatarMaxScales.head;
    end;
    return NumberRange.new(v74, v75);
end;
v1.setHeadScaleRange = function(v77, v78, v79)
    local l_StarterPlayer_11 = v78:GetService("StarterPlayer");
    local l_GameId_11 = v78.GameId;
    if l_GameId_11 == 0 then
        l_StarterPlayer_11.GameSettingsScaleRangeHead = v79;
        return ;
    else
        v77:configurationV2PATCH(l_GameId_11, {
            universeAvatarMinScales = {
                head = tostring(l_Math_0.round(v79.Min, 2))
            }, 
            universeAvatarMaxScales = {
                head = tostring(l_Math_0.round(v79.Max, 2))
            }
        }):await();
        return ;
    end;
end;
v1.getBodyTypeRules = function(v82)
    local l_bodyType_0 = v82:avatarRulesV1GET():await().responseBody.scales.bodyType;
    return NumberRange.new(l_bodyType_0.min, l_bodyType_0.max), l_bodyType_0.increment;
end;
v1.getBodyTypeRange = function(v84, v85)
    local l_StarterPlayer_12 = v85:GetService("StarterPlayer");
    local l_GameId_12 = v85.GameId;
    local v88 = nil;
    local v89 = nil;
    if l_GameId_12 == 0 then
        v88 = l_StarterPlayer_12.GameSettingsScaleRangeBodyType.Min;
        v89 = l_StarterPlayer_12.GameSettingsScaleRangeBodyType.Max;
    else
        local v90 = v84:configurationV2GET(l_GameId_12):await();
        v88 = v90.responseBody.universeAvatarMinScales.bodyType;
        v89 = v90.responseBody.universeAvatarMaxScales.bodyType;
    end;
    return NumberRange.new(v88, v89);
end;
v1.setBodyTypeRange = function(v91, v92, v93)
    local l_StarterPlayer_13 = v92:GetService("StarterPlayer");
    local l_GameId_13 = v92.GameId;
    if l_GameId_13 == 0 then
        l_StarterPlayer_13.GameSettingsScaleRangeBodyType = v93;
        return ;
    else
        v91:configurationV2PATCH(l_GameId_13, {
            universeAvatarMinScales = {
                bodyType = tostring(l_Math_0.round(v93.Min, 2))
            }, 
            universeAvatarMaxScales = {
                bodyType = tostring(l_Math_0.round(v93.Max, 2))
            }
        }):await();
        return ;
    end;
end;
v1.getProportionsRules = function(v96)
    local l_proportion_0 = v96:avatarRulesV1GET():await().responseBody.scales.proportion;
    return NumberRange.new(l_proportion_0.min, l_proportion_0.max), l_proportion_0.increment;
end;
v1.getProportionsRange = function(v98, v99)
    local l_StarterPlayer_14 = v99:GetService("StarterPlayer");
    local l_GameId_14 = v99.GameId;
    local v102 = nil;
    local v103 = nil;
    if l_GameId_14 == 0 then
        v102 = l_StarterPlayer_14.GameSettingsScaleRangeProportion.Min;
        v103 = l_StarterPlayer_14.GameSettingsScaleRangeProportion.Max;
    else
        local v104 = v98:configurationV2GET(l_GameId_14):await();
        v102 = v104.responseBody.universeAvatarMinScales.proportion;
        v103 = v104.responseBody.universeAvatarMaxScales.proportion;
    end;
    return NumberRange.new(v102, v103);
end;
v1.setProportionsRange = function(v105, v106, v107)
    local l_StarterPlayer_15 = v106:GetService("StarterPlayer");
    local l_GameId_15 = v106.GameId;
    if l_GameId_15 == 0 then
        l_StarterPlayer_15.GameSettingsScaleRangeProportion = v107;
        return ;
    else
        v105:configurationV2PATCH(l_GameId_15, {
            universeAvatarMinScales = {
                proportion = tostring(l_Math_0.round(v107.Min, 2))
            }, 
            universeAvatarMaxScales = {
                proportion = tostring(l_Math_0.round(v107.Max, 2))
            }
        }):await();
        return ;
    end;
end;
local v110 = {
    [Enum.AssetType.Face] = "GameSettingsAssetIDFace", 
    [Enum.AssetType.Head] = "GameSettingsAssetIDHead", 
    [Enum.AssetType.Torso] = "GameSettingsAssetIDTorso", 
    [Enum.AssetType.LeftArm] = "GameSettingsAssetIDLeftArm", 
    [Enum.AssetType.RightArm] = "GameSettingsAssetIDRightArm", 
    [Enum.AssetType.LeftLeg] = "GameSettingsAssetIDLeftLeg", 
    [Enum.AssetType.RightLeg] = "GameSettingsAssetIDRightLeg", 
    [Enum.AssetType.Shirt] = "GameSettingsAssetIDShirt", 
    [Enum.AssetType.Pants] = "GameSettingsAssetIDPants", 
    [Enum.AssetType.TShirt] = "GameSettingsAssetIDTeeShirt"
};
local v111 = {};
for _, v113 in pairs(Enum.AssetType:GetEnumItems()) do
    v111[v113.Value] = v113;
end;
v1.getAssetOverrides = function(v114, v115)
    local l_StarterPlayer_16 = v115:GetService("StarterPlayer");
    local l_GameId_16 = v115.GameId;
    local v118 = nil;
    if l_GameId_16 == 0 then
        v118 = {};
        for v119, v120 in pairs(v110) do
            local v121 = l_StarterPlayer_16[v120];
            v118[v119] = {
                assetTypeID = v119.Value, 
                assetID = v121, 
                isPlayerChoice = v121 == 0
            };
        end;
        return v118;
    else
        return v114:configurationV2GET(l_GameId_16):await().responseBody.universeAvatarAssetOverrides;
    end;
end;
v1.setAssetOverrides = function(v122, v123, v124)
    local l_StarterPlayer_17 = v123:GetService("StarterPlayer");
    local l_GameId_17 = v123.GameId;
    if l_GameId_17 == 0 then
        for _, v128 in ipairs(v124) do
            l_StarterPlayer_17[v110[v111[v128.assetTypeID]]] = if not v128.isPlayerChoice then v128.assetID else 0;
        end;
        return ;
    else
        v122:configurationV2PATCH(l_GameId_17, {
            universeAvatarAssetOverrides = v124
        }):await();
        return ;
    end;
end;
return v1;
