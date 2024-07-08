local v0 = require(script:FindFirstAncestor("TerrainEditor").Packages.React);
return function(v1)
    local l_Adornee_0 = v1.Adornee;
    local l_AlwaysOnTop_0 = v1.AlwaysOnTop;
    return v0.createElement("BoxHandleAdornment", {
        Adornee = l_Adornee_0, 
        AlwaysOnTop = l_AlwaysOnTop_0, 
        Color3 = v1.Color, 
        CFrame = v1.Transform, 
        Size = v1.Size, 
        Transparency = if not l_AlwaysOnTop_0 then nil else v1.Transparency, 
        ZIndex = 0
    });
end;
