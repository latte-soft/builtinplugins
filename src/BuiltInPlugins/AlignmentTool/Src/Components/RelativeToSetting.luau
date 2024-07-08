local l_Parent_0 = script.Parent.Parent.Parent;
local l_FitFrameOnAxis_0 = require(l_Parent_0.Packages.FitFrame).FitFrameOnAxis;
local v2 = require(l_Parent_0.Packages.Roact);
local v3 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_UI_0 = v3.UI;
local l_Container_0 = l_UI_0.Container;
local l_Image_0 = l_UI_0.Image;
local l_RadioButton_0 = l_UI_0.RadioButton;
local l_Tooltip_0 = l_UI_0.Tooltip;
local v11 = require(l_Parent_0.Src.Utility.RelativeTo);
local v12 = v2.PureComponent:extend("RelativeToSetting");
v12.defaultProps = {
    Value = v11.Selection, 
    OnValueChanged = function()
    end
};
v12.init = function(_, v14)
    assert(type(v14.Value) == "string", "Missing required property Value.");
    assert(type(v14.OnValueChanged) == "function", "Missing required property OnValueChanged.");
end;
v12.render = function(v15)
    local l_props_0 = v15.props;
    local l_Localization_0 = l_props_0.Localization;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local function v21(v19, v20)
        return v2.createElement(l_RadioButton_0, {
            Disabled = false, 
            Key = v19, 
            LayoutOrder = v20, 
            Selected = v19 == l_props_0.Value, 
            Text = l_Localization_0:getText("RelativeToSection", v19), 
            OnClick = l_props_0.OnValueChanged
        });
    end;
    return v2.createElement(l_FitFrameOnAxis_0, {
        axis = l_FitFrameOnAxis_0.Axis.Both, 
        contentPadding = l_Stylizer_0.SectionContentPaddingCompact, 
        BackgroundTransparency = 1, 
        FillDirection = Enum.FillDirection.Vertical
    }, {
        SelectionRadioButton = v21(v11.Selection, 1), 
        ActiveRadioButton = v2.createElement(l_FitFrameOnAxis_0, {
            axis = l_FitFrameOnAxis_0.Axis.Both, 
            contentPadding = l_Stylizer_0.RelativeToSetting.HelpIconPadding, 
            BackgroundTransparency = 1, 
            FillDirection = Enum.FillDirection.Horizontal, 
            LayoutOrder = 2
        }, {
            RadioButton = v21(v11.Active, 1), 
            HelpIcon = v2.createElement(l_Container_0, {
                LayoutOrder = 2, 
                Size = UDim2.new(0, 22, 1, 0)
            }, {
                Icon = v2.createElement(l_Image_0, {
                    Style = "HelpIcon"
                }), 
                Tooltip = v2.createElement(l_Tooltip_0, {
                    Text = l_Localization_0:getText("RelativeToSection", "ActiveObjectTooltip")
                })
            })
        })
    });
end;
return (l_withContext_0({
    Localization = l_ContextServices_0.Localization, 
    Stylizer = l_ContextServices_0.Stylizer
})(v12));
