local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.Framework);
local l_Stylizer_0 = v2.Style.Stylizer;
local l_withContext_0 = require(l_Parent_0.Packages.Framework).ContextServices.withContext;
local v5 = require(l_Parent_0.Src.Util.Constants);
local l_Button_0 = v2.UI.Button;
local v7 = v1.PureComponent:extend("ButtonBar");
v7.render = function(v8)
    local l_props_0 = v8.props;
    local l_Stylizer_1 = l_props_0.Stylizer;
    local l_HorizontalAlignment_0 = l_props_0.HorizontalAlignment;
    local l_Buttons_0 = l_props_0.Buttons;
    local v13 = {
        Layout = v1.createElement("UIListLayout", {
            Padding = UDim.new(0, l_Stylizer_1.buttonBar.padding), 
            HorizontalAlignment = l_HorizontalAlignment_0, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Horizontal
        }, l_props_0[v1.Children])
    };
    if l_HorizontalAlignment_0 ~= Enum.HorizontalAlignment.Center then
        table.insert(v13, v1.createElement("UIPadding", {
            PaddingRight = UDim.new(0, l_Stylizer_1.buttonBar.edgePadding), 
            PaddingLeft = UDim.new(0, 0)
        }));
    end;
    for v14, v15 in ipairs(l_Buttons_0) do
        table.insert(v13, v1.createElement(l_Button_0, {
            LayoutOrder = v14, 
            Style = v15.Style, 
            Size = UDim2.new(0, v5.BUTTON_WIDTH, 1, 0), 
            StyleModifier = v15.StyleModifier, 
            Text = v15.Name, 
            ZIndex = l_props_0.ZIndex or 1, 
            OnClick = v15.OnPressed
        }));
    end;
    return v1.createElement("Frame", {
        LayoutOrder = l_props_0.LayoutOrder or 1, 
        Size = UDim2.new(1, 0, 0, v5.BUTTON_HEIGHT), 
        AnchorPoint = l_props_0.AnchorPoint or Vector2.new(0, 0.5), 
        Position = l_props_0.Position or UDim2.new(0, 0, 0.5, 0), 
        BackgroundTransparency = 1
    }, v13);
end;
return (l_withContext_0({
    Stylizer = l_Stylizer_0
})(v7));
