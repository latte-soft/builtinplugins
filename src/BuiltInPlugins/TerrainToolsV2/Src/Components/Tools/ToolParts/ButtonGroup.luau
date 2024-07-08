local l_Parent_0 = script.Parent.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Framework);
local v2 = require(l_Parent_0.Packages.Roact);
local l_withContext_0 = v1.ContextServices.withContext;
local v4 = require(l_Parent_0.Src.ContextItems);
local l_StyleModifier_0 = v1.Util.StyleModifier;
local l_Button_0 = v1.UI.Button;
local v7 = v2.PureComponent:extend("ButtonGroup");
v7.render = function(v8)
    local l_props_0 = v8.props;
    local l_LayoutOrder_0 = l_props_0.LayoutOrder;
    local v11 = l_props_0.Buttons or {};
    local v12 = {
        UIListLayout = v2.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, 4), 
            FillDirection = Enum.FillDirection.Horizontal, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            VerticalAlignment = Enum.VerticalAlignment.Center
        })
    };
    local v13 = math.max(200 / #v11, 64);
    for v14, v15 in ipairs(v11) do
        v12[v15.Key] = v2.createElement(l_Button_0, {
            OnClick = v15.OnClicked, 
            LayoutOrder = v14, 
            Size = UDim2.new(0, v13, 0, 28), 
            Style = not l_props_0.Style and "Round" or l_props_0.Style, 
            StyleModifier = if not v15.Active then l_StyleModifier_0.Disabled else nil, 
            Text = v15.Name
        });
    end;
    return v2.createElement("Frame", {
        LayoutOrder = l_LayoutOrder_0, 
        Size = UDim2.new(1, 0, 0, 52), 
        BackgroundTransparency = 1
    }, v12);
end;
return (l_withContext_0({
    Theme = v4.DEPRECATED_Theme
})(v7));
