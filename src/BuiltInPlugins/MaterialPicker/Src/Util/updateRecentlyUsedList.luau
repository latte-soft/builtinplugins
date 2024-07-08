local l_getSerializedMaterialIdentifier_0 = require(script:FindFirstAncestor("MaterialPicker").Packages.MaterialFramework).Util.getSerializedMaterialIdentifier;
return function(v1, v2)
    local v3 = v1:GetSetting("RecentlyUsed") or {
        "Plastic"
    };
    local v4 = l_getSerializedMaterialIdentifier_0(v2);
    local v5 = table.find(v3, v4);
    if v5 then
        table.remove(v3, v5);
    end;
    table.insert(v3, v4);
    if #v3 > 9999 then
        table.remove(v3, 1);
    end;
    v1:SetSetting("RecentlyUsed", v3);
end;
