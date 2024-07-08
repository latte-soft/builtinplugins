local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v2 = require(l_Packages_0.Roact);
local v3 = require(l_Packages_0.Framework);
local v4 = require(l_Parent_0.Core.Util.Images);
local v5 = require(l_Parent_0.Core.Util.Constants);
local v6 = require(l_Parent_0.Core.Components.RoundFrame);
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_GetTextSize_0 = v3.Util.GetTextSize;
local l_SEARCH_TAG_HEIGHT_0 = v5.SEARCH_TAG_HEIGHT;
local v11 = v2.PureComponent:extend("SearchTag");
v11.defaultProps = {
    Name = "", 
    prefix = ""
};
v11.render = function(v12)
    local l_Stylizer_0 = v12.props.Stylizer;
    local l_prefix_0 = v12.props.prefix;
    local l_Name_0 = v12.props.Name;
    local l_onDelete_0 = v12.props.onDelete;
    local l_X_0 = l_GetTextSize_0(l_Name_0, nil, nil, Vector2.new(0, 0)).X;
    local l_X_1 = l_GetTextSize_0(l_prefix_0, v5.FONT_SIZE_MEDIUM, v5.FONT_BOLD, Vector2.new(0, 0)).X;
    return v2.createElement(v6, {
        Size = UDim2.new(0, ((l_X_1 + l_X_0) + 10) + 16, 0, l_SEARCH_TAG_HEIGHT_0), 
        BackgroundColor3 = l_Stylizer_0.searchTag.backgroundColor, 
        BorderColor3 = l_Stylizer_0.searchTag.borderColor, 
        AnchorPoint = Vector2.new(0.5, 0.5), 
        Position = UDim2.new(0.5, 0, 0.5, 0), 
        LayoutOrder = v12.props.LayoutOrder or 1
    }, {
        UIPadding = v2.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, 4), 
            PaddingRight = UDim.new(0, 4)
        }), 
        ByLabel = v2.createElement("TextLabel", {
            Font = v5.FONT_BOLD, 
            TextSize = v5.FONT_SIZE_MEDIUM, 
            TextColor3 = l_Stylizer_0.searchTag.textColor, 
            Size = UDim2.new(0, l_X_1, 1, 0), 
            BackgroundTransparency = 1, 
            ZIndex = 2, 
            Text = l_prefix_0
        }), 
        NameLabel = v2.createElement("TextLabel", {
            Font = v5.FONT, 
            TextSize = v5.FONT_SIZE_MEDIUM, 
            TextColor3 = l_Stylizer_0.searchTag.textColor, 
            Size = UDim2.new(0, l_X_0, 1, 0), 
            Position = UDim2.new(0, l_X_1 + 4, 0, 0), 
            BackgroundTransparency = 1, 
            ZIndex = 2, 
            Text = l_Name_0
        }), 
        DeleteButton = v2.createElement("ImageButton", {
            AnchorPoint = Vector2.new(1, 0.5), 
            Position = UDim2.new(1, 0, 0.5, 0), 
            Size = UDim2.new(0, 10, 0, 10), 
            BackgroundTransparency = 1, 
            Image = v4.DELETE_BUTTON, 
            ImageColor3 = l_Stylizer_0.searchTag.textColor, 
            [v2.Event.Activated] = l_onDelete_0
        })
    });
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer
})(v11));
