local v0 = {
    LockControl = "R", 
    Undo = "Ctrl+Z", 
    Redo = "Ctrl+Y"
};
local _ = function(_, v2, v3, v4)
    return {
        id = v3, 
        text = v2:getText("Actions", v3), 
        defaultShortcut = v4 ~= "" and v4 or nil, 
        allowBinding = false
    };
end;
return function(_, v7)
    local v8 = {};
    for v9, v10 in pairs(v0) do
        local l_v10_0 = v10;
        v8[v9] = {
            id = v9, 
            text = v7:getText("Actions", v9), 
            defaultShortcut = l_v10_0 ~= "" and l_v10_0 or nil, 
            allowBinding = false
        };
    end;
    return v8;
end;
