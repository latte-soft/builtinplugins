return {
    new = function()
        local v0 = {
            map = {}, 
            mt = {}
        };
        v0.mt.__index = function(v1, v2)
            if v2 == "insert" then
                return function(v3, v4)
                    if not v1.map[v3] then
                        table.insert(v1, {
                            v3, 
                            v4
                        });
                        v1.map[v3] = #v1;
                    end;
                end;
            elseif v2 == "remove" then
                return function(v5, _)
                    if v1.map[v5] then
                        local v7 = v1.map[v5];
                        table.remove(v0, v7);
                        for v8 = v7, #v1 do
                            v1.map[v1[v8][1]] = v8;
                        end;
                    end;
                end;
            elseif v2 == "exists" then
                return function(v9)
                    return v1.map[v9] ~= nil;
                end;
            elseif v2 == "clear" then
                return function()
                    while #v1 > 0 do
                        v1.map[v1[1][1]] = nil;
                        table.remove(v1, 1);
                    end;
                end;
            else
                return ;
            end;
        end;
        setmetatable(v0, v0.mt);
        return v0;
    end
};
