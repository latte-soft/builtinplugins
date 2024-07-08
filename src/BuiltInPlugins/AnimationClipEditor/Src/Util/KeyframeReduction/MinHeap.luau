local _ = require(script.Parent.Types);
local v1 = {};
v1.__index = v1;
v1.new = function()
    local v2 = {
        array = {}
    };
    setmetatable(v2, v1);
    return v2;
end;
compare = function(v3, v4)
    return v3.area - v4.area;
end;
v1.push = function(v5, v6)
    table.insert(v5.array, v6);
    v6._order = #v5.array;
    v5:up(#v5.array);
    return #v5.array;
end;
v1.pop = function(v7)
    local v8 = v7.array[1];
    local v9 = table.remove(v7.array);
    if v9 and #v7.array > 0 then
        v9._order = 1;
        v7.array[1] = v9;
        v7:down(1);
    end;
    return v8;
end;
v1.remove = function(v10, v11)
    local l__order_0 = v11._order;
    local v13 = table.remove(v10.array);
    if v13 and l__order_0 ~= #v10.array + 1 then
        v10.array[l__order_0] = v13;
        v13._order = l__order_0;
        if compare(v13, v11) < 0 then
            v10:up(l__order_0);
            return ;
        else
            v10:down(l__order_0);
        end;
    end;
end;
v1.up = function(v14, v15)
    while v15 > 1 do
        local v16 = math.floor(v15 / 2);
        if compare(v14.array[v15], v14.array[v16]) < 0 then
            local l_array_0 = v14.array;
            local l_array_1 = v14.array;
            local v19 = v14.array[v15];
            local v20 = v14.array[v16];
            l_array_0[v16] = v19;
            l_array_1[v15] = v20;
            l_array_0 = v14.array[v16];
            l_array_1 = v14.array[v15];
            l_array_0._order = v16;
            l_array_1._order = v15;
            v15 = v16;
        else
            break;
        end;
    end;
end;
v1.down = function(v21, v22)
    while true do
        local v23 = v22 * 2;
        local v24 = v23 + 1;
        local l_v22_0 = v22;
        if v23 <= #v21.array and compare(v21.array[v23], v21.array[l_v22_0]) < 0 then
            l_v22_0 = v23;
        end;
        if v24 <= #v21.array and compare(v21.array[v24], v21.array[l_v22_0]) < 0 then
            l_v22_0 = v24;
        end;
        if l_v22_0 ~= v22 then
            local l_array_2 = v21.array;
            local l_array_3 = v21.array;
            local v28 = v21.array[l_v22_0];
            local v29 = v21.array[v22];
            l_array_2[v22] = v28;
            l_array_3[l_v22_0] = v29;
            l_array_2 = v21.array[v22];
            l_array_3 = v21.array[l_v22_0];
            l_array_2._order = v22;
            l_array_3._order = l_v22_0;
            v22 = l_v22_0;
        else
            break;
        end;
    end;
end;
return v1;
