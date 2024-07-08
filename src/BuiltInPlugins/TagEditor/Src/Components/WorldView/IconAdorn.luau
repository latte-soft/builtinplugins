local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Src.Components.Icon);
return function(v3)
    local v4 = {};
    if #v3.Icon > 1 then
        v4.UIListLayout = v1.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            Padding = UDim.new(0.125, 0)
        });
    end;
    for v5 = 1, #v3.Icon do
        v4[v5] = v1.createElement(v2, {
            Name = v3.Icon[v5], 
            Size = UDim2.new(1 / #v3.Icon, 0, 1, 0), 
            Style = "WorldView", 
            TextScaled = true
        });
    end;
    return v1.createElement("BillboardGui", {
        Adornee = v3.Adornee, 
        Size = UDim2.new(#v3.Icon, 0, 1, 0), 
        SizeOffset = Vector2.new(0.5, 0.5), 
        ExtentsOffsetWorldSpace = Vector3.new(1, 1, 1), 
        AlwaysOnTop = v3.AlwaysOnTop
    }, v4);
end;
