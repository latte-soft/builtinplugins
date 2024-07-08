local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Roact);
local v2 = require(l_script_FirstAncestor_0.Packages.RoactRodux);
local l_ContextServices_0 = require(l_script_FirstAncestor_0.Packages.Framework).ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Actions_0 = l_script_FirstAncestor_0.Src.Actions;
local v6 = require(l_Actions_0.SetDefaultEulerAnglesOrder);
local v7 = require(l_Actions_0.SetDefaultRotationType);
local v8 = require(l_Actions_0.SetFrameRate);
local v9 = require(l_Actions_0.SetGridSpeed);
local v10 = require(l_Actions_0.SetShowAsSeconds);
local v11 = require(l_Actions_0.SetShowEvents);
local v12 = require(l_Actions_0.SetSnapMode);
local v13 = require(l_Actions_0.SetTimelineUnit);
local v14 = require(l_script_FirstAncestor_0.Src.Components.ContextMenu);
local v15 = require(l_script_FirstAncestor_0.Src.Thunks.Playback.SetPlaybackSpeed);
local _ = require(l_script_FirstAncestor_0.Src.Util.AnimationData);
local v17 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local v18 = require(l_script_FirstAncestor_0.LuaFlags.GetFFlagGridSpeed);
local v19 = require(l_script_FirstAncestor_0.LuaFlags.GetFFlagTimelineUnitSeconds);
local v20 = v1.PureComponent:extend("SettingsMenu");
v20.makeTimelineUnitMenu = function(v21)
    local l_props_0 = v21.props;
    local l_Localization_0 = l_props_0.Localization;
    local v24 = l_props_0.Plugin:get();
    if not v19() then
        local function v27(v25)
            local v26 = v25.Data == v17.TIMELINE_UNITS.Seconds;
            v24:SetSetting(v17.SETTINGS.ShowAsSeconds, v26);
            l_props_0.SetShowAsSeconds(v26);
            l_props_0.Analytics:report("onTimeUnitChanged", v25.Data);
        end;
        return {
            Text = l_Localization_0:getText("Settings", "TimelineUnit"); 
            {
                Data = v17.TIMELINE_UNITS.Seconds, 
                Text = l_Localization_0:getText("Settings", "Seconds"), 
                Checked = l_props_0.ShowAsSeconds, 
                OnItemClicked = v27
            }, 
            {
                Data = v17.TIMELINE_UNITS.Frames, 
                Text = l_Localization_0:getText("Settings", "Frames"), 
                Checked = not l_props_0.ShowAsSeconds, 
                OnItemClicked = v27
            }
        };
    else
        local function v29(v28)
            v24:SetSetting(v17.SETTINGS.TimelineUnit, v28.Data);
            l_props_0.SetTimelineUnit(v28.Data);
            l_props_0.Analytics:report("onTimeUnitChanged", v28.Data);
        end;
        local v30 = {
            Text = l_Localization_0:getText("Settings", "TimelineUnit")
        };
        for _, v32 in v17.TIMELINE_UNITS_ORDER, nil, nil do
            table.insert(v30, {
                Data = v17.TIMELINE_UNITS[v32], 
                Text = l_Localization_0:getText("Settings", v17.TIMELINE_UNITS[v32]), 
                Checked = l_props_0.TimelineUnit == v32, 
                OnItemClicked = v29
            });
        end;
        return v30;
    end;
end;
v20.makePlaybackSpeedMenu = function(v33)
    local l_props_1 = v33.props;
    local l_Localization_1 = l_props_1.Localization;
    local l_PlaybackSpeed_0 = l_props_1.PlaybackSpeed;
    local v37 = false;
    for _, v39 in pairs(v17.PLAYBACK_SPEEDS) do
        if v39 ~= v17.PLAYBACK_SPEEDS.CUSTOM and l_PlaybackSpeed_0 == v39 then
            v37 = true;
            break;
        end;
    end;
    local function v41(v40)
        l_props_1.SetPlaybackSpeed(v40.Data);
    end;
    return {
        Text = l_Localization_1:getText("Settings", "PlaybackSpeed") .. ": " .. string.format("%.2f", l_PlaybackSpeed_0):gsub("%.?0+$", "") .. "x"; 
        {
            Data = v17.PLAYBACK_SPEEDS.PBS_025, 
            Text = l_Localization_1:getText("Settings", "025x"), 
            Checked = l_PlaybackSpeed_0 == v17.PLAYBACK_SPEEDS.PBS_025, 
            OnItemClicked = v41
        }, 
        {
            Data = v17.PLAYBACK_SPEEDS.PBS_05, 
            Text = l_Localization_1:getText("Settings", "05x"), 
            Checked = l_PlaybackSpeed_0 == v17.PLAYBACK_SPEEDS.PBS_05, 
            OnItemClicked = v41
        }, 
        {
            Data = v17.PLAYBACK_SPEEDS.PBS_1, 
            Text = l_Localization_1:getText("Settings", "1x"), 
            Checked = l_PlaybackSpeed_0 == v17.PLAYBACK_SPEEDS.PBS_1, 
            OnItemClicked = v41
        }, 
        {
            Data = v17.PLAYBACK_SPEEDS.PBS_2, 
            Text = l_Localization_1:getText("Settings", "2x"), 
            Checked = l_PlaybackSpeed_0 == v17.PLAYBACK_SPEEDS.PBS_2, 
            OnItemClicked = v41
        }, 
        {
            Data = v17.PLAYBACK_SPEEDS.PBS_4, 
            Text = l_Localization_1:getText("Settings", "4x"), 
            Checked = l_PlaybackSpeed_0 == v17.PLAYBACK_SPEEDS.PBS_4, 
            OnItemClicked = v41
        }, 
        {
            Text = l_Localization_1:getText("Settings", "CustomPlaybackSpeed") .. "...", 
            Checked = not v37, 
            OnItemClicked = function()
                if l_props_1.OnChangePlaybackSpeed then
                    l_props_1.OnChangePlaybackSpeed();
                end;
            end
        }
    };
end;
v20.makeFrameRateMenu = function(v42)
    local l_props_2 = v42.props;
    local l_Localization_2 = l_props_2.Localization;
    local l_AnimationData_0 = l_props_2.AnimationData;
    if l_AnimationData_0 and l_AnimationData_0.Metadata then
        local l_FrameRate_0 = l_props_2.FrameRate;
        local v47 = false;
        for _, v49 in pairs(v17.FRAMERATES) do
            if v49 ~= v17.FRAMERATES.CUSTOM and v49 == l_FrameRate_0 then
                v47 = true;
                break;
            end;
        end;
        local function v51(v50)
            l_props_2.SetFrameRate(v50.Data);
        end;
        return {
            Text = l_Localization_2:getText("Settings", "FrameRate") .. ": " .. l_FrameRate_0 .. " fps", 
            Enabled = false; 
            {
                Data = v17.FRAMERATES.FPS_24, 
                Text = l_Localization_2:getText("Settings", "24FPS"), 
                Checked = l_FrameRate_0 == v17.FRAMERATES.FPS_24, 
                OnItemClicked = v51
            }, 
            {
                Data = v17.FRAMERATES.FPS_30, 
                Text = l_Localization_2:getText("Settings", "30FPS"), 
                Checked = l_FrameRate_0 == v17.FRAMERATES.FPS_30, 
                OnItemClicked = v51
            }, 
            {
                Data = v17.FRAMERATES.FPS_60, 
                Text = l_Localization_2:getText("Settings", "60FPS"), 
                Checked = l_FrameRate_0 == v17.FRAMERATES.FPS_60, 
                OnItemClicked = v51
            }, 
            {
                Data = v17.FRAMERATES.FPS_120, 
                Text = l_Localization_2:getText("Settings", "120FPS"), 
                Checked = l_FrameRate_0 == v17.FRAMERATES.FPS_120, 
                OnItemClicked = v51
            }, 
            {
                Text = l_Localization_2:getText("Settings", "CustomFPS") .. "...", 
                Checked = not v47, 
                OnItemClicked = function()
                    if l_props_2.OnChangeFPS then
                        l_props_2.OnChangeFPS();
                    end;
                end
            }
        };
    else
        return {
            Text = l_Localization_2:getText("Settings", "FrameRate"), 
            Enabled = false
        };
    end;
end;
v20.makeGridSpeedMenu = function(v52)
    local l_props_3 = v52.props;
    local l_Localization_3 = l_props_3.Localization;
    local _ = l_props_3.AnimationData;
    local l_GridSpeed_0 = l_props_3.GridSpeed;
    local v57 = true;
    for _, v59 in pairs(v17.GRIDSPEEDS) do
        if v59 == l_GridSpeed_0 and v59 ~= v17.GRIDSPEEDS.Custom then
            v57 = false;
        end;
    end;
    local function v61(v60)
        l_props_3.SetGridSpeed(v60.Data);
    end;
    local function v62()
        if l_props_3.OnChangeGridSpeed then
            l_props_3.OnChangeGridSpeed();
        end;
    end;
    local l_l_GridSpeed_0_0 = l_GridSpeed_0;
    local v64 = l_props_3.RootInstance and l_props_3.RootInstance:FindFirstChildOfClass("Humanoid");
    if l_l_GridSpeed_0_0 == v17.GRIDSPEEDS.FromRig then
        l_l_GridSpeed_0_0 = not v64 and 0 or v64.WalkSpeed;
    end;
    local v65 = {
        Text = l_Localization_3:getText("Settings", "GridSpeed", {
            speed = l_l_GridSpeed_0_0
        }), 
        Enabled = false; 
        {
            Data = v17.GRIDSPEEDS.Static, 
            Text = l_Localization_3:getText("Settings", "GridSpeedStatic"), 
            Checked = l_GridSpeed_0 == v17.GRIDSPEEDS.Static, 
            OnItemClicked = v61
        }, 
        {
            Data = v17.GRIDSPEEDS.Default, 
            Text = l_Localization_3:getText("Settings", "GridSpeedDefault"), 
            Checked = l_GridSpeed_0 == v17.GRIDSPEEDS.Default, 
            OnItemClicked = v61
        }
    };
    if v64 then
        table.insert(v65, {
            Data = v17.GRIDSPEEDS.FromRig, 
            Text = l_Localization_3:getText("Settings", "GridSpeedFromRig"), 
            Checked = l_GridSpeed_0 == v17.GRIDSPEEDS.FromRig, 
            OnItemClicked = v61
        });
    end;
    table.insert(v65, {
        Data = v17.GRIDSPEEDS.Custom, 
        Text = l_Localization_3:getText("Settings", "GridSpeedCustom"), 
        Checked = v57, 
        OnItemClicked = v62
    });
    return v65;
end;
v20.makeSnapMenu = function(v66)
    local l_props_4 = v66.props;
    local l_Localization_4 = l_props_4.Localization;
    local v69 = l_props_4.Plugin:get();
    local l_SnapMode_0 = l_props_4.SnapMode;
    local function v72(v71)
        v69:SetSetting(v17.SETTINGS.SnapMode, v71.Data);
        l_props_4.SetSnapMode(v71.Data);
    end;
    return {
        Text = l_Localization_4:getText("Settings", "SnapMode"); 
        {
            Data = v17.SNAP_MODES.Keyframes, 
            Text = l_Localization_4:getText("Settings", "SnapKeyframes"), 
            Checked = l_SnapMode_0 == v17.SNAP_MODES.Keyframes, 
            OnItemClicked = v72
        }, 
        {
            Data = v17.SNAP_MODES.Frames, 
            Text = l_Localization_4:getText("Settings", "SnapFrames"), 
            Checked = l_SnapMode_0 == v17.SNAP_MODES.Frames, 
            OnItemClicked = v72
        }, 
        {
            Data = v17.SNAP_MODES.None, 
            Text = l_Localization_4:getText("Settings", "SnapNone"), 
            Checked = l_SnapMode_0 == v17.SNAP_MODES.None, 
            OnItemClicked = v72
        }
    };
end;
v20.makeDefaultRotationTypeMenu = function(v73)
    local l_props_5 = v73.props;
    local l_Localization_5 = l_props_5.Localization;
    local v76 = l_props_5.Plugin:get();
    local l_DefaultRotationType_0 = l_props_5.DefaultRotationType;
    local function v79(v78)
        v76:SetSetting(v17.SETTINGS.RotationType, v78.Data);
        l_props_5.SetDefaultRotationType(v78.Data);
    end;
    return {
        Text = l_Localization_5:getText("Settings", "DefaultRotationType"); 
        {
            Data = v17.TRACK_TYPES.EulerAngles, 
            Text = l_Localization_5:getText("Settings", "EulerAngles"), 
            Checked = l_DefaultRotationType_0 == v17.TRACK_TYPES.EulerAngles, 
            OnItemClicked = v79
        }, 
        {
            Data = v17.TRACK_TYPES.Quaternion, 
            Text = l_Localization_5:getText("Settings", "Quaternions"), 
            Checked = l_DefaultRotationType_0 == v17.TRACK_TYPES.Quaternion, 
            OnItemClicked = v79
        }
    };
end;
v20.makeEulerAnglesOrderMenu = function(v80)
    local l_props_6 = v80.props;
    local l_Localization_6 = l_props_6.Localization;
    local v83 = l_props_6.Plugin:get();
    local l_DefaultEulerAnglesOrder_0 = l_props_6.DefaultEulerAnglesOrder;
    local function v86(v85)
        v83:SetSetting(v17.SETTINGS.EulerAnglesOrder, v85.Data);
        l_props_6.SetDefaultEulerAnglesOrder(v85.Data);
    end;
    return {
        Text = l_Localization_6:getText("Settings", "DefaultEulerAnglesOrder"); 
        {
            Data = Enum.RotationOrder.XYZ, 
            Text = l_Localization_6:getText("Settings", "XYZ"), 
            Checked = l_DefaultEulerAnglesOrder_0 == Enum.RotationOrder.XYZ, 
            OnItemClicked = v86
        }, 
        {
            Data = Enum.RotationOrder.XZY, 
            Text = l_Localization_6:getText("Settings", "XZY"), 
            Checked = l_DefaultEulerAnglesOrder_0 == Enum.RotationOrder.XZY, 
            OnItemClicked = v86
        }, 
        {
            Data = Enum.RotationOrder.YXZ, 
            Text = l_Localization_6:getText("Settings", "YXZ"), 
            Checked = l_DefaultEulerAnglesOrder_0 == Enum.RotationOrder.YXZ, 
            OnItemClicked = v86
        }, 
        {
            Data = Enum.RotationOrder.YZX, 
            Text = l_Localization_6:getText("Settings", "YZX"), 
            Checked = l_DefaultEulerAnglesOrder_0 == Enum.RotationOrder.YZX, 
            OnItemClicked = v86
        }, 
        {
            Data = Enum.RotationOrder.ZXY, 
            Text = l_Localization_6:getText("Settings", "ZXY"), 
            Checked = l_DefaultEulerAnglesOrder_0 == Enum.RotationOrder.ZXY, 
            OnItemClicked = v86
        }, 
        {
            Data = Enum.RotationOrder.ZYX, 
            Text = l_Localization_6:getText("Settings", "ZYX"), 
            Checked = l_DefaultEulerAnglesOrder_0 == Enum.RotationOrder.ZYX, 
            OnItemClicked = v86
        }
    };
end;
v20.makeShowEvents = function(v87)
    local l_props_7 = v87.props;
    return {
        Text = l_props_7.Localization:getText("Settings", "ShowEvents"), 
        Checked = l_props_7.ShowEvents, 
        OnItemClicked = function()
            l_props_7.SetShowEvents(not l_props_7.ShowEvents);
        end
    };
end;
v20.makeMenuActions = function(v89)
    if not v18() then
        return {
            v89:makeTimelineUnitMenu(), 
            v17.MENU_SEPARATOR, 
            v89:makeFrameRateMenu(), 
            v89:makePlaybackSpeedMenu(), 
            v17.MENU_SEPARATOR, 
            v89:makeShowEvents(), 
            v89:makeSnapMenu(), 
            v17.MENU_SEPARATOR, 
            v89:makeDefaultRotationTypeMenu(), 
            v89:makeEulerAnglesOrderMenu()
        };
    else
        return {
            v89:makeTimelineUnitMenu(), 
            v17.MENU_SEPARATOR, 
            v89:makeFrameRateMenu(), 
            v89:makePlaybackSpeedMenu(), 
            v89:makeGridSpeedMenu(), 
            v17.MENU_SEPARATOR, 
            v89:makeShowEvents(), 
            v89:makeSnapMenu(), 
            v17.MENU_SEPARATOR, 
            v89:makeDefaultRotationTypeMenu(), 
            v89:makeEulerAnglesOrderMenu()
        };
    end;
end;
v20.render = function(v90)
    local l_props_8 = v90.props;
    return not not l_props_8.ShowMenu and v1.createElement(v14, {
        Actions = v90:makeMenuActions(), 
        OnMenuOpened = l_props_8.OnMenuOpened
    }) or nil;
end;
return v2.connect(function(v92)
    local l_Status_0 = v92.Status;
    return {
        Analytics = v92.Analytics, 
        AnimationData = v92.AnimationData, 
        DefaultEulerAnglesOrder = l_Status_0.DefaultEulerAnglesOrder, 
        DefaultRotationType = l_Status_0.DefaultRotationType, 
        FrameRate = l_Status_0.FrameRate, 
        GridSpeed = l_Status_0.GridSpeed, 
        PlaybackSpeed = l_Status_0.PlaybackSpeed, 
        RootInstance = l_Status_0.RootInstance, 
        ShowAsSeconds = if not v19() then l_Status_0.ShowAsSeconds else nil, 
        ShowEvents = l_Status_0.ShowEvents, 
        SnapMode = l_Status_0.SnapMode, 
        TimelineUnit = l_Status_0.TimelineUnit
    };
end, function(v94)
    return {
        SetDefaultEulerAnglesOrder = function(v95)
            v94(v6(v95));
        end, 
        SetDefaultRotationType = function(v96)
            v94(v7(v96));
        end, 
        SetFrameRate = function(v97)
            v94(v8(v97));
        end, 
        SetGridSpeed = function(v98)
            v94(v9(v98));
        end, 
        SetPlaybackSpeed = function(v99)
            v94(v15(v99));
        end, 
        SetShowAsSeconds = not v19() and function(v100)
            v94(v10(v100));
        end or nil, 
        SetShowEvents = function(v101)
            v94(v11(v101));
        end, 
        SetSnapMode = function(v102)
            v94(v12(v102));
        end, 
        SetTimelineUnit = function(v103)
            v94(v13(v103));
        end
    };
end)((l_withContext_0({
    Localization = l_ContextServices_0.Localization, 
    Analytics = l_ContextServices_0.Analytics, 
    Plugin = l_ContextServices_0.Plugin
})(v20)));
