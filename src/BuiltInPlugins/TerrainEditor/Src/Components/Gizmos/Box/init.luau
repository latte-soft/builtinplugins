local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Packages.ReactRoblox);
local v3 = require(script.Fill);
return function(v4)
    local l_Adornee_0 = v4.Adornee;
    local l_Color_0 = v4.Color;
    local l_LineThickness_0 = v4.LineThickness;
    local l_Lines_0 = v4.Lines;
    local l_Scale_0 = v4.Scale;
    local l_Size_0 = v4.Size;
    local l_Transform_0 = v4.Transform;
    local l_Transparency_0 = v4.Transparency;
    return v2.createPortal({
        RegionVisual = v1.createElement("Folder", {}, {
            OnTopBox = v1.createElement(v3, {
                Adornee = l_Adornee_0, 
                AlwaysOnTop = true, 
                Color = l_Color_0, 
                LineThickness = l_LineThickness_0, 
                Lines = l_Lines_0, 
                Scale = l_Scale_0, 
                Size = l_Size_0, 
                Transform = l_Transform_0, 
                Transparency = l_Transparency_0
            }), 
            InTopBox = v1.createElement(v3, {
                Adornee = l_Adornee_0, 
                AlwaysOnTop = false, 
                Color = l_Color_0, 
                LineThickness = l_LineThickness_0, 
                Lines = l_Lines_0, 
                Scale = l_Scale_0, 
                Size = l_Size_0, 
                Transform = l_Transform_0, 
                Transparency = l_Transparency_0
            })
        })
    }, game:GetService("CoreGui"));
end;
