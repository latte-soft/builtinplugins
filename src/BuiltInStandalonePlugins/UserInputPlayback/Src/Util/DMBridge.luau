local l_Parent_0 = script.Parent.Parent.Parent;
local _ = require(l_Parent_0.Src.Types);
local v2 = require(l_Parent_0.Src.Util.Constants);
local l_StudioDeviceEmulatorService_0 = game:GetService("StudioDeviceEmulatorService");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_HttpService_0 = game:GetService("HttpService");
local v6 = {};
local v7 = {
    PluginEnabled = "PluginEnabled", 
    RequestDevicePropertiesUpdate = "RequestDevicePropertiesUpdate", 
    ConnectToStudioDeviceEmulatorServiceEvents = "ConnectToStudioDeviceEmulatorServiceEvents", 
    DisconnectStudioDeviceEmulatorServiceEvents = "DisconnectStudioDeviceEmulatorServiceEvents", 
    EmulationDeviceIdChanged = "EmulationDeviceIdChanged", 
    EmulationDeviceOrientationChanged = "EmulationDeviceOrientationChanged", 
    ViewportResolutionChanged = "ViewportResolutionChanged", 
    IsPlayMode = "IsPlayMode", 
    StartRecordingButtonClicked = "StartRecordingButtonClicked", 
    StopRecordingButtonClicked = "StopRecordingButtonClicked", 
    StartPlaybackButtonClicked = "StartPlaybackButtonClicked", 
    StopPlaybackButtonClicked = "StopPlaybackButtonClicked", 
    SetPluginState = "SetPluginState", 
    RoduxState = "RoduxState", 
    SaveRecordingDataToDM = "SaveRecordingDataToDM", 
    OpenSaveRecordingDialog = "OpenSaveRecordingDialog", 
    SetSavedRecordingName = "SetSavedRecordingName", 
    SearchForUserInputRecordings = "SearchForUserInputRecordings", 
    SetPlayableRecordings = "SetPlayableRecordings", 
    LoadRecordingWithName = "LoadRecordingWithName", 
    CurrentPlaybackRecordingDataStr = "CurrentPlaybackRecordingDataStr", 
    CurrentPlaybackRecordingDataObj = "CurrentPlaybackRecordingDataObj", 
    PlaybackInfoChanged = "PlaybackInfoChanged"
};
local v8 = nil;
v6.setPluginObject = function(v9)
    assert(v9, "Plugin object must exist");
    v8 = v9;
end;
local v10 = nil;
v6.setLocalizationObject = function(v11)
    assert(v11, "Localization object must exist");
    v10 = v11;
end;
v6.setIsPlayMode = function(v12)
    v8:SetItem(v7.IsPlayMode, v12);
end;
v6.getIsPlayMode = function()
    return v8:GetItem(v7.IsPlayMode, false);
end;
v6.setPluginEnabled = function(v13)
    v8:SetItem(v7.PluginEnabled, v13);
end;
v6.getPluginEnabled = function()
    return v8:GetItem(v7.PluginEnabled, false);
end;
v6.setRoduxState = function(v14)
    v8:SetItem(v7.RoduxState, v14);
end;
v6.getRoduxState = function()
    return v8:GetItem(v7.RoduxState, nil);
end;
v6.setPluginState = function(v15)
    v8:Invoke(v7.SetPluginState, v15);
end;
v6.getPluginState = function()
    local v16 = v6.getRoduxState();
    if v16 == nil then
        return nil;
    else
        return v16.common.pluginState;
    end;
end;
v6.setPluginStateRoduxActionHandler = function(v17)
    v8:OnInvoke(v7.SetPluginState, v17);
end;
v6.saveRecordingDataToDM = function(v18)
    v8:Invoke(v7.SaveRecordingDataToDM, v18);
end;
local function _()
    local l_l_ReplicatedStorage_0_FirstChild_0 = l_ReplicatedStorage_0:FindFirstChild("User Input Recordings");
    if l_l_ReplicatedStorage_0_FirstChild_0 == nil then
        l_l_ReplicatedStorage_0_FirstChild_0 = Instance.new("Folder");
        l_l_ReplicatedStorage_0_FirstChild_0.Name = v2.RecordingsFolderName;
        l_l_ReplicatedStorage_0_FirstChild_0.Parent = l_ReplicatedStorage_0;
    end;
    assert(l_l_ReplicatedStorage_0_FirstChild_0);
    assert(l_l_ReplicatedStorage_0_FirstChild_0:IsA("Folder"), "ReplicatedStorage.User Input Recordings must be a folder");
    return l_l_ReplicatedStorage_0_FirstChild_0;
end;
local v21 = nil;
local function v27(v22)
    assert(v8.HostDataModelType == Enum.StudioDataModelType.Edit);
    assert(v22, "Must have recording data");
    local v23 = l_HttpService_0:JSONEncode(v22);
    v8:Invoke(v7.OpenSaveRecordingDialog, "EnterNameForRecordingMessage", {
        (string.len(v23))
    });
    local v24 = coroutine.yield();
    if v24 then
        local l_StringValue_0 = Instance.new("StringValue");
        l_StringValue_0.Value = v23;
        l_StringValue_0.Name = tostring(os.date("%x %X"));
        local l_l_ReplicatedStorage_0_FirstChild_1 = l_ReplicatedStorage_0:FindFirstChild("User Input Recordings");
        if l_l_ReplicatedStorage_0_FirstChild_1 == nil then
            l_l_ReplicatedStorage_0_FirstChild_1 = Instance.new("Folder");
            l_l_ReplicatedStorage_0_FirstChild_1.Name = v2.RecordingsFolderName;
            l_l_ReplicatedStorage_0_FirstChild_1.Parent = l_ReplicatedStorage_0;
        end;
        assert(l_l_ReplicatedStorage_0_FirstChild_1);
        assert(l_l_ReplicatedStorage_0_FirstChild_1:IsA("Folder"), "ReplicatedStorage.User Input Recordings must be a folder");
        l_StringValue_0.Parent = l_l_ReplicatedStorage_0_FirstChild_1;
        if string.len(v24) > 0 then
            l_StringValue_0.Name = v24;
        end;
    end;
end;
v6.onSaveRecordingDialogCancel = function()
    v8:Invoke(v7.SetSavedRecordingName, nil);
end;
v6.onSaveRecordingDialogSave = function(v28)
    v8:Invoke(v7.SetSavedRecordingName, v28);
end;
local function v37(v29)
    local l_l_ReplicatedStorage_0_FirstChild_2 = l_ReplicatedStorage_0:FindFirstChild("User Input Recordings");
    if l_l_ReplicatedStorage_0_FirstChild_2 == nil then
        l_l_ReplicatedStorage_0_FirstChild_2 = Instance.new("Folder");
        l_l_ReplicatedStorage_0_FirstChild_2.Name = v2.RecordingsFolderName;
        l_l_ReplicatedStorage_0_FirstChild_2.Parent = l_ReplicatedStorage_0;
    end;
    assert(l_l_ReplicatedStorage_0_FirstChild_2);
    assert(l_l_ReplicatedStorage_0_FirstChild_2:IsA("Folder"), "ReplicatedStorage.User Input Recordings must be a folder");
    l_l_ReplicatedStorage_0_FirstChild_2 = l_l_ReplicatedStorage_0_FirstChild_2:FindFirstChild(v29, false);
    if not l_l_ReplicatedStorage_0_FirstChild_2 then
        error(v10:getText("AssetDM", "CouldNotFindRecordingMessage", {
            name = v29
        }));
    end;
    assert(l_l_ReplicatedStorage_0_FirstChild_2:IsA("StringValue"));
    local l_Value_0 = l_l_ReplicatedStorage_0_FirstChild_2.Value;
    assert(l_Value_0);
    v8:Invoke(v7.PlaybackInfoChanged, nil, 0, 0);
    v8:SetItem(v7.CurrentPlaybackRecordingDataObj, nil);
    v8:SetItem(v7.CurrentPlaybackRecordingDataStr, nil);
    local v32 = l_HttpService_0:JSONDecode(l_Value_0);
    local l_additionalMetadata_0 = v32.additionalMetadata;
    assert(l_additionalMetadata_0, "metaData key not found");
    local l_resolution_0 = l_additionalMetadata_0.resolution;
    assert(l_resolution_0, "resolution key not found");
    assert(#l_resolution_0 == 2, "resolution key invalid");
    assert(l_additionalMetadata_0.deviceId, "deviceId key not found");
    assert(l_additionalMetadata_0.orientation, "orientation key not found");
    local l_events_0 = v32.events;
    assert(l_events_0, "events not found");
    local l_duration_0 = v32.duration;
    assert(l_duration_0, "duration not found");
    assert(l_duration_0 >= 0, "recording duration cannot be negative");
    v8:Invoke(v7.PlaybackInfoChanged, l_additionalMetadata_0, l_duration_0 / 1000, #l_events_0);
    v8:SetItem(v7.CurrentPlaybackRecordingDataObj, v32);
    v8:SetItem(v7.CurrentPlaybackRecordingDataStr, l_Value_0);
end;
local function v42()
    local v38 = {};
    local l_l_ReplicatedStorage_0_FirstChild_3 = l_ReplicatedStorage_0:FindFirstChild("User Input Recordings");
    if l_l_ReplicatedStorage_0_FirstChild_3 == nil then
        l_l_ReplicatedStorage_0_FirstChild_3 = Instance.new("Folder");
        l_l_ReplicatedStorage_0_FirstChild_3.Name = v2.RecordingsFolderName;
        l_l_ReplicatedStorage_0_FirstChild_3.Parent = l_ReplicatedStorage_0;
    end;
    assert(l_l_ReplicatedStorage_0_FirstChild_3);
    assert(l_l_ReplicatedStorage_0_FirstChild_3:IsA("Folder"), "ReplicatedStorage.User Input Recordings must be a folder");
    for _, v41 in ipairs((l_l_ReplicatedStorage_0_FirstChild_3:GetChildren())) do
        if v41:IsA("StringValue") then
            table.insert(v38, v41.Name);
        end;
    end;
    v8:Invoke(v7.SetPlayableRecordings, v38);
end;
local v43 = {};
local function v44()
    if l_StudioDeviceEmulatorService_0 then
        table.insert(v43, l_StudioDeviceEmulatorService_0.CurrentDeviceIdChanged:Connect(function()
            v8:Invoke(v7.EmulationDeviceIdChanged, l_StudioDeviceEmulatorService_0:GetCurrentDeviceId());
        end));
        table.insert(v43, l_StudioDeviceEmulatorService_0.OrientationChanged:Connect(function()
            v8:Invoke(v7.EmulationDeviceOrientationChanged, l_StudioDeviceEmulatorService_0:GetCurrentOrientation().Name);
        end));
    end;
    table.insert(v43, workspace.CurrentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(function()
        v8:Invoke(v7.ViewportResolutionChanged, workspace.CurrentCamera.ViewportSize);
    end));
end;
local function v47()
    for _, v46 in ipairs(v43) do
        v46:Disconnect();
    end;
    v43 = {};
end;
local v48 = false;
v6.setupEditDMEventListeners = function()
    assert(not v48, "Should only setup once per DM");
    v48 = true;
    v8:OnInvoke(v7.RequestDevicePropertiesUpdate, function()
        if l_StudioDeviceEmulatorService_0 then
            v8:Invoke(v7.EmulationDeviceIdChanged, l_StudioDeviceEmulatorService_0:GetCurrentDeviceId());
            v8:Invoke(v7.EmulationDeviceOrientationChanged, l_StudioDeviceEmulatorService_0:GetCurrentOrientation().Name);
            v8:Invoke(v7.ViewportResolutionChanged, workspace.CurrentCamera.ViewportSize);
        end;
    end);
    v8:OnInvoke(v7.ConnectToStudioDeviceEmulatorServiceEvents, v44);
    v8:OnInvoke(v7.DisconnectStudioDeviceEmulatorServiceEvents, v47);
    v8:OnInvoke(v7.SaveRecordingDataToDM, function(v49)
        v21 = coroutine.create(v27);
        coroutine.resume(v21, v49);
    end);
    v8:OnInvoke(v7.SetSavedRecordingName, function(v50)
        coroutine.resume(v21, v50);
    end);
    v8:OnInvoke(v7.SearchForUserInputRecordings, v42);
    v8:OnInvoke(v7.LoadRecordingWithName, v37);
end;
local v51 = false;
v6.setupPlayClientDMEventListeners = function()
    assert(not v51, "Should only setup once per DM");
    v51 = true;
    v8:OnInvoke(v7.ConnectToStudioDeviceEmulatorServiceEvents, v44);
    v8:OnInvoke(v7.DisconnectStudioDeviceEmulatorServiceEvents, v47);
end;
v6.connectToStartRecordButtonClicked = function(v52)
    v8:OnInvoke(v7.StartRecordingButtonClicked, v52);
end;
v6.onStartRecordingButtonClicked = function()
    v8:Invoke(v7.StartRecordingButtonClicked);
end;
v6.connectToStopRecordButtonClicked = function(v53)
    v8:OnInvoke(v7.StopRecordingButtonClicked, v53);
end;
v6.onStopRecordingButtonClicked = function()
    v8:Invoke(v7.StopRecordingButtonClicked);
end;
v6.connectToStartPlaybackButtonClicked = function(v54)
    v8:OnInvoke(v7.StartPlaybackButtonClicked, v54);
end;
v6.onStartPlaybackButtonClicked = function()
    v8:Invoke(v7.StartPlaybackButtonClicked);
end;
v6.connectToStopPlaybackButtonClicked = function(v55)
    v8:OnInvoke(v7.StopPlaybackButtonClicked, v55);
end;
v6.onStopPlaybackButtonClicked = function()
    v8:Invoke(v7.StopPlaybackButtonClicked);
end;
v6.onPlayClientSessionStarted = function()
    v44();
    v8:Invoke(v7.RequestDevicePropertiesUpdate);
end;
v6.getCurrentPlaybackRecordingDataStr = function()
    return v8:GetItem(v7.CurrentPlaybackRecordingDataStr, nil);
end;
v6.getCurrentPlaybackRecordingDataObj = function()
    return v8:GetItem(v7.CurrentPlaybackRecordingDataObj, nil);
end;
local v56 = {};
v6.connectRecordTabEventListenersWithActions = function(v57)
    table.insert(v56, (v8:OnInvoke(v7.EmulationDeviceIdChanged, function(v58)
        v57.SetEmulationDeviceId(v58);
    end)));
    table.insert(v56, (v8:OnInvoke(v7.EmulationDeviceOrientationChanged, function(v59)
        v57.SetEmulationDeviceOrientation((tostring(v59)));
    end)));
    table.insert(v56, (v8:OnInvoke(v7.ViewportResolutionChanged, function(v60)
        v57.SetCurrentScreenSize(v60);
    end)));
    table.insert(v56, (v8:OnInvoke(v7.OpenSaveRecordingDialog, function(v61, v62)
        v57.SetSaveRecordingDialogVisible(v61, v62);
    end)));
end;
v6.disconnectRecordTabEventListeners = function()
    for _, v64 in ipairs(v56) do
        v64:Disconnect();
    end;
    v56 = {};
end;
v6.onRecordTabShown = function()
    v8:Invoke(v7.RequestDevicePropertiesUpdate);
    v8:Invoke(v7.ConnectToStudioDeviceEmulatorServiceEvents);
end;
v6.onRecordTabHidden = function()
    v8:Invoke(v7.DisconnectStudioDeviceEmulatorServiceEvents);
end;
local v65 = nil;
v6.disconnectSetPlayableRecordingsCallback = function()
    if v65 then
        v65:Disconnect();
        v65 = nil;
    end;
end;
v6.connectSetPlayableRecordingsCallback = function(v66)
    v6.disconnectSetPlayableRecordingsCallback();
    v65 = v8:OnInvoke(v7.SetPlayableRecordings, v66);
end;
v6.searchForUserInputRecordings = function()
    v8:Invoke(v7.SearchForUserInputRecordings);
end;
v6.loadRecordingWithName = function(v67)
    v8:Invoke(v7.LoadRecordingWithName, v67);
end;
local v68 = nil;
v6.connectPlaybackInfoChangedCallback = function(v69)
    v68 = v8:OnInvoke(v7.PlaybackInfoChanged, v69);
end;
v6.disconnectPlaybackInfoChangedCallback = function()
    if v68 then
        v68:Disconnect();
        v68 = nil;
    end;
end;
return v6;
