local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.React);
local l_DEPRECATED_TextInput_0 = require(l_Parent_0.Packages.Framework).UI.DEPRECATED_TextInput;
local v3 = v1.Component:extend("ValueEditTextBox");
v3.init = function(v4)
    v4.textBoxRef = v1.createRef();
    v4.enteredText = "";
    v4.onTextChanged = function(v5)
        v4.enteredText = v5;
    end;
    v4.onFocusLost = function(v6)
        local l_props_0 = v4.props;
        local l_enteredText_0 = v4.enteredText;
        if v6 and l_enteredText_0 ~= "" then
            l_props_0.OnTextConfirmed(l_enteredText_0);
        end;
        l_props_0.OnEditCanceled();
    end;
end;
v3.render = function(v9)
    local l_props_1 = v9.props;
    return v1.createElement(l_DEPRECATED_TextInput_0, {
        Size = l_props_1.Size, 
        Style = "FilledRoundedBorder", 
        LayoutOrder = l_props_1.LayoutOrder, 
        TextWrapped = true, 
        ShouldFocus = true, 
        TextXAlignment = Enum.TextXAlignment.Left, 
        ForwardRef = v9.textBoxRef, 
        PlaceholderText = l_props_1.Text, 
        OnTextChanged = v9.onTextChanged, 
        OnFocusLost = v9.onFocusLost
    });
end;
v3.didMount = function(v11)
    v11.textBoxRef.current:CaptureFocus();
end;
return v3;
