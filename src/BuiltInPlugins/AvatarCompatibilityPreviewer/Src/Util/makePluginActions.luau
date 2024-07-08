local v0 = {
    Undo = "Ctrl+Z", 
    Redo = "Ctrl+Y"
};
local _ = function(_, v2, v3, v4)
    if not (v4 ~= "") then
        v4 = nil;
    end;
    return {
        id = v3, 
        text = v2:getText("Actions", v3), 
        defaultShortcut = v4, 
        allowBinding = false
    };
end;
return function(_, v7)
    local v8 = {};
    for v9, v10 in pairs(v0) do
        local l_v10_0 = v10;
        if not (l_v10_0 ~= "") then
            l_v10_0 = nil;
        end;
        v8[v9] = {
            id = v9, 
            text = v7:getText("Actions", v9), 
            defaultShortcut = l_v10_0, 
            allowBinding = false
        };
    end;
    return v8;
end;
