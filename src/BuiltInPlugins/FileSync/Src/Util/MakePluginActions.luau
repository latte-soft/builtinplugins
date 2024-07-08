local v0 = {
    Export = "Ctrl+Alt+E", 
    Import = "Ctrl+Alt+I"
};
local _ = function(_, _, v3, v4)
    return {
        id = v3, 
        text = v3 .. " Scripts", 
        defaultShortcut = v4 ~= "" and v4 or nil, 
        allowBinding = true
    };
end;
return function(_, _)
    local v8 = {};
    for v9, v10 in pairs(v0) do
        local l_v10_0 = v10;
        v8[v9] = {
            id = v9, 
            text = v9 .. " Scripts", 
            defaultShortcut = l_v10_0 ~= "" and l_v10_0 or nil, 
            allowBinding = true
        };
    end;
    return v8;
end;
