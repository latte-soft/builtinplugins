local l_parseMaterial_0 = require(script:FindFirstAncestor("MaterialPicker").Packages.MaterialFramework).Util.parseMaterial;
return function(v1, v2)
    local v3, v4 = l_parseMaterial_0(v1);
    if not v4 then
        v2:SetCurrentMaterial(v3, "");
        return ;
    else
        v2:SetCurrentMaterial(v3, (tostring(v4)));
        return ;
    end;
end;
