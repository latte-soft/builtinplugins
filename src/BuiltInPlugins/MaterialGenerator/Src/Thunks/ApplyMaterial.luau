local _ = require(script.Parent.Parent.Parent.Src.Types);
return function(v1, v2)
    return function(_)
        local l_MaterialVariant_0 = v1.MaterialVariant;
        local v5 = false;
        for _, v7 in v2:getService("Selection"):Get() do
            if v7:IsA("BasePart") then
                v7.Material = l_MaterialVariant_0.BaseMaterial;
                v7.MaterialVariant = l_MaterialVariant_0.Name;
                v5 = true;
            end;
        end;
        if v5 then
            v2:getService("ChangeHistoryService"):SetWaypoint("MaterialGenerator apply material");
        end;
    end;
end;
