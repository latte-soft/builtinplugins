local l_MemStorageService_0 = game:GetService("MemStorageService");
local l_Selection_0 = game:GetService("Selection");
return function(v2, v3, v4)
    if v4:IsR15() and v3.ValidateUgcBody then
        local v5 = l_Selection_0:Get();
        if #v5 ~= 1 then
            return ;
        else
            local v6 = ("rbxassetid://%*"):format(v2.AssetIds[v3.id]);
            if v5[1] ~= v2.Instance and v5[1]:FindFirstChildWhichIsA("PackageLink").PackageId ~= v6 then
                return ;
            else
                l_MemStorageService_0:Fire("ValidateUgcBody");
                return ;
            end;
        end;
    else
        return ;
    end;
end;
