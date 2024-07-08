local l_Players_0 = game:GetService("Players");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_Workspace_0 = game:GetService("Workspace");
local v3 = require(script.Parent.Parent.Parent.Parent.Src.Util.Constants);
return {
    switchToAvatar = function(v4, v5, v6, v7)
        if v6 then
            local l_Humanoid_0 = v6:FindFirstChildOfClass("Humanoid");
            local l_AnimationController_0 = v6:FindFirstChildOfClass("AnimationController");
            local v10 = not not l_Humanoid_0 and l_Humanoid_0:FindFirstChildOfClass("Animator");
            if l_AnimationController_0 then
                v10 = l_AnimationController_0:FindFirstChildOfClass("Animator");
            end;
            local v11 = v5.Character or v5.CharacterAdded:Wait();
            local v12 = v11:WaitForChild("Animate"):Clone();
            v11:WaitForChild("HumanoidRootPart");
            local l_p_0 = v11:GetPrimaryPartCFrame().p;
            if v7 then
                local l_l_Workspace_0_FirstChildWhichIsA_0 = l_Workspace_0:FindFirstChildWhichIsA("SpawnLocation", true);
                if l_l_Workspace_0_FirstChildWhichIsA_0 then
                    l_p_0 = l_l_Workspace_0_FirstChildWhichIsA_0.CFrame.p;
                end;
            end;
            local v15 = v6:Clone();
            local l_Animate_0 = v15:FindFirstChild("Animate");
            v15.Name = v11.Name;
            v15.Parent = l_Workspace_0;
            v5.Character = v15;
            v11:Destroy();
            if not v10 then
                Instance.new("Animator").Parent = v15:FindFirstChild("Humanoid");
            end;
            if l_Animate_0 then
                l_Animate_0:Destroy();
            end;
            v12.Parent = v15;
            v15:MoveTo(l_p_0);
            v4.previewChangedEvent:FireClient(v5);
            return ;
        else
            return ;
        end;
    end, 
    initRemoteEvents = function(v17)
        v17.previewChangedEvent = Instance.new("RemoteEvent");
        v17.previewChangedEvent.Name = v3.PREVIEW_REMOTE_EVENT_NAME;
        v17.previewChangedEvent.Parent = l_ReplicatedStorage_0;
    end, 
    destroyRemoteEvents = function(v18)
        if v18.previewChangedEvent then
            v18.previewChangedEvent:Destroy();
            v18.previewChangedEvent = nil;
        end;
    end, 
    initPlayerPreviewData = function(v19)
        local l_l_ReplicatedStorage_0_FirstChild_0 = l_ReplicatedStorage_0:FindFirstChild(v3.PREVIEW_FOLDER_NAME);
        if l_l_ReplicatedStorage_0_FirstChild_0 then
            v19.playerPreviewAvatarData = {};
            for _, v22 in ipairs(l_l_ReplicatedStorage_0_FirstChild_0:GetChildren()) do
                v19.playerPreviewAvatarData[tonumber(v22.Name)] = {
                    CurrentIndex = 1, 
                    PreviousIndex = 1, 
                    Avatars = v22:GetChildren()
                };
                for v23, v24 in ipairs(v22:GetChildren()) do
                    v24.Name = v23;
                end;
            end;
            return ;
        else
            return ;
        end;
    end, 
    initConnections = function(v25)
        v25.connections = {};
        table.insert(v25.connections, l_Players_0.PlayerAdded:Connect(function(v26)
            local v27 = v25.playerPreviewAvatarData[v26.UserId];
            if v27 then
                if v27.appearanceLoadedHandle then
                    v27.appearanceLoadedHandle:Disconnect();
                end;
                v27.appearanceLoadedHandle = v26.CharacterAppearanceLoaded:Connect(function()
                    v25:switchToAvatar(v26, v27.Avatars[v27.CurrentIndex], true);
                end);
                if v27.characterAddedHandle then
                    v27.characterAddedHandle:Disconnect();
                end;
                v27.characterAddedHandle = v26.CharacterAdded:Connect(function(v28)
                    if v27.diedHandle then
                        v27.diedHandle:Disconnect();
                    end;
                    v27.diedHandle = v28:WaitForChild("Humanoid").Died:Connect(function()
                        v25:switchToAvatar(v26, v27.Avatars[v27.CurrentIndex]);
                    end);
                end);
            end;
        end));
        table.insert(v25.connections, v25.previewChangedEvent.OnServerEvent:Connect(function(v29, v30)
            local v31 = v25.playerPreviewAvatarData[v29.UserId];
            if v31 then
                v31.CurrentIndex = v30;
                if v30 ~= v31.PreviousIndex then
                    v31.Avatars[v31.PreviousIndex]:Destroy();
                    v31.Avatars[v31.PreviousIndex] = v29.Character:Clone();
                end;
                v25:switchToAvatar(v29, v31.Avatars[v30]);
                v31.PreviousIndex = v30;
            end;
        end));
    end, 
    destroyConnections = function(v32)
        if v32.playerPreviewAvatarData then
            for _, v34 in pairs(v32.playerPreviewAvatarData) do
                if v34.appearanceLoadedHandle then
                    v34.appearanceLoadedHandle:Disconnect();
                end;
                if v34.characterAddedHandle then
                    v34.characterAddedHandle:Disconnect();
                end;
                if v34.diedHandle then
                    v34.diedHandle:Disconnect();
                end;
            end;
            for _, v36 in ipairs(v32.connections) do
                v36:Disconnect();
            end;
            v32.connections = {};
            return ;
        else
            return ;
        end;
    end, 
    init = function(v37)
        if #l_Players_0:GetPlayers() > 1 then
            return ;
        else
            v37:initPlayerPreviewData();
            if v37.playerPreviewAvatarData then
                v37:initRemoteEvents();
                v37:initConnections();
                return ;
            else
                return ;
            end;
        end;
    end, 
    shutdown = function(v38)
        v38:destroyConnections();
        v38.playerPreviewAvatarData = nil;
        v38:destroyRemoteEvents();
    end
};
