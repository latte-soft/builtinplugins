local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Dash);
local l_FitFrameOnAxis_0 = require(l_Parent_0.Packages.FitFrame).FitFrameOnAxis;
local v3 = require(l_Parent_0.Packages.Roact);
local v4 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v4.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_UI_0 = v4.UI;
local l_Checkbox_0 = l_UI_0.Checkbox;
local l_RadioButton_0 = l_UI_0.RadioButton;
local l_LayoutOrderIterator_0 = v4.Util.LayoutOrderIterator;
local v11 = require(l_Parent_0.Src.Utility.AlignmentSpace);
local l_join_0 = v1.join;
local v13 = v3.PureComponent:extend("AxesSettingsFragment");
v13.init = function(v14, v15)
    assert(type(v15.AlignmentSpace) == "string", "Missing required property AlignmentSpace.");
    assert(type(v15.EnabledAxes) == "table", "Missing required property EnabledAxes.");
    assert(type(v15.OnAlignmentSpaceChanged) == "function", "Missing required property OnAlignmentSpaceChanged.");
    assert(type(v15.OnEnabledAxesChanged) == "function", "Missing required property OnEnabledAxesChanged.");
    v14.setAlignmentSpace = function(v16)
        local l_props_0 = v14.props;
        if l_props_0.OnAlignmentSpaceChanged then
            l_props_0.OnAlignmentSpaceChanged(v16);
        end;
    end;
    v14.toggleAxis = function(v18)
        local l_props_1 = v14.props;
        if l_props_1.OnEnabledAxesChanged then
            l_props_1.OnEnabledAxesChanged((l_join_0(l_props_1.EnabledAxes, {
                [v18] = not l_props_1.EnabledAxes[v18]
            })));
        end;
    end;
end;
v13.render = function(v20)
    local l_props_2 = v20.props;
    local l_EnabledAxes_0 = l_props_2.EnabledAxes;
    local l_Localization_0 = l_props_2.Localization;
    local l_Stylizer_0 = l_props_2.Stylizer;
    local v25 = l_LayoutOrderIterator_0.new();
    local v26 = {};
    for _, v28 in ipairs({
        "X", 
        "Y", 
        "Z"
    }) do
        v26[v28] = v3.createElement(l_Checkbox_0, {
            Key = v28, 
            Checked = not not l_EnabledAxes_0 and (l_EnabledAxes_0[v28] or false), 
            Disabled = false, 
            LayoutOrder = v25:getNextOrder(), 
            Text = l_Localization_0:getText("AxesSettingsFragment", v28), 
            OnClick = v20.toggleAxis
        });
    end;
    local function v31(v29, v30)
        return v3.createElement(l_RadioButton_0, {
            Disabled = false, 
            Key = v29, 
            LayoutOrder = v30, 
            Selected = l_props_2.AlignmentSpace == v29, 
            Text = l_Localization_0:getText("AxesSettingsFragment", v29), 
            OnClick = v20.setAlignmentSpace
        });
    end;
    return v3.createFragment({
        AlignmentSpaceButtons = v3.createElement(l_FitFrameOnAxis_0, {
            axis = l_FitFrameOnAxis_0.Axis.Both, 
            contentPadding = l_Stylizer_0.SectionContentPadding, 
            BackgroundTransparency = 1, 
            FillDirection = Enum.FillDirection.Horizontal, 
            LayoutOrder = 1
        }, {
            WorldSpaceButton = v31(v11.World, 1), 
            LocalSpaceButton = v31(v11.Local, 2)
        }), 
        AxisCheckboxes = v3.createElement(l_FitFrameOnAxis_0, {
            axis = l_FitFrameOnAxis_0.Axis.Both, 
            contentPadding = l_Stylizer_0.SectionContentPadding, 
            BackgroundTransparency = 1, 
            FillDirection = Enum.FillDirection.Horizontal, 
            LayoutOrder = 1
        }, v26)
    });
end;
return (l_withContext_0({
    Localization = l_ContextServices_0.Localization, 
    Stylizer = l_ContextServices_0.Stylizer
})(v13));
