local l_ContextServices_0 = require(script.Parent.Parent.Parent.Packages.Framework).ContextServices;
local l_ContextItem_0 = l_ContextServices_0.ContextItem;
local l_PluginActions_0 = l_ContextServices_0.PluginActions;
local v3 = l_ContextItem_0:extend("PluginActionsController");
v3.new = function(v4, v5)
    assert(v4, "PluginActionsController.new() requires a plugin");
    return (setmetatable({
        _pluginActions = l_PluginActions_0.new(v4, v5)
    }, v3));
end;
v3.Enable = function(v6, v7)
    v6:SetEnabled(v7, true);
end;
v3.Disable = function(v8, v9)
    v8:SetEnabled(v9, false);
end;
v3.SetEnabled = function(v10, v11, v12)
    v10._pluginActions:get(v11).Enabled = v12;
end;
v3.Connect = function(v13, v14, v15)
    return v13._pluginActions:get(v14).Triggered:Connect(v15);
end;
return v3;
