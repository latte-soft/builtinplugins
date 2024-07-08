local l_Parent_0 = script.Parent.Parent.Parent;
local _ = require(l_Parent_0.Src.Types);
local v2 = require(l_Parent_0.Packages.Roact);
local v3 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Analytics_0 = l_ContextServices_0.Analytics;
local l_Localization_0 = l_ContextServices_0.Localization;
local l_Stylizer_0 = v3.Style.Stylizer;
local l_UI_0 = v3.UI;
local l_HoverArea_0 = l_UI_0.HoverArea;
local l_Pane_0 = l_UI_0.Pane;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_Tooltip_0 = l_UI_0.Tooltip;
local l_LayoutOrderIterator_0 = v3.Util.LayoutOrderIterator;
local v15 = v2.PureComponent:extend("TagSettingRow");
v15.init = function(v16)
    v16.state = {
        hovered = false
    };
end;
v15.render = function(v17)
    local l_props_0 = v17.props;
    local l_TagSettingRow_0 = l_props_0.Stylizer.TagSettingRow;
    local v20 = l_LayoutOrderIterator_0.new();
    return v2.createElement(l_Pane_0, {
        Size = l_TagSettingRow_0.Size, 
        LayoutOrder = l_props_0.LayoutOrder
    }, {
        v2.createElement(l_Pane_0, {
            Size = l_TagSettingRow_0.Size, 
            Layout = Enum.FillDirection.Horizontal, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            Spacing = l_TagSettingRow_0.Spacing, 
            OnClick = l_props_0.OnClick, 
            Style = v17.state.hovered and "PaneHover"
        }, {
            RowText = v2.createElement(l_TextLabel_0, {
                Size = UDim2.new(1, l_TagSettingRow_0.TextSize.X.Offset - l_props_0.ControlSize.X.Offset, 0, l_TagSettingRow_0.TextSize.Y.Offset), 
                Style = not v17.state.hovered and "ButtonText" or "ButtonTextHover", 
                LayoutOrder = v20:getNextOrder(), 
                Text = l_props_0.Text, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextTruncate = Enum.TextTruncate.AtEnd
            }, {
                Tooltip = v2.createElement(l_Tooltip_0, {
                    Text = l_props_0.TooltipText, 
                    Priority = 1
                })
            }), 
            ControlPane = v2.createElement(l_Pane_0, {
                LayoutOrder = v20:getNextOrder(), 
                Size = l_props_0.ControlSize
            }, {
                Control = l_props_0.Control and v2.createElement(l_props_0.Control)
            })
        }), 
        v2.createElement(l_HoverArea_0, {
            Cursor = l_props_0.OnClick ~= nil and "PointingHand" or "Arrow", 
            MouseEnter = function()
                v17:setState({
                    hovered = true
                });
            end, 
            MouseLeave = function()
                v17:setState({
                    hovered = false
                });
            end
        })
    });
end;
return (l_withContext_0({
    Analytics = l_Analytics_0, 
    Localization = l_Localization_0, 
    Stylizer = l_Stylizer_0
})(v15));
