local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Roact);
local v2 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local v3 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_Button_0 = v3.UI.Button;
local l_CaptureFocus_0 = v3.UI.CaptureFocus;
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v8 = v1.PureComponent:extend("FocusedPrompt");
v8.renderButton = function(v9, v10, v11, _)
    local l_props_0 = v9.props;
    return v1.createElement(l_Button_0, {
        Size = UDim2.new(0, v2.PROMPT_BUTTON_SIZE.X, 0, v2.PROMPT_BUTTON_SIZE.Y), 
        LayoutOrder = v10, 
        Style = v11.Style, 
        Text = v11.Text, 
        OnClick = function()
            l_props_0.OnButtonClicked(v11.Key);
        end
    });
end;
v8.render = function(v14)
    local l_props_1 = v14.props;
    local l_Stylizer_0 = l_props_1.Stylizer;
    local l_dialogTheme_0 = l_Stylizer_0.dialogTheme;
    local l_PROMPT_BUTTON_PADDING_0 = v2.PROMPT_BUTTON_PADDING;
    local l_Y_0 = v2.PROMPT_BUTTON_SIZE.Y;
    local l_Buttons_0 = l_props_1.Buttons;
    local l_PromptText_0 = l_props_1.PromptText;
    local v22 = l_props_1.Size or v2.PROMPT_SIZE;
    local v23 = nil;
    v23 = if not l_PromptText_0 then v14.props[v1.Children] else {
        PromptText = v1.createElement("TextLabel", {
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = 1, 
            TextSize = l_dialogTheme_0.textSize, 
            TextColor3 = l_dialogTheme_0.textColor, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            Font = l_Stylizer_0.font, 
            Text = l_PromptText_0, 
            TextWrapped = true
        })
    };
    local v24 = {
        Layout = v1.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Horizontal, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            Padding = UDim.new(0, l_PROMPT_BUTTON_PADDING_0)
        })
    };
    for v25, v26 in ipairs(l_Buttons_0) do
        table.insert(v24, v14:renderButton(v25, v26, l_dialogTheme_0.textSize));
    end;
    return v1.createElement(l_CaptureFocus_0, {}, {
        Background = v1.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = 0.35, 
            BorderSizePixel = 0, 
            BackgroundColor3 = Color3.new()
        }, {
            CenterFrame = v1.createElement("ImageButton", {
                Size = v22, 
                Position = UDim2.new(0.5, 0, 0.5, 0), 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                BorderSizePixel = 0, 
                BackgroundColor3 = l_Stylizer_0.backgroundColor, 
                AutoButtonColor = false, 
                ImageTransparency = 1
            }, {
                Padding = v1.createElement("UIPadding", {
                    PaddingTop = UDim.new(0, v2.PROMPT_VERTICAL_PADDING), 
                    PaddingBottom = UDim.new(0, v2.PROMPT_VERTICAL_PADDING), 
                    PaddingLeft = UDim.new(0, v2.PROMPT_HORIZONTAL_PADDING), 
                    PaddingRight = UDim.new(0, v2.PROMPT_HORIZONTAL_PADDING)
                }), 
                Container = v1.createElement("Frame", {
                    Size = UDim2.new(1, 0, 1, -(l_Y_0 + v2.PROMPT_VERTICAL_PADDING)), 
                    AnchorPoint = Vector2.new(0.5, 0), 
                    Position = UDim2.new(0.5, 0, 0, 0), 
                    BackgroundTransparency = 1
                }, v23), 
                Buttons = v1.createElement("Frame", {
                    Size = UDim2.new(1, 0, 0, l_Y_0), 
                    AnchorPoint = Vector2.new(0.5, 1), 
                    Position = UDim2.new(0.5, 0, 1, 0), 
                    BackgroundTransparency = 1
                }, v24)
            })
        })
    });
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer
})(v8));
