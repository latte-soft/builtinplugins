return function(v0, v1, v2)
    if not (not v0 or not v0:IsA("BasePart")) then
        v0.Material = v1;
        v0.MaterialVariant = v2 or "";
    end;
end;
