local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v2.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_UI_0 = v2.UI;
local l_TextInput_0 = l_UI_0.TextInput;
local l_TitledFrame_0 = l_UI_0.TitledFrame;
local v8 = v1.PureComponent:extend("TextInput");
v8.render = function(v9)
    local l_props_0 = v9.props;
    local l_Label_0 = l_props_0.Label;
    local v12 = l_props_0.Text or "";
    local l_LayoutOrder_0 = l_props_0.LayoutOrder;
    local l_OnChange_0 = l_props_0.OnChange;
    local l_Sizes_0 = l_props_0.Stylizer.Sizes;
    return v1.createElement(l_TitledFrame_0, {
        Title = l_Label_0, 
        LayoutOrder = l_LayoutOrder_0
    }, {
        TextBox = v1.createElement(l_TextInput_0, {
            Size = UDim2.fromOffset(l_Sizes_0.TextBoxWidth, l_Sizes_0.ShortHeight), 
            Position = UDim2.new(0.1, 0, 0, 0), 
            Text = v12, 
            OnTextChanged = l_OnChange_0
        })
    });
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer
})(v8));
