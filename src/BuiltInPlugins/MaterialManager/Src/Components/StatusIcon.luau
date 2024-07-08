local l_Parent_0 = script.Parent.Parent.Parent;
local _ = require(l_Parent_0.Src.Types);
local v2 = require(l_Parent_0.Packages.Roact);
local v3 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Analytics_0 = l_ContextServices_0.Analytics;
local l_Stylizer_0 = v3.Style.Stylizer;
local l_UI_0 = v3.UI;
local l_Container_0 = l_UI_0.Container;
local l_Image_0 = l_UI_0.Image;
local l_Pane_0 = l_UI_0.Pane;
local l_Tooltip_0 = l_UI_0.Tooltip;
local v13 = v2.PureComponent:extend("StatusIcon");
v13.render = function(v14)
    local l_props_0 = v14.props;
    local l_StatusIcon_0 = l_props_0.Stylizer.StatusIcon;
    local l_Status_0 = l_props_0.Status;
    local v18 = nil;
    local v19 = l_props_0.StatusText or "";
    if l_Status_0 == Enum.PropertyStatus.Error then
        v18 = l_StatusIcon_0.Error;
    elseif l_Status_0 == Enum.PropertyStatus.Warning then
        v18 = l_StatusIcon_0.Warning;
    elseif l_Status_0 == Enum.PropertyStatus.Ok then
        return v2.createElement(l_Pane_0, {
            LayoutOrder = l_props_0.LayoutOrder, 
            Size = UDim2.fromOffset(0, 0)
        });
    end;
    return v2.createElement(l_Container_0, {
        LayoutOrder = l_props_0.LayoutOrder, 
        Position = l_props_0.Position, 
        Size = l_props_0.Size, 
        ZIndex = l_props_0.ZIndex
    }, {
        Image = v2.createElement(l_Image_0, {
            Style = v18
        }), 
        Tooltip = v2.createElement(l_Tooltip_0, {
            Text = v19
        })
    });
end;
return (l_withContext_0({
    Analytics = l_Analytics_0, 
    Stylizer = l_Stylizer_0
})(v13));
