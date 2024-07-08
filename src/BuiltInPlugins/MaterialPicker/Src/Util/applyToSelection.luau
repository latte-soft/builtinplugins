local l_applyToInstances_0 = require(script:FindFirstAncestor("MaterialPicker").Packages.MaterialFramework).Util.applyToInstances;
return function(v1, v2)
    local v3 = nil;
    local v4 = nil;
    if not (typeof(v1) == "Instance") or not v1:IsA("MaterialVariant") then
        v4 = v1;
    else
        v4 = v1.BaseMaterial;
        v3 = v1.Name;
    end;
    l_applyToInstances_0(v2:Get(), v4, v3);
end;
