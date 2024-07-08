return function(v0)
    for _, v2 in pairs((v0:GetKeys())) do
        print("{", v2.Time, v2.Value, v2.Interpolation.Name, v2.LeftTangent, v2.RightTangent, "}");
    end;
end;
