local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v2.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Analytics_0 = l_ContextServices_0.Analytics;
local l_Localization_0 = l_ContextServices_0.Localization;
local l_Stylizer_0 = v2.Style.Stylizer;
local l_UI_0 = v2.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_TextInput_0 = l_UI_0.TextInput;
local l_LayoutOrderIterator_0 = v2.Util.LayoutOrderIterator;
local v12 = require(script.Parent.ColorStringValidators);
local v13 = v1.PureComponent:extend("ColorPropertiesPanel");
v13.init = function(v14)
    v14.onFocusLostHex = function()
        if v14.lastHexValid then
            v14.props.OnTextChangedHex(v14.lastHex);
        end;
    end;
    v14.onFocusLostRGB = function()
        if v14.lastRGBValid then
            v14.props.OnTextChangedRGB(v14.lastRGB);
        end;
    end;
    v14.onFocusLostHSV = function()
        if v14.lastHSVValid then
            v14.props.OnTextChangedHSV(v14.lastHSV);
        end;
    end;
    v14.onTextChangedHex = function(v15, v16)
        v14.lastHexValid = v16;
        v14.lastHex = v15;
    end;
    v14.onTextChangedRGB = function(v17, v18)
        v14.lastRGBValid = v18;
        v14.lastRGB = v17;
    end;
    v14.onTextChangedHSV = function(v19, v20)
        v14.lastHSVValid = v20;
        v14.lastHSV = v19;
    end;
end;
v13.render = function(v21)
    local l_props_0 = v21.props;
    local l_ColorPropertiesPanel_0 = l_props_0.Stylizer.ColorPropertiesPanel;
    local l_Localization_1 = l_props_0.Localization;
    local v25 = l_LayoutOrderIterator_0.new();
    local l_Hue_0 = l_props_0.Hue;
    local l_Saturation_0 = l_props_0.Saturation;
    local l_Value_0 = l_props_0.Value;
    local l_Color_0 = l_props_0.Color;
    local l_r_0 = l_Color_0.r;
    local l_g_0 = l_Color_0.g;
    local l_b_0 = l_Color_0.b;
    return v1.createElement(l_Pane_0, {
        Size = l_ColorPropertiesPanel_0.Size, 
        AutomaticSize = Enum.AutomaticSize.Y, 
        Layout = Enum.FillDirection.Vertical, 
        LayoutOrder = l_props_0.LayoutOrder, 
        Spacing = l_ColorPropertiesPanel_0.Spacing
    }, {
        Hex = v1.createElement(l_TextInput_0, {
            Size = l_ColorPropertiesPanel_0.TextInputSize, 
            Text = string.format("#%02x%02x%02x", l_r_0 * 255, l_g_0 * 255, l_b_0 * 255), 
            BottomText = l_Localization_1:getText("ColorPicker", "Hex"), 
            LayoutOrder = v25:getNextOrder(), 
            Style = "ColorTextInput", 
            OnFocusLost = v21.onFocusLostHex, 
            OnValidateText = v12.validateHex, 
            OnTextChanged = v21.onTextChangedHex
        }), 
        RGB = v1.createElement(l_TextInput_0, {
            Size = l_ColorPropertiesPanel_0.TextInputSize, 
            Text = ("%d, %d, %d"):format(l_r_0 * 255, l_g_0 * 255, l_b_0 * 255), 
            LayoutOrder = v25:getNextOrder(), 
            BottomText = l_Localization_1:getText("ColorPicker", "RGB"), 
            Style = "ColorTextInput", 
            OnFocusLost = v21.onFocusLostRGB, 
            OnValidateText = v12.validateRGB, 
            OnTextChanged = v21.onTextChangedRGB
        }), 
        HSV = v1.createElement(l_TextInput_0, {
            Size = l_ColorPropertiesPanel_0.TextInputSize, 
            Text = ("%d, %d, %d"):format(l_Hue_0 * 360, l_Saturation_0 * 100, l_Value_0 * 100), 
            BottomText = l_Localization_1:getText("ColorPicker", "HSV"), 
            LayoutOrder = v25:getNextOrder(), 
            Style = "ColorTextInput", 
            OnFocusLost = v21.onFocusLostHSV, 
            OnValidateText = v12.validateHSV, 
            OnTextChanged = v21.onTextChangedHSV
        })
    });
end;
return (l_withContext_0({
    Analytics = l_Analytics_0, 
    Localization = l_Localization_0, 
    Stylizer = l_Stylizer_0
})(v13));
