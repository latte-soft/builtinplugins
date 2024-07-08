local l_status_0, l_result_0 = pcall(function()
    return game:GetService("StudioService"):HasInternalPermission();
end);
if not l_status_0 then
    l_result_0 = false;
end;
if l_result_0 then
    local l_Parent_0 = script.Parent.Parent;
    require(l_Parent_0.Common.commonInit)();
    local v3 = require(l_Parent_0.Src.Util.DebugFlags);
    if not v3.RunningUnderCLI() then
        local l_VirtualInputManager_0 = game:GetService("VirtualInputManager");
        local l_StudioDeviceEmulatorService_0 = game:GetService("StudioDeviceEmulatorService");
        local l_HttpService_0 = game:GetService("HttpService");
        local l_CoreGui_0 = game:GetService("CoreGui");
        local l_UserInputService_0 = game:GetService("UserInputService");
        local l_UserInputPlaybackPluginDeferPackageLoading_0 = game:GetFastFlag("UserInputPlaybackPluginDeferPackageLoading");
        local l_MultipleDocumentInterfaceInstance_0 = plugin.MultipleDocumentInterfaceInstance;
        local v11 = require(l_Parent_0.Src.Util.DMBridge);
        local _ = require(l_Parent_0.Src.Types);
        local v13 = require(l_Parent_0.Src.Util.Enums);
        local v14 = nil;
        local v15 = nil;
        local v16 = nil;
        local v17 = nil;
        local v18 = nil;
        local v19 = nil;
        local v20 = nil;
        if not l_UserInputPlaybackPluginDeferPackageLoading_0 then
            v14 = require(l_Parent_0.Src.Components.InputVisualizer);
            v15 = require(l_Parent_0.Packages.Cryo);
            v16 = require(l_Parent_0.Packages.Roact);
            v17 = require(l_Parent_0.Packages.Framework);
            v18 = v17.ContextServices;
            v19 = v18.Plugin;
            v20 = require(l_Parent_0.Src.Resources.MakeTheme);
        end;
        v11.setPluginObject(plugin);
        local v21 = nil;
        local l_UserInputPlaybackPluginShowMouseCursorAfterPlayback_0 = game:GetFastFlag("UserInputPlaybackPluginShowMouseCursorAfterPlayback");
        local function v28(v23)
            if l_UserInputPlaybackPluginDeferPackageLoading_0 then
                v15 = require(l_Parent_0.Packages.Cryo);
            end;
            local v24 = {
                mouseButton = {
                    Enum.UserInputType.MouseButton1, 
                    Enum.UserInputType.MouseButton2, 
                    Enum.UserInputType.MouseButton3
                }, 
                mouseMove = {
                    Enum.UserInputType.MouseMovement
                }, 
                touch = {
                    Enum.UserInputType.Touch
                }, 
                keyboard = {
                    Enum.UserInputType.Keyboard
                }, 
                gamepad = {
                    Enum.UserInputType.Gamepad1, 
                    Enum.UserInputType.Gamepad2, 
                    Enum.UserInputType.Gamepad3, 
                    Enum.UserInputType.Gamepad4, 
                    Enum.UserInputType.Gamepad5, 
                    Enum.UserInputType.Gamepad6, 
                    Enum.UserInputType.Gamepad7, 
                    Enum.UserInputType.Gamepad8
                }
            };
            local v25 = {};
            for v26, v27 in pairs(v23) do
                if not v27 then
                    v25 = v15.List.join(v25, v24[v26]);
                end;
            end;
            l_VirtualInputManager_0:SetInputTypesToIgnore(v25);
        end;
        local function v35()
            local v29 = v11.getRoduxState();
            assert(v29, "Access rodux state");
            if v29.playbackTab.shouldSetEmulationDevice then
                local v30 = v11.getCurrentPlaybackRecordingDataObj();
                assert(v30, "Could not get recording data");
                local l_additionalMetadata_0 = v30.additionalMetadata;
                local l_resolution_0 = l_additionalMetadata_0.resolution;
                local l_deviceId_0 = l_additionalMetadata_0.deviceId;
                local l_orientation_0 = l_additionalMetadata_0.orientation;
                if l_deviceId_0 == "default" then
                    l_StudioDeviceEmulatorService_0:EmulatePCDeviceWithResolution("Test Computer Device", Vector2.new(l_resolution_0[1], l_resolution_0[2]));
                    return ;
                else
                    l_StudioDeviceEmulatorService_0:SetCurrentDeviceId(l_deviceId_0);
                    l_StudioDeviceEmulatorService_0:SetCurrentOrientation(l_orientation_0);
                end;
            end;
        end;
        local v36 = nil;
        local function _()
            if v36 then
                v36:Disconnect();
                v36 = nil;
            end;
        end;
        local v38 = nil;
        local function v40()
            if l_UserInputPlaybackPluginDeferPackageLoading_0 then
                v14 = require(l_Parent_0.Src.Components.InputVisualizer);
                v16 = require(l_Parent_0.Packages.Roact);
                v17 = require(l_Parent_0.Packages.Framework);
                v18 = v17.ContextServices;
                v19 = v18.Plugin;
                v20 = require(l_Parent_0.Src.Resources.MakeTheme);
            end;
            local v39 = v18.provide({
                v19.new(plugin), 
                v20()
            }, {
                InputVisualizer = v16.createElement("ScreenGui", {
                    DisplayOrder = 1000, 
                    Enabled = true
                }, {
                    InputVisualizer = v16.createElement(v14)
                })
            });
            assert(v38 == nil);
            v38 = v16.mount(v39, l_CoreGui_0);
        end;
        local function _()
            if l_UserInputPlaybackPluginDeferPackageLoading_0 then
                v16 = require(l_Parent_0.Packages.Roact);
            end;
            if v38 then
                v16.unmount(v38);
                v38 = nil;
            end;
        end;
        local function v42()
            assert(plugin.HostDataModelType == Enum.StudioDataModelType.PlayClient, "Correct datamodel game state type");
            if v36 then
                v36:Disconnect();
                v36 = nil;
            end;
            assert(v11.getPluginState() == v13.PluginState.Playing);
            v11.setPluginState(v13.PluginState.Default);
            if l_UserInputPlaybackPluginDeferPackageLoading_0 then
                v16 = require(l_Parent_0.Packages.Roact);
            end;
            if v38 then
                v16.unmount(v38);
                v38 = nil;
            end;
            if l_UserInputPlaybackPluginShowMouseCursorAfterPlayback_0 then
                l_UserInputService_0.OverrideMouseIconBehavior = Enum.OverrideMouseIconBehavior.None;
            end;
        end;
        local function v43()
            assert(v11.getPluginState() == v13.PluginState.Playing);
            assert(plugin.HostDataModelType == Enum.StudioDataModelType.PlayClient, "Correct datamodel game state type");
            l_VirtualInputManager_0:StopPlaying();
        end;
        local function v47()
            local v44 = v11.getPluginState();
            local v45 = true;
            if v44 ~= v13.PluginState.Default then
                v45 = v44 == v13.PluginState.ShouldStartPlayback;
            end;
            assert(v45);
            assert(plugin.HostDataModelType == Enum.StudioDataModelType.PlayClient, "Correct datamodel game state type");
            local v46 = v11.getRoduxState();
            assert(v46, "Access rodux state");
            v45 = v11.getCurrentPlaybackRecordingDataStr();
            assert(v45, "Recording data string not found");
            v11.setPluginState(v13.PluginState.Disabled);
            v28({
                mouseMove = v46.playbackTabFilter.mouseMove, 
                mouseButton = v46.playbackTabFilter.mouseClick, 
                keyboard = v46.playbackTabFilter.keyboard, 
                gamepad = v46.playbackTabFilter.gamepad, 
                touch = v46.playbackTabFilter.touch
            });
            v40();
            while game.Players.LocalPlayer == nil do
                wait();
            end;
            if not game:IsLoaded() then
                game.Loaded:Wait();
            end;
            v11.setPluginState(v13.PluginState.Playing);
            v35();
            if v36 then
                v36:Disconnect();
                v36 = nil;
            end;
            v36 = l_VirtualInputManager_0.PlaybackCompleted:Connect(v42);
            l_VirtualInputManager_0:StartPlayingJSON(v45);
        end;
        local function v53()
            local v48 = v11.getPluginState();
            local v49 = true;
            if v48 ~= v13.PluginState.Default then
                v49 = v48 == v13.PluginState.ShouldStartRecording;
            end;
            assert(v49);
            assert(plugin.HostDataModelType == Enum.StudioDataModelType.PlayClient, "Correct datamodel game state type");
            local v50 = v11.getRoduxState();
            assert(v50, "Access rodux state");
            l_VirtualInputManager_0:StopRecording();
            v11.setPluginState(v13.PluginState.Disabled);
            if not game:IsLoaded() then
                game.Loaded:Wait();
            end;
            while game.Players.LocalPlayer == nil do
                game.Players.PlayerAdded:Wait();
            end;
            v11.setPluginState(v13.PluginState.Recording);
            v49 = game.workspace.CurrentCamera.ViewportSize;
            assert(v49, "Get viewport resolution");
            local l_l_StudioDeviceEmulatorService_0_CurrentDeviceId_0 = l_StudioDeviceEmulatorService_0:GetCurrentDeviceId();
            assert(l_l_StudioDeviceEmulatorService_0_CurrentDeviceId_0);
            local l_Name_0 = l_StudioDeviceEmulatorService_0:GetCurrentOrientation().Name;
            assert(l_Name_0);
            v21 = {
                resolution = {
                    math.floor(v49.x), 
                    (math.floor(v49.y))
                }, 
                deviceId = l_l_StudioDeviceEmulatorService_0_CurrentDeviceId_0, 
                orientation = l_Name_0
            };
            v28({
                mouseMove = v50.recordTabFilter.mouseMove, 
                mouseButton = v50.recordTabFilter.mouseClick, 
                keyboard = v50.recordTabFilter.keyboard, 
                gamepad = v50.recordTabFilter.gamepad, 
                touch = v50.recordTabFilter.touch
            });
            l_VirtualInputManager_0:StartRecording();
        end;
        local function v57()
            assert(v11.getPluginState() == v13.PluginState.Recording);
            local v54 = nil;
            v54 = l_VirtualInputManager_0.RecordingCompleted:Connect(function(v55)
                local v56 = l_HttpService_0:JSONDecode(v55);
                v56.additionalMetadata = v21;
                if not v56.additionalLuaState then
                    v56.additionalLuaState = {
                        "dummy state"
                    };
                end;
                v11.saveRecordingDataToDM(v56);
                v11.setPluginState(v13.PluginState.Default);
                if v54 then
                    v54:Disconnect();
                end;
            end);
            l_VirtualInputManager_0:StopRecording();
        end;
        local function _()
            local v58 = v11.getPluginState();
            if v58 == v13.PluginState.ShouldStartRecording then
                v53();
                return ;
            else
                if v58 == v13.PluginState.ShouldStartPlayback then
                    v47();
                end;
                return ;
            end;
        end;
        local function v62()
            v11.setupPlayClientDMEventListeners();
            v11.connectToStartRecordButtonClicked(v53);
            v11.connectToStopRecordButtonClicked(v57);
            v11.connectToStartPlaybackButtonClicked(v47);
            v11.connectToStopPlaybackButtonClicked(v43);
            l_MultipleDocumentInterfaceInstance_0.FocusedDataModelSession.CurrentDataModelTypeAboutToChange:Connect(function(v60)
                if plugin.HostDataModelTypeIsCurrent and v60 == Enum.StudioDataModelType.Edit then
                    v11.setIsPlayMode(false);
                    local v61 = v11.getPluginState();
                    if v61 == v13.PluginState.Recording then
                        v57();
                        return ;
                    elseif v61 == v13.PluginState.Playing then
                        assert(v11.getPluginState() == v13.PluginState.Playing);
                        assert(plugin.HostDataModelType == Enum.StudioDataModelType.PlayClient, "Correct datamodel game state type");
                        l_VirtualInputManager_0:StopPlaying();
                        return ;
                    elseif v61 == v13.PluginState.Disabled then
                        v11.setPluginState(v13.PluginState.Default);
                    end;
                end;
            end);
        end;
        local function _()
            v11.setIsPlayMode(true);
            v62();
            v11.onPlayClientSessionStarted();
        end;
        local v64 = nil;
        local function v66()
            if not (l_UserInputPlaybackPluginDeferPackageLoading_0 and (not (plugin.HostDataModelType == Enum.StudioDataModelType.PlayClient) or not v3.EnableDeveloperTools())) then
                v64 = require(l_Parent_0.Packages.Framework).DeveloperTools.forPlugin(l_Parent_0.Name, plugin);
                v64:addPluginRouter(plugin);
            end;
            if plugin.HostDataModelType == Enum.StudioDataModelType.Edit then
                v11.setupEditDMEventListeners();
                return ;
            else
                if not (not (plugin.HostDataModelType == Enum.StudioDataModelType.PlayClient) or not v11.getPluginEnabled()) then
                    v11.setIsPlayMode(true);
                    v62();
                    v11.onPlayClientSessionStarted();
                    local v65 = v11.getPluginState();
                    if v65 == v13.PluginState.ShouldStartRecording then
                        v53();
                        return ;
                    elseif v65 == v13.PluginState.ShouldStartPlayback then
                        v47();
                    end;
                end;
                return ;
            end;
        end;
        local function _()
            l_MultipleDocumentInterfaceInstance_0.FocusedDataModelSession.CurrentDataModelTypeAboutToChange:Connect(function()
                if v64 then
                    v64:destroy();
                    v64 = nil;
                end;
            end);
            v66();
        end;
        l_MultipleDocumentInterfaceInstance_0.FocusedDataModelSession.CurrentDataModelTypeAboutToChange:Connect(function()
            if v64 then
                v64:destroy();
                v64 = nil;
            end;
        end);
        v66();
        return ;
    else
        return ;
    end;
else
    return ;
end;
