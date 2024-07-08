local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v2.ContextServices;
local l_DEPRECATED_TextInput_0 = v2.UI.DEPRECATED_TextInput;
local v5 = v1.Component:extend("GroupRenameTextBox");
v5.init = function(v6)
    v6.textBoxRef = v1.createRef();
    v6.enteredText = "";
end;
v5.render = function(v7)
    local l_props_0 = v7.props;
    local _ = l_props_0.Stylizer;
    local l_Localization_0 = l_props_0.Localization;
    local _ = l_props_0.Group;
    return v1.createElement(l_DEPRECATED_TextInput_0, {
        Size = l_props_0.Size, 
        LayoutOrder = l_props_0.LayoutOrder, 
        BackgroundTransparency = 1, 
        TextWrapped = true, 
        ShouldFocus = true, 
        TextXAlignment = Enum.TextXAlignment.Right, 
        ForwardRef = v7.textBoxRef, 
        PlaceholderText = l_Localization_0:getText("Info", "NewGroupName"), 
        OnTextChanged = function(v12)
            v7.text = v12;
        end, 
        OnFocusLost = function(v13)
            if not v13 then
                l_props_0.Group.OnRenamed();
                return ;
            else
                l_props_0.Group.OnRenamed(v7.text);
                return ;
            end;
        end
    });
end;
v5.didMount = function(v14)
    v14.textBoxRef.current:CaptureFocus();
end;
return (l_ContextServices_0.withContext({
    Stylizer = l_ContextServices_0.Stylizer, 
    Localization = l_ContextServices_0.Localization
})(v5));
