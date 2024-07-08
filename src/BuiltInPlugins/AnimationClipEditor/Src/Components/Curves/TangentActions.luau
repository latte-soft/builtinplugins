local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Roact);
local v2 = require(l_script_FirstAncestor_0.Packages.RoactRodux);
local v3 = require(l_script_FirstAncestor_0.Src.Util.isEmpty);
local v4 = require(l_script_FirstAncestor_0.Src.Components.ContextMenu);
local l_ContextServices_0 = require(l_script_FirstAncestor_0.Packages.Framework).ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v7 = v1.PureComponent:extend("TangentActions");
v7.makeMenuActions = function(v8)
    local l_PluginActions_0 = v8.props.PluginActions;
    return {
        l_PluginActions_0:get("ClearTangent"), 
        l_PluginActions_0:get("ZeroTangent")
    };
end;
v7.addAction = function(v10, v11, v12)
    if v11 then
        v11.Enabled = false;
        table.insert(v10.Actions, v11);
        table.insert(v10.Connections, v11.Triggered:Connect(v12));
    end;
end;
v7.didMount = function(v13)
    local l_PluginActions_1 = v13.props.PluginActions;
    v13.Connections = {};
    v13.Actions = {};
    v13:addAction(l_PluginActions_1:get("ClearTangent"), function()
        local l_props_0 = v13.props;
        l_props_0.OnSetTangent(l_props_0.InstanceName, l_props_0.Path, l_props_0.Tick, l_props_0.Side);
    end);
    v13:addAction(l_PluginActions_1:get("ZeroTangent"), function()
        local l_props_1 = v13.props;
        l_props_1.OnSetTangent(l_props_1.InstanceName, l_props_1.Path, l_props_1.Tick, l_props_1.Side, 0);
    end);
end;
v7.render = function(v17)
    local l_props_2 = v17.props;
    local l_ShowMenu_0 = l_props_2.ShowMenu;
    local l_Actions_0 = v17.Actions;
    local l_PluginActions_2 = v17.props.PluginActions;
    if not v3(l_PluginActions_2) and l_Actions_0 ~= nil then
        for _, v23 in ipairs(l_Actions_0) do
            v23.Enabled = false;
        end;
        l_PluginActions_2:get("ClearTangent").Enabled = true;
        l_PluginActions_2:get("ZeroTangent").Enabled = true;
    end;
    return not not l_ShowMenu_0 and v1.createElement(v4, {
        Actions = v17:makeMenuActions(), 
        OnMenuOpened = l_props_2.OnMenuOpened
    }) or nil;
end;
v7.willUnmount = function(v24)
    if v24.Connections then
        for _, v26 in ipairs(v24.Connections) do
            v26:Disconnect();
        end;
        v24.Connections = {};
    end;
    if v24.Actions then
        for _, v28 in ipairs(v24.Actions) do
            v28.Enabled = false;
        end;
    end;
end;
return v2.connect(function(v29)
    local l_Status_0 = v29.Status;
    return {
        InstanceName = l_Status_0.RightClickContextInfo.InstanceName, 
        Path = l_Status_0.RightClickContextInfo.Path, 
        Tick = l_Status_0.RightClickContextInfo.Tick, 
        Side = l_Status_0.RightClickContextInfo.Side
    };
end, function()
    return {};
end)((l_withContext_0({
    PluginActions = l_ContextServices_0.PluginActions
})(v7)));
