local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Framework);
local v2 = require(l_Parent_0.Packages.Roact);
local v3 = require(l_Parent_0.Packages.RoactRodux);
local l_ContextServices_0 = v1.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v6 = require(l_Parent_0.Src.ContextItems);
local l_ToolId_0 = require(l_Parent_0.Src.Util.TerrainEnums).ToolId;
local v8 = v2.PureComponent:extend(script.Name);
v8.didUpdate = function(v9, v10, _)
    if v10.currentTab ~= v9.props.currentTab then
        v9.props.Analytics:report("changeTab", v9.props.currentTab);
    end;
    if v10.currentTool ~= v9.props.currentTool and v9.props.currentTool ~= l_ToolId_0.None then
        v9.props.Analytics:report("changeTool", v9.props.currentTool);
    end;
    if v9.props.currentTool == l_ToolId_0.None then
        v9.props.PluginActivationController:deselectTool();
        return ;
    else
        v9.props.PluginActivationController:activateTool(v9.props.currentTool);
        return ;
    end;
end;
v8.render = function(v12)
    assert(not v12.props[v2.Children], "ToolSelectionListener can't have children");
    return nil;
end;
return v3.connect(function(v13, _)
    return {
        currentTab = v13.Tools.currentTab, 
        currentTool = v13.Tools.currentTool
    };
end, nil)((l_withContext_0({
    Analytics = l_ContextServices_0.Analytics, 
    PluginActivationController = v6.PluginActivationController
})(v8)));
