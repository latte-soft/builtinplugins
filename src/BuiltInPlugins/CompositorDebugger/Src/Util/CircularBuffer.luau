local _ = script:FindFirstAncestor("CompositorDebugger");
local v1 = {};
v1.new = function(v2)
    assert(v2 > 0, "Invalid buffer size, should be > 0");
    return (setmetatable({
        __buffer = {}, 
        __size = v2, 
        __writeIndex = 1, 
        __firstIndex = nil
    }, v1));
end;
v1.clone = function(v3)
    local v4 = v1.new(v3.__size);
    for v5, v6 in v3.__buffer, nil, nil do
        v4.__buffer[v5] = v6;
    end;
    v4.__writeIndex = v3.__writeIndex;
    v4.__firstIndex = v3.__firstIndex;
    return v4;
end;
v1.getSize = function(v7)
    return v7.__size;
end;
v1.push = function(v8, v9)
    if v8.__firstIndex then
        if v8.__firstIndex == v8.__writeIndex then
            v8.__firstIndex = v8.__firstIndex % v8.__size + 1;
        end;
    else
        v8.__firstIndex = v8.__writeIndex;
    end;
    v8.__buffer[v8.__writeIndex] = v9;
    v8.__writeIndex = v8.__writeIndex % v8.__size + 1;
end;
v1.__index = function(v10, v11)
    local v12 = getmetatable(v10)[v11];
    if v12 ~= nil then
        return v12;
    elseif v11 == "last" then
        return v10[1];
    elseif v11 == "first" then
        return v10.__buffer[v10.__firstIndex or 1];
    elseif type(v11) == "number" then
        local v13 = v10.__writeIndex - v11;
        if v13 < 1 then
            v13 = v13 + v10.__size;
        end;
        return v10.__buffer[v13];
    else
        return nil;
    end;
end;
v1.resize = function(v14, v15)
    local v16 = v1.new(v15);
    local v17 = math.max(v14.__size, v15);
    if v14.__firstIndex ~= nil then
        local l___firstIndex_0 = v14.__firstIndex;
        for _ = 1, v17 do
            v16:push(v14.__buffer[l___firstIndex_0]);
            l___firstIndex_0 = l___firstIndex_0 % v14.__size + 1;
            if not (l___firstIndex_0 ~= v14.__writeIndex) then
                break;
            end;
        end;
    end;
    return v16;
end;
v1.dump = function(v20, v21)
    local v22 = "Buffer:\n";
    for v23 = 1, v20.__size do
        v22 = v22 .. string.format("[%d]: %s\n", v23, (tostring(v20.__buffer[v23])));
    end;
    (v21 or print)(v22 .. string.format("WriteIndex: %d\n", v20.__writeIndex) .. string.format("FirstIndex: %d\n", v20.__firstIndex or -1));
end;
return v1;
