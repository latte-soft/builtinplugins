local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v2 = require(l_Packages_0.Roact);
local v3 = require(l_Packages_0.Framework);
local l_Pane_0 = v3.UI.Pane;
local l_TextLabel_0 = v3.UI.TextLabel;
local l_Util_0 = l_Parent_0.Core.Util;
local v7 = require(l_Util_0.Constants);
local v8 = require(l_Util_0.AssetConfigConstants);
local l_LayoutOrderIterator_0 = v3.Util.LayoutOrderIterator;
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_withForwardRef_0 = v3.Wrappers.withForwardRef;
local v13 = v2.PureComponent:extend("ConfigureSectionWrapper");
v13.defaultProps = {
    Size = UDim2.new(1, 0, 0, 0)
};
v13.render = function(v14)
    local l_props_0 = v14.props;
    local l_publishAsset_0 = l_props_0.Stylizer.publishAsset;
    local v17 = l_LayoutOrderIterator_0.new();
    return v2.createElement(l_Pane_0, {
        AutomaticSize = Enum.AutomaticSize.Y, 
        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
        Layout = Enum.FillDirection.Horizontal, 
        LayoutOrder = l_props_0.LayoutOrder, 
        Size = l_props_0.Size, 
        VerticalAlignment = Enum.VerticalAlignment.Top, 
        [v2.Ref] = l_props_0.ForwardRef
    }, {
        Title = v2.createElement(l_TextLabel_0, {
            AutomaticSize = Enum.AutomaticSize.Y, 
            LayoutOrder = v17:getNextOrder(), 
            Size = UDim2.new(0, v8.TITLE_GUTTER_WIDTH, 0, 0), 
            Text = l_props_0.Title, 
            TextColor = l_publishAsset_0.titleTextColor, 
            TextSize = v7.FONT_SIZE_TITLE, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Top
        }), 
        Contents = v2.createElement(l_Pane_0, {
            AutomaticSize = Enum.AutomaticSize.Y, 
            LayoutOrder = v17:getNextOrder(), 
            Size = UDim2.new(1, -v8.TITLE_GUTTER_WIDTH, 0, v7.FONT_SIZE_TITLE)
        }, l_props_0[v2.Children])
    });
end;
return (l_withForwardRef_0((l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer
})(v13))));
