return function(v0, v1, v2)
    local v3 = {};
    for v4 in pairs(v2) do
        table.insert(v3, {
            Key = v4, 
            Text = v0:getText(v1, v4), 
            Disabled = false
        });
    end;
    return v3;
end;
