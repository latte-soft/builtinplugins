local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.FitFrame);
local v3 = require(l_Parent_0.Src.Util.Constants);
local l_ContextServices_0 = require(l_Parent_0.Packages.Framework).ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_FitFrameVertical_0 = v2.FitFrameVertical;
local l_FitTextLabel_0 = v2.FitTextLabel;
local v8 = v1.Component:extend("ListItem");
v8.defaultProps = {
    renderContent = function()
    end, 
    title = "", 
    titleWidth = v3.LIST_ITEM_TITLE_WIDTH
};
v8.render = function(v9)
    local l_LayoutOrder_0 = v9.props.LayoutOrder;
    local l_renderContent_0 = v9.props.renderContent;
    local l_title_0 = v9.props.title;
    local l_titleWidth_0 = v9.props.titleWidth;
    local l_Stylizer_0 = v9.props.Stylizer;
    return v1.createElement(l_FitFrameVertical_0, {
        BackgroundTransparency = 1, 
        contentPadding = UDim.new(0, 20), 
        FillDirection = Enum.FillDirection.Horizontal, 
        LayoutOrder = l_LayoutOrder_0, 
        width = UDim.new(1, 0)
    }, {
        Title = v1.createElement(l_FitTextLabel_0, {
            BackgroundTransparency = 1, 
            Font = l_Stylizer_0.Font, 
            LayoutOrder = 1, 
            Text = l_title_0, 
            TextColor3 = l_Stylizer_0.SubTextColor, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextSize = 18, 
            width = UDim.new(0, l_titleWidth_0)
        }), 
        Container = v1.createElement(l_FitFrameVertical_0, {
            BackgroundTransparency = 1, 
            LayoutOrder = 2, 
            width = UDim.new(1, -l_titleWidth_0 - 20)
        }, {
            Content = l_renderContent_0()
        })
    });
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer
})(v8));
