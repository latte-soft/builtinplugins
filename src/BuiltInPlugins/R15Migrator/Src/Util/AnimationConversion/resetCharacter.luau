local function v10(v0)
    local v1 = {
        RootJoint = {
            Name = "RootJoint", 
            Part0 = "HumanoidRootPart", 
            Part1 = "Torso", 
            C0 = CFrame.new(0, 0, 0, -1, 0, 0, 0, 0, 1, 0, 1, 0), 
            C1 = CFrame.new(0, 0, 0, -1, 0, 0, 0, 0, 1, 0, 1, 0), 
            MaxVelocity = 0.1
        }, 
        ["Left Hip"] = {
            Name = "Left Hip", 
            Part0 = "Torso", 
            Part1 = "Left Leg", 
            C0 = CFrame.new(-1, -1, 0, 0, 0, -1, 0, 1, 0, 1, 0, 0), 
            C1 = CFrame.new(-0.5, 1, 0, 0, 0, -1, 0, 1, 0, 1, 0, 0), 
            MaxVelocity = 0.1
        }, 
        ["Left Shoulder"] = {
            Name = "Left Shoulder", 
            Part0 = "Torso", 
            Part1 = "Left Arm", 
            C0 = CFrame.new(-1, 0.5, 0, 0, 0, -1, 0, 1, 0, 1, 0, 0), 
            C1 = CFrame.new(0.5, 0.5, 0, 0, 0, -1, 0, 1, 0, 1, 0, 0), 
            MaxVelocity = 0.1
        }, 
        Neck = {
            Name = "Neck", 
            Part0 = "Torso", 
            Part1 = "Head", 
            C0 = CFrame.new(0, 1, 0, -1, 0, 0, 0, 0, 1, 0, 1, 0), 
            C1 = CFrame.new(0, -0.5, 0, -1, 0, 0, 0, 0, 1, 0, 1, 0), 
            MaxVelocity = 0.1
        }, 
        ["Right Shoulder"] = {
            Name = "Right Shoulder", 
            Part0 = "Torso", 
            Part1 = "Right Arm", 
            C0 = CFrame.new(1, 0.5, 0, 0, 0, 1, 0, 1, 0, -1, 0, 0), 
            C1 = CFrame.new(-0.5, 0.5, 0, 0, 0, 1, 0, 1, 0, -1, 0, 0), 
            MaxVelocity = 0.1
        }, 
        ["Right Hip"] = {
            Name = "Right Hip", 
            Part0 = "Torso", 
            Part1 = "Right Leg", 
            C0 = CFrame.new(1, -1, 0, 0, 0, 1, 0, 1, 0, -1, 0, 0), 
            C1 = CFrame.new(0.5, 1, 0, 0, 0, 1, 0, 1, 0, -1, 0, 0), 
            MaxVelocity = 0.1
        }
    };
    local function v6(v2)
        v2.Part0 = v0:FindFirstChild(v2.Part0);
        v2.Part1 = v0:FindFirstChild(v2.Part1);
        if v2.Part0 and v2.Part1 then
            local l_FirstChild_0 = v2.Part0:FindFirstChild(v2.Name);
            if not l_FirstChild_0 then
                l_FirstChild_0 = Instance.new("Motor6D");
                l_FirstChild_0.Parent = v2.Part0;
            end;
            for v4, v5 in pairs(v2) do
                l_FirstChild_0[v4] = v5;
            end;
            return ;
        else
            return ;
        end;
    end;
    local l_Humanoid_0 = v0:FindFirstChildWhichIsA("Humanoid");
    if l_Humanoid_0.RigType == Enum.HumanoidRigType.R6 then
        for _, v9 in pairs(v1) do
            v6(v9);
        end;
        return ;
    else
        l_Humanoid_0:BuildRigFromAttachments();
        return ;
    end;
end;
local function v11(v12, v13, v14, v15)
    v15 = v15 or {};
    if v13 then
        if not v15[v13] then
            v15[v13] = true;
            v13.Anchored = false;
            v13.CFrame = v14;
            for _, v17 in v12:GetDescendants() do
                if not (not v17:IsA("JointInstance") or not v17.Enabled) and v17.Part0 == v13 then
                    v11(v12, v17.Part1, (v17.Part0.CFrame * v17.C0) * v17.C1:Inverse(), v15);
                end;
            end;
            return ;
        else
            warn(tostring(v12) .. "'s JointInstance form a circular hierarchy");
            return ;
        end;
    else
        return ;
    end;
end;
local function v18(v19, v20)
    for _, v22 in v19:GetChildren() do
        if not (v22:IsA("Accessory") or v22:IsA("Tool")) then
            if v22:IsA("Attachment") and v22.Name == v20 then
                return v22;
            else
                local v23 = v18(v22, v20);
                if v23 then
                    return v23;
                end;
            end;
        end;
    end;
end;
local function v30(v24)
    for _, v26 in v24:GetChildren() do
        if v26:IsA("Accessory") then
            local l_Handle_0 = v26:FindFirstChild("Handle");
            local l_Attachment_0 = l_Handle_0:FindFirstChildWhichIsA("Attachment");
            if l_Attachment_0 then
                local v29 = v18(v24, l_Attachment_0);
                if v29 then
                    l_Handle_0.CFrame = (v29.Parent.CFrame * v29.CFrame) * l_Attachment_0.CFrame:Inverse();
                    return ;
                end;
            end;
            l_Handle_0.CFrame = (v24:FindFirstChild("Head").CFrame * CFrame.new(0, 0.5, 0)) * v26.AttachmentPoint:Inverse();
        end;
    end;
end;
local function v34(v31)
    for _, v33 in v31:GetDescendants() do
        if v33:IsA("Script") then
            v33:Destroy();
        end;
    end;
end;
return function(v35, v36)
    if not v36 then
        v36 = CFrame.new();
    end;
    assert(v35:FindFirstChildWhichIsA("Humanoid"), "model does not contain humanoid");
    local l_HumanoidRootPart_0 = v35:FindFirstChild("HumanoidRootPart");
    if not l_HumanoidRootPart_0 and v35:FindFirstChildWhichIsA("Humanoid").RigType == Enum.HumanoidRigType.R6 then
        l_HumanoidRootPart_0 = Instance.new("Part", v35);
        l_HumanoidRootPart_0.Name = "HumanoidRootPart";
        l_HumanoidRootPart_0.Size = Vector3.new(2, 2, 1);
        l_HumanoidRootPart_0.Transparency = 1;
    end;
    if l_HumanoidRootPart_0 then
        v10(v35);
        v11(v35, l_HumanoidRootPart_0, v36);
        v30(v35);
        v34(v35);
        return ;
    else
        return ;
    end;
end;
