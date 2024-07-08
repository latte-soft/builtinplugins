local l_Signal_0 = require(script.Parent.Parent.Parent.Packages.Framework).Util.Signal;
local v1 = require(script.Parent.MockMouse);
local v2 = {};
v2.__index = v2;
v2.new = function()
    local v3 = {
        Name = "", 
        Tooltip = "", 
        Icon = "", 
        Enabled = false, 
        Click = l_Signal_0.new()
    };
    setmetatable(v3, v2);
    return v3;
end;
v2.SetActive = function(v4, v5)
    v4.Enabled = v5;
end;
local v6 = {};
v6.__index = v6;
v6.new = function(v7)
    local v8 = {
        Title = v7, 
        Buttons = {}
    };
    setmetatable(v8, v6);
    return v8;
end;
v6.CreateButton = function(_, _, _, _)
    return v2.new();
end;
local v13 = {};
v13.__index = v13;
v13.__newindex = function(v14, v15, v16)
    if v15 == "_signals" then
        return ;
    else
        v14[v15] = v16;
        v14._signals[v15]:fire(v16);
        return ;
    end;
end;
v13.new = function(v17, v18)
    assert(type(v17) == "string", "DockWidgetPluginGui's title must be a string");
    assert(type(v18) == "table", "DockWidgetPluginGui's widgetInfo must be an array");
    assert(#v18 == 7, "Unexpected table provided for widgetInfo, expected an array");
    local v19 = {
        Name = "", 
        Title = v17, 
        ZIndexBehavior = Enum.ZIndexBehavior.Global, 
        Enabled = true
    };
    local v20 = {};
    for v21, _ in pairs(v19) do
        v20[v21] = l_Signal_0.new();
    end;
    v19._signals = v20;
    setmetatable(v19, v13);
    return v19;
end;
v13.GetPropertyChangedSignal = function(v23, v24)
    assert(v24 ~= nil, "Need a property to observe changes");
    assert(v23[v24] ~= nil, "Could not find the key," .. tostring(v24) .. " please add it to the constructor");
    return v23._signals[v24];
end;
local v25 = {};
local v26 = {};
v26.__index = v26;
v26.new = function()
    local v27 = setmetatable({
        Name = "", 
        Deactivation = l_Signal_0.new(), 
        Unloading = l_Signal_0.new(), 
        _activated = false, 
        _activatedWithExclusiveMouse = false, 
        _mouse = v1.new()
    }, v26);
    v25[v27] = true;
    return v27;
end;
v26.Destroy = function(v28)
    v25[v28] = nil;
end;
v26.CreateToolbar = function(_, v30)
    return v6.new(v30);
end;
v26.CreateDockWidgetPluginGui = function(_, v32, v33)
    return v13.new(v32, v33);
end;
v26.GetMouse = function(v34)
    return v34._mouse;
end;
v26.IsActivated = function(v35)
    return v35._activated;
end;
v26.IsActivatedWithExclusiveMouse = function(v36)
    return v36._activatedWithExclusiveMouse;
end;
v26.Activate = function(v37, v38)
    if not v37._activated then
        for v39, _ in pairs(v25) do
            if v39._activated then
                v39:Deactivate();
            end;
        end;
        v37._activated = true;
        v37._activatedWithExclusiveMouse = v38;
        return ;
    else
        return ;
    end;
end;
v26.Deactivate = function(v41)
    if v41._activated then
        v41._activated = false;
        v41._activatedWithExclusiveMouse = false;
        v41.Deactivation:fire();
        return ;
    else
        return ;
    end;
end;
return v26;
