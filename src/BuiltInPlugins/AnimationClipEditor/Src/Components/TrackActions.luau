local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Roact);
local v2 = require(l_script_FirstAncestor_0.Packages.Cryo);
local v3 = require(l_script_FirstAncestor_0.Packages.RoactRodux);
local l_ContextServices_0 = require(l_script_FirstAncestor_0.Packages.Framework).ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v6 = require(l_script_FirstAncestor_0.Src.Components.ContextMenu);
local v7 = require(l_script_FirstAncestor_0.Src.Thunks.AddKeyframe);
local v8 = require(l_script_FirstAncestor_0.Src.Thunks.History.AddWaypoint);
local v9 = require(l_script_FirstAncestor_0.Src.Thunks.ClearTrack);
local v10 = require(l_script_FirstAncestor_0.Src.Thunks.ConvertTrack);
local v11 = require(l_script_FirstAncestor_0.Src.Thunks.DeleteTrack);
local v12 = require(l_script_FirstAncestor_0.Src.Thunks.SetTrackEulerAnglesOrder);
local v13 = require(l_script_FirstAncestor_0.Src.Actions.SetRightClickContextInfo);
local v14 = require(l_script_FirstAncestor_0.Src.Thunks.SplitTrack);
local v15 = require(l_script_FirstAncestor_0.Src.Util.AnimationData);
local v16 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local v17 = require(l_script_FirstAncestor_0.Src.Util.isEmpty);
local v18 = require(l_script_FirstAncestor_0.Src.Util.KeyframeUtils);
local _ = require(l_script_FirstAncestor_0.Src.Util.PathUtils);
local v20 = require(l_script_FirstAncestor_0.Src.Util.TrackUtils);
local _ = {
    Enum.RotationOrder.XYZ, 
    Enum.RotationOrder.XZY, 
    Enum.RotationOrder.YXZ, 
    Enum.RotationOrder.YZX, 
    Enum.RotationOrder.ZXY, 
    Enum.RotationOrder.ZYX
};
local v22 = v1.PureComponent:extend("TrackActions");
v22.init = function(v23)
    v23.hasInternalPermission = false;
end;
v22.makeEulerAnglesOrderSubMenu = function(v24)
    local l_props_0 = v24.props;
    local l_Localization_0 = v24.props.Localization;
    local l_AnimationData_0 = v24.props.AnimationData;
    local l_InstanceName_0 = v24.props.InstanceName;
    local l_Path_0 = v24.props.Path;
    local v30 = v20.getEulerAnglesOrder((v15.getTrack(l_AnimationData_0, l_InstanceName_0, l_Path_0))) or l_props_0.DefaultEulerAnglesOrder;
    local function v32(v31)
        l_props_0.SetTrackEulerAnglesOrder(l_InstanceName_0, l_Path_0, v31.Data);
    end;
    local v33 = {
        Text = l_Localization_0:getText("ContextMenu", "EulerAnglesOrder")
    };
    for _, v35 in v16.EULER_ANGLES_ORDER, nil, nil do
        table.insert(v33, {
            Text = v35.Name, 
            Data = v35, 
            Checked = v30 == v35.Value, 
            OnItemClicked = v32
        });
    end;
    return v33;
end;
v22.makeMenuActions = function(v36)
    local l_props_1 = v36.props;
    local l_PluginActions_0 = l_props_1.PluginActions;
    local l_IsChannelAnimation_0 = l_props_1.IsChannelAnimation;
    local l_Path_1 = l_props_1.Path;
    local l_TrackType_0 = l_props_1.TrackType;
    local l_AnimationData_1 = l_props_1.AnimationData;
    local l_InstanceName_1 = l_props_1.InstanceName;
    local l_TrackName_0 = l_props_1.TrackName;
    local v45 = v15.getTrack(l_AnimationData_1, l_InstanceName_1, l_Path_1);
    local v46 = false;
    if v45 ~= nil then
        v46 = true;
        if v45.Type ~= v16.TRACK_TYPES.Quaternion then
            v46 = false;
            if v45.Type == v16.TRACK_TYPES.CFrame then
                v46 = v20.getRotationType(v45) == v16.TRACK_TYPES.Quaternion;
            end;
        end;
    end;
    local v47 = not l_IsChannelAnimation_0;
    if not v47 then
        v47 = false;
        if l_Path_1 ~= nil then
            v47 = #l_Path_1 <= 1;
        end;
    end;
    local v48 = {
        l_PluginActions_0:get("AddKeyframe"), 
        l_PluginActions_0:get(not v47 and "ClearTrack" or "DeleteTrack")
    };
    local v49 = false;
    if not (not l_IsChannelAnimation_0 or not v46) then
        table.insert(v48, v16.MENU_SEPARATOR);
        table.insert(v48, l_PluginActions_0:get("ConvertToEulerAngles"));
        v49 = true;
    end;
    if l_TrackType_0 == v16.TRACK_TYPES.EulerAngles then
        if not v49 then
            table.insert(v48, v16.MENU_SEPARATOR);
        end;
        table.insert(v48, v36:makeEulerAnglesOrderSubMenu());
    end;
    if v36.hasInternalPermission then
        table.insert(v48, {
            Text = "[INTERNAL] Dump track data", 
            OnItemClicked = function()
                local v50 = l_AnimationData_1.Instances[l_InstanceName_1];
                l_TrackName_0 = l_TrackName_0 or l_Path_1[1];
                require(l_script_FirstAncestor_0.Src.Util.Debug.dumpTable)(v50.Tracks[l_TrackName_0]);
            end
        });
        table.insert(v48, {
            Text = "[INTERNAL] Dump track as CSV", 
            OnItemClicked = function()
                local v51 = require(l_script_FirstAncestor_0.Src.Util.Debug.dumpTrack);
                local v52 = l_AnimationData_1.Instances[l_InstanceName_1];
                l_TrackName_0 = l_TrackName_0 or l_Path_1[1];
                local v53 = v52.Tracks[l_TrackName_0];
                v51(v53, l_TrackName_0, v20.getEulerAnglesOrder(v53) or l_props_1.DefaultEulerAnglesOrder);
            end
        });
    end;
    return v48;
end;
v22.addAction = function(v54, v55, v56)
    if v55 then
        v55.Enabled = false;
        table.insert(v54.Actions, v55);
        table.insert(v54.Connections, v55.Triggered:Connect(v56));
    end;
end;
v22.didMount = function(v57)
    local l_PluginActions_1 = v57.props.PluginActions;
    v57.Actions = {};
    v57.Connections = {};
    local l_status_0, l_result_0 = pcall(function()
        return game:GetService("StudioService"):HasInternalPermission();
    end);
    if not (not l_status_0 or not l_result_0) then
        v57.hasInternalPermission = true;
    end;
    v57:addAction(l_PluginActions_1:get("DeleteTrack"), function()
        local l_props_2 = v57.props;
        l_props_2.DeleteTrack(l_props_2.Path[1], l_props_2.Analytics);
    end);
    v57:addAction(l_PluginActions_1:get("ClearTrack"), function()
        local l_props_3 = v57.props;
        l_props_3.ClearTrack(l_props_3.InstanceName, l_props_3.Path, l_props_3.Analytics);
    end);
    v57:addAction(l_PluginActions_1:get("AddKeyframe"), function()
        local l_props_4 = v57.props;
        local l_Playhead_0 = l_props_4.Playhead;
        local l_TrackType_1 = l_props_4.TrackType;
        local l_RotationType_0 = l_props_4.RotationType;
        local l_InstanceName_2 = l_props_4.InstanceName;
        local l_AnimationData_2 = l_props_4.AnimationData;
        local l_IsChannelAnimation_1 = l_props_4.IsChannelAnimation;
        local l_Path_2 = l_props_4.Path;
        local _ = nil;
        if not (not l_InstanceName_2 or not l_Path_2) then
            if not l_IsChannelAnimation_1 then
                local v72 = v15.getTrack(l_AnimationData_2, l_InstanceName_2, l_Path_2);
                l_props_4.AddKeyframe(l_InstanceName_2, l_Path_2, l_TrackType_1, nil, l_Playhead_0, {
                    Value = if not not v72 and v72.Keyframes then v18.getValue(v72, l_Playhead_0) else v18.getDefaultValue(l_TrackType_1), 
                    EasingStyle = Enum.PoseEasingStyle.Linear, 
                    EasingDirection = Enum.PoseEasingDirection.In
                }, l_props_4.Analytics);
            else
                v20.traverseComponents(l_TrackType_1, function(v73, v74)
                    l_props_4.SplitTrack(l_InstanceName_2, v2.List.join(l_Path_2, v74), v73, l_RotationType_0, l_Playhead_0, l_props_4.Analytics);
                end, l_RotationType_0);
                return ;
            end;
        end;
    end);
    v57:addAction(l_PluginActions_1:get("ConvertToEulerAngles"), function()
        local l_props_5 = v57.props;
        local l_Path_3 = l_props_5.Path;
        local l_InstanceName_3 = l_props_5.InstanceName;
        local l_TrackType_2 = l_props_5.TrackType;
        local l_AnimationData_3 = l_props_5.AnimationData;
        if l_TrackType_2 == v16.TRACK_TYPES.CFrame then
            table.insert(l_Path_3, v16.PROPERTY_KEYS.Rotation);
            local v80 = v15.getTrack(l_AnimationData_3, l_InstanceName_3, l_Path_3);
            if not v80 or v80.Type ~= v16.TRACK_TYPES.Quaternion then
                return ;
            end;
        end;
        l_props_5.ConvertTrack(l_InstanceName_3, l_Path_3, v16.TRACK_TYPES.EulerAngles, l_props_5.Analytics);
    end);
end;
v22.render = function(v81)
    local l_props_6 = v81.props;
    local l_ShowMenu_0 = l_props_6.ShowMenu;
    local l_Path_4 = l_props_6.Path;
    local l_InstanceName_4 = l_props_6.InstanceName;
    local l_AnimationData_4 = l_props_6.AnimationData;
    local l_Playhead_1 = l_props_6.Playhead;
    local l_ReadOnly_0 = l_props_6.ReadOnly;
    local l_Actions_0 = v81.Actions;
    local l_PluginActions_2 = v81.props.PluginActions;
    local l_IsChannelAnimation_2 = v81.props.IsChannelAnimation;
    if not v17(l_PluginActions_2) and l_Actions_0 ~= nil then
        for _, v93 in ipairs(l_Actions_0) do
            v93.Enabled = false;
        end;
        if not (not l_Path_4 or not l_InstanceName_4) then
            local v94 = v15.getTrack(l_AnimationData_4, l_InstanceName_4, l_Path_4);
            local v95 = nil;
            if l_IsChannelAnimation_2 then
                if v94 then
                    local v96 = v20.getComponentsInfo(v94, l_Playhead_1);
                    v95 = not v96[l_Playhead_1] or not v96[l_Playhead_1].Complete;
                else
                    v95 = true;
                end;
            else
                v95 = not ((v94 and v94.Data) and v94.Data[l_Playhead_1]);
            end;
            l_PluginActions_2:get("AddKeyframe").Enabled = not l_ReadOnly_0 and v95;
        end;
        l_PluginActions_2:get("DeleteTrack").Enabled = not l_ReadOnly_0;
        l_PluginActions_2:get("ClearTrack").Enabled = not l_ReadOnly_0;
        if l_IsChannelAnimation_2 then
            l_PluginActions_2:get("ConvertToEulerAngles").Enabled = not l_ReadOnly_0;
        end;
    end;
    return not not l_ShowMenu_0 and v1.createElement(v6, {
        Actions = v81:makeMenuActions(), 
        OnMenuOpened = l_props_6.OnMenuOpened
    }) or nil;
end;
v22.willUnmount = function(v97)
    if v97.Connections then
        for _, v99 in ipairs(v97.Connections) do
            v99:Disconnect();
        end;
        v97.Connections = {};
    end;
    if v97.Actions then
        for _, v101 in ipairs(v97.Actions) do
            v101.Enabled = false;
        end;
    end;
end;
return v3.connect(function(v102)
    local l_Status_0 = v102.Status;
    return {
        AnimationData = v102.AnimationData, 
        DefaultEulerAnglesOrder = l_Status_0.DefaultEulerAnglesOrder, 
        InstanceName = l_Status_0.RightClickContextInfo.InstanceName, 
        Path = l_Status_0.RightClickContextInfo.Path, 
        Playhead = l_Status_0.Playhead, 
        ReadOnly = l_Status_0.ReadOnly, 
        RotationType = l_Status_0.RightClickContextInfo.RotationType, 
        TrackName = l_Status_0.RightClickContextInfo.TrackName, 
        TrackType = l_Status_0.RightClickContextInfo.TrackType
    };
end, function(v104)
    return {
        AddKeyframe = function(v105, v106, v107, v108, v109, v110, v111)
            v104(v8());
            v104(v7(v105, v106, v107, v108, v109, v110, v111));
            v104(v13({}));
        end, 
        ClearTrack = function(v112, v113, v114)
            v104(v8());
            v104(v9(v112, v113, v114));
            v104(v13({}));
        end, 
        ConvertTrack = function(v115, v116, v117, v118)
            v104(v8());
            v104(v10(v115, v116, v117, v118));
            v104(v13({}));
        end, 
        DeleteTrack = function(v119, v120)
            v104(v8());
            v104(v11(v119, v120));
            v104(v13({}));
        end, 
        SetTrackEulerAnglesOrder = function(v121, v122, v123)
            v104(v8());
            v104(v12(v121, v122, v123));
            v104(v13({}));
        end, 
        SplitTrack = function(v124, v125, v126, v127, v128, v129)
            v104(v8());
            v104(v14(v124, v125, v126, v127, v128, v129));
            v104(v13({}));
        end
    };
end)((l_withContext_0({
    Localization = l_ContextServices_0.Localization, 
    PluginActions = l_ContextServices_0.PluginActions, 
    Analytics = l_ContextServices_0.Analytics
})(v22)));
