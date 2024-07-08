local v0 = require(script.Parent.Parent.Parent.Src.Selectors.IsGroupOwner);
return function(v1)
    local v2 = v1.GroupMetadata.NewGroupMetadata or v1.GroupMetadata.CurrentGroupMetadata;
    local l_CurrentGroupMetadata_0 = v1.GroupMetadata.CurrentGroupMetadata;
    local v4 = {};
    for v5, v6 in pairs(v2) do
        local l_Name_0 = v6.Name;
        if not v0(v1, v5) then
            table.insert(v4, {
                Name = l_Name_0, 
                Id = v5
            });
        end;
    end;
    table.sort(v4, function(v8, v9)
        return v8.Name < v9.Name;
    end);
    local v10 = {};
    local v11 = {};
    for _, v13 in ipairs(v4) do
        if not l_CurrentGroupMetadata_0[v13.Id] then
            table.insert(v10, v13.Id);
        end;
    end;
    for _, v15 in ipairs(v4) do
        if l_CurrentGroupMetadata_0[v15.Id] then
            table.insert(v11, v15.Id);
        end;
    end;
    return v10, v11;
end;
