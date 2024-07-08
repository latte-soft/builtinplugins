return function(v0, v1, v2, v3)
    for v4, _ in pairs(v3) do
        if v0:getText(v1, v4) == v2 then
            return v4;
        end;
    end;
end;
