return function(v0, v1)
    local v2 = {};
    if not v1 and type(v0) == "function" then
        v1 = v0;
        v0 = nil;
    elseif type(v0) == "table" then
        for v3, v4 in pairs(v0) do
            v2[v3] = v4;
        end;
        v2._base = v0;
    end;
    v2.__index = v2;
    local v7 = {
        __call = function(_, ...)
            local v6 = {};
            setmetatable(v6, v2);
            if not v1 then
                if not (not v0 or not v0.init) then
                    v0.init(v6, ...);
                end;
                return v6;
            else
                v1(v6, ...);
                return v6;
            end;
        end
    };
    v2.init = v1;
    v2.is_a = function(v8, v9)
        local v10 = getmetatable(v8);
        while true do
            if not v10 then
                return false;
            elseif v10 == v9 then
                return true;
            else
                v10 = v10._base;
            end;
        end;
    end;
    setmetatable(v2, v7);
    return v2;
end;
