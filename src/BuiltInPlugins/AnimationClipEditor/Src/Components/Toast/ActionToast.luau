local v0 = Vector2.new(340, 10000);
local l_TextService_0 = game:GetService("TextService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v3 = require(l_script_FirstAncestor_0.Packages.Roact);
local v4 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local v5 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_Button_0 = v5.UI.Button;
local l_ContextServices_0 = v5.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v9 = require(l_script_FirstAncestor_0.Src.Components.Toast.BaseToast);
local v10 = v3.PureComponent:extend("ActionToast");
v10.renderButton = function(v11, v12, v13, _)
    local l_props_0 = v11.props;
    return v3.createElement(l_Button_0, {
        Size = UDim2.new(0, l_props_0.ButtonWidth or v4.PROMPT_BUTTON_SIZE.X, 0, v4.PROMPT_BUTTON_SIZE.Y), 
        LayoutOrder = v12, 
        Style = v13.Style, 
        Text = v13.Text, 
        OnClick = function()
            l_props_0.OnButtonClicked(v13.Key);
        end
    });
end;
v10.render = function(v16)
    local l_props_1 = v16.props;
    local l_Stylizer_0 = l_props_1.Stylizer;
    local l_toastTheme_0 = l_Stylizer_0.toastTheme;
    local l_PROMPT_BUTTON_PADDING_0 = v4.PROMPT_BUTTON_PADDING;
    local l_Y_0 = v4.PROMPT_BUTTON_SIZE.Y;
    local l_Text_0 = l_props_1.Text;
    local l_Buttons_0 = l_props_1.Buttons;
    local v24 = (l_TextService_0:GetTextSize(l_Text_0, l_toastTheme_0.textSize, l_Stylizer_0.font, v0).Y + v4.PROMPT_VERTICAL_PADDING * 3) + l_Y_0;
    local v25 = {
        Layout = v3.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Horizontal, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            Padding = UDim.new(0, l_PROMPT_BUTTON_PADDING_0)
        })
    };
    for v26, v27 in ipairs(l_Buttons_0) do
        table.insert(v25, v16:renderButton(v26, v27, l_toastTheme_0.textSize));
    end;
    return v3.createElement(v9, {
        AnchorPoint = Vector2.new(1, 1), 
        Size = UDim2.new(0, 380, 0, v24)
    }, {
        Padding = v3.createElement("UIPadding", {
            PaddingTop = UDim.new(0, v4.PROMPT_VERTICAL_PADDING), 
            PaddingBottom = UDim.new(0, v4.PROMPT_VERTICAL_PADDING), 
            PaddingLeft = UDim.new(0, v4.PROMPT_HORIZONTAL_PADDING), 
            PaddingRight = UDim.new(0, v4.PROMPT_HORIZONTAL_PADDING)
        }), 
        Text = v3.createElement("TextLabel", {
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = 1, 
            Text = l_Text_0, 
            TextWrapped = true, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Top, 
            TextSize = l_toastTheme_0.textSize, 
            TextColor3 = l_toastTheme_0.textColor, 
            Font = l_Stylizer_0.font
        }), 
        Buttons = v3.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, l_Y_0), 
            AnchorPoint = Vector2.new(0.5, 1), 
            Position = UDim2.new(0.5, 0, 1, 0), 
            BackgroundTransparency = 1
        }, v25)
    });
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer
})(v10));
