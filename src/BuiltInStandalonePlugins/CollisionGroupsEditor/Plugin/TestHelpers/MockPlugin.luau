local v0 = require(script.Parent.Parent.Parent.Plugin.Util.Signal);
local v1 = {};
v1.__index = v1;
v1.new = function()
    local v2 = {
        Name = "", 
        Tooltip = "", 
        Icon = "", 
        Enabled = false, 
        Click = v0.new()
    };
    setmetatable(v2, v1);
    return v2;
end;
v1.SetActive = function(v3, v4)
    v3.Enabled = v4;
end;
local v5 = {};
v5.__index = v5;
v5.new = function(v6)
    local v7 = {
        Title = v6, 
        Buttons = {}
    };
    setmetatable(v7, v5);
    return v7;
end;
v5.CreateButton = function(_, _, _, _)
    return v1.new();
end;
local v12 = {};
v12.__index = v12;
v12.__newindex = function(v13, v14, v15)
    if v14 == "_signals" then
        return ;
    else
        v13[v14] = v15;
        v13._signals[v14]:fire(v15);
        return ;
    end;
end;
v12.new = function(v16, v17)
    assert(type(v16) == "string", "DockWidgetPluginGui's title must be a string");
    assert(type(v17) == "table", "DockWidgetPluginGui's widgetInfo must be an array");
    assert(#v17 == 7, "Unexpected table provided for widgetInfo, expected an array");
    local v18 = {
        Name = "", 
        Title = v16, 
        ZIndexBehavior = Enum.ZIndexBehavior.Global, 
        Enabled = true
    };
    local v19 = {};
    for v20, _ in pairs(v18) do
        v19[v20] = v0.new();
    end;
    v18._signals = v19;
    setmetatable(v18, v12);
    return v18;
end;
v12.GetPropertyChangedSignal = function(v22, v23)
    assert(v23 ~= nil, "Need a property to observe changes");
    assert(v22[v23] ~= nil, "Could not find the key," .. tostring(v23) .. " please add it to the constructor");
    return v22._signals[v23];
end;
local v24 = {};
v24.__index = v24;
v24.new = function()
    local v25 = {
        Name = ""
    };
    setmetatable(v25, v24);
    return v25;
end;
v24.CreateToolbar = function(_, v27)
    return v5.new(v27);
end;
v24.CreateDockWidgetPluginGui = function(_, v29, v30)
    return v12.new(v29, v30);
end;
return v24;
