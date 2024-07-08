local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Src.Constants);
return function(v3)
    local v4 = {};
    if #v3.TagName > 1 then
        v4.UIListLayout = v1.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder
        });
    end;
    for v5 = 1, #v3.TagName do
        local v6 = v3.TagName[v5];
        v4[v6] = v1.createElement("TextLabel", {
            LayoutOrder = v5, 
            Size = UDim2.new(1, 0, 1 / #v3.TagName, 0), 
            Text = v6, 
            TextScaled = true, 
            TextSize = 20, 
            Font = Enum.Font.SourceSansBold, 
            TextColor3 = v2.White, 
            BackgroundTransparency = 1, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Bottom, 
            TextStrokeTransparency = 0
        });
    end;
    return v1.createElement("BillboardGui", {
        Adornee = v3.Adornee, 
        Size = UDim2.new(10, 0, #v3.TagName, 0), 
        SizeOffset = Vector2.new(0.5, 0.5), 
        ExtentsOffsetWorldSpace = Vector3.new(1, 1, 1), 
        AlwaysOnTop = v3.AlwaysOnTop
    }, v4);
end;
