local l_Parent_0 = script.Parent;
local v1 = require(l_Parent_0.MinHeap);
local v2 = require(l_Parent_0.Triangle);
local _ = require(l_Parent_0.Types);
return function(v4)
    if #v4 < 3 then
        local v5 = {};
        for _, v7 in v4, nil, nil do
            table.insert(v5, v7[1]);
        end;
        return v5;
    else
        local v8 = v1.new();
        local _ = {};
        local v10 = nil;
        for v11 = 2, #v4 - 1 do
            local v12 = v2.new(v4[v11 - 1], v4[v11], v4[v11 + 1]);
            v12:updateArea();
            v12.prev = v10;
            if v12.prev then
                v12.prev.next = v12;
            end;
            v8:push(v12);
            v10 = v12;
        end;
        local function _(v13)
            v8:remove(v13);
            v13:updateArea();
            v8:push(v13);
        end;
        local v15 = table.create(#v4);
        v15[1] = v4[1][1];
        v15[2] = v4[#v4][1];
        local v16 = #v4;
        local v17 = v8:pop();
        while v17 do
            v15[v16] = v17.b[1];
            v16 = v16 - 1;
            if v17.prev then
                v17.prev.next = v17.next;
                v17.prev.c = v17.c;
                local l_prev_0 = v17.prev;
                v8:remove(l_prev_0);
                l_prev_0:updateArea();
                v8:push(l_prev_0);
            end;
            if v17.next then
                v17.next.prev = v17.prev;
                v17.next.a = v17.a;
                local l_next_0 = v17.next;
                v8:remove(l_next_0);
                l_next_0:updateArea();
                v8:push(l_next_0);
            end;
            v17 = v8:pop();
        end;
        return v15;
    end;
end;
