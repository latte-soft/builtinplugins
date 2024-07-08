local v0 = {};
local v1 = game:GetService("InsertService"):LoadLocalAsset("rbxasset://models/RigBuilder/AnthroRigs.rbxm");
local function _(v2, v3, v4, v5)
    local l_Motor6D_0 = Instance.new("Motor6D");
    l_Motor6D_0.Part0 = v2;
    l_Motor6D_0.Part1 = v3;
    l_Motor6D_0.C0 = v4;
    l_Motor6D_0.C1 = v5;
    l_Motor6D_0.Parent = v2;
    return l_Motor6D_0;
end;
v0.CreateR6Rig = function()
    local l_Model_0 = Instance.new("Model");
    l_Model_0.Name = "Dummy";
    local l_Part_0 = Instance.new("Part");
    l_Part_0.Name = "HumanoidRootPart";
    l_Part_0.Anchored = true;
    l_Part_0.CanCollide = true;
    l_Part_0.Transparency = 1;
    l_Part_0.Size = Vector3.new(2, 2, 1);
    l_Part_0.Parent = l_Model_0;
    l_Part_0.CFrame = CFrame.new(0, 5.2, 4.5);
    l_Part_0.BottomSurface = "Smooth";
    l_Part_0.TopSurface = "Smooth";
    l_Model_0.PrimaryPart = l_Part_0;
    local l_Part_1 = Instance.new("Part");
    l_Part_1.Name = "Torso";
    l_Part_1.Anchored = false;
    l_Part_1.CanCollide = false;
    l_Part_1.Size = Vector3.new(2, 2, 1);
    l_Part_1.Parent = l_Model_0;
    l_Part_1.CFrame = CFrame.new(0, 5.2, 4.5);
    l_Part_1.BottomSurface = "Smooth";
    l_Part_1.TopSurface = "Smooth";
    local v11 = CFrame.new(0, 0, 0, -1, 0, 0, 0, 0, 1, 0, 1, 0);
    local l_Motor6D_1 = Instance.new("Motor6D");
    l_Motor6D_1.Part0 = l_Part_0;
    l_Motor6D_1.Part1 = l_Part_1;
    l_Motor6D_1.C0 = v11;
    l_Motor6D_1.C1 = v11;
    l_Motor6D_1.Parent = l_Part_0;
    local l_l_Motor6D_1_0 = l_Motor6D_1;
    l_l_Motor6D_1_0.Name = "Root Hip";
    l_l_Motor6D_1_0.MaxVelocity = 0.1;
    l_Motor6D_1 = Instance.new("Part", l_Model_0);
    l_Motor6D_1.Name = "Left Leg";
    l_Motor6D_1.Anchored = false;
    l_Motor6D_1.CanCollide = false;
    l_Motor6D_1.Size = Vector3.new(1, 2, 1);
    l_Motor6D_1.CFrame = CFrame.new(0.5, 3.2, 4.5);
    l_Motor6D_1.BottomSurface = "Smooth";
    l_Motor6D_1.TopSurface = "Smooth";
    local v14 = CFrame.new(-1, -1, 0) * CFrame.fromAxisAngle(Vector3.new(0, 1, 0), -1.5707963267948966);
    local v15 = CFrame.new(-0.5, 1, 0) * CFrame.fromAxisAngle(Vector3.new(0, 1, 0), -1.5707963267948966);
    local l_Motor6D_2 = Instance.new("Motor6D");
    l_Motor6D_2.Part0 = l_Part_1;
    l_Motor6D_2.Part1 = l_Motor6D_1;
    l_Motor6D_2.C0 = v14;
    l_Motor6D_2.C1 = v15;
    l_Motor6D_2.Parent = l_Part_1;
    local l_l_Motor6D_2_0 = l_Motor6D_2;
    l_l_Motor6D_2_0.Name = "Left Hip";
    l_l_Motor6D_2_0.MaxVelocity = 0.1;
    l_Motor6D_2 = Instance.new("Part", l_Model_0);
    l_Motor6D_2.Name = "Right Leg";
    l_Motor6D_2.Anchored = false;
    l_Motor6D_2.CanCollide = false;
    l_Motor6D_2.Size = Vector3.new(1, 2, 1);
    l_Motor6D_2.CFrame = CFrame.new(-0.5, 3.2, 4.5);
    l_Motor6D_2.BottomSurface = "Smooth";
    l_Motor6D_2.TopSurface = "Smooth";
    local v18 = CFrame.new(1, -1, 0) * CFrame.fromAxisAngle(Vector3.new(0, -1, 0), -1.5707963267948966);
    local v19 = CFrame.new(0.5, 1, 0) * CFrame.fromAxisAngle(Vector3.new(0, 1, 0), 1.5707963267948966);
    local l_Motor6D_3 = Instance.new("Motor6D");
    l_Motor6D_3.Part0 = l_Part_1;
    l_Motor6D_3.Part1 = l_Motor6D_2;
    l_Motor6D_3.C0 = v18;
    l_Motor6D_3.C1 = v19;
    l_Motor6D_3.Parent = l_Part_1;
    local l_l_Motor6D_3_0 = l_Motor6D_3;
    l_l_Motor6D_3_0.Name = "Right Hip";
    l_l_Motor6D_3_0.MaxVelocity = 0.1;
    l_Motor6D_3 = Instance.new("Part", l_Model_0);
    l_Motor6D_3.Name = "Left Arm";
    l_Motor6D_3.Anchored = false;
    l_Motor6D_3.CanCollide = false;
    l_Motor6D_3.Size = Vector3.new(1, 2, 1);
    l_Motor6D_3.CFrame = CFrame.new(1.5, 5.2, 4.5);
    l_Motor6D_3.BottomSurface = "Smooth";
    l_Motor6D_3.TopSurface = "Smooth";
    local v22 = CFrame.new(-1, 0.5, 0) * CFrame.fromAxisAngle(Vector3.new(0, 1, 0), -1.5707963267948966);
    local v23 = CFrame.new(0.5, 0.5, 0) * CFrame.fromAxisAngle(Vector3.new(0, 1, 0), -1.5707963267948966);
    local l_Motor6D_4 = Instance.new("Motor6D");
    l_Motor6D_4.Part0 = l_Part_1;
    l_Motor6D_4.Part1 = l_Motor6D_3;
    l_Motor6D_4.C0 = v22;
    l_Motor6D_4.C1 = v23;
    l_Motor6D_4.Parent = l_Part_1;
    local l_l_Motor6D_4_0 = l_Motor6D_4;
    l_l_Motor6D_4_0.Name = "Left Shoulder";
    l_l_Motor6D_4_0.MaxVelocity = 0.1;
    l_Motor6D_4 = Instance.new("Part", l_Model_0);
    l_Motor6D_4.Name = "Right Arm";
    l_Motor6D_4.Anchored = false;
    l_Motor6D_4.CanCollide = false;
    l_Motor6D_4.Size = Vector3.new(1, 2, 1);
    l_Motor6D_4.CFrame = CFrame.new(-1.5, 5.2, 4.5);
    l_Motor6D_4.BottomSurface = "Smooth";
    l_Motor6D_4.TopSurface = "Smooth";
    local v26 = CFrame.new(1, 0.5, 0) * CFrame.fromAxisAngle(Vector3.new(0, -1, 0), -1.5707963267948966);
    local v27 = CFrame.new(-0.5, 0.5, 0) * CFrame.fromAxisAngle(Vector3.new(0, 1, 0), 1.5707963267948966);
    local l_Motor6D_5 = Instance.new("Motor6D");
    l_Motor6D_5.Part0 = l_Part_1;
    l_Motor6D_5.Part1 = l_Motor6D_4;
    l_Motor6D_5.C0 = v26;
    l_Motor6D_5.C1 = v27;
    l_Motor6D_5.Parent = l_Part_1;
    local l_l_Motor6D_5_0 = l_Motor6D_5;
    l_l_Motor6D_5_0.Name = "Right Shoulder";
    l_l_Motor6D_5_0.MaxVelocity = 0.1;
    l_Motor6D_5 = Instance.new("Part", l_Model_0);
    l_Motor6D_5.Name = "Head";
    l_Motor6D_5.Anchored = false;
    l_Motor6D_5.CanCollide = true;
    l_Motor6D_5.Size = Vector3.new(2, 1, 1);
    l_Motor6D_5.CFrame = CFrame.new(0, 6.7, 4.5);
    l_Motor6D_5.BottomSurface = "Smooth";
    l_Motor6D_5.TopSurface = "Smooth";
    local v30 = CFrame.new(0, 1, 0, -1, 0, 0, 0, 0, 1, 0, 1, 0);
    local v31 = CFrame.new(0, -0.5, 0, -1, 0, 0, 0, 0, 1, 0, 1, 0);
    local l_Motor6D_6 = Instance.new("Motor6D");
    l_Motor6D_6.Part0 = l_Part_1;
    l_Motor6D_6.Part1 = l_Motor6D_5;
    l_Motor6D_6.C0 = v30;
    l_Motor6D_6.C1 = v31;
    l_Motor6D_6.Parent = l_Part_1;
    local l_l_Motor6D_6_0 = l_Motor6D_6;
    l_l_Motor6D_6_0.Name = "Neck";
    l_l_Motor6D_6_0.MaxVelocity = 0.1;
    l_Motor6D_6 = Instance.new("Decal", l_Motor6D_5);
    l_Motor6D_6.Name = "Face";
    l_Motor6D_6.Texture = "rbxasset://textures/face.png";
    Instance.new("Humanoid", l_Model_0);
    l_Model_0.Parent = workspace;
    return l_Model_0;
end;
v0.CreateR6MeshRig = function()
    local v34 = v0.CreateR6Rig();
    local v35 = Instance.new("CharacterMesh", v34);
    v35.MeshId = 27111419;
    v35.BodyPart = 2;
    local v36 = Instance.new("CharacterMesh", v34);
    v36.MeshId = 27111864;
    v36.BodyPart = 3;
    local v37 = Instance.new("CharacterMesh", v34);
    v37.MeshId = 27111857;
    v37.BodyPart = 4;
    local v38 = Instance.new("CharacterMesh", v34);
    v38.MeshId = 27111882;
    v38.BodyPart = 5;
    local v39 = Instance.new("CharacterMesh", v34);
    v39.MeshId = 27111894;
    v39.BodyPart = 1;
    local v40 = Instance.new("SpecialMesh", v34.Head);
    v40.MeshType = 0;
    v40.Scale = Vector3.new(1.25, 1.25, 1.25);
    return v34;
end;
v0.CreateR6MeshBoyRig = function()
    local v41 = v0.CreateR6Rig();
    local v42 = Instance.new("CharacterMesh", v41);
    v42.MeshId = 82907977;
    v42.BodyPart = 2;
    local v43 = Instance.new("CharacterMesh", v41);
    v43.MeshId = 82908019;
    v43.BodyPart = 3;
    local v44 = Instance.new("CharacterMesh", v41);
    v44.MeshId = 81487640;
    v44.BodyPart = 4;
    local v45 = Instance.new("CharacterMesh", v41);
    v45.MeshId = 81487710;
    v45.BodyPart = 5;
    local v46 = Instance.new("CharacterMesh", v41);
    v46.MeshId = 82907945;
    v46.BodyPart = 1;
    local v47 = Instance.new("SpecialMesh", v41.Head);
    v47.MeshType = 0;
    v47.Scale = Vector3.new(1.25, 1.25, 1.25);
    return v41;
end;
v0.CreateR6MeshGirlRig = function()
    local v48 = v0.CreateR6Rig();
    local v49 = Instance.new("CharacterMesh", v48);
    v49.MeshId = 83001137;
    v49.BodyPart = 2;
    local v50 = Instance.new("CharacterMesh", v48);
    v50.MeshId = 83001181;
    v50.BodyPart = 3;
    local v51 = Instance.new("CharacterMesh", v48);
    v51.MeshId = 81628361;
    v51.BodyPart = 4;
    local v52 = Instance.new("CharacterMesh", v48);
    v52.MeshId = 81628308;
    v52.BodyPart = 5;
    local v53 = Instance.new("CharacterMesh", v48);
    v53.MeshId = 82987757;
    v53.BodyPart = 1;
    local v54 = Instance.new("SpecialMesh", v48.Head);
    v54.MeshType = 0;
    v54.Scale = Vector3.new(1.25, 1.25, 1.25);
    return v48;
end;
local function v63(v55)
    local v56 = game:GetService("InsertService"):LoadAsset(9425124156):GetChildren()[1];
    for _, v58 in pairs(v55:GetChildren()) do
        local l_v56_FirstChild_0 = v56:FindFirstChild(v58.Name);
        if l_v56_FirstChild_0 then
            l_v56_FirstChild_0:Destroy();
        end;
        v58.Parent = v56;
    end;
    v55:Destroy();
    v55 = v56;
    v55.Parent = workspace;
    local l_Humanoid_0 = v55:FindFirstChildOfClass("Humanoid");
    if l_Humanoid_0 then
        l_Humanoid_0:BuildRigFromAttachments();
    end;
    local v61 = v55:WaitForChild("Head", 1);
    if (v61:FindFirstChild("face") or v61:FindFirstChild("Face")) == nil then
        local v62 = Instance.new("Decal", v61);
        v62.Name = "face";
        v62.Texture = "rbxasset://textures/face.png";
    end;
    return v55;
end;
v0.BuildR15Rig = function(v64)
    local v65 = Instance.new("Model", workspace);
    local v66 = nil;
    local v67 = nil;
    if v64 ~= nil then
        for _, v69 in pairs((game:GetService("AssetService"):GetAssetIdsForPackage(v64))) do
            local v70 = game:GetService("InsertService"):LoadAsset(v69);
            if not v70:FindFirstChild("R15ArtistIntent") then
                if not v70:FindFirstChild("R15") then
                    if not v70:FindFirstChild("face") then
                        if not v70:FindFirstChild("Face") then
                            if v70:FindFirstChild("Mesh") then
                                v66 = v70.Mesh;
                            end;
                        else
                            v67 = v70.Face;
                        end;
                    else
                        v67 = v70.face;
                    end;
                else
                    for _, v72 in pairs(v70.R15:GetChildren()) do
                        v72.Parent = v65;
                    end;
                end;
            else
                for _, v74 in pairs(v70.R15ArtistIntent:GetChildren()) do
                    v74.Parent = v65;
                end;
            end;
        end;
    end;
    local v75 = v63(v65);
    if v66 then
        v75.Head.Mesh:Destroy();
        v66.Parent = v75.Head;
    end;
    if v67 then
        for _, v77 in pairs(v75.Head:GetChildren()) do
            if not (v77.Name ~= "face") or v77.Name == "Face" then
                v77:Destroy();
            end;
        end;
        v67.Parent = v75.Head;
    end;
    return v75;
end;
v0.BuildAnthroRig = function(v78)
    local l_v1_FirstChild_0 = v1:FindFirstChild(v78);
    if l_v1_FirstChild_0 then
        local v80 = l_v1_FirstChild_0:Clone();
        local l_Humanoid_1 = v80:FindFirstChildOfClass("Humanoid");
        if l_Humanoid_1 then
            l_Humanoid_1:BuildRigFromAttachments();
        end;
        v80.Parent = workspace;
        return v80;
    else
        error("RigCreator couldn't find Rig with name " .. v78);
        return ;
    end;
end;
v0.buildTestRig = function()
    local l_Model_1 = Instance.new("Model");
    local v83 = Instance.new("Part", l_Model_1);
    v83.Name = "HumanoidRootPart";
    local v84 = Instance.new("Part", l_Model_1);
    v84.Name = "UpperTorso";
    local v85 = Instance.new("Part", l_Model_1);
    v85.Name = "Head";
    local v86 = Instance.new("Motor6D", v84);
    v86.Part0 = v83;
    v86.Part1 = v84;
    local v87 = Instance.new("Motor6D", v85);
    v87.Part0 = v84;
    v87.Part1 = v85;
    Instance.new("Attachment", v83).Name = "RootAttachment";
    Instance.new("Attachment", v84).Name = "RootAttachment";
    local v88 = Instance.new("Attachment", v84);
    v88.Name = "NeckAttachment";
    local v89 = Instance.new("Attachment", v85);
    v89.Name = "NeckAttachment";
    local v90 = Instance.new("BallSocketConstraint", l_Model_1);
    v90.Enabled = false;
    v90.Attachment0 = v88;
    v90.Attachment1 = v89;
    Instance.new("AnimationController", l_Model_1);
    Instance.new("Bone", v85).Name = "Jaw";
    return l_Model_1;
end;
return v0;
