local v0 = require(script.Parent.Parent.Parent.Packages.Roact);
local v1 = require(script.Box);
return function(v2)
    local l_Adornee_0 = v2.Adornee;
    local l_Color_0 = v2.Color;
    local l_LineThickness_0 = v2.LineThickness;
    local l_Lines_0 = v2.Lines;
    local l_Transform_0 = v2.Transform;
    local l_Scale_0 = v2.Scale;
    local l_Size_0 = v2.Size;
    local l_Transparency_0 = v2.Transparency;
    local l_Wireframe_0 = v2.Wireframe;
    return v0.createElement(v0.Portal, {
        target = game:GetService("CoreGui")
    }, {
        RegionVisual = v0.createElement("Folder", {}, {
            OnTopBox = v0.createElement(v1, {
                Adornee = l_Adornee_0, 
                AlwaysOnTop = true, 
                CFrame = l_Transform_0, 
                Color = l_Color_0, 
                LineThickness = l_LineThickness_0, 
                Lines = l_Lines_0, 
                Scale = l_Scale_0, 
                Size = l_Size_0, 
                Transparency = l_Transparency_0, 
                Wireframe = l_Wireframe_0
            }), 
            InTopBox = v0.createElement(v1, {
                Adornee = l_Adornee_0, 
                AlwaysOnTop = false, 
                CFrame = l_Transform_0, 
                Color = l_Color_0, 
                LineThickness = l_LineThickness_0, 
                Lines = l_Lines_0, 
                Scale = l_Scale_0, 
                Size = l_Size_0, 
                Transparency = l_Transparency_0, 
                Wireframe = l_Wireframe_0
            })
        })
    });
end;
