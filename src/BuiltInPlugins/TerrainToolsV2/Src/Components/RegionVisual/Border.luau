local v0 = require(script.Parent.Parent.Parent.Parent.Packages.Roact);
return function(v1)
    local l_Adornee_0 = v1.Adornee;
    local l_AlwaysOnTop_0 = v1.AlwaysOnTop;
    return v0.createElement("BoxHandleAdornment", {
        Adornee = l_Adornee_0, 
        Color3 = v1.Color, 
        Transparency = if not l_AlwaysOnTop_0 then nil else v1.Transparency, 
        AlwaysOnTop = l_AlwaysOnTop_0, 
        Size = v1.Size, 
        CFrame = v1.CFrame, 
        ZIndex = 0
    });
end;
