local v0 = {};
local v1 = require(script.Parent.animateModule);
local v2 = require(script.Parent.avatarUtils);
local v3 = require(script.Parent.Parent.Parent.Packages._Index.Dash.Dash.splitOn);
v0.attachScript = function(v4)
    local l_Script_0 = Instance.new("Script");
    l_Script_0.Source = v1;
    l_Script_0.Parent = v4;
end;
v0.alignFaceModels = function(v6, v7)
    local v8 = Instance.new("Model", workspace);
    local v9 = 5;
    if v7 then
        for _, v11 in v6, nil, nil do
            local v12 = 0;
            local v13 = {};
            for v14, _ in pairs(v11) do
                table.insert(v13, v14);
            end;
            table.sort(v13);
            for _, v17 in pairs(v13) do
                v11[v17]:PivotTo((CFrame.new(-5 + v12, v11[v17].PrimaryPart.Size.Y / 2 + v11[v17].Humanoid.HipHeight, v9)));
                v11[v17].Parent = v8;
                v12 = v12 + 5;
            end;
            v9 = v9 + 5;
        end;
        return v8;
    else
        for _, v19 in v6, nil, nil do
            local v20 = 0;
            local v21 = {};
            for v22, _ in pairs(v19) do
                table.insert(v21, v22);
            end;
            table.sort(v21);
            for _, v25 in pairs(v21) do
                v19[v25]:PivotTo((CFrame.new(-4 + v20, v9, 0)));
                v19[v25].Parent = v8;
                v20 = v20 + 2;
            end;
            v9 = v9 + 2;
        end;
        v8:PivotTo(CFrame.new(0, 10, 0));
        return v8;
    end;
end;
v0.setUpFaceModel = function(v26, v27)
    local v28 = v3(v26.Name, "_")[1];
    v26:WaitForChild("Humanoid").DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None;
    local l_Head_0 = v26:WaitForChild("Head");
    if v27 then
        local l_v26_Children_0 = v26:GetChildren();
        local v31 = false;
        for _, v33 in pairs(l_v26_Children_0) do
            if not (not (v33.Name ~= "Head") or not v33:IsA("MeshPart")) then
                v31 = true;
            end;
        end;
        if not v31 then
            v26.PrimaryPart = l_Head_0;
            v26.PrimaryPart.PivotOffset = CFrame.new(0, 0, 0);
        end;
    else
        for _, v35 in pairs((v26:GetChildren())) do
            if not (not (v35.Name ~= "Head") or not v35:IsA("MeshPart")) then
                v35:Destroy();
            end;
        end;
        local l_Neck_0 = l_Head_0:FindFirstChild("Neck");
        if l_Neck_0 ~= nil then
            l_Neck_0:Destroy();
        end;
        v26.PrimaryPart = l_Head_0;
        v26.PrimaryPart.PivotOffset = CFrame.new(0, 0, 0);
    end;
    local v37 = {
        ChiseledGoodLooks = "rbxassetid://12259863451", 
        Man = "rbxassetid://12259863451", 
        StevieStandard = "rbxassetid://12651328744", 
        Stevie = "rbxassetid://12651328744", 
        MakeupMinimalist = "rbxassetid://12262506468", 
        Woman = "rbxassetid://12262506468", 
        ClassicVampire = "rbxassetid://12431828460"
    };
    local function v41(v38)
        for v39, _ in pairs(v37) do
            if string.match(v38, v39) then
                return v37[v39];
            end;
        end;
        return "rbxassetid://144080495";
    end;
    if l_Head_0 ~= nil then
        l_Head_0.Name = "Head";
        l_Head_0.Anchored = true;
        l_Head_0.BrickColor = BrickColor.new("Bright orange");
        l_Head_0.Material = Enum.Material.SmoothPlastic;
        local l_face_0 = l_Head_0:FindFirstChild("face");
        if l_face_0 ~= nil then
            l_face_0:Destroy();
        end;
        local v43 = "";
        v43 = if l_Head_0.TextureID ~= "" then l_Head_0.TextureID else v41(v28);
        local v44 = nil;
        v44 = l_Head_0:FindFirstChild("SurfaceAppearance");
        if v44 ~= nil then
            v44:Destroy();
        end;
        Instance.new("SurfaceAppearance", l_Head_0).ColorMap = v43;
    end;
    v26:WaitForChild("HumanoidRootPart").Anchored = true;
    if v26:FindFirstChild("Script") == nil then
        v0.attachScript(v26);
    end;
end;
v0.setCameraPosition = function(v45)
    local l_Camera_0 = workspace.Camera;
    local l_v45_Children_0 = v45:GetChildren();
    if #l_v45_Children_0 ~= 0 then
        local l_v45_ExtentsSize_0 = v45:GetExtentsSize();
        local v49 = math.clamp(math.max(l_v45_ExtentsSize_0.X, l_v45_ExtentsSize_0.Y) * 5, 40, 90);
        l_Camera_0.CameraType = Enum.CameraType.Scriptable;
        local l_Position_0 = v45:GetPivot().Position;
        l_Camera_0.CFrame = CFrame.lookAt(Vector3.new(l_Position_0.X, l_Position_0.Y, v49 * -1), l_Position_0);
        l_Camera_0.DiagonalFieldOfView = 4;
        l_Camera_0.FieldOfView = 9.8;
        l_Camera_0.FieldOfViewMode = Enum.FieldOfViewMode.Vertical;
        l_Camera_0.MaxAxisFieldOfView = 19;
        for _, v52 in pairs(l_v45_Children_0) do
            v52.Parent = workspace;
        end;
        v45:Destroy();
        l_Camera_0.CameraType = Enum.CameraType.Custom;
        return ;
    else
        v45:Destroy();
        return ;
    end;
end;
v0.importAvatars = function(v53)
    local v54 = {};
    local v55 = nil;
    local l_keepBody_0 = v53.state.keepBody;
    for _, v58 in pairs((v0.selectFiles())) do
        local v59, v60 = v0.setUploadSession(v58);
        v59:GetImportTree().RigType = 0;
        local v61 = false;
        v53:setState({
            objectName = v60
        });
        v53:setState({
            enabled = true
        });
        v59:Upload();
        do
            local l_v61_0 = v61;
            v59.UploadComplete:Connect(function(v63)
                l_v61_0 = true;
                local l_Instance_0 = v63.Instance;
                l_Instance_0.Parent = workspace;
                table.insert(v54, l_Instance_0);
            end);
            while not l_v61_0 do
                if not v53.state.canceled then
                    v59.UploadProgress:Connect(function(v65)
                        v53:setState({
                            progress = v65
                        });
                    end);
                    wait();
                else
                    v59:Cancel();
                    break;
                end;
            end;
        end;
    end;
    if v54 ~= {} then
        for _, v67 in v54, nil, nil do
            v0.setUpFaceModel(v67, l_keepBody_0);
        end;
        v55 = v2.getFaceList(v54);
        if v55 ~= {} then
            local v68 = v0.alignFaceModels(v55, l_keepBody_0);
            if v68 ~= nil then
                v0.setCameraPosition(v68);
            end;
        end;
    end;
    v53:setState({
        enabled = false
    });
end;
v0.selectFiles = function()
    return (game:GetService("AssetImportService"):PickMultipleFilesWithPrompt());
end;
v0.setUploadSession = function(v69)
    local v70 = v3(v69, "/");
    return game:GetService("AssetImportService"):StartSessionWithPath(v69), (string.gsub(v70[#v70], ".fbx", ""));
end;
return v0;
