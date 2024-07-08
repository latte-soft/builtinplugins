local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.Framework);
local v3 = game:DefineFastFlag("LocalizationToolsFixLabeledImageButton", false);
local l_ContextServices_0 = v2.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_UI_0 = v2.UI;
local l_HoverArea_0 = l_UI_0.HoverArea;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_StyleModifier_0 = v2.Util.StyleModifier;
local v10 = v1.PureComponent:extend("LabeledImageButton");
v10.init = function(v11)
    v11.state = {
        hovered = false
    };
    v11.onMouseEnter = function()
        if v11.props.Active then
            v11:setState({
                hovered = true
            });
            return ;
        else
            return ;
        end;
    end;
    v11.onMouseLeave = function()
        if v11.props.Active then
            v11:setState({
                hovered = false
            });
            return ;
        else
            return ;
        end;
    end;
end;
v10.render = function(v12)
    local l_props_0 = v12.props;
    local l_state_0 = v12.state;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local l_LayoutOrder_0 = l_props_0.LayoutOrder;
    local l_LabelText_0 = l_props_0.LabelText;
    local l_ButtonText_0 = l_props_0.ButtonText;
    local l_ButtonImage_0 = l_props_0.ButtonImage;
    local l_Active_0 = l_props_0.Active;
    return v1.createElement("Frame", {
        AutomaticSize = if not v3 then nil else Enum.AutomaticSize.XY, 
        Size = UDim2.new(1, 0, 0, l_Stylizer_0.Height), 
        BackgroundTransparency = 1, 
        LayoutOrder = l_LayoutOrder_0
    }, {
        Layout = v1.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Horizontal
        }), 
        Label = v1.createElement(l_TextLabel_0, {
            AutomaticSize = if not v3 then nil else Enum.AutomaticSize.Y, 
            LayoutOrder = 1, 
            Size = if not v3 then UDim2.new(0, l_Stylizer_0.LabelWidth, 1, 0) else UDim2.new(0, l_Stylizer_0.LabelWidth, 0, 0), 
            Text = l_LabelText_0, 
            StyleModifier = if not l_Active_0 then l_StyleModifier_0.Disabled else nil, 
            TextWrapped = true, 
            TextXAlignment = Enum.TextXAlignment.Left
        }), 
        Button = v1.createElement("ImageButton", {
            AutoButtonColor = false, 
            AutomaticSize = if not v3 then nil else Enum.AutomaticSize.XY, 
            BackgroundColor3 = not not l_state_0.hovered and l_Stylizer_0.BackgroundColorHovered or l_Stylizer_0.BackgroundColor, 
            BorderSizePixel = 0, 
            LayoutOrder = 2, 
            Size = if not v3 then UDim2.new(0, l_Stylizer_0.ImageButtonSize, 0, l_Stylizer_0.ImageButtonSize) else UDim2.new(0, l_Stylizer_0.ImageButtonSize, 0, 0), 
            [v1.Event.Activated] = not not l_Active_0 and l_props_0.OnButtonClick or function()
            end, 
            [v1.Event.MouseEnter] = v12.onMouseEnter, 
            [v1.Event.MouseLeave] = v12.onMouseLeave
        }, {
            Layout = if not v3 then nil else v1.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center
            }), 
            ImageLabel = v1.createElement("ImageLabel", {
                Position = if not v3 then UDim2.new(0.5, 0, 0, l_Stylizer_0.ImageLabelSize / 2) else nil, 
                AnchorPoint = if not v3 then Vector2.new(0.5, 0.5) else nil, 
                Size = UDim2.new(0, l_Stylizer_0.ImageLabelSize, 0, l_Stylizer_0.ImageLabelSize), 
                Image = l_ButtonImage_0, 
                BackgroundTransparency = 1
            }), 
            TextLabel = v1.createElement(l_TextLabel_0, {
                AutomaticSize = if not v3 then nil else Enum.AutomaticSize.Y, 
                Position = if not v3 then UDim2.new(0.5, 0, 1, -l_Stylizer_0.TextLabelSize / 2) else nil, 
                AnchorPoint = if not v3 then Vector2.new(0.5, 0.5) else nil, 
                Size = if not v3 then UDim2.new(1, 0, 0, l_Stylizer_0.TextLabelSize) else UDim2.new(0, l_Stylizer_0.ImageButtonSize, 0, 0), 
                LayoutOrder = if not v3 then nil else 2, 
                Text = l_ButtonText_0, 
                StyleModifier = if not l_Active_0 then l_StyleModifier_0.Disabled else nil, 
                Style = "Label", 
                TextWrapped = true
            }); 
            if not v3 then v1.createElement(l_HoverArea_0, {
                Cursor = "PointingHand"
            }) else nil
        })
    });
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer
})(v10));
