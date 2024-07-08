local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Roact);
local v2 = require(l_script_FirstAncestor_0.Packages.RoactRodux);
local v3 = require(l_script_FirstAncestor_0.Src.Util.isEmpty);
local v4 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local l_ContextServices_0 = require(l_script_FirstAncestor_0.Packages.Framework).ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v7 = require(l_script_FirstAncestor_0.Src.Components.ContextMenu);
local v8 = require(l_script_FirstAncestor_0.Src.Thunks.History.AddWaypoint);
local v9 = require(l_script_FirstAncestor_0.Src.Thunks.Events.PasteEvents);
local v10 = require(l_script_FirstAncestor_0.Src.Thunks.Events.CopySelectedEvents);
local v11 = require(l_script_FirstAncestor_0.Src.Thunks.Events.DeleteSelectedEvents);
local v12 = require(l_script_FirstAncestor_0.Src.Actions.SetRightClickContextInfo);
local v13 = v1.PureComponent:extend("EventActions");
v13.makeMenuActionsDeprecated = function(v14)
    local l_PluginActions_0 = v14.props.PluginActions;
    if not l_PluginActions_0 then
        return ;
    else
        local l_props_0 = v14.props;
        local v17 = {
            l_PluginActions_0:get("DeleteEvents"), 
            v4.MENU_SEPARATOR, 
            l_PluginActions_0:get("CutEvents"), 
            l_PluginActions_0:get("CopyEvents"), 
            l_PluginActions_0:get("PasteEvents")
        };
        if not l_props_0.OnEvent then
            table.insert(v17, 1, l_PluginActions_0:get("AddEvent"));
            return v17;
        else
            table.insert(v17, 1, l_PluginActions_0:get("EditEvents"));
            return v17;
        end;
    end;
end;
v13.makeMenuActions = function(v18)
    local l_PluginActions_1 = v18.props.PluginActions;
    if not l_PluginActions_1 then
        return nil;
    else
        return {
            l_PluginActions_1:get(not v18.props.OnEvent and "AddEvent" or "EditEvents"), 
            l_PluginActions_1:get("DeleteEvents"), 
            v4.MENU_SEPARATOR, 
            l_PluginActions_1:get("CutEvents"), 
            l_PluginActions_1:get("CopyEvents"), 
            l_PluginActions_1:get("PasteEvents")
        };
    end;
end;
v13.addAction = function(v20, v21, v22)
    if v21 then
        v21.Enabled = false;
        table.insert(v20.Actions, v21);
        table.insert(v20.Connections, v21.Triggered:Connect(v22));
    end;
end;
v13.didMount = function(v23)
    local l_PluginActions_2 = v23.props.PluginActions;
    v23.Connections = {};
    v23.Actions = {};
    v23:addAction(l_PluginActions_2:get("EditEvents"), function()
        local l_props_1 = v23.props;
        l_props_1.OnEditEvents(l_props_1.Tick);
    end);
    v23:addAction(l_PluginActions_2:get("PasteEvents"), function()
        local l_props_2 = v23.props;
        l_props_2.PasteEvents(l_props_2.Tick or l_props_2.Playhead);
    end);
    v23:addAction(l_PluginActions_2:get("CutEvents"), function()
        local l_props_3 = v23.props;
        l_props_3.CopySelectedEvents(v23.props.EventFilters);
        l_props_3.DeleteSelectedEvents(v23.props.EventFilters);
    end);
    v23:addAction(l_PluginActions_2:get("CopyEvents"), function()
        v23.props.CopySelectedEvents(v23.props.EventFilters);
    end);
    v23:addAction(l_PluginActions_2:get("DeleteEvents"), function()
        v23.props.DeleteSelectedEvents(v23.props.EventFilters);
    end);
end;
v13.render = function(v28)
    local l_props_4 = v28.props;
    local l_ShowMenu_0 = l_props_4.ShowMenu;
    local l_Clipboard_0 = l_props_4.Clipboard;
    local l_ClipboardType_0 = l_props_4.ClipboardType;
    local l_SelectedEvents_0 = l_props_4.SelectedEvents;
    local l_OnMenuOpened_0 = l_props_4.OnMenuOpened;
    local l_Actions_0 = v28.Actions;
    local l_PluginActions_3 = v28.props.PluginActions;
    if not v3(l_PluginActions_3) and l_Actions_0 ~= nil then
        for _, v38 in ipairs(l_Actions_0) do
            v38.Enabled = false;
        end;
        if not (not l_Clipboard_0 or v3(l_Clipboard_0)) and l_ClipboardType_0 == v4.CLIPBOARD_TYPE.Events then
            l_PluginActions_3:get("PasteEvents").Enabled = true;
        end;
        if not (not l_SelectedEvents_0 or v3(l_SelectedEvents_0)) then
            l_PluginActions_3:get("CutEvents").Enabled = true;
            l_PluginActions_3:get("CopyEvents").Enabled = true;
            l_PluginActions_3:get("DeleteEvents").Enabled = true;
        end;
        if l_props_4.OnEvent then
            l_PluginActions_3:get("EditEvents").Enabled = true;
        end;
    end;
    local v39 = v28:makeMenuActions();
    if not l_ShowMenu_0 or not v39 then
        return nil;
    else
        return (v1.createElement(v7, {
            Actions = v28:makeMenuActions(), 
            OnMenuOpened = l_OnMenuOpened_0
        }));
    end;
end;
v13.willUnmount = function(v40)
    if v40.Connections then
        for _, v42 in ipairs(v40.Connections) do
            v42:Disconnect();
        end;
        v40.Connections = {};
    end;
    if v40.Actions then
        for _, v44 in ipairs(v40.Actions) do
            v44.Enabled = false;
        end;
    end;
end;
return v2.connect(function(v45, _)
    local l_Status_0 = v45.Status;
    return {
        Clipboard = l_Status_0.Clipboard, 
        ClipboardType = l_Status_0.ClipboardType, 
        SelectedEvents = l_Status_0.SelectedEvents, 
        Playhead = l_Status_0.Playhead, 
        OnEvent = l_Status_0.RightClickContextInfo.OnEvent, 
        Tick = l_Status_0.RightClickContextInfo.Tick
    };
end, function(v48)
    return {
        DeleteSelectedEvents = function(v49)
            v48(v8());
            v48(v11(v49));
            v48(v12({}));
        end, 
        CopySelectedEvents = function(v50)
            v48(v10(v50));
            v48(v12({}));
        end, 
        PasteEvents = function(v51)
            v48(v8());
            v48(v9(v51));
            v48(v12({}));
        end
    };
end)((l_withContext_0({
    Analytics = l_ContextServices_0.Analytics, 
    PluginActions = l_ContextServices_0.PluginActions
})(v13)));
