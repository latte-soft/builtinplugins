return function(v0, v1, v2)
    if game:GetFastFlag("Path2DControlPointAtomicClass4") then
        if v0 then
            if v2 then
                return Path2DControlPoint.new(v0, v1, v2);
            else
                return Path2DControlPoint.new(v0);
            end;
        else
            return Path2DControlPoint.new();
        end;
    else
        return {};
    end;
end;
