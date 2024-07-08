local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v2.ContextServices;
local l_UI_0 = v2.UI;
local l_Button_0 = l_UI_0.Button;
local l_HoverArea_0 = l_UI_0.HoverArea;
local l_Image_0 = l_UI_0.Image;
local l_Pane_0 = l_UI_0.Pane;
local l_Tooltip_0 = l_UI_0.Tooltip;
local v10 = v1.Component:extend("GroupButton");
v10.init = function(v11)
    v11.state = {
        Hovering = false
    };
    v11.mouseEnter = function()
        v11:setState({
            Hovering = true
        });
    end;
    v11.mouseLeave = function()
        v11:setState({
            Hovering = false
        });
    end;
end;
v10.render = function(v12)
    local l_props_0 = v12.props;
    local l_Stylizer_0 = l_props_0.Stylizer;
    return v1.createElement(l_Button_0, {
        Size = l_Stylizer_0.Size, 
        Padding = l_Stylizer_0.Padding, 
        LayoutOrder = l_props_0.LayoutOrder, 
        Style = {
            Foreground = l_Image_0, 
            ForegroundStyle = {
                Image = if not v12.state.Hovering then l_Stylizer_0.Image else l_Stylizer_0.HoveredImage, 
                Size = l_Stylizer_0.ImageSize, 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Position = UDim2.new(0.5, 0, 0.5, 0), 
                ScaleType = Enum.ScaleType.Stretch
            }, 
            Background = l_Pane_0, 
            BackgroundStyle = "None"
        }, 
        OnClick = l_props_0.OnClick, 
        OnMouseEnter = v12.mouseEnter, 
        OnMouseLeave = v12.mouseLeave
    }, {
        HoverArea = v1.createElement(l_HoverArea_0, {
            Cursor = "PointingHand"
        }), 
        Tooltip = v1.createElement(l_Tooltip_0, {
            Text = l_props_0.TooltipMessage
        })
    });
end;
return (l_ContextServices_0.withContext({
    Stylizer = l_ContextServices_0.Stylizer, 
    Localization = l_ContextServices_0.Localization
})(v10));
