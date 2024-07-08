local l_HttpService_0 = game:GetService("HttpService");
local function _(v1)
    return l_HttpService_0:JSONEncode(v1);
end;
return {
    new = function()
        local v3 = {
            map = {}, 
            mt = {}
        };
        v3.mt.__index = function(v4, v5)
            if v5 == "insert" then
                return function(v6)
                    local l_v6_0 = v6;
                    if type(l_v6_0) == "table" then
                        l_v6_0 = l_HttpService_0:JSONEncode(l_v6_0);
                    end;
                    if not v4.map[l_v6_0] then
                        table.insert(v4, v6);
                        v4.map[l_v6_0] = #v4;
                    end;
                end;
            elseif v5 == "remove" then
                return function(v8)
                    local l_v8_0 = v8;
                    if type(l_v8_0) == "table" then
                        l_v8_0 = l_HttpService_0:JSONEncode(l_v8_0);
                    end;
                    if v4.map[l_v8_0] then
                        local v10 = v4.map[l_v8_0];
                        table.remove(v3, v10);
                        for v11 = v10, #v4 do
                            l_v8_0 = v4[v11];
                            if type(l_v8_0) == "table" then
                                l_v8_0 = l_HttpService_0:JSONEncode(l_v8_0);
                            end;
                            v4.map[l_v8_0] = v11;
                        end;
                    end;
                end;
            elseif v5 == "exists" then
                return function(v12)
                    local l_v12_0 = v12;
                    if type(l_v12_0) == "table" then
                        l_v12_0 = l_HttpService_0:JSONEncode(l_v12_0);
                    end;
                    return v4.map[l_v12_0] ~= nil;
                end;
            elseif v5 == "clear" then
                return function()
                    while #v4 > 0 do
                        local v14 = v4[1];
                        if type(v14) == "table" then
                            v14 = l_HttpService_0:JSONEncode(v14);
                        end;
                        v4.map[v14] = nil;
                        table.remove(v4, 1);
                    end;
                end;
            else
                return ;
            end;
        end;
        setmetatable(v3, v3.mt);
        return v3;
    end
};
