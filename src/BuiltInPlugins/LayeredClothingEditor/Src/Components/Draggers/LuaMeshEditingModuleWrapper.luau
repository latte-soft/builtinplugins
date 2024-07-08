local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.RoactRodux);
local l_LuaMeshEditingModule_0 = l_Parent_0.Packages.LuaMeshEditingModule;
local v4 = require(l_Parent_0.Packages.AvatarToolsShared);
local l_ContextServices_0 = require(l_Parent_0.Packages.Framework).ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v7 = require(l_LuaMeshEditingModule_0.Components.MeshEditingComponent);
local l_LuaMeshEditingModuleContext_0 = v4.Contexts.LuaMeshEditingModuleContext;
local v9 = require(l_Parent_0.Src.Actions.SetControlsPanelBlockerActivity);
local v10 = require(l_Parent_0.Src.Actions.SetControlsPanelBlockerMessage);
local l_ChangeHistoryService_0 = game:GetService("ChangeHistoryService");
local v12 = v1.PureComponent:extend("LuaMeshEditingModuleWrapper");
local v13 = {
    Enum.RibbonTool.Select, 
    Enum.RibbonTool.Move, 
    Enum.RibbonTool.Scale, 
    Enum.RibbonTool.Rotate
};
local v14 = {};
for v15, v16 in ipairs(v13) do
    v14[v16] = v15;
end;
v12.didMount = function(v17)
    local l_props_0 = v17.props;
    local v19 = l_props_0.Plugin:get();
    v19:Activate(true);
    v17.toolChangedHandle = v17.props.LuaMeshEditingModuleContext:getToolChangedSignal():Connect(function()
        v17:setState({
            temp = {}
        });
    end);
    v17.onToolSelected = function(v20)
        local v21 = v17.props.LuaMeshEditingModuleContext:getCurrentTool();
        if not ((v20 ~= Enum.RibbonTool.Select and v20 ~= Enum.RibbonTool.Rotate) and v20 ~= Enum.RibbonTool.Move) or v20 == Enum.RibbonTool.Scale then
            task.delay(0, function()
                v19:Activate(true);
            end);
            if v21 then
                v21:setCurrentHandle(v20);
            end;
            return true;
        else
            return ;
        end;
    end;
    v17.deactivationListener = v19.Deactivation:Connect(function()
        local l_v19_SelectedRibbonTool_0 = v19:GetSelectedRibbonTool();
        if l_v19_SelectedRibbonTool_0 ~= Enum.RibbonTool.None then
            if next(game:GetService("Selection"):Get()) == nil then
                if v17.onToolSelected(l_v19_SelectedRibbonTool_0) then
                    return ;
                end;
            else
                v17.props.LuaMeshEditingModuleContext:disableEditing();
                v17.props.SetControlsPanelBlockerMessage(v17.props.Localization:getText("Editor", "ResumeEditing"));
                v17.props.SetControlsPanelBlockerActivity(true);
            end;
        end;
    end);
    local v23 = l_props_0.PluginActions:get("Undo");
    if v23 then
        v23.Enabled = true;
        v17.undoHandle = v23.Triggered:Connect(function()
            local v24 = v17.props.LuaMeshEditingModuleContext:getCurrentTool();
            if v24 then
                v24:undo();
            end;
        end);
    end;
    local v25 = l_props_0.PluginActions:get("Redo");
    if v25 then
        v25.Enabled = true;
        v17.redoHandle = v25.Triggered:Connect(function()
            local v26 = v17.props.LuaMeshEditingModuleContext:getCurrentTool();
            if v26 then
                v26:redo();
            end;
        end);
    end;
    l_ChangeHistoryService_0:SetEnabled(false);
end;
v12.render = function(v27)
    local l_props_1 = v27.props;
    local v29 = l_props_1.Mouse:get();
    local v30 = l_props_1.Plugin:get();
    local v31 = l_props_1.LuaMeshEditingModuleContext:getCurrentTool();
    if v31 ~= nil then
        return v1.createElement(v7, {
            Mouse = v29, 
            Plugin = v30, 
            VertexToolBase = v31
        });
    else
        return nil;
    end;
end;
v12.willUnmount = function(v32)
    local l_props_2 = v32.props;
    local v34 = l_props_2.PluginActions:get("Undo");
    local v35 = l_props_2.PluginActions:get("Redo");
    if v34 then
        v34.Enabled = false;
    end;
    if v35 then
        v35.Enabled = false;
    end;
    if v32.deactivationListener then
        v32.deactivationListener:Disconnect();
    end;
    if v32.undoHandle then
        v32.undoHandle:Disconnect();
    end;
    if v32.redoHandle then
        v32.redoHandle:Disconnect();
    end;
    if v32.toolChangedHandle then
        v32.toolChangedHandle:Disconnect();
    end;
    l_ChangeHistoryService_0:SetEnabled(true);
end;
return v2.connect(function(v36, _)
    return {
        EditingCage = v36.selectItem.editingCage
    };
end, function(v38)
    return {
        SetControlsPanelBlockerActivity = function(v39)
            v38(v9(v39));
        end, 
        SetControlsPanelBlockerMessage = function(v40)
            v38(v10(v40));
        end
    };
end)((l_withContext_0({
    Plugin = l_ContextServices_0.Plugin, 
    PluginActions = l_ContextServices_0.PluginActions, 
    Localization = l_ContextServices_0.Localization, 
    LuaMeshEditingModuleContext = l_LuaMeshEditingModuleContext_0, 
    Mouse = l_ContextServices_0.Mouse
})(v12)));
