local v0 = require(script:FindFirstAncestor("TerrainEditor").Packages.React);
return function(v1)
    local l_Adornee_0 = v1.Adornee;
    local l_CFrame_0 = v1.CFrame;
    local l_Color_0 = v1.Color;
    local l_Height_0 = v1.Height;
    local l_Radius_0 = v1.Radius;
    local l_Transparency_0 = v1.Transparency;
    return v0.createElement(v0.Fragment, {}, {
        OnTop = v0.createElement("CylinderHandleAdornment", {
            Adornee = l_Adornee_0, 
            AlwaysOnTop = true, 
            CFrame = l_CFrame_0, 
            Color = l_Color_0, 
            Height = l_Height_0, 
            Radius = l_Radius_0, 
            Transparency = l_Transparency_0, 
            ZIndex = 0
        }), 
        Outline = v0.createElement("CylinderHandleAdornment", {
            Adornee = l_Adornee_0, 
            CFrame = l_CFrame_0, 
            Color = l_Color_0, 
            Height = l_Height_0, 
            Radius = l_Radius_0, 
            Transparency = l_Transparency_0
        })
    });
end;
