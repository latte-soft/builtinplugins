local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.RoactRodux);
local v3 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v3.ContextServices;
local l_Analytics_0 = l_ContextServices_0.Analytics;
local l_PluginActions_0 = l_ContextServices_0.PluginActions;
local l_UI_0 = v3.UI;
local l_PluginButton_0 = l_UI_0.PluginButton;
local l_PluginToolbar_0 = l_UI_0.PluginToolbar;
local v10 = require(l_Parent_0.Src.Util.Constants);
local v11 = require(l_Parent_0.Src.Thunks.Callstack.StepHandlers);
local v12 = require(l_Parent_0.Src.Actions.Common.SetPausedState);
local v13 = v1.PureComponent:extend("DebuggerToolbarButtons");
v13.init = function(v14, v15)
    v14.onResume = function()
        v15.onSetPausedState(false);
        game:GetService("DebuggerUIService"):Resume();
    end;
    v14.onPause = function()
        game:GetService("DebuggerUIService"):Pause();
    end;
    v14.onStepOver = function()
        v14.props.onStepAction(v10.StepActionIds.stepOverActionV2, "ToolbarButton", v14.props.CurrentDebuggerConnectionId, v14.props.CurrentThreadId);
    end;
    v14.onStepInto = function()
        v14.props.onStepAction(v10.StepActionIds.stepIntoActionV2, "ToolbarButton", v14.props.CurrentDebuggerConnectionId, v14.props.CurrentThreadId);
    end;
    v14.onStepOut = function()
        v14.props.onStepAction(v10.StepActionIds.stepOutActionV2, "ToolbarButton", v14.props.CurrentDebuggerConnectionId, v14.props.CurrentThreadId);
    end;
end;
v13.addAction = function(v16, v17, v18)
    if v17 then
        v17.Enabled = true;
        table.insert(v16.shortcuts, v17);
        table.insert(v16.connections, v17.Triggered:Connect(v18));
    end;
end;
v13.didMount = function(v19)
    local l_PluginActions_1 = v19.props.PluginActions;
    v19.connections = {};
    v19.shortcuts = {};
    v19:addAction(l_PluginActions_1:get(v10.StepActionIds.stepOverActionV2), function()
        v19.props.onStepAction(v10.StepActionIds.stepOverActionV2, "PluginAction", v19.props.CurrentDebuggerConnectionId, v19.props.CurrentThreadId);
    end);
    v19:addAction(l_PluginActions_1:get(v10.StepActionIds.stepIntoActionV2), function()
        v19.props.onStepAction(v10.StepActionIds.stepIntoActionV2, "PluginAction", v19.props.CurrentDebuggerConnectionId, v19.props.CurrentThreadId);
    end);
    v19:addAction(l_PluginActions_1:get(v10.StepActionIds.stepOutActionV2), function()
        v19.props.onStepAction(v10.StepActionIds.stepOutActionV2, "PluginAction", v19.props.CurrentDebuggerConnectionId, v19.props.CurrentThreadId);
    end);
    v19:addAction(l_PluginActions_1:get(v10.StepActionIds.simulationResumeActionV2), function()
        v19.onResume();
    end);
end;
v13.renderButtons = function(v21, v22)
    local l_DebuggerUIService_0 = game:GetService("DebuggerUIService");
    local v24 = false;
    if v21.props.CurrentDebuggerConnectionId ~= v10.kInvalidDebuggerConnectionId then
        v24 = l_DebuggerUIService_0:IsConnectionForPlayDataModel(v21.props.CurrentDebuggerConnectionId);
    end;
    local l_IsPaused_0 = v21.props.IsPaused;
    local l_HitException_0 = v21.props.HitException;
    local v27 = {
        ResumeButton = v1.createElement(l_PluginButton_0, {
            Name = "simulationResumeActionV2", 
            Toolbar = v22, 
            Active = false, 
            Enabled = l_IsPaused_0, 
            Title = "Resume", 
            Tooltip = "", 
            icon = "rbxlocaltheme://Resume", 
            OnClick = v21.onResume, 
            ClickableWhenViewportHidden = true
        }), 
        PauseButton = v1.createElement(l_PluginButton_0, {
            Name = "simulationPauseActionV2", 
            Toolbar = v22, 
            Active = false, 
            Enabled = not l_IsPaused_0 and v24, 
            Title = "Pause", 
            Tooltip = "", 
            icon = "rbxlocaltheme://Pause", 
            OnClick = v21.onPause, 
            ClickableWhenViewportHidden = true
        })
    };
    local l_createElement_0 = v1.createElement;
    local l_l_PluginButton_0_0 = l_PluginButton_0;
    local v30 = {
        Name = "stepOverActionV2", 
        Toolbar = v22, 
        Active = false
    };
    local v31 = false;
    if v21.props.CurrentThreadId ~= nil then
        v31 = not l_HitException_0;
    end;
    v30.Enabled = v31;
    v30.Title = "StepOver";
    v30.Tooltip = "";
    v30.icon = "rbxlocaltheme://StepOver";
    v30.OnClick = v21.onStepOver;
    v30.ClickableWhenViewportHidden = true;
    v27.StepOverButton = l_createElement_0(l_l_PluginButton_0_0, v30);
    l_createElement_0 = v1.createElement;
    l_l_PluginButton_0_0 = l_PluginButton_0;
    v30 = {
        Name = "stepIntoActionV2", 
        Toolbar = v22, 
        Active = false
    };
    v31 = false;
    if v21.props.CurrentThreadId ~= nil then
        v31 = not l_HitException_0;
    end;
    v30.Enabled = v31;
    v30.Title = "StepInto";
    v30.Tooltip = "";
    v30.icon = "rbxlocaltheme://StepInto";
    v30.OnClick = v21.onStepInto;
    v30.ClickableWhenViewportHidden = true;
    v27.StepIntoButton = l_createElement_0(l_l_PluginButton_0_0, v30);
    l_createElement_0 = v1.createElement;
    l_l_PluginButton_0_0 = l_PluginButton_0;
    v30 = {
        Name = "stepOutActionV2", 
        Toolbar = v22, 
        Active = false
    };
    v31 = false;
    if v21.props.CurrentThreadId ~= nil then
        v31 = not l_HitException_0;
    end;
    v30.Enabled = v31;
    v30.Title = "StepOut";
    v30.Tooltip = "";
    v30.icon = "rbxlocaltheme://StepOut";
    v30.OnClick = v21.onStepOut;
    v30.ClickableWhenViewportHidden = true;
    v27.StepOutButton = l_createElement_0(l_l_PluginButton_0_0, v30);
    return v27;
end;
v13.render = function(v32)
    if v32.shortcuts then
        for _, v34 in pairs(v32.shortcuts) do
            v34.Enabled = v32.props.IsPaused;
        end;
    end;
    return v1.createElement(l_PluginToolbar_0, {
        Title = "Debugger", 
        RenderButtons = function(v35)
            return v32:renderButtons(v35);
        end
    });
end;
return (v2.connect(function(v36, _)
    local l_Common_0 = v36.Common;
    local l_isPaused_0 = l_Common_0.isPaused;
    local v40 = l_Common_0.debuggerConnectionIdToCurrentThreadId[l_Common_0.currentDebuggerConnectionId];
    return {
        IsPaused = l_isPaused_0, 
        CurrentThreadId = v40, 
        CurrentDebuggerConnectionId = l_Common_0.currentDebuggerConnectionId, 
        HitException = not not v40 and l_Common_0.hitException[v40]
    };
end, function(v41)
    return {
        onSetPausedState = function(v42)
            return v41(v12(v42));
        end, 
        onStepAction = function(v43, v44, v45, v46)
            return v41(v11(v43, v44, v45, v46));
        end
    };
end)((l_ContextServices_0.withContext({
    Analytics = l_Analytics_0, 
    PluginActions = l_PluginActions_0
})(v13))));
