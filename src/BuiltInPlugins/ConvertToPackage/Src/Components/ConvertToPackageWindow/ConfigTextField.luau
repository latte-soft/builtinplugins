local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v2 = require(l_Packages_0.Roact);
local v3 = require(l_Packages_0.Framework);
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_TextInput_0 = v3.UI.TextInput;
local v7 = require(l_Parent_0.Src.Util.Constants);
local v8 = v2.PureComponent:extend("ConfigTextField");
v8.init = function(v9, _)
    v9.state = {};
    v9.onTextChanged = function(v11)
        v9:setState({
            currentContent = v11
        });
        v9.props.TextChangeCallBack(v11);
    end;
end;
v8.render = function(v12)
    local l_props_0 = v12.props;
    local l_state_0 = v12.state;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local l_Title_0 = l_props_0.Title;
    local l_TotalHeight_0 = l_props_0.TotalHeight;
    local l_LayoutOrder_0 = l_props_0.LayoutOrder;
    local l_MaxCount_0 = l_props_0.MaxCount;
    return v2.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, l_TotalHeight_0), 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        LayoutOrder = l_LayoutOrder_0
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
            Text = l_Title_0, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Top, 
            TextSize = v7.FONT_SIZE_TITLE, 
            TextColor3 = l_Stylizer_0.publishAsset.titleTextColor, 
            Font = v7.FONT, 
            LayoutOrder = 1
        }), 
        TextField = v2.createElement(l_TextInput_0, {
            LayoutOrder = 2, 
            MaxLength = l_MaxCount_0, 
            MultiLine = l_MaxCount_0 > 50, 
            OnTextChanged = v12.onTextChanged, 
            Text = l_state_0.currentContent or (l_props_0.TextContent or ""), 
            Size = UDim2.new(1, -v7.TITLE_GUTTER_WIDTH, 0, (l_TotalHeight_0 - 40) - 20)
        })
    });
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer
})(v8));
