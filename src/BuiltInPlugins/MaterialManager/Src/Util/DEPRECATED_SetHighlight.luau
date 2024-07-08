local l_CoreGui_0 = game:GetService("CoreGui");
return function(v1, v2)
    if not v1 then
        v1 = Instance.new("Highlight");
        v1.Parent = l_CoreGui_0;
        v1.FillTransparency = 1;
    end;
    if not v2 or not v2:IsA("BasePart") then
        v1.Adornee = nil;
        return v1;
    else
        v1.Adornee = v2;
        return v1;
    end;
end;
