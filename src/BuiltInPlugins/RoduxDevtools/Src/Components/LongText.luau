local l_Parent_0 = script.Parent.Parent.Parent;
local _ = require(l_Parent_0.Src.Types);
local v2 = require(l_Parent_0.Packages.React);
local v3 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Analytics_0 = l_ContextServices_0.Analytics;
local l_Localization_0 = l_ContextServices_0.Localization;
local l_Stylizer_0 = v3.Style.Stylizer;
local l_UI_0 = v3.UI;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_List_0 = l_UI_0.List;
local v12 = v2.PureComponent:extend("LongText");
v12.render = function(v13)
    local v14 = string.split(v13.props.Text, "\n");
    return v2.createElement("Frame", {
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, 0, 0, (math.min(v13.props.MaxHeight, #v14 * 20))), 
        Position = v13.props.Position, 
        AnchorPoint = v13.props.AnchorPoint, 
        AutomaticSize = v13.props.AutomaticSize, 
        LayoutOrder = v13.props.LayoutOrder
    }, {
        List = v2.createElement(l_List_0, {
            Rows = v14, 
            RowHeight = 20, 
            RowComponent = function(v15)
                return v2.createElement(l_TextLabel_0, {
                    Text = v15.Text, 
                    LayoutOrder = v15.LayoutOrder, 
                    Position = v15.Position, 
                    Size = v15.Size, 
                    Font = v15.Font, 
                    FontFace = v15.FontFace, 
                    TextXAlignment = v15.TextXAlignment, 
                    TextYAlignment = v15.TextYAlignment, 
                    RichText = v15.RichText
                });
            end, 
            GetRowProps = function(v16, v17, v18, v19)
                return {
                    Text = v16, 
                    LayoutOrder = v17, 
                    Position = v18, 
                    Size = v19, 
                    Font = v13.props.Font, 
                    FontFace = v13.props.FontFace, 
                    TextXAlignment = v13.props.TextXAlignment, 
                    TextYAlignment = v13.props.TextYAlignment, 
                    RichText = v13.props.RichText
                };
            end
        })
    });
end;
return (l_withContext_0({
    Analytics = l_Analytics_0, 
    Localization = l_Localization_0, 
    Stylizer = l_Stylizer_0
})(v12));
