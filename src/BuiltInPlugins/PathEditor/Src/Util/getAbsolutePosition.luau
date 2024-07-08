local _ = function(v0, v1)
    local l_status_0, _ = pcall(function()
        local _ = v0[v1];
    end);
    return l_status_0;
end;
local function v6(v7)
    local l_pcall_0 = pcall;
    local v9 = "AbsolutePosition";
    local l_v9_0 = v9 --[[ copy: 4 -> 6 ]];
    local v11;
    l_pcall_0, v11 = l_pcall_0(function()
        local _ = v7[l_v9_0];
    end);
    if not l_pcall_0 then
        l_pcall_0 = pcall;
        v9 = "Position";
        local l_v9_1 = v9 --[[ copy: 4 -> 7 ]];
        l_pcall_0, v11 = l_pcall_0(function()
            local _ = v7[l_v9_1];
        end);
        if l_pcall_0 then
            l_pcall_0 = v7.Parent;
            v11 = pcall;
            local v15 = "AbsoluteSize";
            v11, v9 = v11(function()
                local _ = l_pcall_0[v15];
            end);
            if v11 then
                return Vector2.new(v7.Position.X.Offset + v7.Position.X.Scale * v7.Parent.AbsoluteSize.x, v7.Position.Y.Offset + v7.Position.Y.Scale * v7.Parent.AbsoluteSize.y) + v6(v7.Parent);
            end;
        end;
        return v6(v7.Parent);
    else
        return v7.AbsolutePosition;
    end;
end;
return v6;
