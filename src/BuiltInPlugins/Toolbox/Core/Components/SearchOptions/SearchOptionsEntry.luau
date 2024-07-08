local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v2 = require(l_Packages_0.Roact);
local v3 = require(l_Packages_0.Cryo);
local v4 = require(l_Packages_0.Framework);
local l_LayoutOrderIterator_0 = v4.Util.LayoutOrderIterator;
local l_Separator_0 = v4.UI.Separator;
local v7 = require(l_Parent_0.Core.Util.Constants);
local l_Pane_0 = v4.UI.Pane;
local l_ContextServices_0 = v4.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_GetTextSize_0 = v4.Util.GetTextSize;
local v12 = require(l_Parent_0.Core.Util.SharedFlags.getFFlagToolboxEnableSearchOptionsRefactor);
local v13 = v2.PureComponent:extend("SearchOptionsEntry");
v13.render = function(v14)
    local l_Stylizer_0 = v14.props.Stylizer;
    local l_Header_0 = v14.props.Header;
    local l_LayoutOrder_0 = v14.props.LayoutOrder;
    local v18 = v14.props.ZIndex or 1;
    local v19 = v14.props[v2.Children] or {};
    local l_searchOptions_0 = l_Stylizer_0.searchOptions;
    local v21 = l_GetTextSize_0(l_Header_0, nil, nil, Vector2.new(0, 0));
    local v22 = if not v12() then nil else l_LayoutOrderIterator_0.new();
    return v2.createElement(l_Pane_0, {
        AutomaticSize = Enum.AutomaticSize.XY, 
        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
        Layout = Enum.FillDirection.Vertical, 
        LayoutOrder = l_LayoutOrder_0, 
        Padding = 6, 
        Spacing = if not v12() then nil else 6, 
        VerticalAlignment = Enum.VerticalAlignment.Top, 
        ZIndex = v18
    }, if not v12() then v3.Dictionary.join(v19, {
        Header = v2.createElement("TextLabel", {
            LayoutOrder = -1, 
            BackgroundTransparency = 1, 
            Font = v7.FONT, 
            TextSize = v7.FONT_SIZE_MEDIUM, 
            TextColor3 = l_searchOptions_0.headerTextColor, 
            Size = UDim2.new(0, v21.X, 0, v21.Y), 
            Text = l_Header_0
        })
    }) else {
        Header = v2.createElement("TextLabel", {
            LayoutOrder = v22:getNextOrder(), 
            BackgroundTransparency = 1, 
            Font = v7.FONT, 
            TextSize = v7.FONT_SIZE_MEDIUM, 
            TextColor3 = l_searchOptions_0.headerTextColor, 
            Size = UDim2.new(0, v21.X, 0, v21.Y), 
            Text = l_Header_0
        }), 
        Content = v2.createElement(l_Pane_0, {
            AutomaticSize = Enum.AutomaticSize.XY, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            Layout = Enum.FillDirection.Vertical, 
            LayoutOrder = v22:getNextOrder(), 
            Size = UDim2.fromScale(1, 0), 
            Spacing = 10
        }, v19), 
        SeparatorWithPadding = if v14.props.HideLowerSeparator then nil else v2.createElement(l_Pane_0, {
            AutomaticSize = Enum.AutomaticSize.XY, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            Layout = Enum.FillDirection.Vertical, 
            LayoutOrder = v22:getNextOrder(), 
            Padding = {
                Top = 10
            }, 
            Size = UDim2.fromScale(1, 0)
        }, {
            Separator = v2.createElement(l_Separator_0)
        })
    });
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer
})(v13));
