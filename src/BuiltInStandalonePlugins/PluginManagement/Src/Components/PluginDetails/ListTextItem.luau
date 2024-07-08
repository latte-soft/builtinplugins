local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Src.Util.Constants);
local l_ContextServices_0 = require(l_Parent_0.Packages.Framework).ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v5 = require(l_Parent_0.Src.Components.PluginDetails.ListItem);
local v6 = require(l_Parent_0.Src.Components.FluidFitTextLabel);
local v7 = v1.Component:extend("ListTextItem");
v7.defaultProps = {
    description = "", 
    title = "", 
    titleWidth = v2.LIST_ITEM_TITLE_WIDTH
};
v7.render = function(v8)
    local l_description_0 = v8.props.description;
    local l_LayoutOrder_0 = v8.props.LayoutOrder;
    local l_title_0 = v8.props.title;
    local l_titleWidth_0 = v8.props.titleWidth;
    local l_Stylizer_0 = v8.props.Stylizer;
    return v1.createElement(v5, {
        LayoutOrder = l_LayoutOrder_0, 
        renderContent = function()
            return v1.createElement(v6, {
                BackgroundTransparency = 1, 
                Font = l_Stylizer_0.Font, 
                LayoutOrder = 1, 
                TextSize = 16, 
                Text = l_description_0, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextColor3 = l_Stylizer_0.TextColor
            });
        end, 
        title = l_title_0, 
        titleWidth = l_titleWidth_0
    });
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer
})(v7));
