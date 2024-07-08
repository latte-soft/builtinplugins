local v0 = require(script.Parent.Parent.Parent.Parent.Packages.Roact);
return function(v1)
    return v0.createElement("Frame", {
        AnchorPoint = v1.AnchorPoint, 
        Position = v1.Position, 
        Size = v1.Size, 
        BackgroundColor3 = Color3.fromRGB(151, 151, 151), 
        BorderSizePixel = 0, 
        LayoutOrder = v1.LayoutOrder or 0
    });
end;
