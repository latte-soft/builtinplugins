local l_RunService_0 = game:GetService("RunService");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_Selection_0 = game:GetService("Selection");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v4 = require(l_script_FirstAncestor_0.Packages.Roact);
local v5 = require(l_script_FirstAncestor_0.Packages.RoactRodux);
local l_ContextServices_0 = require(l_script_FirstAncestor_0.Packages.Framework).ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v8 = require(l_script_FirstAncestor_0.Src.Context.Signals);
local l_Actions_0 = l_script_FirstAncestor_0.Src.Actions;
local v10 = require(l_Actions_0.SetSelectedTrackInstances);
local v11 = require(l_Actions_0.SetSelectedTracks);
local l_Components_0 = l_script_FirstAncestor_0.Src.Components;
local _ = require(l_Components_0.BlockingDialog.ErrorDialogContents);
local v14 = require(l_Components_0.BlockingDialog.ErrorList);
local l_Util_0 = l_script_FirstAncestor_0.Src.Util;
local v16 = require(l_Util_0.Constants);
local v17 = require(l_Util_0.RigInfo);
local _ = require(l_Util_0.RigUtils);
local v19 = require(l_Util_0.RigValidation);
local v20 = require(l_Util_0.RigVisualization);
local v21 = require(l_Util_0.showBlockingDialog);
local l_Thunks_0 = l_script_FirstAncestor_0.Src.Thunks;
local v23 = require(l_Thunks_0.SetSelectedTracks);
local v24 = require(l_Thunks_0.UpdateRootInstance);
local v25 = require(l_script_FirstAncestor_0.LuaFlags.GetFFlagSelectFromViewport);
local v26 = v4.PureComponent:extend("InstanceSelector");
local function v27(v28)
    if not v28 or v28 == game.Workspace then
        return nil;
    else
        assert(v28);
        if not v28:IsA("Model") then
            return v27(v28.Parent);
        else
            return v28;
        end;
    end;
end;
local function _(v29)
    return v29:FindFirstAncestor(game.Workspace.Name) ~= nil;
end;
local function _()
    if #l_Selection_0:Get() > 0 then
        return l_Selection_0:Get()[1];
    else
        return nil;
    end;
end;
local function _(v32)
    return v32.props.Mouse:get().Target;
end;
local function _(v34)
    local v35 = false;
    if v34 ~= nil then
        v35 = v34:FindFirstAncestor(game.Workspace.Name) ~= nil and v17.getAnimationController(v34) ~= nil;
    end;
    return v35;
end;
v26.isCurrentRootInstance = function(v37, v38)
    return v38 == v37.props.RootInstance;
end;
v26.selectValidInstance = function(v39, v40, v41)
    if not v39.wasUnmounted then
        local l_Target_0 = v39.props.Mouse:get().Target;
        if l_Target_0 ~= nil then
            local v43;
            if not l_Target_0 or l_Target_0 == game.Workspace then
                v43 = nil;
            else
                assert(l_Target_0);
                v43 = if not l_Target_0:IsA("Model") then v27(l_Target_0.Parent) else l_Target_0;
            end;
            if not (not v43 or v39:isCurrentRootInstance(v43)) then
                local v44 = false;
                if v43 ~= nil then
                    v44 = v43:FindFirstAncestor(game.Workspace.Name) ~= nil and v17.getAnimationController(v43) ~= nil;
                end;
                if v44 then
                    v40(v43);
                    return ;
                end;
            end;
            if v41 then
                v41();
            end;
        end;
        return ;
    else
        return ;
    end;
end;
v26.showErrorDialogs = function(_, v46, v47)
    v21(v46, v4.createElement(v14, {
        ErrorKey = v16.RIG_ERRORS_KEY, 
        ErrorList = v47
    }));
end;
v26.init = function(v48)
    v48.wasUnmounted = false;
    v48.state = {
        HoverPart = nil
    };
    v48.selectInstance = function(v49)
        l_Selection_0:Set({
            v49
        });
    end;
    v48.deselect = function()
        l_Selection_0:Set({});
    end;
    v48.deselectAndRemoveSelectedTrackInstances = function()
        v48.deselect();
        if not v25() then
            v48.props.SetSelectedTrackInstances({});
        else
            v48.props.ClearSelectedTracks();
        end;
        v48.props.Signals:get(v16.SIGNAL_KEYS.SelectionChanged):Fire();
    end;
    v48.highlightInstance = function(v50)
        v48:setState({
            HoverPart = v50
        });
    end;
    v48.removeHighlight = function()
        v48:setState({
            HoverPart = v4.None
        });
    end;
    v48.SelectionChangedHandle = l_Selection_0.SelectionChanged:Connect(function()
        local v51 = if #l_Selection_0:Get() > 0 then l_Selection_0:Get()[1] else nil;
        local v52;
        if not v51 or v51 == game.Workspace then
            v52 = nil;
        else
            assert(v51);
            v52 = if not v51:IsA("Model") then v27(v51.Parent) else v51;
        end;
        local l_Plugin_0 = v48.props.Plugin;
        local v54 = false;
        if v52 ~= nil then
            v54 = v52:FindFirstAncestor(game.Workspace.Name) ~= nil and v17.getAnimationController(v52) ~= nil;
        end;
        if not v54 or v48:isCurrentRootInstance(v52) then
            if not (not v51 or not l_Plugin_0) then
                l_Plugin_0:get():Deactivate();
            end;
            return ;
        else
            local v55;
            v54, v55 = v19.rigHasErrors(v52);
            if v54 then
                v48.deselectAndRemoveSelectedTrackInstances();
                l_Plugin_0:get():Deactivate();
                v48:showErrorDialogs(l_Plugin_0:get(), v55);
                return ;
            else
                v48.props.UpdateRootInstance(v52, v48.props.Analytics);
                v48.deselectAndRemoveSelectedTrackInstances();
                return ;
            end;
        end;
    end);
end;
v26.didMount = function(v56)
    v56.deselect();
    v56.Heartbeat = l_RunService_0.Heartbeat:Connect(function(_)
        v56:selectValidInstance(v56.highlightInstance, v56.removeHighlight);
    end);
    local l_Plugin_1 = v56.props.Plugin;
    if l_Plugin_1 then
        l_Plugin_1:get():Activate(true);
        v56.MouseButtonDown = v56.props.Mouse:get().Button1Down:Connect(function()
            v56:selectValidInstance(v56.selectInstance);
        end);
    end;
end;
v26.render = function(v59)
    local l_state_0 = v59.state;
    local l_props_0 = v59.props;
    local l_VisualizeBones_0 = l_props_0.VisualizeBones;
    local l_HoverPart_0 = l_state_0.HoverPart;
    local v64 = l_props_0.Container or l_CoreGui_0;
    local v65 = {};
    if l_VisualizeBones_0 then
        v20.deselectBones();
    end;
    if l_props_0.SelectedTrackInstances then
        for v66, v67 in ipairs(l_props_0.SelectedTrackInstances) do
            if not l_VisualizeBones_0 or not v20.isBone(v67) then
                v65["SelectionBox" .. v66] = v4.createElement("SelectionBox", {
                    Archivable = false, 
                    Adornee = v67, 
                    LineThickness = 1, 
                    Transparency = 0.5, 
                    SurfaceTransparency = 0.8, 
                    StudioSelectionBox = true
                });
            else
                v20.selectBone(v67);
            end;
        end;
    end;
    v65.HoverBox = l_HoverPart_0 and v4.createElement("SelectionBox", {
        Archivable = false, 
        Adornee = l_HoverPart_0, 
        LineThickness = 2, 
        StudioSelectionBox = true
    });
    return v4.createElement(v4.Portal, {
        target = v64
    }, v65);
end;
v26.willUnmount = function(v68)
    v68.wasUnmounted = true;
    if v68.Heartbeat then
        v68.Heartbeat:Disconnect();
    end;
    if not v25() then
        v68.props.SetSelectedTrackInstances({});
    else
        v68.props.ClearSelectedTracks();
    end;
    v68.props.Signals:get(v16.SIGNAL_KEYS.SelectionChanged):Fire();
    if v68.SelectionChangedHandle then
        v68.SelectionChangedHandle:Disconnect();
    end;
    if v68.MouseButtonDown then
        v68.MouseButtonDown:Disconnect();
    end;
    if v68.props.Plugin then
        v68.props.Plugin:get():Deactivate();
    end;
end;
return v5.connect(function(v69, _)
    return {
        RootInstance = v69.Status.RootInstance, 
        SelectedTrackInstances = v69.Status.SelectedTrackInstances, 
        VisualizeBones = v69.Status.VisualizeBones
    };
end, function(v71)
    return {
        ClearSelectedTracks = function()
            v71(v23({}));
        end, 
        SetSelectedTrackInstances = if v25() then nil else function(v72)
            local v73 = {};
            for v74, v75 in pairs(v72) do
                v73[v74] = {
                    v75.Name
                };
            end;
            v71(v10(v72));
            v71(v11(v73));
        end, 
        UpdateRootInstance = function(v76, v77)
            v71(v24(v76, v77));
        end
    };
end)((l_withContext_0({
    Plugin = l_ContextServices_0.Plugin, 
    Mouse = l_ContextServices_0.Mouse, 
    Analytics = l_ContextServices_0.Analytics, 
    Signals = v8
})(v26)));
