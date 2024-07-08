local l_script_FirstAncestor_0 = script:FindFirstAncestor("R15Migrator");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local v2 = require(l_script_FirstAncestor_0.Packages.Roact);
local v3 = require(l_script_FirstAncestor_0.Packages.RoactRodux);
local l_UI_0 = v1.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_Button_0 = l_UI_0.Button;
local l_Util_0 = v1.Util;
local _ = l_Util_0.StyleModifier;
local l_LayoutOrderIterator_0 = l_Util_0.LayoutOrderIterator;
local l_ContextServices_0 = v1.ContextServices;
local v11 = require(l_script_FirstAncestor_0.Src.Contexts.ScriptConversionContext);
local l_AnimationConversion_0 = l_script_FirstAncestor_0.Src.Util.AnimationConversion;
local _ = require(l_AnimationConversion_0.AnimationConversionManager);
local _ = require(l_AnimationConversion_0.constants).AssetType;
local l_Thunks_0 = l_script_FirstAncestor_0.Src.Thunks;
local v16 = require(l_Thunks_0.ConvertAnimation);
local v17 = require(l_Thunks_0.UploadTestAnimations);
local v18 = require(l_Thunks_0.RevertAnimation);
local v19 = v2.PureComponent:extend("ReplaceRevertButtons");
v19.render = function(v20)
    local l_props_0 = v20.props;
    local _ = l_props_0.selection;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local l_Localization_0 = l_props_0.Localization;
    local v25 = l_LayoutOrderIterator_0.new();
    return v2.createElement(l_Pane_0, {
        Layout = Enum.FillDirection.Horizontal, 
        HorizontalAlignment = Enum.HorizontalAlignment.Right, 
        VerticalAlignment = Enum.VerticalAlignment.Top, 
        Spacing = l_Stylizer_0.Spacing, 
        AutomaticSize = Enum.AutomaticSize.XY
    }, {
        Revert = v2.createElement(l_Button_0, {
            Style = "Round", 
            Text = l_Localization_0:getText("AnimationConversion", "Revert"), 
            Size = l_Stylizer_0.ButtonSize, 
            OnClick = function()
                v20.props.revertAnimation(l_props_0.ScriptConversionContext);
            end, 
            LayoutOrder = v25:getNextOrder()
        }), 
        Replace = v2.createElement(l_Button_0, {
            Style = "RoundPrimary", 
            Text = l_Localization_0:getText("AnimationConversion", "Replace"), 
            Size = l_Stylizer_0.ButtonSize, 
            OnClick = function()
                v20.props.convertAnimation(l_props_0.ScriptConversionContext, l_props_0.Analytics);
            end, 
            LayoutOrder = v25:getNextOrder()
        })
    });
end;
return v3.connect(function(v26, _)
    return {
        selection = v26.AnimationConversion.selection
    };
end, function(v28)
    return {
        convertAnimation = function(v29, v30)
            v28(v16(v29, v30));
        end, 
        revertAnimation = function(v31)
            v28(v18(v31));
        end, 
        uploadTestAnimations = function(v32)
            v28(v17(v32));
        end
    };
end)((l_ContextServices_0.withContext({
    Analytics = l_ContextServices_0.Analytics, 
    Stylizer = l_ContextServices_0.Stylizer, 
    Localization = l_ContextServices_0.Localization, 
    ScriptConversionContext = v11
})(v19)));
