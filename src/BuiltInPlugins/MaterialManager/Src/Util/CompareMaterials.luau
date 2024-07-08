local _ = require(script.Parent.Parent.Parent.Src.Types);
return function(v1, v2)
    if v1 or v2 then
        if v1 and v2 then
            if not v1.MaterialVariant or not v2.MaterialVariant then
                if not (v1.MaterialVariant and not v2.MaterialVariant) and (v1.MaterialVariant or not v2.MaterialVariant) then
                    return v1.Material == v2.Material;
                else
                    return false;
                end;
            else
                return v1.MaterialVariant == v2.MaterialVariant;
            end;
        else
            return false;
        end;
    else
        return true;
    end;
end;
