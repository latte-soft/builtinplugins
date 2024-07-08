local v0 = {
    new = function()
        return {
            data = {}, 
            allowed = false, 
            type = nil
        };
    end
};
v0.mock = function()
    local v1 = v0.new();
    v1.allowed = true;
    v1.data = {
        domain = "a"
    };
    return v1;
end;
v0.fromUserData = function(v2, v3)
    local v4 = v0.new();
    v4.type = v2.Type;
    v4.index = v3;
    if v2.Data then
        v4.allowed = v2.Data.Allowed;
        v4.data = {
            domain = v2.Data.Domain
        };
    end;
    return v4;
end;
return v0;
