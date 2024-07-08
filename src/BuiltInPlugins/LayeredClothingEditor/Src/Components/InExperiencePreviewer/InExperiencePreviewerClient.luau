local l_CoreGui_0 = game:GetService("CoreGui");
local l_Players_0 = game:GetService("Players");
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_Workspace_0 = game.Workspace;
local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v6 = require(l_Parent_0.Packages.Roact);
local l_PreviewContext_0 = require(l_Parent_0.Packages.AvatarToolsShared).Contexts.PreviewContext;
local v8 = require(l_Parent_0.Src.Resources.PluginTheme);
local l_ContextServices_0 = require(l_Parent_0.Packages.Framework).ContextServices;
local v10 = require(script.Parent.InExperiencePreviewFrame);
local v11 = require(l_Parent_0.Src.Util.Constants);
return {
    focusCamera = function(_)
        local v13 = l_LocalPlayer_0.Character or l_LocalPlayer_0.CharacterAdded:Wait();
        if v13 then
            local l_CurrentCamera_0 = l_Workspace_0.CurrentCamera;
            l_CurrentCamera_0.CameraType = Enum.CameraType.Custom;
            l_CurrentCamera_0.CameraSubject = v13;
            return ;
        else
            return ;
        end;
    end, 
    initRemoteConnections = function(v15)
        v15.connections = {};
        local v16 = l_ReplicatedStorage_0:WaitForChild(v11.PREVIEW_REMOTE_EVENT_NAME);
        table.insert(v15.connections, v15.previewContext:getPreviewModelChangedSignal():Connect(function()
            v16:FireServer(v15.previewContext:getCurrentPreviewAvatarIndex());
        end));
        table.insert(v15.connections, v16.OnClientEvent:Connect(function()
            v15:focusCamera();
        end));
    end, 
    initUI = function(v17)
        v17.roactHandle = v6.mount(l_ContextServices_0.provide({
            v8.makePluginTheme(), 
            v17.previewContext
        }, {
            InExperiencePreviewFrame = v6.createElement(v10)
        }), l_CoreGui_0);
    end, 
    initPreviewContext = function(v18)
        local l_l_ReplicatedStorage_0_FirstChild_0 = l_ReplicatedStorage_0:FindFirstChild(v11.PREVIEW_FOLDER_NAME);
        if l_l_ReplicatedStorage_0_FirstChild_0 then
            local v20 = nil;
            for _, v22 in ipairs(l_l_ReplicatedStorage_0_FirstChild_0:GetChildren()) do
                if tonumber(v22.Name) == l_LocalPlayer_0.UserId then
                    v20 = v22;
                end;
            end;
            if v20 then
                v18.previewContext = l_PreviewContext_0.new();
                local v23 = {};
                for _, v25 in ipairs(v20:Clone():GetChildren()) do
                    v23[tonumber(v25.Name)] = v25;
                end;
                v18.previewContext:setAvatars(v23);
                return ;
            else
                return ;
            end;
        else
            return ;
        end;
    end, 
    init = function(v26)
        if #l_Players_0:GetPlayers() > 1 then
            return ;
        else
            v26:initPreviewContext();
            if v26.previewContext then
                v26:initRemoteConnections();
                v26:initUI();
                return ;
            else
                return ;
            end;
        end;
    end, 
    shutdown = function(v27)
        if v27.connections then
            for _, v29 in ipairs(v27.connections) do
                v29:Disconnect();
            end;
            v27.connections = {};
            if v27.roactHandle then
                v6.unmount(v27.roactHandle);
                v27.roactHandle = nil;
            end;
            return ;
        else
            return ;
        end;
    end
};
