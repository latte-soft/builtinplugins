local l_TextService_0 = game:GetService("TextService");
local v1 = Vector2.new(340, 100000);
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v3 = require(l_script_FirstAncestor_0.Packages.Roact);
local v4 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local v5 = require(l_script_FirstAncestor_0.Src.Util.StringUtils);
local l_ContextServices_0 = require(l_script_FirstAncestor_0.Packages.Framework).ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v8 = require(l_script_FirstAncestor_0.Src.Components.EditEventsDialog.FocusedPrompt);
local v9 = require(l_script_FirstAncestor_0.Src.Components.TextBox);
local v10 = v3.PureComponent:extend("TextEntryPrompt");
v10.init = function(v11, v12)
    v11.state = {
        currentText = v12.Text or ""
    };
    v11.setCurrentText = function(v13)
        v11:setState({
            currentText = v13
        });
    end;
    v11.onFocusChanged = function(v14, v15, v16)
        if not v15 then
            local l_Text_0 = v14.Text;
            local v18 = nil;
            if v16 and l_Text_0 ~= "" then
                v18 = v11.props.OnTextSubmitted(l_Text_0);
            end;
            if v18 == true then
                v11.onClose();
                return ;
            else
                v11.setCurrentText(l_Text_0);
            end;
        end;
    end;
    v11.onClose = function()
        if v11.props.OnClose then
            v11.props.OnClose();
        end;
    end;
end;
v10.render = function(v19)
    local l_props_0 = v19.props;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local l_dialogTheme_0 = l_Stylizer_0.dialogTheme;
    local l_state_0 = v19.state;
    local l_PromptText_0 = l_props_0.PromptText;
    local l_InputText_0 = l_props_0.InputText;
    local l_NoticeText_0 = l_props_0.NoticeText;
    local l_HasError_0 = l_props_0.HasError;
    local l_Buttons_0 = l_props_0.Buttons;
    local l_OnButtonClicked_0 = l_props_0.OnButtonClicked;
    local l_OnTextSubmitted_0 = l_props_0.OnTextSubmitted;
    local l_currentText_0 = l_state_0.currentText;
    local v32 = not not l_InputText_0 and v5.getTextWidth(l_InputText_0, l_dialogTheme_0.textSize, l_Stylizer_0.font) or 0;
    local v33 = not not l_NoticeText_0 and l_TextService_0:GetTextSize(l_NoticeText_0, l_dialogTheme_0.subTextSize, l_Stylizer_0.font, v1).Y or 0;
    return v3.createElement(v8, {
        Size = UDim2.new(0, 380, 0, (((v4.PROMPT_VERTICAL_PADDING * 3 + 16) + v4.TRACK_HEIGHT * 2) + v33) + v4.PROMPT_BUTTON_SIZE.Y), 
        Buttons = l_Buttons_0, 
        OnButtonClicked = function(v34)
            if not (type(v34) == "string") or not l_OnButtonClicked_0 then
                if not v34 then
                    v19.onClose();
                elseif l_currentText_0 ~= "" and l_OnTextSubmitted_0(l_currentText_0) ~= false then
                    v19.onClose();
                    return ;
                end;
                return ;
            else
                l_OnButtonClicked_0(v34);
                return ;
            end;
        end, 
        OnClose = v19.onClose
    }, {
        Layout = v3.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Vertical, 
            Padding = UDim.new(0, 8)
        }), 
        PromptText = l_PromptText_0 and v3.createElement("TextLabel", {
            Size = UDim2.new(1, 0, 0, v4.TRACK_HEIGHT), 
            BackgroundTransparency = 1, 
            TextSize = l_dialogTheme_0.textSize, 
            TextColor3 = l_dialogTheme_0.textColor, 
            Font = l_Stylizer_0.font, 
            Text = l_PromptText_0, 
            TextTruncate = Enum.TextTruncate.AtEnd, 
            LayoutOrder = 1
        }), 
        Center = v3.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, v4.TRACK_HEIGHT), 
            BackgroundTransparency = 1, 
            LayoutOrder = 2
        }, {
            Layout = v3.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Horizontal, 
                Padding = UDim.new(0, 8)
            }), 
            InputText = l_InputText_0 and v3.createElement("TextLabel", {
                LayoutOrder = -1, 
                Size = UDim2.new(0, v32, 1, 0), 
                BackgroundTransparency = 1, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                Text = l_InputText_0, 
                TextSize = l_dialogTheme_0.textSize, 
                TextColor3 = l_dialogTheme_0.textColor, 
                Font = l_Stylizer_0.font
            }), 
            TextBox = v3.createElement(v9, {
                Size = UDim2.new(1, not not l_InputText_0 and -v32 - 8 or 0, 1, 0), 
                ClearTextOnFocus = false, 
                CaptureFocus = true, 
                FocusChanged = v19.onFocusChanged, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                Text = l_currentText_0
            })
        }), 
        NoticeText = l_NoticeText_0 and v3.createElement("TextLabel", {
            Size = UDim2.new(1, 0, 0, v33), 
            BackgroundTransparency = 1, 
            LayoutOrder = 3, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Top, 
            Text = l_NoticeText_0, 
            TextSize = l_dialogTheme_0.subTextSize, 
            TextColor3 = not not l_HasError_0 and l_dialogTheme_0.errorTextColor or l_dialogTheme_0.subTextColor, 
            TextWrapped = true, 
            Font = l_Stylizer_0.font
        })
    });
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer
})(v10));
