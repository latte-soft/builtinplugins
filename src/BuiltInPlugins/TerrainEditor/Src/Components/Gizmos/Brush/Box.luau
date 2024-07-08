local v0 = require(script:FindFirstAncestor("TerrainEditor").Packages.React);
return function(v1)
    local l_Adornee_0 = v1.Adornee;
    local l_CFrame_0 = v1.CFrame;
    local l_Color_0 = v1.Color;
    local l_Size_0 = v1.Size;
    local l_Transparency_0 = v1.Transparency;
    return v0.createElement(v0.Fragment, {}, {
        OnTop = v0.createElement("BoxHandleAdornment", {
            Adornee = l_Adornee_0, 
            AlwaysOnTop = true, 
            CFrame = l_CFrame_0, 
            Color = l_Color_0, 
            Size = l_Size_0, 
            Transparency = l_Transparency_0, 
            ZIndex = 0
        }), 
        Outline = v0.createElement("BoxHandleAdornment", {
            Adornee = l_Adornee_0, 
            CFrame = l_CFrame_0, 
            Color = l_Color_0, 
            Size = l_Size_0, 
            Transparency = l_Transparency_0
        })
    });
end;
