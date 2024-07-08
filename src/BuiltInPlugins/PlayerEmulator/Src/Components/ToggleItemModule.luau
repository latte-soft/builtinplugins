local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v2.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_UI_0 = v2.UI;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_ToggleButton_0 = l_UI_0.ToggleButton;
local l_StyleModifier_0 = v2.Util.StyleModifier;
local v9 = v1.PureComponent:extend("ToggleItemModule");
v9.init = function(v10, v11)
    v10.onToggle = function(v12)
        if v10.props.Enabled then
            v11.ToggleCallback(v11.Key, v12, v11.Plugin:get());
        end;
    end;
end;
v9.render = function(v13)
    local l_props_0 = v13.props;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local l_Key_0 = l_props_0.Key;
    local l_IsOn_0 = l_props_0.IsOn;
    local l_Enabled_0 = l_props_0.Enabled;
    return v1.createElement("Frame", {
        Size = l_Stylizer_0.TOGGLE_ITEM_FRAME_SIZE, 
        BackgroundTransparency = 1
    }, {
        TextLabel = v1.createElement(l_TextLabel_0, {
            AutomaticSize = Enum.AutomaticSize.XY, 
            StyleModifier = if not l_Enabled_0 then l_StyleModifier_0.Disabled else nil, 
            Text = l_Key_0
        }), 
        Toggle = v1.createElement(l_ToggleButton_0, {
            AnchorPoint = Vector2.new(0, 0.5), 
            Disabled = not l_Enabled_0, 
            OnClick = v13.onToggle, 
            Position = UDim2.new(0, l_Stylizer_0.TOGGLE_BUTTON_OFFSET, 0.5, -l_Stylizer_0.TOGGLE_BUTTON_HEIGHT / 2), 
            Selected = l_IsOn_0
        })
    });
end;
return (l_withContext_0({
    Plugin = l_ContextServices_0.Plugin, 
    Stylizer = l_ContextServices_0.Stylizer
})(v9));
