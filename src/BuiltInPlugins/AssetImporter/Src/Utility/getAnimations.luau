return function(v0)
    local v1 = {};
    for _, v3 in v0:GetDescendants() do
        if v3:IsA("AnimationImportData") then
            table.insert(v1, v3);
        end;
    end;
    return v1;
end;
