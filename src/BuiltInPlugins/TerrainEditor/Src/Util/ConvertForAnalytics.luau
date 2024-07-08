return function(v0)
    local v1 = {};
    for v2, v3 in v0, nil, nil do
        if typeof(v3) == "Vector3" then
            v1[("%*X"):format(v2)] = v3.X;
            v1[("%*Y"):format(v2)] = v3.Y;
            v1[("%*Z"):format(v2)] = v3.Z;
        elseif typeof(v3) == "EnumItem" then
            v1[v2] = v3.Name;
        else
            v1[v2] = v3;
        end;
    end;
    return v1;
end;
