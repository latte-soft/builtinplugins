local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.RoactRodux);
local l_ContextServices_0 = require(l_Parent_0.Packages.Framework).ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v5 = require(l_Parent_0.Src.Actions.SetAlignmentMode);
local v6 = require(l_Parent_0.Src.Actions.SetAlignmentSpace);
local v7 = require(l_Parent_0.Src.Actions.SetEnabledAxes);
local v8 = require(l_Parent_0.Src.Actions.SetRelativeTo);
local v9 = require(l_Parent_0.Src.Components.AxesSettingsFragment);
local v10 = require(l_Parent_0.Src.Components.ModeSetting);
local v11 = require(l_Parent_0.Src.Components.LabeledElementList);
local v12 = require(l_Parent_0.Src.Components.RelativeToSetting);
local v13 = require(l_Parent_0.Src.Thunks.UpdateActiveInstanceHighlight);
local v14 = require(l_Parent_0.Src.Thunks.UpdateAlignEnabled);
local v15 = v1.PureComponent:extend("AlignmentSettings");
v15.render = function(v16)
    local l_props_0 = v16.props;
    local l_Localization_0 = l_props_0.Localization;
    return v1.createElement(v11, {
        Collapsible = true, 
        Items = {
            {
                Text = l_Localization_0:getText("ModeSection", "Title"), 
                TextYAlignment = Enum.TextYAlignment.Center, 
                Content = v1.createElement(v10, {
                    Value = l_props_0.alignmentMode, 
                    OnValueChanged = l_props_0.setAlignmentMode
                })
            }, 
            {
                Text = l_Localization_0:getText("AxesSection", "Title"), 
                Content = v1.createElement(v9, {
                    AlignmentSpace = l_props_0.alignmentSpace, 
                    EnabledAxes = l_props_0.enabledAxes, 
                    OnAlignmentSpaceChanged = l_props_0.setAlignmentSpace, 
                    OnEnabledAxesChanged = l_props_0.setEnabledAxes
                })
            }, 
            {
                Text = l_Localization_0:getText("RelativeToSection", "Title"), 
                Content = v1.createElement(v12, {
                    Value = l_props_0.relativeTo, 
                    OnValueChanged = l_props_0.setRelativeTo
                })
            }
        }, 
        LayoutOrder = l_props_0.LayoutOrder, 
        MaximumLabelWidth = l_props_0.Stylizer.MaximumLabelWidth
    });
end;
return v2.connect(function(v19, _)
    return {
        alignmentMode = v19.alignmentMode, 
        alignmentSpace = v19.alignmentSpace, 
        enabledAxes = v19.enabledAxes, 
        relativeTo = v19.relativeTo
    };
end, function(v21)
    return {
        setAlignmentMode = function(v22)
            v21(v5(v22));
            v21(v14());
        end, 
        setAlignmentSpace = function(v23)
            v21(v6(v23));
            v21(v14());
        end, 
        setEnabledAxes = function(v24)
            v21(v7(v24));
            v21(v14());
        end, 
        setRelativeTo = function(v25)
            v21(v8(v25));
            v21(v14());
            v21(v13());
        end
    };
end)((l_withContext_0({
    Localization = l_ContextServices_0.Localization, 
    Stylizer = l_ContextServices_0.Stylizer
})(v15)));
