local l_TextService_0 = game:GetService("TextService");
local l_Parent_0 = script.Parent.Parent.Parent;
local v2 = require(l_Parent_0.Packages.Roact);
local v3 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v3.ContextServices;
local l_UI_0 = v3.UI;
local l_Button_0 = l_UI_0.Button;
local l_Pane_0 = l_UI_0.Pane;
local l_DEPRECATED_TextInput_0 = l_UI_0.DEPRECATED_TextInput;
local l_StyleModifier_0 = v3.Util.StyleModifier;
local v10 = require(script.Parent.Parent.Constants);
local v11 = v2.PureComponent:extend("AddGroup");
v11.init = function(v12)
    v12.textBoxRef = v2.createRef();
    v12.text = "";
    v12.state = {
        editing = false
    };
end;
v11.render = function(v13)
    local l_props_0 = v13.props;
    local l_Localization_0 = l_props_0.Localization;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local v17 = v10.GroupCountMax <= #l_props_0.Groups;
    if not (not v17 or not v13.state.editing) then
        v13:setState({
            editing = false
        });
    end;
    local v18 = "+ " .. l_Localization_0:getText("Actions", "AddGroup");
    local v19 = "+ " .. l_Localization_0:getText("Info", "NewGroupName");
    local l_Font_0 = l_Stylizer_0.Font;
    local l_TextSize_0 = l_Stylizer_0.TextSize;
    return v2.createElement(l_Pane_0, {
        Size = UDim2.new(0, math.max(v10.ControlsHeaderButtonWidth, math.ceil(l_TextService_0:GetTextSize(v18, l_TextSize_0, l_Font_0, Vector2.new(0, 0)).X + 2), (math.ceil(l_TextService_0:GetTextSize(v19, l_TextSize_0, l_Font_0, Vector2.new(0, 0)).X + 2))), 1, 0), 
        LayoutOrder = l_props_0.LayoutOrder, 
        Layout = Enum.FillDirection.Horizontal, 
        HorizontalAlignment = Enum.HorizontalAlignment.Center
    }, {
        AddButton = not v13.state.editing and v2.createElement(l_Button_0, {
            Style = "Round", 
            Text = v18, 
            StyleModifier = if not v17 then nil else l_StyleModifier_0.Disabled, 
            Size = UDim2.new(1, 0, 1, 0), 
            TextWrapped = true, 
            OnClick = function()
                v13:setState({
                    editing = true
                });
                if v13.textBoxRef:getValue() ~= nil then
                    v13.textBoxRef:getValue():CaptureFocus();
                end;
                l_props_0.OnEditingChanged(true);
            end
        }), 
        TextInput = v13.state.editing and v2.createElement(l_DEPRECATED_TextInput_0, {
            Size = UDim2.new(1, 0, 1, 0), 
            TextXAlignment = Enum.TextXAlignment.Center, 
            PlaceholderText = v19, 
            ForwardRef = v13.textBoxRef, 
            OnTextChanged = function(v22)
                v13.text = v22;
            end, 
            OnFocusLost = function(v23)
                local v24 = string.gsub(v13.text, "^%s+", "");
                local v25 = false;
                v25 = v24 == "Default";
                if not (v23 and v24 ~= "") or v25 then
                    v13:setState({
                        editing = false
                    });
                    l_props_0.OnEditingChanged(false);
                else
                    l_props_0.OnGroupAdded(v24);
                    if v13.textBoxRef:getValue() ~= nil then
                        v13.textBoxRef:getValue():CaptureFocus();
                    end;
                end;
                if v13.textBoxRef:getValue() ~= nil then
                    v13.textBoxRef:getValue().Text = "";
                end;
            end
        })
    });
end;
return (l_ContextServices_0.withContext({
    Stylizer = l_ContextServices_0.Stylizer, 
    Localization = l_ContextServices_0.Localization
})(v11));
