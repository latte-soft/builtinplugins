local function v0(v1, v2)
    local v3 = v1.Name .. "\n";
    local v4 = string.rep("..", v2);
    for _, v6 in pairs(v1:GetChildren()) do
        v3 = v3 .. v4 .. ".." .. v0(v6, v2 + 1);
    end;
    return v3;
end;
return function(v7)
    if not v7 then
        print("<nil>");
        return ;
    else
        print((v0(v7, 0)));
        return ;
    end;
end;
