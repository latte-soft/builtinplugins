local v0 = {};
v0.__index = v0;
v0.new = function(v1, v2)
    local v3 = setmetatable({}, v0);
    v3.lambda = v1;
    v3.removeConnection = v2;
    return v3;
end;
v0._fire = function(v4, ...)
    v4.lambda(...);
end;
v0.Disconnect = function(v5)
    v5:removeConnection();
    v5.lambda = nil;
    v5.removeConnection = nil;
end;
local v6 = {};
v6.__index = v6;
v6.new = function()
    local v7 = setmetatable({}, v6);
    v7.connections = {};
    return v7;
end;
v6.Connect = function(v8, v9)
    local v11 = v0.new(v9, function(v10)
        v8:_remove(v10);
    end);
    v8.connections[v11] = true;
    return v11;
end;
v6.Fire = function(v12, ...)
    for v13, _ in pairs(v12.connections) do
        v13:_fire(...);
    end;
end;
v6._remove = function(v15, v16)
    if v15.connections[v16] ~= nil then
        v15.connections[v16] = nil;
    end;
end;
v6.Destroy = function(v17)
    for v18, _ in pairs(v17.connections) do
        v18:Disconnect();
    end;
    v17.connections = {};
end;
return v6;
