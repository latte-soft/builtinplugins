local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.RoactRodux);
local v3 = require(l_Parent_0.Packages.AvatarToolsShared);
local v4 = require(l_Parent_0.Packages.Framework);
local l_withContext_0 = v4.ContextServices.withContext;
local l_Signals_0 = v3.Contexts.Signals;
local l_LuaMeshEditingModuleContext_0 = v3.Contexts.LuaMeshEditingModuleContext;
local v8 = require(l_Parent_0.Src.Components.MeshPartTool);
local v9 = require(l_Parent_0.Src.Components.Draggers.LuaMeshEditingModuleWrapper);
local v10 = require(l_Parent_0.Src.Actions.SetToolMode);
local v11 = require(l_Parent_0.Src.Util.Constants);
local v12 = require(l_Parent_0.Src.Util.DebugFlags);
local v13 = v1.PureComponent:extend("EditorToolsManager");
local v14 = require(l_Parent_0.Src.Components.Editor.WorkspaceEditorControls);
local _ = v4.Util;
v13.init = function(v16)
    v16.editorFrameRef = v1.createRef();
    v16.onToolChange = function(v17)
        v16.props.SetToolMode(v17);
        v16.props.Signals:get(v11.SIGNAL_KEYS.SelectionChanged):Fire();
        v16.props.Signals:get(v11.SIGNAL_KEYS.ToolChanged):Fire();
    end;
end;
v13.render = function(v18)
    local l_props_0 = v18.props;
    local _ = l_props_0.ToolMode;
    local _ = l_props_0.Size;
    local l_EditingCage_0 = l_props_0.EditingCage;
    local _ = l_props_0.LayoutOrder;
    local v24 = l_EditingCage_0 == v11.EDIT_MODE.Mesh;
    local v25 = false;
    if l_EditingCage_0 ~= nil then
        v25 = not v24;
    end;
    return v1.createFragment({
        WorkspaceEditorControls = v1.createElement(v14), 
        MeshPartTool = v24 and v1.createElement(v8), 
        LuaMeshEditingModuleWrapper = (not (v12.RunRhodiumTests() or v12.RunTests()) and v25) and v1.createElement(v9) or nil
    });
end;
v13.willUpdate = function(v26, v27)
    local v28 = false;
    local l_LuaMeshEditingModuleContext_1 = v26.props.LuaMeshEditingModuleContext;
    if v27.ToolMode ~= v26.props.ToolMode then
        if not (v27.ToolMode ~= v11.TOOL_MODE.Point) or v27.ToolMode == v11.TOOL_MODE.Lattice then
            l_LuaMeshEditingModuleContext_1:setCurrentTool(v27.ToolMode);
            v28 = true;
        elseif v27.ToolMode ~= v11.TOOL_MODE.Reset then
            l_LuaMeshEditingModuleContext_1:setCurrentTool(nil);
            v28 = true;
        end;
    end;
    l_LuaMeshEditingModuleContext_1:changeEditingCage(v27.EditingCage);
    if v28 and v27.ToolMode ~= v26.props.ToolMode then
        l_LuaMeshEditingModuleContext_1:getToolChangedSignal():Fire();
    end;
end;
v13.willUnmount = function(v30)
    local l_LuaMeshEditingModuleContext_2 = v30.props.LuaMeshEditingModuleContext;
    if l_LuaMeshEditingModuleContext_2 then
        l_LuaMeshEditingModuleContext_2:setCurrentTool(nil);
    end;
end;
return v2.connect(function(v32, _)
    local l_status_0 = v32.status;
    local _ = v32.cageData;
    return {
        ToolMode = l_status_0.toolMode, 
        EditingCage = v32.selectItem.editingCage
    };
end, function(v36)
    return {
        SetToolMode = function(v37)
            v36(v10(v37));
        end
    };
end)((l_withContext_0({
    LuaMeshEditingModuleContext = l_LuaMeshEditingModuleContext_0, 
    Signals = l_Signals_0
})(v13)));
