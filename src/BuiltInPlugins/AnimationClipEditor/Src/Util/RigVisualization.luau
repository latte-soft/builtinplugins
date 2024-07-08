local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local l_Math_0 = require(l_script_FirstAncestor_0.Packages.Framework).Util.Math;
local v2 = require(l_script_FirstAncestor_0.Packages.DraggerFramework.Utility.Math);
local l_Util_0 = l_script_FirstAncestor_0.Src.Util;
local v4 = require(l_Util_0.Adorn);
local v5 = require(l_Util_0.Constants);
local v6 = require(l_Util_0.RigInfo);
local v7 = game:DefineFastFlag("ACEShowBoneLeaves", false);
local v8 = {};
local function _(v9)
    return v9.TransformedWorldCFrame.Position;
end;
local function _(v11)
    local v12 = 0;
    local l_Parent_0 = v11.Parent;
    if not (not l_Parent_0 or not l_Parent_0:IsA("Bone")) then
        v12 = (l_Parent_0.TransformedWorldCFrame.Position - v11.TransformedWorldCFrame.Position).Magnitude;
    end;
    return v12;
end;
local function v21(v15, v16)
    local v17 = v16 - v15;
    local l_Magnitude_0 = v17.Magnitude;
    v17 = if not l_Math_0.fuzzyEq(l_Magnitude_0, 0) then v17 / l_Magnitude_0 else Vector3.new(0, 0, 1);
    local v19 = Vector3.new(0, 1, 0);
    if l_Math_0.fuzzyEq(math.abs((v17:Dot(v19))), 1) then
        v19 = Vector3.new(1, 0, 0);
    end;
    local v20 = v17:Cross(v19);
    return CFrame.fromMatrix(v15, v20, (v20:Cross(v17)));
end;
local function v50(v22, v23, v24)
    local v25 = false;
    local l_Position_0 = v22.TransformedWorldCFrame.Position;
    local function v36(v27, v28)
        local l_v23_FirstChild_0 = v23:FindFirstChild(v27);
        if not (l_v23_FirstChild_0 and l_v23_FirstChild_0:IsA("Part")) then
            local l_Part_0 = Instance.new("Part");
            l_Part_0.Transparency = 1;
            l_Part_0.Name = v27;
            l_Part_0.Archivable = false;
            l_Part_0.Parent = v23;
            l_Part_0.Size = Vector3.new(0, 0, 0);
            l_v23_FirstChild_0 = l_Part_0;
        end;
        local l_BoneRef_0 = l_v23_FirstChild_0:FindFirstChild("BoneRef");
        if not (l_BoneRef_0 and l_BoneRef_0:IsA("ObjectValue")) then
            local l_ObjectValue_0 = Instance.new("ObjectValue");
            l_ObjectValue_0.Name = "BoneRef";
            l_ObjectValue_0.Parent = l_v23_FirstChild_0;
            l_BoneRef_0 = l_ObjectValue_0;
        end;
        assert(l_v23_FirstChild_0:IsA("Part"));
        assert(l_BoneRef_0:IsA("ObjectValue"));
        l_BoneRef_0.Value = v22;
        local l_Cone_0 = l_v23_FirstChild_0:FindFirstChild("Cone");
        if not (l_Cone_0 and l_Cone_0:IsA("ConeHandleAdornment")) then
            l_Cone_0 = v4:Cone("Cone", l_v23_FirstChild_0, v5.BONE_LINK_TRANSPARENCY, v5.BONE_CONE_COLOR, 0);
        end;
        local l_Line_0 = l_v23_FirstChild_0:FindFirstChild("Line");
        if not (l_Line_0 and l_Line_0:IsA("LineHandleAdornment")) then
            l_Line_0 = v4:Line("Line", l_v23_FirstChild_0, 1, v5.BONE_LINK_COLOR, 0, 0);
        end;
        assert(l_Cone_0:IsA("ConeHandleAdornment"));
        assert(l_Line_0:IsA("LineHandleAdornment"));
        local v35 = not v24 and 1 or v5.BONE_TRANSPARENCY_DEFAULT;
        l_Cone_0.Transparency = v35;
        l_Cone_0.Radius = v28 / v5.LENGTH_TO_RADIUS_RATIO;
        l_Cone_0.Height = v28;
        l_Line_0.Transparency = v35;
        l_Line_0.Length = v28;
        return l_v23_FirstChild_0;
    end;
    for _, v38 in ipairs(v22:GetChildren()) do
        if v38:IsA("Bone") then
            local l_Position_1 = v38.TransformedWorldCFrame.Position;
            local l_Magnitude_1 = (l_Position_1 - l_Position_0).Magnitude;
            local v41 = v22.Name .. "To" .. v38.Name;
            if not v7 then
                local l_v23_FirstChild_1 = v23:FindFirstChild(v41);
                if not (l_v23_FirstChild_1 and l_v23_FirstChild_1:IsA("Part")) then
                    local l_Part_1 = Instance.new("Part");
                    l_Part_1.Transparency = 1;
                    l_Part_1.Name = v41;
                    l_Part_1.Archivable = false;
                    l_Part_1.Parent = v23;
                    v4:Cone("Cone", l_Part_1, v5.BONE_LINK_TRANSPARENCY, v5.BONE_CONE_COLOR, 0);
                    v4:Line("Line", l_Part_1, 1, v5.BONE_LINK_COLOR, 0, 0);
                    l_v23_FirstChild_1 = l_Part_1;
                end;
                local l_BoneRef_1 = l_v23_FirstChild_1:FindFirstChild("BoneRef");
                if not (l_BoneRef_1 and l_BoneRef_1:IsA("ObjectValue")) then
                    local l_ObjectValue_1 = Instance.new("ObjectValue");
                    l_ObjectValue_1.Name = "BoneRef";
                    l_ObjectValue_1.Parent = l_v23_FirstChild_1;
                    l_BoneRef_1 = l_ObjectValue_1;
                end;
                assert(l_v23_FirstChild_1:IsA("Part"));
                assert(l_BoneRef_1:IsA("ObjectValue"));
                l_BoneRef_1.Value = v22;
                local l_Cone_1 = l_v23_FirstChild_1:FindFirstChild("Cone");
                local l_Line_1 = l_v23_FirstChild_1:FindFirstChild("Line");
                if not (not l_Cone_1 or not l_Cone_1:IsA("ConeHandleAdornment")) then
                    l_Cone_1.Transparency = not v24 and 1 or v5.BONE_TRANSPARENCY_DEFAULT;
                    l_Cone_1.Radius = l_Magnitude_1 / v5.LENGTH_TO_RADIUS_RATIO;
                    l_Cone_1.Height = l_Magnitude_1;
                end;
                if not (not l_Line_1 or not l_Line_1:IsA("LineHandleAdornment")) then
                    l_Line_1.Transparency = not v24 and 1 or v5.BONE_TRANSPARENCY_DEFAULT;
                    l_Line_1.Length = l_Magnitude_1;
                end;
                l_v23_FirstChild_1.CFrame = v21(l_Position_0, l_Position_1);
            else
                v36(v41, l_Magnitude_1).CFrame = v21(l_Position_0, l_Position_1);
            end;
            v25 = true;
        end;
    end;
    if not (not v7 or v25) then
        local l_Parent_1 = v22.Parent;
        local _ = nil;
        v36(v22.Name .. "End", if not not l_Parent_1 and l_Parent_1:IsA("Bone") then (l_Parent_1.TransformedWorldCFrame.Position - l_Position_0).Magnitude * v5.LEAF_BONE_LENGTH_RATIO else 1).CFrame = v22.TransformedWorldCFrame * CFrame.fromEulerAngles(1.5707963267948966, 0, 0);
    end;
end;
local function v63(v51, v52, v53)
    local l_Position_2 = v51.TransformedWorldCFrame.Position;
    local v55 = v51.Name .. "Node";
    local l_v52_FirstChild_0 = v52:FindFirstChild(v55);
    if not (l_v52_FirstChild_0 and l_v52_FirstChild_0:IsA("Part")) then
        local l_Part_2 = Instance.new("Part");
        l_Part_2.Transparency = 1;
        l_Part_2.Name = v55;
        l_Part_2.Archivable = false;
        l_Part_2.Parent = v52;
        v4:Sphere("Sphere", l_Part_2, v5.BONE_NODE_TRANSPARENCY, v5.BONE_NODE_COLOR, 0);
        l_v52_FirstChild_0 = l_Part_2;
    end;
    local l_BoneRef_2 = l_v52_FirstChild_0:FindFirstChild("BoneRef");
    if not (l_BoneRef_2 and l_BoneRef_2:IsA("ObjectValue")) then
        local l_ObjectValue_2 = Instance.new("ObjectValue");
        l_ObjectValue_2.Name = "BoneRef";
        l_ObjectValue_2.Parent = l_v52_FirstChild_0;
        l_BoneRef_2 = l_ObjectValue_2;
    end;
    assert(l_v52_FirstChild_0:IsA("Part"));
    assert(l_BoneRef_2:IsA("ObjectValue"));
    l_BoneRef_2.Value = v51;
    local l_Sphere_0 = l_v52_FirstChild_0:FindFirstChild("Sphere");
    if not (not l_Sphere_0 or not l_Sphere_0:IsA("SphereHandleAdornment")) then
        local v61 = 0;
        local l_Parent_2 = v51.Parent;
        if not (not l_Parent_2 or not l_Parent_2:IsA("Bone")) then
            v61 = (l_Parent_2.TransformedWorldCFrame.Position - v51.TransformedWorldCFrame.Position).Magnitude;
        end;
        l_Sphere_0.Radius = v61 / v5.LENGTH_TO_RADIUS_RATIO;
        l_Sphere_0.Transparency = not v53 and 1 or v5.BONE_TRANSPARENCY_DEFAULT;
    end;
    l_v52_FirstChild_0.CFrame = CFrame.new(l_Position_2);
    v50(v51, v52, v53);
end;
local function _()
    return Workspace:FindFirstChild(v5.FOLDERS.Microbones);
end;
local function _()
    local l_Workspace_FirstChild_0 = Workspace:FindFirstChild(v5.FOLDERS.Microbones);
    if not l_Workspace_FirstChild_0 then
        local l_Folder_0 = Instance.new("Folder");
        l_Folder_0.Name = v5.FOLDERS.Microbones;
        l_Folder_0.Archivable = false;
        l_Folder_0.Parent = Workspace;
        l_Workspace_FirstChild_0 = l_Folder_0;
    end;
    assert(l_Workspace_FirstChild_0);
    return l_Workspace_FirstChild_0;
end;
local function v78(v68, v69)
    local l_Cone_2 = v68:FindFirstChild("Cone");
    local l_Sphere_1 = v68:FindFirstChild("Sphere");
    if not l_Cone_2 or not l_Cone_2:IsA("ConeHandleAdornment") then
        if not l_Sphere_1 or not l_Sphere_1:IsA("SphereHandleAdornment") then
            return nil;
        else
            local v72, v73 = v2.intersectRaySphere(v69.Origin, v69.Direction.Unit, v68.CFrame.Position, l_Sphere_1.Radius);
            if not v72 then
                return nil;
            else
                return v73;
            end;
        end;
    else
        local v74, v75 = v2.intersectRayRay(v68.CFrame.Position, v68.CFrame.LookVector, v69.Origin, v69.Direction.Unit);
        if v74 then
            local _, v77 = v2.intersectRayRay(v69.Origin, v69.Direction.Unit, v68.CFrame.Position, v68.CFrame.LookVector);
            if (((v68.CFrame.Position + v68.CFrame.LookVector * v75) - (v69.Origin + v69.Direction.Unit * v77)).Magnitude < l_Cone_2.Radius and v75 > 0) and v75 < l_Cone_2.Height then
                return v77;
            else
                return nil;
            end;
        else
            return nil;
        end;
    end;
end;
local function v88(v79)
    local v80 = nil;
    local l_huge_0 = math.huge;
    local l_Workspace_FirstChild_1 = Workspace:FindFirstChild(v5.FOLDERS.Microbones);
    if l_Workspace_FirstChild_1 then
        for _, v84 in pairs((l_Workspace_FirstChild_1:GetChildren())) do
            local l_Cone_3 = v84:FindFirstChild("Cone");
            local l_Sphere_2 = v84:FindFirstChild("Sphere");
            if not (not l_Cone_3 or not l_Cone_3:IsA("ConeHandleAdornment")) and l_Cone_3.Color3 ~= v5.BONE_COLOR_SELECTED then
                l_Cone_3.Color3 = v5.BONE_COLOR_DEFAULT;
                l_Cone_3.Transparency = v5.BONE_TRANSPARENCY_DEFAULT;
            end;
            if not (not l_Sphere_2 or not l_Sphere_2:IsA("SphereHandleAdornment")) and l_Sphere_2.Color3 ~= v5.BONE_COLOR_SELECTED then
                l_Sphere_2.Color3 = v5.BONE_COLOR_DEFAULT;
                l_Sphere_2.Transparency = v5.BONE_TRANSPARENCY_DEFAULT;
            end;
            if v84:IsA("Part") then
                local v87 = v78(v84, v79);
                if v87 and v87 < l_huge_0 then
                    l_huge_0 = v87;
                    v80 = v84;
                end;
            end;
        end;
    end;
    return v80, l_huge_0;
end;
v8.clearMicrobones = function()
    local l_Workspace_FirstChild_2 = Workspace:FindFirstChild(v5.FOLDERS.Microbones);
    if l_Workspace_FirstChild_2 then
        l_Workspace_FirstChild_2:Destroy();
    end;
end;
v8.updateMicrobones = function(v90, v91)
    if not v90 or type(v90) == "table" then
        return ;
    else
        local l_Workspace_FirstChild_3 = Workspace:FindFirstChild(v5.FOLDERS.Microbones);
        if not l_Workspace_FirstChild_3 then
            local l_Folder_1 = Instance.new("Folder");
            l_Folder_1.Name = v5.FOLDERS.Microbones;
            l_Folder_1.Archivable = false;
            l_Folder_1.Parent = Workspace;
            l_Workspace_FirstChild_3 = l_Folder_1;
        end;
        assert(l_Workspace_FirstChild_3);
        local l_l_Workspace_FirstChild_3_0 = l_Workspace_FirstChild_3;
        for _, v96 in v6.getRigInfo(v90).BoneNameToBone, nil, nil do
            v63(v96, l_l_Workspace_FirstChild_3_0, v91);
        end;
        return ;
    end;
end;
v8.getBoneHit = function(v97, v98)
    local _ = v6.getRigInfo(v98).BoneNameToBone;
    return v88(v97);
end;
v8.selectBone = function(v100)
    if v100 then
        assert(v100);
        local l_Cone_4 = v100:FindFirstChild("Cone");
        local l_Sphere_3 = v100:FindFirstChild("Sphere");
        if not (not l_Cone_4 or not l_Cone_4:IsA("ConeHandleAdornment")) then
            l_Cone_4.Color3 = v5.BONE_COLOR_SELECTED;
        end;
        if not (not l_Sphere_3 or not l_Sphere_3:IsA("SphereHandleAdornment")) then
            l_Sphere_3.Color3 = v5.BONE_COLOR_SELECTED;
        end;
        return ;
    else
        return ;
    end;
end;
v8.deselectBones = function()
    local l_Workspace_FirstChild_4 = Workspace:FindFirstChild(v5.FOLDERS.Microbones);
    if l_Workspace_FirstChild_4 then
        assert(l_Workspace_FirstChild_4);
        for _, v105 in pairs((l_Workspace_FirstChild_4:GetChildren())) do
            local l_Cone_5 = v105:FindFirstChild("Cone");
            local l_Sphere_4 = v105:FindFirstChild("Sphere");
            if not (not l_Cone_5 or not l_Cone_5:IsA("ConeHandleAdornment")) and l_Cone_5.Color3 == v5.BONE_COLOR_SELECTED then
                l_Cone_5.Color3 = v5.BONE_COLOR_DEFAULT;
                l_Cone_5.Transparency = v5.BONE_TRANSPARENCY_DEFAULT;
            end;
            if not (not l_Sphere_4 or not l_Sphere_4:IsA("SphereHandleAdornment")) and l_Sphere_4.Color3 == v5.BONE_COLOR_SELECTED then
                l_Sphere_4.Color3 = v5.BONE_COLOR_DEFAULT;
                l_Sphere_4.Transparency = v5.BONE_TRANSPARENCY_DEFAULT;
            end;
        end;
        return ;
    else
        return ;
    end;
end;
v8.isBone = function(v108)
    local v109 = false;
    if v108.Parent ~= nil then
        v109 = v108.Parent.Name == v5.FOLDERS.Microbones;
    end;
    return v109;
end;
return v8;
