local function v0(v1, v2)
    if v1 then
        assert(v1);
        if typeof(v1) ~= "Instance" then
            return "<Not an instance>\n";
        else
            local v3 = string.format("%s [%s]\n", v1.Name, v1.ClassName);
            local v4 = string.rep("..", v2);
            for _, v6 in pairs(v1:GetChildren()) do
                v3 = v3 .. v4 .. ".." .. v0(v6, v2 + 1);
            end;
            return v3;
        end;
    else
        return "<nil>";
    end;
end;
return function(v7, v8)
    local v9 = v0(v7, 0);
    if not v8 then
        print(v9);
        return ;
    else
        v8(v9);
        return ;
    end;
end;
