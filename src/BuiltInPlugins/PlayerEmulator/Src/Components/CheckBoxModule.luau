local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v2.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Checkbox_0 = v2.UI.Checkbox;
local v6 = v1.PureComponent:extend("CheckBoxModule");
v6.init = function(v7, v8)
    v7.onActivated = function()
        v8.CheckBoxCallback(v8.ItemKey);
    end;
end;
v6.render = function(v9)
    local l_props_0 = v9.props;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local l_Enabled_0 = l_props_0.Enabled;
    local l_ItemKey_0 = l_props_0.ItemKey;
    return v1.createElement("Frame", {
        Size = l_Stylizer_0.CHECKBOX_FRAME_SIZE, 
        BackgroundTransparency = 1
    }, {
        Padding = v1.createElement("UIPadding", {
            PaddingLeft = l_Stylizer_0.LISTITEM_INDENT_LEFT
        }), 
        CheckBox = v1.createElement(l_Checkbox_0, {
            Checked = l_props_0.Selected, 
            Disabled = not l_Enabled_0, 
            Key = l_ItemKey_0, 
            OnClick = v9.onActivated, 
            Text = l_ItemKey_0
        })
    });
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer
})(v6));
