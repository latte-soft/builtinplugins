local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Src.Constants);
return function(v3)
    if v3.Adornee.ClassName == "Attachment" then
        return v1.createElement("BoxHandleAdornment", {
            Adornee = v3.Adornee.Parent, 
            CFrame = v3.Adornee.CFrame, 
            Size = v2.WorldView.OutlineAdorn.Size, 
            Transparency = v2.WorldView.OutlineAdorn.Transparency, 
            Color3 = v3.Color
        });
    else
        return v1.createElement("SelectionBox", {
            LineThickness = v2.WorldView.OutlineAdorn.LineThickness, 
            Adornee = v3.Adornee, 
            Color3 = v3.Color, 
            StudioSelectionBox = true
        });
    end;
end;
