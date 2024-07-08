local v0 = {};
v0.__index = v0;
v0.GetFullName = function(v1)
    return v1.FileName;
end;
v0.new = function(v2, v3)
    local v4 = {
        ScriptGuid = v2, 
        FileName = v3
    };
    setmetatable(v4, v0);
    return v4;
end;
return v0;
