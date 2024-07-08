local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Framework);
local l_ContextItem_0 = v1.ContextServices.ContextItem;
local l_Signal_0 = v1.Util.Signal;
local v4 = require(l_Parent_0.Src.Util.Constants);
local l_ToolId_0 = require(l_Parent_0.Src.Util.TerrainEnums).ToolId;
local v6 = l_ContextItem_0:extend("PluginActivationController");
v6.new = function(v7)
    local v8 = setmetatable({
        _plugin = v7, 
        _active = false, 
        _activeTool = l_ToolId_0.None, 
        _selectedTool = l_ToolId_0.None, 
        _pluginDeactivationConnection = nil, 
        _onToolActivated = l_Signal_0.new(), 
        _onToolDeactivated = l_Signal_0.new()
    }, v6);
    assert(v8._plugin, "PluginActivationController.new() requires a plugin");
    v8.onPluginDeactivation = function()
        v8:pauseActivatedTool();
    end;
    return v8;
end;
v6.pauseActivatedTool = function(v9)
    if v9._activeTool ~= l_ToolId_0.None and v9._active then
        v9._selectedTool = v9._activeTool;
        v9:deactivateTool();
        return ;
    else
        return ;
    end;
end;
v6.restoreSelectedTool = function(v10)
    if (not (v10._activeTool == l_ToolId_0.None) or v10._active) or v10._selectedTool == l_ToolId_0.None then
        return ;
    else
        v10:activateTool(v10._selectedTool);
        return ;
    end;
end;
v6.subscribeToToolActivated = function(v11, ...)
    return v11._onToolActivated:Connect(...);
end;
v6.subscribeToToolDeactivated = function(v12, ...)
    return v12._onToolDeactivated:Connect(...);
end;
v6.getActiveTool = function(v13)
    return v13._activeTool;
end;
v6.destroy = function(v14)
    v14:deselectTool();
    if v14._plugin:IsActivated() then
        v14._plugin:Deactivate();
    end;
end;
v6.activateTool = function(v15, v16)
    assert(v16 ~= l_ToolId_0.None, "activateTool requires toolId to not be ToolId.None");
    v15._active = true;
    v15._activeTool = v16;
    v15._selectedTool = v15._activeTool;
    if v4.ToolActivatesPlugin[v16] then
        v15._plugin:Activate(true);
    end;
    if v15._pluginDeactivationConnection then
        v15._pluginDeactivationConnection:Disconnect();
    end;
    v15._pluginDeactivationConnection = v15._plugin.Deactivation:Connect(v15.onPluginDeactivation);
    v15._onToolActivated:Fire(v16);
end;
v6.deactivateTool = function(v17)
    if v17._pluginDeactivationConnection then
        v17._pluginDeactivationConnection:Disconnect();
        v17._pluginDeactivationConnection = nil;
    end;
    local l__activeTool_0 = v17._activeTool;
    v17._active = false;
    v17._activeTool = l_ToolId_0.None;
    if v17._plugin:IsActivated() then
        v17._plugin:Deactivate();
    end;
    v17._onToolDeactivated:Fire(l__activeTool_0);
end;
v6.deselectTool = function(v19)
    v19:deactivateTool();
    v19._selectedTool = l_ToolId_0.None;
end;
return v6;
