local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = script.Parent.Parent.Parent.Parent;
local v2 = require(l_Parent_1.Packages.Roact);
local v3 = require(l_Parent_1.Packages.Framework);
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_UI_0 = v3.UI;
local l_ToggleButton_0 = l_UI_0.ToggleButton;
local l_TitledFrame_0 = l_UI_0.TitledFrame;
local l_TextInput_0 = l_UI_0.TextInput;
local v10 = require(l_Parent_0.Util.StateInterfaceTheme);
local v11 = nil;
local v12 = nil;
local v13 = v2.PureComponent:extend("AssetInput");
v13.init = function(v14)
    v14.onTextChanged = function(v15)
        v14.currentTextInputBoxText = v15;
    end;
    v14.onFocusLost = function()
        if v14.props.SetValue then
            v14.props.SetValue(v14.currentTextInputBoxText);
        end;
    end;
    v14.onValidateText = function(v16)
        local v17 = true;
        if v16 ~= "" then
            v17 = tonumber(v16) ~= nil;
        end;
        local v18 = nil;
        if not v17 then
            v18 = v14.props.Localization:getText("General", "NumberError");
        end;
        return v17, v18;
    end;
end;
v13.render = function(v19)
    local l_Localization_0 = v19.props.Localization;
    local l_Stylizer_0 = v19.props.Stylizer;
    v19.currentTextInputBoxText = v12(v19);
    local v22 = l_Localization_0:getText("General", "AvatarOverrideItem");
    local v23 = v11(v22, 22, Enum.Font.SourceSans);
    return v2.createElement(l_TitledFrame_0, {
        LayoutOrder = v19.props.LayoutOrder or 1, 
        Title = v19.props.Title
    }, {
        ToggleButton = v2.createElement(l_ToggleButton_0, {
            Enabled = v19.props.IsEnabled, 
            OnClick = v19.props.SetPlayerChoiceValue, 
            Selected = not v19.props.PlayerChoice
        }), 
        CustomItemLabel = v2.createElement("TextLabel", {
            Position = UDim2.new(0, 59, 0, 0), 
            Size = UDim2.new(0, v23.X, 0, 24), 
            BackgroundTransparency = 1, 
            TextColor3 = if not v10.getRadioButtonTextColor(v19.props) then l_Stylizer_0.fontStyle.Header.TextColor3 else v10.getRadioButtonTextColor(v19.props), 
            TextTransparency = (not v19.props.IsEnabled or v19.props.PlayerChoice) and 0.5 or 0, 
            Font = Enum.Font.SourceSans, 
            TextSize = 22, 
            Text = v22, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Center
        }), 
        InputBox = v2.createElement(l_TextInput_0, {
            Disabled = not v19.props.IsEnabled, 
            ErrorText = v19.props.ErrorMessage, 
            OnTextChanged = v19.onTextChanged, 
            OnFocusLost = v19.onFocusLost, 
            OnValidateText = v19.onValidateText, 
            PlaceholderText = l_Localization_0:getText("General", "AvatarOverrideId"), 
            Position = UDim2.new(0, (59 + v23.X) + 8, 0, 0), 
            Width = 175, 
            Text = v19.currentTextInputBoxText
        })
    });
end;
v13 = l_withContext_0({
    Localization = l_ContextServices_0.Localization, 
    Mouse = l_ContextServices_0.Mouse, 
    Stylizer = l_ContextServices_0.Stylizer
})(v13);
v11 = function(v24, v25, v26)
    return game:GetService("TextService"):GetTextSize(v24, v25, v26, (Vector2.new(5000, 5000)));
end;
v12 = function(v27)
    if not (v27.props.InputBoxText ~= nil) or v27.props.InputBoxText == "0" then
        return "";
    else
        return v27.props.InputBoxText;
    end;
end;
return v13;
