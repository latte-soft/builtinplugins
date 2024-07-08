local l_Parent_0 = script.Parent.Parent.Parent.Parent.Parent;
local _ = require(l_Parent_0.Src.Types);
local v2 = require(l_Parent_0.Packages.Roact);
local v3 = require(l_Parent_0.Packages.Framework);
local l_StyleModifier_0 = v3.Util.StyleModifier;
local l_withContext_0 = v3.ContextServices.withContext;
local l_Stylizer_0 = v3.Style.Stylizer;
local l_UI_0 = v3.UI;
local l_Button_0 = l_UI_0.Button;
local l_Image_0 = l_UI_0.Image;
local l_Tooltip_0 = l_UI_0.Tooltip;
local v11 = v2.PureComponent:extend("ActionButton");
v11.render = function(v12)
    local l_props_0 = v12.props;
    local l_ButtonSize_0 = l_props_0.Stylizer.ActionButton.ButtonSize;
    local v15 = nil;
    if not l_props_0.IsDisabled then
        if l_props_0.IsPressed then
            v15 = l_StyleModifier_0.Pressed;
        end;
    else
        v15 = l_StyleModifier_0.Disabled;
    end;
    return v2.createElement(l_Button_0, {
        LayoutOrder = l_props_0.LayoutOrder, 
        OnClick = l_props_0.OnClick, 
        Size = l_ButtonSize_0, 
        Style = "Round", 
        StyleModifier = v15
    }, {
        Image = v2.createElement(l_Image_0, {
            Style = l_props_0.ImageStyle, 
            StyleModifier = v15
        }), 
        Tooltip = v2.createElement(l_Tooltip_0, {
            Text = l_props_0.TooltipText
        })
    });
end;
return l_withContext_0({
    Stylizer = l_Stylizer_0
})(v11);
