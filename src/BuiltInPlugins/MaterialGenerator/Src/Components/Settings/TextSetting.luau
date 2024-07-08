local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Dash);
local v2 = require(l_Parent_0.Packages.Framework);
local v3 = require(l_Parent_0.Packages.React);
local l_withContext_0 = v2.ContextServices.withContext;
local l_Stylizer_0 = v2.Style.Stylizer;
local l_UI_0 = v2.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_TextInput_0 = l_UI_0.TextInput;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_Util_0 = v2.Util;
local l_StyleModifier_0 = l_Util_0.StyleModifier;
local l_prioritize_0 = l_Util_0.prioritize;
local v13 = require(l_Parent_0.Src.Flags.getFFlagMaterialGeneratorNewUI);
local v14 = v3.PureComponent:extend("TextSetting");
v14.defaultProps = {
    Disabled = false
};
v14.init = function(v15)
    if not v13() then
        v15.valueChanged = function(v16)
            local l_props_0 = v15.props;
            if l_props_0.OnValueChanged then
                l_props_0.OnValueChanged(v16);
            end;
        end;
        return ;
    else
        v15.textInputRef = v3.createRef();
        v15.focusLost = function(v18, v19)
            local l_props_1 = v15.props;
            if not v18 or v1.trim(v18) == "" then
                local l_current_0 = v15.textInputRef.current;
                if l_current_0 then
                    l_current_0.Text = l_props_1.Value;
                end;
                return ;
            else
                local l_v18_0 = v18;
                if not (not v19 or not l_props_1.OnValueChanged) then
                    if l_props_1.MaxLength and l_props_1.MaxLength < string.len(l_v18_0) then
                        l_v18_0 = string.sub(l_v18_0, 1, l_props_1.MaxLength);
                        local l_current_1 = v15.textInputRef.current;
                        if l_current_1 then
                            l_current_1.Text = l_v18_0;
                        end;
                    end;
                    l_props_1.OnValueChanged(l_v18_0);
                end;
                return ;
            end;
        end;
        return ;
    end;
end;
v14.render = function(v24)
    local l_props_2 = v24.props;
    local v26 = nil;
    v26 = if not v13() then l_props_2.Stylizer.Setting else {
        HorizontalSpacing = 16, 
        Size = UDim2.new(1, 0, 0, 30), 
        ValueLabelWidth = 30
    };
    local l_Disabled_0 = l_props_2.Disabled;
    local l_HorizontalSpacing_0 = v26.HorizontalSpacing;
    local l_LabelWidth_0 = l_props_2.LabelWidth;
    return v3.createElement(l_Pane_0, {
        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
        Layout = Enum.FillDirection.Horizontal, 
        LayoutOrder = l_props_2.LayoutOrder, 
        Size = l_prioritize_0(l_props_2.Size, v26.Size), 
        Spacing = l_HorizontalSpacing_0, 
        VerticalAlignment = Enum.VerticalAlignment.Center
    }, {
        Label = v3.createElement(l_TextLabel_0, {
            LayoutOrder = 1, 
            Size = UDim2.new(0, l_LabelWidth_0, 1, 0), 
            StyleModifier = if not l_Disabled_0 then nil else l_StyleModifier_0.Disabled, 
            Text = l_props_2.Text, 
            TextXAlignment = Enum.TextXAlignment.Left
        }), 
        TextInput = v3.createElement(l_TextInput_0, {
            Disabled = l_Disabled_0, 
            ForwardRef = v24.textInputRef, 
            LayoutOrder = 2, 
            OnTextChanged = if not v13() then v24.valueChanged else nil, 
            OnFocusLost = if not v13() then nil else v24.focusLost, 
            Size = UDim2.new(1, -(l_LabelWidth_0 + l_HorizontalSpacing_0), 1, 0), 
            Text = l_props_2.Value
        })
    });
end;
return l_withContext_0({
    Stylizer = l_Stylizer_0
})(v14);
