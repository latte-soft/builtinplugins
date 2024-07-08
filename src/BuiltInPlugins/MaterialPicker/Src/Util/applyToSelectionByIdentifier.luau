local l_applyToInstances_0 = require(script:FindFirstAncestor("MaterialPicker").Packages.MaterialFramework).Util.applyToInstances;
applyToSelectionByIdentifier = function(v1, v2)
    local v3 = string.split(v1, "__");
    local v4 = v2:Get();
    if #v3 == 2 then
        l_applyToInstances_0(v4, v3[2], v3[1]);
        return ;
    else
        l_applyToInstances_0(v4, v1);
        return ;
    end;
end;
return applyToSelectionByIdentifier;
