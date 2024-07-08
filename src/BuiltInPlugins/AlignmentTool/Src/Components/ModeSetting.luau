local l_Parent_0 = script.Parent.Parent.Parent;
local l_FitFrameOnAxis_0 = require(l_Parent_0.Packages.FitFrame).FitFrameOnAxis;
local v2 = require(l_Parent_0.Packages.Roact);
local v3 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_UI_0 = v3.UI;
local l_Button_0 = l_UI_0.Button;
local l_Image_0 = l_UI_0.Image;
local l_Tooltip_0 = l_UI_0.Tooltip;
local l_Util_0 = v3.Util;
local l_StyleModifier_0 = l_Util_0.StyleModifier;
local l_LayoutOrderIterator_0 = l_Util_0.LayoutOrderIterator;
local v13 = require(l_Parent_0.Src.Utility.AlignmentMode);
local v14 = v2.PureComponent:extend("ModeSetting");
v14.defaultProps = {
    LayoutOrder = 1, 
    Value = v13.Center, 
    OnValueChanged = function()
    end
};
v14.init = function(_, v16)
    assert(type(v16.Value) == "string", "Missing required property Value.");
    assert(type(v16.OnValueChanged) == "function", "Missing required property OnValueChanged.");
end;
v14.render = function(v17)
    local l_props_0 = v17.props;
    local l_Localization_0 = l_props_0.Localization;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local v21 = l_LayoutOrderIterator_0.new();
    local function v24(v22, v23)
        return v2.createElement(l_Button_0, {
            LayoutOrder = v21:getNextOrder(), 
            Size = UDim2.fromOffset(32, 32), 
            StyleModifier = not not (v22 == l_props_0.Value) and l_StyleModifier_0.Selected or nil, 
            Style = "Selectable", 
            OnClick = function()
                l_props_0.OnValueChanged(v22);
            end
        }, {
            Image = v2.createElement(l_Image_0, {
                Style = {
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    Image = v23, 
                    Position = UDim2.new(0.5, 0, 0.5, 0), 
                    Size = UDim2.fromOffset(24, 24)
                }
            }), 
            Tooltip = v2.createElement(l_Tooltip_0, {
                Text = l_Localization_0:getText("ModeSection", v22)
            })
        });
    end;
    local v25 = {};
    for _, v27 in ipairs(l_Stylizer_0.ModeButtons) do
        local l_Mode_0 = v27.Mode;
        v25[tostring(l_Mode_0)] = v24(l_Mode_0, v27.Image);
    end;
    return v2.createElement(l_FitFrameOnAxis_0, {
        axis = l_FitFrameOnAxis_0.Axis.Both, 
        contentPadding = UDim.new(0, 2), 
        BackgroundTransparency = 1, 
        FillDirection = Enum.FillDirection.Horizontal, 
        LayoutOrder = l_props_0.LayoutOrder
    }, v25);
end;
return (l_withContext_0({
    Localization = l_ContextServices_0.Localization, 
    Stylizer = l_ContextServices_0.Stylizer
})(v14));
