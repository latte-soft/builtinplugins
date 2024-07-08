local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v2 = require(l_Packages_0.Roact);
local v3 = require(l_Packages_0.Framework);
local v4 = require(l_Parent_0.Core.Components.DropdownMenu);
local l_Util_0 = l_Parent_0.Core.Util;
local v6 = require(l_Util_0.Constants);
local v7 = require(l_Util_0.AssetConfigConstants);
local v8 = require(l_Util_0.AssetConfigUtil);
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_withForwardRef_0 = v3.Wrappers.withForwardRef;
local v12 = v2.PureComponent:extend("ConfigGenre");
v12.render = function(v13)
    local l_props_0 = v13.props;
    local _ = v13.state;
    return v2.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, l_props_0.TotalHeight), 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        LayoutOrder = l_props_0.LayoutOrder, 
        [v2.Ref] = l_props_0.ForwardRef
    }, {
        UIListLayout = v2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            VerticalAlignment = Enum.VerticalAlignment.Top, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, 0)
        }), 
        Title = v2.createElement("TextLabel", {
            Size = UDim2.new(0, v7.TITLE_GUTTER_WIDTH, 1, 0), 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            Text = l_props_0.Title, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Top, 
            TextSize = v6.FONT_SIZE_TITLE, 
            TextColor3 = l_props_0.Stylizer.publishAsset.titleTextColor, 
            Font = v6.FONT, 
            LayoutOrder = 1
        }), 
        DropDown = v2.createElement(v4, {
            Size = UDim2.new(0, 220, 0, 38), 
            visibleDropDownCount = 5, 
            selectedDropDownIndex = v8.getGenreIndex((l_props_0.genres or {})[1]), 
            items = v8.getGenreTypes(), 
            fontSize = v6.FONT_SIZE_LARGE, 
            onItemClicked = l_props_0.onDropDownSelect, 
            setDropdownHeight = l_props_0.setDropdownHeight, 
            LayoutOrder = 2
        })
    });
end;
return (l_withForwardRef_0((l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer
})(v12))));
