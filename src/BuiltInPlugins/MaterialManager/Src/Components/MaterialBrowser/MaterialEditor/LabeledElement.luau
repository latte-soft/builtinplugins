local l_Parent_0 = script.Parent.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.Framework);
local l_join_0 = v2.Dash.join;
local l_UI_0 = v2.UI;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_Pane_0 = l_UI_0.Pane;
local l_LayoutOrderIterator_0 = v2.Util.LayoutOrderIterator;
local l_ContextServices_0 = v2.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Analytics_0 = l_ContextServices_0.Analytics;
local l_Localization_0 = l_ContextServices_0.Localization;
local l_Stylizer_0 = v2.Style.Stylizer;
local v13 = require(l_Parent_0.Src.Components.StatusIcon);
local v14 = v1.PureComponent:extend("LabeledElement");
v14.render = function(v15)
    local l_props_0 = v15.props;
    local l_LabeledElement_0 = l_props_0.Stylizer.LabeledElement;
    local v18 = l_LayoutOrderIterator_0.new();
    local v19 = l_props_0.FillDirection or l_LabeledElement_0.FillDirection;
    local v20 = UDim2.new(l_props_0.LabelColumnWidth, l_LabeledElement_0.LabelYSize);
    local l_ImageSize_0 = l_LabeledElement_0.ImageSize;
    local l_Status_0 = l_props_0.Status;
    local l_StatusText_0 = l_props_0.StatusText;
    local l_VerticalAlignment_0 = l_props_0.VerticalAlignment;
    return v1.createElement(l_Pane_0, {
        AutomaticSize = Enum.AutomaticSize.Y, 
        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
        VerticalAlignment = l_VerticalAlignment_0 or Enum.VerticalAlignment.Top, 
        Layout = Enum.FillDirection.Horizontal, 
        LayoutOrder = l_props_0.LayoutOrder, 
        Padding = l_props_0.Padding or if not l_Status_0 or l_Status_0 and l_Status_0 == Enum.PropertyStatus.Ok then {
            Left = l_ImageSize_0.Width.Offset
        } else nil
    }, {
        StatusIcon = if not not l_Status_0 and l_Status_0 ~= Enum.PropertyStatus.Ok then v1.createElement(v13, {
            LayoutOrder = v18:getNextOrder(), 
            Size = l_ImageSize_0, 
            StatusText = l_StatusText_0, 
            Status = l_Status_0
        }) else nil, 
        LabeledElement = v1.createElement(l_Pane_0, {
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            Layout = v19, 
            LayoutOrder = v18:getNextOrder(), 
            Spacing = 2, 
            VerticalAlignment = l_VerticalAlignment_0 or Enum.VerticalAlignment.Top
        }, {
            Label = v1.createElement(l_TextLabel_0, {
                AutomaticSize = Enum.AutomaticSize.Y, 
                Font = l_props_0.Font, 
                LayoutOrder = 1, 
                Size = v20, 
                Text = l_props_0.Text, 
                TextXAlignment = l_props_0.TextXAlignment or l_LabeledElement_0.TextXAlignment, 
                TextWrapped = true
            }), 
            ElementListItem = v1.createElement(l_Pane_0, l_join_0({
                LayoutOrder = 2, 
                AutomaticSize = Enum.AutomaticSize.XY, 
                VerticalAlignment = l_VerticalAlignment_0
            }, l_props_0.WrapperProps), l_props_0[v1.Children])
        })
    });
end;
return (l_withContext_0({
    Analytics = l_Analytics_0, 
    Localization = l_Localization_0, 
    Stylizer = l_Stylizer_0
})(v14));
