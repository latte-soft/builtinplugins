local l_Parent_0 = script.Parent.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Framework);
local v2 = require(l_Parent_0.Packages.Roact);
local l_withContext_0 = v1.ContextServices.withContext;
local v4 = require(l_Parent_0.Src.ContextItems);
local v5 = require(l_Parent_0.Src.Util.Constants);
local l_TextService_0 = game:GetService("TextService");
local v7 = Rect.new(3, 3, 13, 13);
local v8 = v2.PureComponent:extend(script.Name);
v8.defaultProps = {
    Width = UDim.new(0, v5.SECOND_COLUMN_WIDTH)
};
v8.init = function(v9)
    v9.state = {
        warningMessage = ""
    };
    v9.textClipperFrameRef = v2.createRef();
    v9.textBoxRef = v2.createRef();
    v9.updateTextBoxOffset = function()
        local l_current_0 = v9.textBoxRef.current;
        local l_current_1 = v9.textClipperFrameRef.current;
        if l_current_0 and l_current_1 then
            local l_font_0 = l_current_0.font;
            local l_textSize_0 = l_current_0.textSize;
            local l_X_0 = l_current_1.AbsoluteSize.X;
            local l_x_0 = l_TextService_0:GetTextSize(string.sub(l_current_0.Text, 1, l_current_0.CursorPosition - 1), l_textSize_0, l_font_0, Vector2.new(0, 0)).x;
            local l_x_1 = l_TextService_0:GetTextSize(l_current_0.Text, l_textSize_0, l_font_0, Vector2.new(0, 0)).x;
            local l_Offset_0 = l_current_0.Position.X.Offset;
            if l_x_0 <= 4 - l_Offset_0 then
                l_Offset_0 = 4 - l_x_0;
            elseif l_X_0 - l_Offset_0 <= l_x_0 + 4 then
                l_Offset_0 = -((l_x_0 + 4) - l_X_0);
            end;
            l_current_0.Position = UDim2.new(0, l_Offset_0, 0, 0);
            l_current_0.Size = UDim2.new(0, math.max(l_x_1, l_X_0), 0, l_current_0.AbsoluteSize.Y);
            return ;
        else
            return ;
        end;
    end;
    v9.textBoxCheckFunc = function()
        local l_current_2 = v9.textBoxRef.current;
        if l_current_2 then
            if string.find(l_current_2.Text, "\t") then
                l_current_2.Text = l_current_2.Text:gsub("\t", "");
                l_current_2:ReleaseFocus(true);
            end;
            if v9.props.ValidateText then
                local l_Text_0 = l_current_2.Text;
                local v20 = nil;
                local v21 = "";
                local v22, v23 = v9.props.ValidateText(l_Text_0);
                v20 = v22;
                v21 = v23;
                if l_current_2.Text ~= v20 then
                    l_current_2.CursorPosition = l_current_2.CursorPosition - 1;
                    l_current_2.Text = v20;
                end;
                if v21 == nil then
                    v21 = "";
                end;
                if v9.state.warningMessage ~= v21 then
                    v9:setState({
                        warningMessage = v21
                    });
                end;
            end;
            if v9.props.MaxGraphemes and v9.props.MaxGraphemes < utf8.len(l_current_2.Text) then
                l_current_2.Text = string.sub(l_current_2.Text, 1, utf8.offset(l_current_2.Text, 1, v9.props.MaxGraphemes + 1) - 1);
            end;
            v9.updateTextBoxOffset();
            return ;
        else
            return ;
        end;
    end;
    v9.onFocus = function()
        if utf8.len(v9.state.warningMessage) == 0 then
            v9:setState({
                focused = true
            });
        end;
        if v9.props.OnFocused then
            v9.props.OnFocused();
        end;
    end;
    v9.onFocusLost = function(_, v25)
        local l_current_3 = v9.textBoxRef.current;
        if l_current_3 then
            l_current_3.Position = UDim2.new(0, 4, 0, 0);
        end;
        if utf8.len(v9.state.warningMessage) == 0 then
            v9:setState({
                focused = false
            });
        end;
        local l_current_4 = v9.textBoxRef.current;
        if not (not v9.props.OnFocusLost or not l_current_4) then
            local v28 = v9.props.OnFocusLost(v25, l_current_4.Text);
            if v28 then
                l_current_4.Text = v28;
            end;
        end;
    end;
end;
v8.render = function(v29)
    local v30 = v29.props.Theme:get();
    local l_Position_0 = v29.props.Position;
    local v32 = v29.props.Width or UDim.new(1, 0);
    local v33 = v29.props.Label or "";
    local v34 = v29.props.Text or "";
    local v35 = nil;
    v35 = v29.props.TextSize or v30.textSize;
    local l_EditingDisabled_0 = v29.props.EditingDisabled;
    local v37 = v29.props.PlaceholderText or v34;
    local v38 = v29.props.ClearTextOnFocus or false;
    local l_LayoutOrder_0 = v29.props.LayoutOrder;
    local v40 = 0;
    if utf8.len(v33) > 0 then
        v40 = l_TextService_0:GetTextSize(v33, v30.textSize, v30.font, Vector2.new()).X + 8;
    end;
    local l_warningMessage_0 = v29.state.warningMessage;
    if v29.props.WarningOverride then
        l_warningMessage_0 = v29.props.WarningOverride;
    end;
    local v42 = l_warningMessage_0 and utf8.len(l_warningMessage_0) > 0;
    local v43 = nil;
    local v44 = nil;
    local v45 = UDim2.new(1, 0, 0, 24);
    if v42 then
        v43 = UDim2.new(v32.Scale, v32.Offset, 0, 48);
        v44 = v30.errorColor;
    else
        v43 = UDim2.new(v32.Scale, v32.Offset, 0, 24);
        v44 = if not v29.state.focused then v30.borderColor else v30.hoveredItemColor;
    end;
    local l_createElement_0 = v2.createElement;
    local v47 = "Frame";
    local v48 = {
        Position = l_Position_0, 
        Size = v43, 
        LayoutOrder = l_LayoutOrder_0, 
        BackgroundTransparency = 1
    };
    local v49 = {};
    local l_createElement_1 = v2.createElement;
    local v51 = "ImageLabel";
    local v52 = {
        Size = v45, 
        Image = "rbxasset://textures/StudioToolbox/RoundedBorder.png", 
        ImageTransparency = 0, 
        ImageColor3 = v44, 
        ScaleType = Enum.ScaleType.Slice, 
        SliceCenter = v7, 
        BackgroundTransparency = 1, 
        [v2.Ref] = v29.textInputBorderRef
    };
    local v53 = {};
    local v54 = false;
    if v40 > 0 then
        v54 = v2.createElement("TextLabel", {
            Position = UDim2.new(0, 1, 0, 1), 
            Size = UDim2.new(0, v40, 0, 22), 
            BackgroundColor3 = v30.shadowColor, 
            BorderSizePixel = 0, 
            Text = v33, 
            Font = v30.font, 
            TextSize = v30.textSize, 
            TextColor3 = v30.textColor, 
            TextXAlignment = Enum.TextXAlignment.Center
        });
    end;
    v53.Label = v54;
    v53.TextBoxFrame = v2.createElement("Frame", {
        Position = UDim2.new(0, v40 > 0 and v40 + 1 or 2, 0, 1), 
        Size = UDim2.new(1, -v40 - 4, 0, 22), 
        ClipsDescendants = true, 
        BorderSizePixel = 0, 
        BackgroundColor3 = v30.roundTextButtonTheme.textBoxColor, 
        [v2.Ref] = v29.textClipperFrameRef
    }, {
        TextBox = v2.createElement("TextBox", {
            Size = UDim2.new(1, -4, 1, 0), 
            Position = UDim2.new(0, 4, 0, 0), 
            BackgroundTransparency = 1, 
            Text = v34, 
            Font = v30.font, 
            TextSize = v35, 
            TextColor3 = v30.textColor, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            ClearTextOnFocus = v38, 
            PlaceholderText = v37, 
            TextEditable = not l_EditingDisabled_0, 
            [v2.Ref] = v29.textBoxRef, 
            [v2.Change.Text] = v29.textBoxCheckFunc, 
            [v2.Change.CursorPosition] = v29.updateTextBoxOffset, 
            [v2.Event.Focused] = v29.onFocus, 
            [v2.Event.FocusLost] = v29.onFocusLost
        })
    });
    v49.TextBox = l_createElement_1(v51, v52, v53);
    v49.Warning = v42 and v2.createElement("TextLabel", {
        Size = UDim2.new(1, 0, 0, 22), 
        Position = UDim2.new(0, 0, 0, 22), 
        Text = l_warningMessage_0, 
        Font = v30.font, 
        TextSize = v30.textSize, 
        TextColor3 = v30.errorColor, 
        TextXAlignment = Enum.TextXAlignment.Left, 
        BackgroundTransparency = 1
    });
    return l_createElement_0(v47, v48, v49);
end;
return (l_withContext_0({
    Theme = v4.DEPRECATED_Theme
})(v8));
