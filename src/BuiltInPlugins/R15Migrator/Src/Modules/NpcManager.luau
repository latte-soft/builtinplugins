local v0 = {};
local l_InsertService_0 = game:GetService("InsertService");
local l_CollectionService_0 = game:GetService("CollectionService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("R15Migrator");
local l_Modules_0 = l_script_FirstAncestor_0.Src.Modules;
local v5 = require(l_Modules_0.CharacterMeshesMap);
local v6 = require(l_Modules_0.ClassicHeadsMap);
local v7 = require(l_Modules_0.NpcIdManager);
local v8 = require(l_script_FirstAncestor_0.Src.Util.findAllInServices);
local v9 = require(l_script_FirstAncestor_0.Src.Util.areCFramesEqual);
local v10 = require(l_script_FirstAncestor_0.Src.Util.AnimationConversion.normalizeAssetId);
local v11 = require(l_script_FirstAncestor_0.Src.Util.ScriptAnalysis.Constants);
local v12 = require(l_script_FirstAncestor_0.Src.Util.SaveInterface);
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_StarterCharacterScripts_0 = game:GetService("StarterPlayer"):FindFirstChild("StarterCharacterScripts");
local v15 = {
    AdaptInstance = "rbxasset://avatar/unification/AdaptInstance.lua", 
    SetupAdapterParts = "rbxasset://avatar/unification/SetupAdapterParts.lua"
};
local v16 = "rbxasset://avatar/unification/" .. "LocalEffects" .. ".lua";
local v17 = "rbxasset://avatar/unification/" .. "UnificationServerScript" .. "R15Migrator" .. ".lua";
local v18 = l_InsertService_0:LoadLocalAsset("rbxasset://avatar/unification/AdapterReference.rbxm");
local v19 = l_InsertService_0:LoadLocalAsset("rbxasset://avatar/unification/R15.rbxm");
local l_Color_0 = v19.UpperTorso.Color;
local v21 = CFrame.Angles(1.5707963267948966, -3.141592653589793, 0);
local v22 = CFrame.Angles(0, -1.5707963267948966, 0);
local v23 = CFrame.Angles(0, 1.5707963267948966, 0);
local v24 = {
    RootJoint = {
        C0 = v21, 
        C1 = v21
    }, 
    Neck = {
        C0 = CFrame.new(0, 1, 0) * v21, 
        C1 = CFrame.new(0, -0.5, 0) * v21
    }, 
    ["Right Shoulder"] = {
        C0 = CFrame.new(1, 0.5, 0) * v23, 
        C1 = CFrame.new(-0.5, 0.5, 0) * v23
    }, 
    ["Right Hip"] = {
        C0 = CFrame.new(1, -1, 0) * v23, 
        C1 = CFrame.new(0.5, 1, 0) * v23
    }, 
    ["Left Shoulder"] = {
        C0 = CFrame.new(-1, 0.5, 0) * v22, 
        C1 = CFrame.new(0.5, 0.5, 0) * v22
    }, 
    ["Left Hip"] = {
        C0 = CFrame.new(-1, -1, 0) * v22, 
        C1 = CFrame.new(-0.5, 1, 0) * v22
    }
};
local v25 = {
    Root = v21:Inverse(), 
    Neck = v21:Inverse(), 
    RightShoulder = v23:Inverse(), 
    RightHip = v23:Inverse(), 
    LeftShoulder = v22:Inverse(), 
    LeftHip = v22:Inverse()
};
local v26 = {
    ["Left Hip"] = "LeftHip", 
    ["Right Hip"] = "RightHip", 
    ["Left Shoulder"] = "LeftShoulder", 
    ["Right Shoulder"] = "RightShoulder", 
    Neck = "Neck", 
    RootJoint = "Root"
};
local v27 = {
    ["Left Hip"] = {
        Part0Name = "Torso", 
        Part1Name = "Left Leg"
    }, 
    ["Right Hip"] = {
        Part0Name = "Torso", 
        Part1Name = "Right Leg"
    }, 
    ["Left Shoulder"] = {
        Part0Name = "Torso", 
        Part1Name = "Left Arm"
    }, 
    ["Right Shoulder"] = {
        Part0Name = "Torso", 
        Part1Name = "Right Arm"
    }, 
    Neck = {
        Part0Name = "Torso", 
        Part1Name = "Head"
    }, 
    RootJoint = {
        Part0Name = "HumanoidRootPart", 
        Part1Name = "Torso"
    }
};
local v28 = {
    [Enum.BodyPart.Head] = {
        "Head"
    }, 
    [Enum.BodyPart.Torso] = {
        "UpperTorso", 
        "LowerTorso"
    }, 
    [Enum.BodyPart.LeftArm] = {
        "LeftUpperArm", 
        "LeftLowerArm", 
        "LeftHand"
    }, 
    [Enum.BodyPart.RightArm] = {
        "RightUpperArm", 
        "RightLowerArm", 
        "RightHand"
    }, 
    [Enum.BodyPart.LeftLeg] = {
        "LeftUpperLeg", 
        "LeftLowerLeg", 
        "LeftFoot"
    }, 
    [Enum.BodyPart.RightLeg] = {
        "RightUpperLeg", 
        "RightLowerLeg", 
        "RightFoot"
    }
};
local v29 = {
    [Enum.BodyPart.Head] = "Head", 
    [Enum.BodyPart.Torso] = "Torso", 
    [Enum.BodyPart.LeftArm] = "Left Arm", 
    [Enum.BodyPart.RightArm] = "Right Arm", 
    [Enum.BodyPart.LeftLeg] = "Left Leg", 
    [Enum.BodyPart.RightLeg] = "Right Leg"
};
local v30 = {};
for v31, v32 in v29, nil, nil do
    v30[v32] = v31;
end;
local v33 = {};
for v34, v35 in v28, nil, nil do
    for _, v37 in v35, nil, nil do
        v33[v37] = v34;
    end;
end;
local v38 = {
    "R15ArtistIntent", 
    "R15", 
    "R15Fixed"
};
v0.GetBodyPartR6 = function(v39)
    if v39 then
        return v30[v39.Name];
    else
        return ;
    end;
end;
v0.GetR15PartsFromBodyPart = function(v40)
    if v40 then
        return v28[v40];
    else
        return ;
    end;
end;
v0.GetLimbForR15Part = function(v41)
    if v41 then
        local v42 = v33[v41];
        if v42 then
            return v29[v42];
        else
            return ;
        end;
    else
        return ;
    end;
end;
local function _(v43, v44)
    local l_Humanoid_0 = v43:FindFirstChildOfClass("Humanoid");
    if not l_Humanoid_0 then
        return false;
    else
        return l_Humanoid_0.RigType == v44;
    end;
end;
v0.GetR6Npcs = function()
    return v8(function(v47)
        local v48 = v47:IsA("Model");
        if v48 then
            local l_R6_0 = Enum.HumanoidRigType.R6;
            local l_Humanoid_1 = v47:FindFirstChildOfClass("Humanoid");
            if not l_Humanoid_1 then
                v48 = false;
            else
                return l_Humanoid_1.RigType == l_R6_0;
            end;
        end;
        return v48;
    end);
end;
v0.GetR15ConvertedNpcs = function()
    return v8(function(v51)
        if v51:IsA("Model") then
            local l_R15_0 = Enum.HumanoidRigType.R15;
            local l_Humanoid_2 = v51:FindFirstChildOfClass("Humanoid");
            if not not l_Humanoid_2 and l_Humanoid_2.RigType == l_R15_0 then
                return v12.hasConvertedFrom(v51);
            end;
        end;
        return false;
    end);
end;
v0.IsR15Complete = function(v54)
    if v54:IsA("Model") then
        local l_R15_1 = Enum.HumanoidRigType.R15;
        local l_Humanoid_3 = v54:FindFirstChildOfClass("Humanoid");
        if not not l_Humanoid_3 and l_Humanoid_3.RigType == l_R15_1 then
            for _, v58 in v28, nil, nil do
                for _, v60 in v58, nil, nil do
                    if not v54:FindFirstChild(v60) then
                        return false;
                    end;
                end;
            end;
            return true;
        end;
    end;
    return false;
end;
v0.ClearAdapterSetup = function()
    for _, v63 in (v8(function(v61)
        return v61:IsA("Model") and v61:FindFirstChild("Humanoid");
    end)), nil, nil do
        for _, v65 in v63:GetDescendants() do
            if v65:IsA("LuaSourceContainer") and v65.Name == "UnificationServerScript" then
                v65:Destroy();
            end;
        end;
    end;
    local l_AvatarUnification_0 = l_ReplicatedStorage_0:FindFirstChild("AvatarUnification");
    if l_AvatarUnification_0 then
        l_AvatarUnification_0:Destroy();
    end;
    local l_LocalEffects_0 = l_StarterCharacterScripts_0:FindFirstChild("LocalEffects");
    if l_LocalEffects_0 then
        l_LocalEffects_0:Destroy();
    end;
end;
local function v77(v68)
    local v69 = {};
    for _, v71 in v68:GetChildren() do
        if v71:IsA("CharacterMesh") then
            v69[v71.BodyPart] = tostring(v71.MeshId);
        end;
    end;
    for _, v73 in v68:GetChildren() do
        if not (not v73:IsA("Part") or not v30[v73.Name]) then
            local l_SpecialMesh_0 = v73:FindFirstChildOfClass("SpecialMesh");
            local v75 = v30[v73.Name];
            if not (not l_SpecialMesh_0 or v69[v75]) then
                local v76 = v10(l_SpecialMesh_0.MeshId);
                if v76 then
                    v69[v75] = tostring(v76);
                end;
            end;
        end;
    end;
    return v69;
end;
local function _(v78)
    if v78 then
        local l_Decal_0 = Instance.new("Decal");
        l_Decal_0.Name = "face";
        l_Decal_0.Color3 = v78.Color3;
        l_Decal_0.Texture = v78.Texture;
        l_Decal_0.Transparency = v78.Transparency;
        l_Decal_0.ZIndex = v78.ZIndex;
        return l_Decal_0;
    else
        return ;
    end;
end;
local function v94(v81, v82, v83, v84)
    local v85 = v28[v81];
    if v85 then
        for _, v87 in v85, nil, nil do
            local l_v19_FirstChild_0 = v19:FindFirstChild(v87);
            if l_v19_FirstChild_0 then
                local l_v82_FirstChild_0 = v82:FindFirstChild(v87);
                if l_v82_FirstChild_0 then
                    l_v82_FirstChild_0:Destroy();
                end;
                local v90 = l_v19_FirstChild_0:Clone();
                v90.Color = v83;
                if v81 == Enum.BodyPart.Head then
                    local l_Decal_1 = v90:FindFirstChildOfClass("Decal");
                    if l_Decal_1 and l_Decal_1.Name == "face" then
                        l_Decal_1:Destroy();
                    end;
                    local v92;
                    if v84 then
                        local l_Decal_2 = Instance.new("Decal");
                        l_Decal_2.Name = "face";
                        l_Decal_2.Color3 = v84.Color3;
                        l_Decal_2.Texture = v84.Texture;
                        l_Decal_2.Transparency = v84.Transparency;
                        l_Decal_2.ZIndex = v84.ZIndex;
                        v92 = l_Decal_2;
                    else
                        v92 = nil;
                    end;
                    if v92 then
                        v92.Parent = v90;
                    end;
                end;
                v90.Parent = v82;
            end;
        end;
        return ;
    else
        return ;
    end;
end;
local function v114(v95, v96, v97, v98, v99, v100)
    local v101 = v5[v97];
    local l_status_0, l_result_0 = pcall(function()
        return l_InsertService_0:LoadAsset(v101);
    end);
    if l_status_0 then
        local v104 = nil;
        for _, v106 in v38, nil, nil do
            v104 = l_result_0:FindFirstChild(v106);
            if v104 then
                break;
            end;
        end;
        if v104 then
            for v107, v108 in v28[v95], nil, nil do
                local l_v104_FirstChild_0 = v104:FindFirstChild(v108);
                if l_v104_FirstChild_0 then
                    local v110 = l_v104_FirstChild_0:Clone();
                    v110.Color = v98;
                    if v95 == Enum.BodyPart.Head then
                        local l_Decal_3 = v110:FindFirstChildOfClass("Decal");
                        if l_Decal_3 and l_Decal_3.Name == "face" then
                            l_Decal_3:Destroy();
                        end;
                        local v112;
                        if v99 then
                            local l_Decal_4 = Instance.new("Decal");
                            l_Decal_4.Name = "face";
                            l_Decal_4.Color3 = v99.Color3;
                            l_Decal_4.Texture = v99.Texture;
                            l_Decal_4.Transparency = v99.Transparency;
                            l_Decal_4.ZIndex = v99.ZIndex;
                            v112 = l_Decal_4;
                        else
                            v112 = nil;
                        end;
                        if v112 then
                            v112.Parent = v110;
                        end;
                    elseif not (not (v107 == 1) or not v100) then
                        v110.TextureID = v100;
                    end;
                    v110.Parent = v96;
                end;
            end;
            return ;
        else
            warn("Failed to find R15 folder for " .. tostring(v95) .. " with meshId " .. v97);
            v94(v95, v96);
            return ;
        end;
    else
        warn("Failed to load R15 part for " .. tostring(v95) .. " with meshId " .. v97);
        v94(v95, v96);
        return ;
    end;
end;
local function v128(v115)
    local l_l_InsertService_0_MeshPartAsync_0 = l_InsertService_0:CreateMeshPartAsync(v115.MeshId, Enum.CollisionFidelity.Default, Enum.RenderFidelity.Automatic);
    l_l_InsertService_0_MeshPartAsync_0.TextureID = v115.TextureId;
    l_l_InsertService_0_MeshPartAsync_0.Size = l_l_InsertService_0_MeshPartAsync_0.Size * v115.Scale;
    l_l_InsertService_0_MeshPartAsync_0.Name = "Head";
    if not l_CollectionService_0:HasTag(v115, "NoFace") then
        local l_Decal_5 = Instance.new("Decal");
        l_Decal_5.Parent = l_l_InsertService_0_MeshPartAsync_0;
        l_Decal_5.Name = "face";
        l_Decal_5.Texture = "rbxasset://textures/face.png";
    end;
    for _, v119 in v115:GetChildren() do
        if v119:IsA("Vector3Value") and string.sub(v119.Name, -10) == "Attachment" then
            local l_Attachment_0 = Instance.new("Attachment");
            l_Attachment_0.Name = v119.Name;
            l_Attachment_0.Position = v119.Value;
            l_Attachment_0.Parent = l_l_InsertService_0_MeshPartAsync_0;
        else
            local v121 = v119:Clone();
            v121.Parent = l_l_InsertService_0_MeshPartAsync_0;
            if v121:IsA("Attachment") then
                v121.Position = v121.Position - v115.Offset;
            end;
        end;
    end;
    if not l_l_InsertService_0_MeshPartAsync_0:FindFirstChild("AvatarPartScaleType") then
        local l_StringValue_0 = Instance.new("StringValue");
        l_StringValue_0.Name = "AvatarPartScaleType";
        l_StringValue_0.Value = "Classic";
        l_StringValue_0.Parent = l_l_InsertService_0_MeshPartAsync_0;
    end;
    if not l_l_InsertService_0_MeshPartAsync_0:FindFirstChild("FaceCenterAttachment") then
        local l_Attachment_1 = Instance.new("Attachment");
        l_Attachment_1.Name = "FaceCenterAttachment";
        l_Attachment_1.Position = Vector3.new(0, 0, 0);
        l_Attachment_1.Parent = l_l_InsertService_0_MeshPartAsync_0;
    end;
    if not l_l_InsertService_0_MeshPartAsync_0:FindFirstChild("FaceFrontAttachment") then
        local l_Attachment_2 = Instance.new("Attachment");
        l_Attachment_2.Name = "FaceFrontAttachment";
        l_Attachment_2.Position = Vector3.new(0, 0, -0.6);
        l_Attachment_2.Parent = l_l_InsertService_0_MeshPartAsync_0;
    end;
    if not l_l_InsertService_0_MeshPartAsync_0:FindFirstChild("HairAttachment") then
        local l_Attachment_3 = Instance.new("Attachment");
        l_Attachment_3.Name = "HairAttachment";
        l_Attachment_3.Position = Vector3.new(0, 0.6, 0);
        l_Attachment_3.Parent = l_l_InsertService_0_MeshPartAsync_0;
    end;
    if not l_l_InsertService_0_MeshPartAsync_0:FindFirstChild("HatAttachment") then
        local l_Attachment_4 = Instance.new("Attachment");
        l_Attachment_4.Name = "HatAttachment";
        l_Attachment_4.Position = Vector3.new(0, 0.6, 0);
        l_Attachment_4.Parent = l_l_InsertService_0_MeshPartAsync_0;
    end;
    if not l_l_InsertService_0_MeshPartAsync_0:FindFirstChild("NeckRigAttachment") then
        local l_Attachment_5 = Instance.new("Attachment");
        l_Attachment_5.Name = "NeckRigAttachment";
        l_Attachment_5.Position = Vector3.new(0, -0.5, 0);
        l_Attachment_5.Parent = l_l_InsertService_0_MeshPartAsync_0;
    end;
    return l_l_InsertService_0_MeshPartAsync_0;
end;
local function v145(v129, v130, v131, v132)
    local l_SpecialMesh_1 = v132:FindFirstChildOfClass("SpecialMesh");
    local v134 = tostring(v10(l_SpecialMesh_1.MeshId));
    assert(l_SpecialMesh_1, "SpecialMesh must exist if loadMeshPartHead() is called");
    local v135 = v6[v134];
    local l_status_1, l_result_1 = pcall(function()
        return l_InsertService_0:LoadAsset(v135);
    end);
    if not (not (not l_status_1 or not l_result_1) and #l_result_1:GetChildren() > 0) or not l_result_1:GetChildren()[1]:IsA("SpecialMesh") then
        warn("Failed to load R15 head for meshId " .. v134);
    else
        l_SpecialMesh_1.MeshId = l_result_1:GetChildren()[1].MeshId;
    end;
    local v138 = v128(l_SpecialMesh_1);
    for _, v140 in v132:GetChildren() do
        if not v140:IsA("SpecialMesh") and (not v140:IsA("Weld") or v140.Name ~= "HeadWeld") then
            local l_v138_FirstChild_0 = v138:FindFirstChild(v140.Name);
            if l_v138_FirstChild_0 and l_v138_FirstChild_0.ClassName == v140.ClassName then
                l_v138_FirstChild_0:Destroy();
            end;
            v140.Parent = v138;
        end;
    end;
    v132:Destroy();
    v138.Color = v130;
    local l_Decal_6 = v138:FindFirstChildOfClass("Decal");
    if l_Decal_6 and l_Decal_6.Name == "face" then
        l_Decal_6:Destroy();
    end;
    local v143;
    if v131 then
        local l_Decal_7 = Instance.new("Decal");
        l_Decal_7.Name = "face";
        l_Decal_7.Color3 = v131.Color3;
        l_Decal_7.Texture = v131.Texture;
        l_Decal_7.Transparency = v131.Transparency;
        l_Decal_7.ZIndex = v131.ZIndex;
        v143 = l_Decal_7;
    else
        v143 = nil;
    end;
    if v143 then
        v143.Parent = v138;
    end;
    v138.Parent = v129;
end;
local function _(v146, v147)
    local l_l_InsertService_0_LocalFileContents_0 = l_InsertService_0:GetLocalFileContents(v147);
    local l_ModuleScript_0 = Instance.new("ModuleScript");
    l_ModuleScript_0.Name = v146;
    l_ModuleScript_0.Source = l_l_InsertService_0_LocalFileContents_0;
    return l_ModuleScript_0;
end;
v0.RemoveUnificationScripts = function(v151)
    local l_UnificationServerScript_0 = v151:FindFirstChild("UnificationServerScript");
    if l_UnificationServerScript_0 then
        l_UnificationServerScript_0:Destroy();
    end;
end;
v0.HasUnificationScripts = function(v153)
    return v153:FindFirstChild("UnificationServerScript") ~= nil;
end;
v0.SetupUnificationScripts = function(v154)
    if not l_ReplicatedStorage_0:FindFirstChild("AvatarUnification") then
        local l_Folder_0 = Instance.new("Folder");
        l_Folder_0.Parent = l_ReplicatedStorage_0;
        l_Folder_0.Name = "AvatarUnification";
        for v156, v157 in v15, nil, nil do
            local l_l_InsertService_0_LocalFileContents_1 = l_InsertService_0:GetLocalFileContents(v157);
            local l_ModuleScript_1 = Instance.new("ModuleScript");
            l_ModuleScript_1.Name = v156;
            l_ModuleScript_1.Source = l_l_InsertService_0_LocalFileContents_1;
            local l_l_ModuleScript_1_0 = l_ModuleScript_1;
            l_l_ModuleScript_1_0:SetAttribute(v11.AttributeUnificationScriptName, true);
            l_l_ModuleScript_1_0.Parent = l_Folder_0;
        end;
    end;
    if not v154:FindFirstChild("UnificationServerScript") then
        local l_Script_0 = Instance.new("Script");
        l_Script_0.Name = "UnificationServerScript";
        l_Script_0.Source = l_InsertService_0:GetLocalFileContents(v17);
        l_Script_0:SetAttribute(v11.AttributeUnificationScriptName, true);
        l_Script_0.Parent = v154;
        v18:Clone().Parent = l_Script_0;
    end;
    if not l_StarterCharacterScripts_0:FindFirstChild("LocalEffects") then
        local l_LocalScript_0 = Instance.new("LocalScript");
        l_LocalScript_0.Name = "LocalEffects";
        l_LocalScript_0.Source = l_InsertService_0:GetLocalFileContents(v16);
        l_LocalScript_0:SetAttribute(v11.AttributeUnificationScriptName, true);
        l_LocalScript_0.Parent = l_StarterCharacterScripts_0;
    end;
end;
local function v167(v163)
    for v164, v165 in {
        BodyHeightScale = 1, 
        BodyDepthScale = 1, 
        BodyWidthScale = 1, 
        HeadScale = 1, 
        BodyProportionScale = 0
    }, nil, nil do
        local l_NumberValue_0 = Instance.new("NumberValue");
        l_NumberValue_0.Name = v164;
        l_NumberValue_0.Value = v165;
        l_NumberValue_0.Parent = v163;
    end;
end;
v0.FindInstanceUnderNewModel = function(v168, v169, v170)
    local v171 = {};
    local l_v168_0 = v168;
    while l_v168_0 ~= v169 do
        table.insert(v171, 1, l_v168_0.Name);
        l_v168_0 = l_v168_0.Parent;
    end;
    local l_v170_0 = v170;
    for _, v175 in v171, nil, nil do
        local l_l_v170_0_FirstChild_0 = l_v170_0:FindFirstChild(v175);
        assert(l_l_v170_0_FirstChild_0, "can't find " .. v175 .. " under " .. v170:GetFullName());
        l_v170_0 = l_l_v170_0_FirstChild_0;
    end;
    return l_v170_0;
end;
v0.ReplaceModel = function(v177, v178, v179, v180)
    local v181 = v7.GetNpcFromId(v177);
    if v181 then
        v178.Name = v181.Name;
        local l_Parent_0 = v181.Parent;
        v181.Parent = nil;
        for _, v184 in v181:GetDescendants() do
            if not (not v184:IsA("LuaSourceContainer") or v184:GetAttribute(v11.AttributeUnificationScriptName)) then
                local v185 = v0.FindInstanceUnderNewModel(v184, v181, v178);
                local l_Parent_1 = v185.Parent;
                v185:Destroy();
                v184.Parent = l_Parent_1;
            end;
        end;
        v178.Parent = l_Parent_0;
        if v179 then
            v0.ConvertR6ToR15(v178);
            if v180 then
                v0.SetupUnificationScripts(v178);
            end;
        end;
        v181:Destroy();
        v7.SetNpcWithId(v178, v177);
        return ;
    else
        return ;
    end;
end;
v0.FixRootAttachment = function(v187)
    local l_HumanoidRootPart_0 = v187:FindFirstChild("HumanoidRootPart");
    assert(l_HumanoidRootPart_0, "There must be a HumanoidRootPart on the npc");
    if not l_HumanoidRootPart_0:FindFirstChild("RootRigAttachment") then
        local l_RootAttachment_0 = l_HumanoidRootPart_0:FindFirstChild("RootAttachment");
        if not l_RootAttachment_0 then
            l_RootAttachment_0 = Instance.new("Attachment");
            l_RootAttachment_0.Parent = l_HumanoidRootPart_0;
        end;
        l_RootAttachment_0.Name = "RootRigAttachment";
        return ;
    else
        return ;
    end;
end;
v0.GetNumCharactersHaveWarnings = function(v190)
    local v191 = 0;
    for _, v193 in v190, nil, nil do
        if v0.GetNpcHasWarnings(v193.model) then
            v191 = v191 + 1;
        end;
    end;
    return v191;
end;
v0.GetNpcHasWarnings = function(v194)
    return v0.GetNpcHasCustomMesh(v194);
end;
v0.GetNumCharactersHaveCustomMesh = function(v195)
    local v196 = 0;
    for _, v198 in v195, nil, nil do
        if v0.GetNpcHasCustomMesh(v198.model) then
            v196 = v196 + 1;
        end;
    end;
    return v196;
end;
v0.GetNpcHasCustomMesh = function(v199)
    local v200 = v77(v199);
    for v201 in v28, nil, nil do
        local v202 = v200[v201];
        if not ((not v202 or v5[v202]) or v6[v202]) then
            return true;
        end;
    end;
    return false;
end;
local function v207(v203)
    local v204 = {};
    for _, v206 in v203:GetDescendants() do
        if not v206:IsA("Part") then
            if not (not ((not (((not v206:IsA("Motor6D") or not v27[v206.Name]) or not v206.Part0) or not v206.Part1) and v203 == v206.Part1.Parent) and v27[v206.Name].Part1Name == v206.Part1.Name) or not v30[v206.Part1.Name]) then
                v204[v30[v206.Part1.Name]] = {
                    Part = v206.Part1, 
                    Motor6D = v206
                };
            end;
        elseif not (not v30[v206.Name] or v204[v30[v206.Name]]) and v206.Parent == v203 then
            v204[v30[v206.Name]] = {
                Part = v206
            };
        end;
    end;
    return v204;
end;
local function v223(v208, v209)
    local function _(v210)
        v210.Part0 = nil;
    end;
    local function v217(v212, v213, v214)
        local l_Position_0 = v213.CFrame.Position;
        if v214 ~= Enum.BodyPart.Head then
            local v216 = (v213.Size.Y - v212.Size.Y) / 2;
            if v214 == Enum.BodyPart.Torso then
                v216 = -v216;
            end;
            l_Position_0 = v213.CFrame.Position + v213.CFrame.Rotation * Vector3.new(0, v216, 0);
        end;
        v212.CFrame = v213.CFrame.Rotation + l_Position_0;
    end;
    for v218, v219 in v27, nil, nil do
        local v220 = v209[v30[v219.Part1Name]];
        if not (not v220 or v220.Motor6D) then
            local l_v208_FirstChild_0 = v208:FindFirstChild(v26[v218], true);
            if l_v208_FirstChild_0 then
                l_v208_FirstChild_0.Part0 = nil;
                local l_Part1_0 = l_v208_FirstChild_0.Part1;
                if l_Part1_0 then
                    l_Part1_0.Anchored = true;
                    v217(l_Part1_0, v220.Part, v30[v219.Part1Name]);
                end;
            end;
        end;
    end;
end;
local function v230(v224, v225)
    for v226, v227 in v27, nil, nil do
        local v228 = v225[v30[v227.Part1Name]];
        if not (not v228 or not v228.Motor6D) then
            local l_v224_FirstChild_0 = v224:FindFirstChild(v26[v226], true);
            if not (not l_v224_FirstChild_0 or not v25[l_v224_FirstChild_0.Name]) then
                l_v224_FirstChild_0.C0 = (CFrame.new(l_v224_FirstChild_0.C0.Position - v24[v226].C0.Position) * v228.Motor6D.C0) * v25[l_v224_FirstChild_0.Name];
                l_v224_FirstChild_0.C1 = (CFrame.new(l_v224_FirstChild_0.C1.Position - v24[v226].C1.Position) * v228.Motor6D.C1) * v25[l_v224_FirstChild_0.Name];
            end;
        end;
    end;
end;
local function _(v231)
    local v232 = v24.RootJoint.C0 * v24.RootJoint.C1:Inverse();
    local v233 = v231.C0 * v231.C1:Inverse();
    return v233.Rotation:Inverse() * (v233.Position - v232.Position);
end;
v0.ConvertR6ToR15 = function(v235)
    local l_v235_Pivot_0 = v235:GetPivot();
    local l_HumanoidRootPart_1 = v235:FindFirstChild("HumanoidRootPart");
    if not l_HumanoidRootPart_1 then
        l_HumanoidRootPart_1 = v19:FindFirstChild("HumanoidRootPart"):Clone();
        l_HumanoidRootPart_1.Parent = v235;
        l_HumanoidRootPart_1.CFrame = if not v235.PrimaryPart then l_v235_Pivot_0 else v235.PrimaryPart.CFrame;
    end;
    local v238 = false;
    if v235.PrimaryPart ~= nil then
        v238 = l_HumanoidRootPart_1 ~= v235.PrimaryPart;
    end;
    if l_HumanoidRootPart_1 ~= v235.PrimaryPart then
        v235.PrimaryPart = l_HumanoidRootPart_1;
    end;
    local v239 = {};
    local v240 = {};
    local v241 = nil;
    local v242 = nil;
    local v243 = {};
    local v244 = v77(v235);
    local v245 = v207(v235);
    for v246, v247 in v245, nil, nil do
        local l_Part_0 = v247.Part;
        if l_Part_0 then
            v243[v246] = true;
            if v246 == Enum.BodyPart.Head then
                local l_Decal_8 = l_Part_0:FindFirstChildOfClass("Decal");
                if l_Decal_8 then
                    v241 = {
                        Color3 = l_Decal_8.Color3, 
                        Texture = l_Decal_8.Texture, 
                        Transparency = l_Decal_8.Transparency, 
                        ZIndex = l_Decal_8.ZIndex
                    };
                end;
                v242 = l_Part_0;
            end;
            v239[v246] = l_Part_0.Color;
            local l_Decal_9 = l_Part_0:FindFirstChildOfClass("Decal");
            if l_Decal_9 then
                v240[v246] = if l_Decal_9.Texture ~= "" then l_Decal_9.Texture else nil;
            end;
            l_Part_0.Parent = nil;
        end;
    end;
    local l_BindableEvent_0 = Instance.new("BindableEvent");
    local v252 = 0 + 1;
    task.delay(0, function()
        local v253 = v239[Enum.BodyPart.Head];
        if not v244[Enum.BodyPart.Head] or not v6[v244[Enum.BodyPart.Head]] then
            v94(Enum.BodyPart.Head, v235, v253, v241);
        else
            assert(v242:FindFirstChildOfClass("SpecialMesh"), "SpecialMesh must exist if characterMeshes[Enum.BodyPart.Head] has a value");
            assert(v244[Enum.BodyPart.Head] == tostring(v10(v242:FindFirstChildOfClass("SpecialMesh").MeshId)));
            v145(v235, v253, v241, v242);
        end;
        v252 = v252 - 1;
        if v252 == 0 then
            l_BindableEvent_0:Fire();
        end;
    end);
    for v254, _ in pairs(v28) do
        if v243[v254] and Enum.BodyPart.Head ~= v254 then
            v252 = v252 + 1;
            task.delay(0, function()
                local v256 = v239[v254] or l_Color_0;
                local v257 = v244[v254];
                if not v257 or not v5[v257] then
                    v94(v254, v235, v256, v241);
                else
                    v114(v254, v235, v257, v256, v241, v240[v254]);
                end;
                v252 = v252 - 1;
                if v252 == 0 then
                    l_BindableEvent_0:Fire();
                end;
            end);
        end;
    end;
    l_BindableEvent_0.Event:Wait();
    v0.FixRootAttachment(v235);
    for _, v259 in v235:GetChildren() do
        if v259:IsA("CharacterMesh") then
            v259:Destroy();
        end;
    end;
    local l_Humanoid_4 = v235:FindFirstChildOfClass("Humanoid");
    l_Humanoid_4.RigType = Enum.HumanoidRigType.R15;
    v167(l_Humanoid_4);
    l_Humanoid_4:BuildRigFromAttachments();
    v223(v235, v245);
    local v261 = nil;
    local v262 = v245[Enum.BodyPart.Torso];
    local v263 = nil;
    if not ((not v262 or not v262.Motor6D) or v9(v262.Motor6D.C0, v24.RootJoint.C0) and v9(v262.Motor6D.C1, v24.RootJoint.C1)) then
        v263 = v235:FindFirstChild(v26[v262.Motor6D.Name], true);
        if v263 then
            local l_v263_0 = v263;
            local v265 = v24.RootJoint.C0 * v24.RootJoint.C1:Inverse();
            local v266 = l_v263_0.C0 * l_v263_0.C1:Inverse();
            v261 = v266.Rotation:Inverse() * (v266.Position - v265.Position);
        end;
    end;
    v230(v235, v245);
    local v267 = false;
    if v261 ~= nil then
        v267 = false;
        if v263 ~= nil then
            v267 = v262 ~= nil;
        end;
    end;
    if v267 then
        local v268 = (l_HumanoidRootPart_1.CFrame * v263.C0) * v263.C1:Inverse();
        v235:TranslateBy((v262.Part.CFrame.Position + v268.Rotation * v261) - v268.Position);
    end;
    if v238 then
        l_HumanoidRootPart_1.PivotOffset = l_HumanoidRootPart_1.CFrame:Inverse() * l_v235_Pivot_0;
    end;
    for _, v270 in v245, nil, nil do
        if v270.Part then
            v270.Part:Destroy();
        end;
    end;
end;
return v0;
