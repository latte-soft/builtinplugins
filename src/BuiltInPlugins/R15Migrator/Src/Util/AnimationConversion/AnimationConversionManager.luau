local v0 = {};
local l_MarketplaceService_0 = game:GetService("MarketplaceService");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_KeyframeSequenceProvider_0 = game:GetService("KeyframeSequenceProvider");
local l_InsertService_0 = game:GetService("InsertService");
local l_UserId_0 = game:GetService("StudioService"):GetUserId();
local l_script_FirstAncestor_0 = script:FindFirstAncestor("R15Migrator");
local l_Attributes_0 = require(l_script_FirstAncestor_0.Src.Resources.Constants).Attributes;
local l_Util_0 = l_script_FirstAncestor_0.Src.Util;
local v9 = require(l_Util_0.AssetIdUtil);
local l_AnimationConversion_0 = l_Util_0.AnimationConversion;
local v11 = require(l_AnimationConversion_0.normalizeAssetId);
local v12 = require(l_AnimationConversion_0.constructAssetUrl);
local l_AssetType_0 = require(l_AnimationConversion_0.constants).AssetType;
local v14 = require(l_AnimationConversion_0.AnimationAssetInfo);
local v15 = require(l_AnimationConversion_0.robloxAnimationsMap);
local v16 = nil;
local function _()
    if not v16 then
        v16 = l_CoreGui_0:FindFirstChild("converted_animation_cache");
    end;
    if not v16 then
        v16 = Instance.new("Folder", l_CoreGui_0);
        v16.Name = "converted_animation_cache";
        v16.Archivable = true;
    end;
end;
if not v16 then
    v16 = l_CoreGui_0:FindFirstChild("converted_animation_cache");
end;
if not v16 then
    v16 = Instance.new("Folder", l_CoreGui_0);
    v16.Name = "converted_animation_cache";
    v16.Archivable = true;
end;
local v18 = {};
local v19 = {
    ["Left Arm"] = "LeftUpperArm", 
    ["Right Arm"] = "RightUpperArm", 
    ["Left Leg"] = "LeftUpperLeg", 
    ["Right Leg"] = "RightUpperLeg", 
    Torso = "LowerTorso"
};
local v20 = {
    LeftUpperArm = "UpperTorso", 
    RightUpperArm = "UpperTorso", 
    Head = "UpperTorso", 
    LeftUpperLeg = "LowerTorso", 
    RightUpperLeg = "LowerTorso"
};
local v21 = CFrame.fromEulerAnglesYXZ(0, -1.5707963267948966, 0);
local v22 = CFrame.fromEulerAnglesYXZ(0, 1.5707963267948966, 0);
local v23 = CFrame.fromEulerAnglesYXZ(-1.5707963267948966, 3.141592653589793, 0);
local v24 = {
    RightUpperArm = {
        v21:Inverse(), 
        v21
    }, 
    RightUpperLeg = {
        v21:Inverse(), 
        v21
    }, 
    LeftUpperArm = {
        v22:Inverse(), 
        v22
    }, 
    LeftUpperLeg = {
        v22:Inverse(), 
        v22
    }, 
    LowerTorso = {
        v23:Inverse(), 
        v23
    }, 
    Head = {
        v23:Inverse(), 
        v23
    }
};
local function _(v25, v26)
    local v27 = v24[v26];
    if v27 then
        return (v27[1] * v25) * v27[2];
    else
        return v25;
    end;
end;
local function _(v29)
    if not v19[v29] then
        return v29;
    else
        return v19[v29];
    end;
end;
local v31 = {
    Head = {
        requiredParent = "Torso"
    }, 
    ["Left Arm"] = {
        requiredParent = "Torso"
    }, 
    ["Right Arm"] = {
        requiredParent = "Torso"
    }, 
    ["Left Leg"] = {
        requiredParent = "Torso"
    }, 
    ["Right Leg"] = {
        requiredParent = "Torso"
    }, 
    Torso = {}
};
local v32 = {
    LeftUpperArm = true, 
    LeftLowerArm = true, 
    LeftHand = true, 
    RightUpperArm = true, 
    RightLowerArm = true, 
    RightHand = true, 
    LeftUpperLeg = true, 
    LeftLowerLeg = true, 
    LeftFoot = true, 
    RightUpperLeg = true, 
    RightLowerLeg = true, 
    RightFoot = true, 
    UpperTorso = true, 
    LowerTorso = true
};
local v33 = {};
v0.isR6KeyframeSequence = function(v34)
    if v34 then
        if #v34:GetChildren() < 1 then
            return false;
        else
            local v35 = false;
            for _, v37 in v34:GetChildren() do
                if not v37:IsA("AnimationRigData") then
                    for _, v39 in v37:GetDescendants() do
                        local v40 = v31[v39.Name];
                        if v40 then
                            v35 = true;
                            if v40.requiredParent and v39.Parent.Name ~= v40.requiredParent then
                                return false;
                            end;
                        end;
                        if v32[v39.Name] then
                            return false;
                        end;
                    end;
                else
                    return false;
                end;
            end;
            return v35;
        end;
    else
        return false;
    end;
end;
v0.convertKeyframeSequence = function(v41)
    local v42 = v41:Clone();
    if v0.isR6KeyframeSequence(v41) then
        for _, v44 in v42:getChildren() do
            local v45 = {};
            local v46 = nil;
            for _, v48 in v44:GetDescendants() do
                if v48:IsA("Pose") then
                    local l_Name_0 = v48.Name;
                    local v50 = if not v19[l_Name_0] then l_Name_0 else v19[l_Name_0];
                    if v48.Name == "Torso" then
                        v46 = Instance.new("Pose");
                        v46.Name = "UpperTorso";
                    end;
                    v48.Name = v50;
                    local l_CFrame_0 = v48.CFrame;
                    local v52 = v24[v50];
                    v48.CFrame = if v52 then (v52[1] * l_CFrame_0) * v52[2] else l_CFrame_0;
                    v45[v50] = v48;
                end;
            end;
            for v53, v54 in v45, nil, nil do
                local v55 = v20[v53];
                if v55 then
                    if v55 == "UpperTorso" then
                        v46.Parent = v45.LowerTorso;
                        v54.Parent = v46;
                    else
                        v54.Parent = v45[v55];
                    end;
                end;
            end;
        end;
        return v42;
    else
        warn("Asset is not an r6 animation. Have you changed any Attributes on Animations?");
        return v42;
    end;
end;
local function _(v56)
    local v57 = l_KeyframeSequenceProvider_0:RegisterKeyframeSequence(v56);
    if not v57 then
        return nil;
    else
        return v57;
    end;
end;
local function _(v59)
    local l_v16_FirstChild_0 = v16:FindFirstChild(v59);
    if l_v16_FirstChild_0 then
        local l_Value_0 = l_v16_FirstChild_0.Value;
        local l_l_v16_FirstChild_0_Attribute_0 = l_v16_FirstChild_0:GetAttribute(l_Attributes_0.TempId);
        if not (not (l_Value_0 ~= "") or not l_l_v16_FirstChild_0_Attribute_0) then
            warn((("StringValue %* has both val and tempId - has %* been manually edited?"):format(v59, "converted_animation_cache")));
        end;
        return l_v16_FirstChild_0, l_l_v16_FirstChild_0_Attribute_0 or l_Value_0;
    else
        return ;
    end;
end;
v0.addCacheEntry = function(v64, v65, v66, v67)
    assert(not (v65 and v67));
    local l_v16_FirstChild_1 = v16:FindFirstChild(v64);
    local v69;
    if l_v16_FirstChild_1 then
        local l_Value_1 = l_v16_FirstChild_1.Value;
        local l_l_v16_FirstChild_1_Attribute_0 = l_v16_FirstChild_1:GetAttribute(l_Attributes_0.TempId);
        if not (not (l_Value_1 ~= "") or not l_l_v16_FirstChild_1_Attribute_0) then
            warn((("StringValue %* has both val and tempId - has %* been manually edited?"):format(v64, "converted_animation_cache")));
        end;
        local _ = l_l_v16_FirstChild_1_Attribute_0 or l_Value_1;
        v69 = l_v16_FirstChild_1;
    else
        v69 = nil;
    end;
    if not v69 then
        v69 = Instance.new("StringValue", v16);
        v69.Name = v64;
    end;
    v69.Value = v65 or "";
    v69:SetAttribute(l_Attributes_0.TempId, v67);
    if v66 then
        v69:ClearAllChildren();
        v66:Clone().Parent = v69;
    end;
end;
local function _(v73, v74)
    local l_v16_FirstChild_2 = v16:FindFirstChild(v73);
    if l_v16_FirstChild_2 then
        l_v16_FirstChild_2:SetAttribute(l_Attributes_0.Name, v74);
        return ;
    else
        return ;
    end;
end;
local function _(v77, v78)
    local v79 = v78 or v77;
    if not v33[v79] then
        v33[v79] = l_KeyframeSequenceProvider_0:RegisterKeyframeSequence(v77) or nil;
    end;
    return v33[v79];
end;
v0.registerConvertedKeyframeSequence = function(v81, v82)
    local v83 = v82 or v81;
    if not v33[v83] then
        v33[v83] = l_KeyframeSequenceProvider_0:RegisterKeyframeSequence(v81) or nil;
    end;
    v0.addCacheEntry(v33[v83], nil, v82, l_KeyframeSequenceProvider_0:RegisterKeyframeSequence(v82) or nil);
end;
local function v87(v84)
    if v84 then
        if not tonumber(v84) then
            if typeof(v84) == "string" then
                if not v11(v84) then
                    return v84, v84, l_AssetType_0.LocalAsset;
                else
                    return v11(v84), v84, l_AssetType_0.AssetIdString;
                end;
            elseif typeof(v84) == "table" then
                if not v84.id then
                    return ;
                else
                    return v84.id, v84.url, v84._type;
                end;
            elseif typeof(v84) ~= "Instance" then
                return ;
            elseif not v84:IsA("Animation") then
                if not v84:IsA("KeyframeSequence") then
                    return ;
                else
                    local l_v84_0 = v84;
                    if not v33[l_v84_0] then
                        v33[l_v84_0] = l_KeyframeSequenceProvider_0:RegisterKeyframeSequence(v84) or nil;
                    end;
                    local v86 = v33[l_v84_0];
                    return v86, v86, l_AssetType_0.LocalAsset, v84;
                end;
            else
                return v11(v84.AnimationId), v84.AnimationId, l_AssetType_0.AnimationInstance, v84;
            end;
        else
            return tonumber(v84), v12(v84), l_AssetType_0.RobloxAsset;
        end;
    else
        return nil;
    end;
end;
v0.getAnimationId = function(v88)
    local v89 = v87(v88);
    if not tonumber(v89) then
        return v89;
    else
        return v12(v89);
    end;
end;
v0.getCachedName = function(v90)
    local v91, _, _ = v87(v90);
    local l_v16_FirstChild_3 = v16:FindFirstChild(v91);
    local v95;
    if l_v16_FirstChild_3 then
        local l_Value_2 = l_v16_FirstChild_3.Value;
        local l_l_v16_FirstChild_3_Attribute_0 = l_v16_FirstChild_3:GetAttribute(l_Attributes_0.TempId);
        if not (not (l_Value_2 ~= "") or not l_l_v16_FirstChild_3_Attribute_0) then
            warn((("StringValue %* has both val and tempId - has %* been manually edited?"):format(v91, "converted_animation_cache")));
        end;
        local v98 = l_l_v16_FirstChild_3_Attribute_0 or l_Value_2;
        v95 = l_v16_FirstChild_3;
        local _ = v98;
    else
        v95 = nil;
        local _ = nil;
    end;
    if v95 then
        return v95:GetAttribute(l_Attributes_0.Name);
    else
        return ;
    end;
end;
local function v107(v101)
    local l_status_0, l_result_0 = pcall(function()
        return l_InsertService_0:LoadAsset(v101);
    end);
    if l_status_0 then
        local v104 = nil;
        for _, v106 in l_result_0:GetChildren() do
            if v106:IsA("KeyframeSequence") then
                v104 = v106;
            end;
        end;
        return v104;
    else
        return ;
    end;
end;
v0.overrideIsR6Cache = function(v108, v109)
    v18[v87(v108)] = v109;
end;
v0.isR6Animation = function(v110, v111)
    local v112 = v0.getAnimationAssetInfo(v110);
    local v113 = nil;
    if not v112:IsA(l_AssetType_0.RobloxAsset) then
        if v112:IsA(l_AssetType_0.LocalAsset) then
            v113 = v110;
        end;
        return v0.isR6KeyframeSequence(v113);
    elseif v112.id then
        if v18[v112.id] ~= nil then
            return v18[v112.id];
        else
            local l_id_0 = v112.id;
            local l_v16_FirstChild_4 = v16:FindFirstChild(l_id_0);
            local v116;
            if l_v16_FirstChild_4 then
                local l_Value_3 = l_v16_FirstChild_4.Value;
                local l_l_v16_FirstChild_4_Attribute_0 = l_v16_FirstChild_4:GetAttribute(l_Attributes_0.TempId);
                if not (not (l_Value_3 ~= "") or not l_l_v16_FirstChild_4_Attribute_0) then
                    warn((("StringValue %* has both val and tempId - has %* been manually edited?"):format(l_id_0, "converted_animation_cache")));
                end;
                local _ = l_l_v16_FirstChild_4_Attribute_0 or l_Value_3;
                v116 = l_v16_FirstChild_4;
            else
                v116 = nil;
            end;
            if not v116 then
                if not v112:IsA(l_AssetType_0.AnimationInstance) or not v110:GetAttribute(l_Attributes_0.OriginalId) then
                    if not v111 then
                        l_id_0 = v0.isR6KeyframeSequence((v107(v112.id)));
                        v18[v112.id] = l_id_0;
                        return l_id_0;
                    else
                        return ;
                    end;
                else
                    l_id_0 = v110:GetAttribute(l_Attributes_0.OriginalId);
                    v18[l_id_0] = true;
                    v18[v112.id] = l_id_0 == v112.id;
                    return v18[v112.id];
                end;
            else
                v18[v112.id] = true;
                return true;
            end;
        end;
    else
        return false;
    end;
end;
v0.getNormalizedAssetId = function(v120)
    local v121, _, _ = v87(v120);
    return v121;
end;
v0.convertAnimation = function(v124)
    local v125 = v0.getConvertedKeyframeSequence(v124);
    if not v125 then
        local v126 = v87(v124);
        assert(v126, "no valid animation provided");
        local _ = nil;
        v125 = v0.convertKeyframeSequence(if not tonumber(v126) then v124 else v107(v126));
        v0.addCacheEntry(v126, nil, v125, l_KeyframeSequenceProvider_0:RegisterKeyframeSequence(v125) or nil);
        return v125;
    else
        return v125;
    end;
end;
v0.registerConvertedAssetId = function(v128, v129, v130, v131)
    if not v9.isValidAssetId(v129) then
        v0.addCacheEntry(v128, nil, v130, l_KeyframeSequenceProvider_0:RegisterKeyframeSequence(v130) or nil);
    else
        v0.addCacheEntry(v128, v129, v130, nil);
    end;
    if v131 then
        local l_v16_FirstChild_5 = v16:FindFirstChild(v128);
        if l_v16_FirstChild_5 then
            l_v16_FirstChild_5:SetAttribute(l_Attributes_0.Name, v131);
        else
            return ;
        end;
    end;
end;
v0.getConvertedKeyframeSequence = function(v133)
    local v134 = v87(v133);
    local l_v16_FirstChild_6 = v16:FindFirstChild(v134);
    local v136;
    if l_v16_FirstChild_6 then
        local l_Value_4 = l_v16_FirstChild_6.Value;
        local l_l_v16_FirstChild_6_Attribute_0 = l_v16_FirstChild_6:GetAttribute(l_Attributes_0.TempId);
        if not (not (l_Value_4 ~= "") or not l_l_v16_FirstChild_6_Attribute_0) then
            warn((("StringValue %* has both val and tempId - has %* been manually edited?"):format(v134, "converted_animation_cache")));
        end;
        local _ = l_l_v16_FirstChild_6_Attribute_0 or l_Value_4;
        v136 = l_v16_FirstChild_6;
    else
        v136 = nil;
    end;
    if v136 then
        for _, v141 in v136:GetChildren() do
            if v141:IsA("KeyframeSequence") then
                return v141;
            end;
        end;
        return nil;
    else
        return nil;
    end;
end;
v0.getConvertedAssetId = function(v142)
    local _, _, v145 = v87(v142);
    local v146 = v0.getConvertedAnimationAssetInfo(v142);
    if not v146:IsA(v145) then
        return nil;
    else
        return v146.id;
    end;
end;
v0.getConvertedAssetUrl = function(v147)
    local v148 = v0.getConvertedAnimationAssetInfo(v147);
    if not v148:IsA(l_AssetType_0.RobloxAsset) then
        return nil;
    else
        return v148.url;
    end;
end;
v0.getConvertedAnimationAssetInfo = function(v149)
    local v150, _, _ = v87(v149);
    if v150 then
        local l_v16_FirstChild_7 = v16:FindFirstChild(v150);
        local v154;
        if l_v16_FirstChild_7 then
            local l_Value_5 = l_v16_FirstChild_7.Value;
            local l_l_v16_FirstChild_7_Attribute_0 = l_v16_FirstChild_7:GetAttribute(l_Attributes_0.TempId);
            if not (not (l_Value_5 ~= "") or not l_l_v16_FirstChild_7_Attribute_0) then
                warn((("StringValue %* has both val and tempId - has %* been manually edited?"):format(v150, "converted_animation_cache")));
            end;
            local v157 = l_l_v16_FirstChild_7_Attribute_0 or l_Value_5;
            local _ = l_v16_FirstChild_7;
            v154 = v157;
        else
            local _ = nil;
            v154 = nil;
        end;
        local v160, v161, v162;
        l_v16_FirstChild_7, v160, v161, v162 = v87(v154);
        return v14.new(l_v16_FirstChild_7, v160, v161, v162);
    else
        return v14.new(nil, nil, nil, nil);
    end;
end;
v0.getAnimationAssetInfo = function(v163)
    local v164, v165, v166, v167 = v87(v163);
    return v14.new(v164, v165, v166, v167);
end;
local function _(v168, v169)
    assert(v168:IsA("KeyframeSequence") and v169:IsA("KeyframeSequence"));
    return (l_KeyframeSequenceProvider_0:RegisterKeyframeSequence(v168) or nil) == (l_KeyframeSequenceProvider_0:RegisterKeyframeSequence(v169) or nil);
end;
local function v176(v171, v172)
    for _, v174 in v171, nil, nil do
        local v175 = v107(v174);
        assert(v175:IsA("KeyframeSequence") and v172:IsA("KeyframeSequence"));
        if (l_KeyframeSequenceProvider_0:RegisterKeyframeSequence(v175) or nil) == (l_KeyframeSequenceProvider_0:RegisterKeyframeSequence(v172) or nil) then
            return v174;
        end;
    end;
    return nil;
end;
v0.checkIfAssetsAlreadyConverted = function(v177, v178)
    local v179 = {};
    for v180, _ in v178, nil, nil do
        local v182 = v0.getConvertedAnimationAssetInfo(v180);
        if not v182.id or not v182:IsA(l_AssetType_0.RobloxAsset) then
            local v183 = v0.convertAnimation(v180);
            local l_status_1, l_result_1 = pcall(function()
                return l_MarketplaceService_0:GetProductInfo(v180);
            end);
            if l_status_1 then
                local l_Name_1 = l_result_1.Name;
                local l_v16_FirstChild_8 = v16:FindFirstChild(v180);
                if l_v16_FirstChild_8 then
                    l_v16_FirstChild_8:SetAttribute(l_Attributes_0.Name, l_Name_1);
                end;
                l_Name_1 = l_result_1.Name .. " R15";
                l_v16_FirstChild_8 = l_result_1.Creator.CreatorType;
                local l_CreatorTargetId_0 = l_result_1.Creator.CreatorTargetId;
                if l_v16_FirstChild_8 == Enum.CreatorType.Group.Name then
                    local v189 = nil;
                    while true do
                        v189 = v177:getGroupAnimations(v189, l_CreatorTargetId_0):andThen(function(v190)
                            local l_data_0 = v190.responseBody.data;
                            local v192 = {};
                            for _, v194 in l_data_0, nil, nil do
                                if v194.name == l_Name_1 then
                                    table.insert(v192, v194.assetId);
                                end;
                            end;
                            return v176(v192, v183) or v190.responseBody.nextPageCursor;
                        end, function(v195)
                            warn("ERROR: ", v195);
                        end):await();
                        if not tonumber(v189) then
                            if not v189 then
                                break;
                            end;
                        else
                            v179[v180] = v189;
                            v0.addCacheEntry(v180, v189);
                            break;
                        end;
                    end;
                elseif l_v16_FirstChild_8 == Enum.CreatorType.User.Name then
                    if l_CreatorTargetId_0 == 1 then
                        if not v15[v180] then
                            l_CreatorTargetId_0 = l_UserId_0;
                        else
                            v179[v180] = v15[v180];
                            v0.addCacheEntry(v180, v15[v180]);
                            continue;
                        end;
                    end;
                    local v196 = nil;
                    while true do
                        v196 = v177:getUserAnimations(v196, l_CreatorTargetId_0, l_Name_1):andThen(function(v197)
                            local l_data_1 = v197.responseBody.data;
                            local l_nextPageCursor_0 = v197.responseBody.nextPageCursor;
                            local v200 = {};
                            for _, v202 in l_data_1, nil, nil do
                                local _, l_result_2 = pcall(function()
                                    return l_MarketplaceService_0:GetProductInfo(v202.id);
                                end);
                                if l_result_2 and l_result_2.Name ~= l_Name_1 then
                                    l_nextPageCursor_0 = nil;
                                    break;
                                else
                                    table.insert(v200, v202.id);
                                end;
                            end;
                            return v176(v200, v183) or l_nextPageCursor_0;
                        end, function(v205)
                            warn("ERROR: ", v205);
                        end):await();
                        if not tonumber(v196) then
                            if not v196 then
                                break;
                            end;
                        else
                            v179[v180] = v196;
                            v0.addCacheEntry(v180, v196);
                            break;
                        end;
                    end;
                end;
            else
                warn(l_result_1);
            end;
        else
            v179[v180] = v182.id;
        end;
    end;
    return v179;
end;
return v0;
