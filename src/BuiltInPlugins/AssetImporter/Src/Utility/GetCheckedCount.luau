return function(v0)
    local v1 = not v0.ShouldImport and 0 or 1;
    for _, v3 in pairs(v0:GetDescendants()) do
        if v3.ShouldImport then
            v1 = v1 + 1;
        end;
    end;
    return v1;
end;
