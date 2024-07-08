local l_script_FirstAncestor_0 = script:FindFirstAncestor("R15Migrator");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local v2 = require(l_script_FirstAncestor_0.Packages.Roact);
local v3 = require(l_script_FirstAncestor_0.Packages.RoactRodux);
local l_ContextServices_0 = v1.ContextServices;
local v5 = require(l_script_FirstAncestor_0.Src.Thunks.ReplaceWithRules);
local v6 = require(l_script_FirstAncestor_0.Src.Thunks.RevertScripts);
local v7 = require(l_script_FirstAncestor_0.Src.Components.ConfirmRevertDialog);
local v8 = require(l_script_FirstAncestor_0.Src.Components.ScriptConversionConsole);
local v9 = require(l_script_FirstAncestor_0.Src.Contexts.ScriptConversionContext);
local v10 = require(l_script_FirstAncestor_0.Src.Util.showDialog);
local v11 = require(l_script_FirstAncestor_0.Src.Util.ScriptHistory.selectionHasScriptBackups);
local l_UI_0 = v1.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_Button_0 = l_UI_0.Button;
local l_Util_0 = v1.Util;
local l_StyleModifier_0 = l_Util_0.StyleModifier;
local l_LayoutOrderIterator_0 = l_Util_0.LayoutOrderIterator;
local v18 = v2.PureComponent:extend("ScriptConversionPaneFooter");
v18.init = function(v19)
    v19.onRevertClicked = function()
        local l_props_0 = v19.props;
        l_props_0.RevertScripts(l_props_0.ScriptConversionContext, l_props_0.Localization, l_props_0.Analytics);
    end;
    v19.openDialog = function()
        local l_props_1 = v19.props;
        v10(l_props_1.Plugin, l_props_1.Localization, v7, {
            OnConfirm = v19.onRevertClicked
        });
    end;
    v19.onConvertClicked = function()
        local l_props_2 = v19.props;
        l_props_2.ReplaceWithRules(l_props_2.ScriptConversionContext, l_props_2.Localization, true, l_props_2.Analytics);
    end;
    v19.revertEnabled = function()
        local l_props_3 = v19.props;
        return v11(l_props_3.selection, l_props_3.ScriptConversionContext);
    end;
end;
v18.render = function(v24)
    local l_props_4 = v24.props;
    local l_Localization_0 = l_props_4.Localization;
    local l_LayoutOrder_0 = l_props_4.LayoutOrder;
    local l_Stylizer_0 = l_props_4.Stylizer;
    local l_Size_0 = l_props_4.Size;
    local v30 = l_LayoutOrderIterator_0.new();
    return v2.createElement(l_Pane_0, {
        BackgroundColor = l_Stylizer_0.BackgroundColor, 
        LayoutOrder = l_LayoutOrder_0, 
        Size = l_Size_0, 
        Layout = Enum.FillDirection.Vertical, 
        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
        VerticalAlignment = Enum.VerticalAlignment.Top, 
        Spacing = l_Stylizer_0.Spacing, 
        Padding = l_Stylizer_0.ButtonPadding
    }, {
        ScriptConversionConsole = v2.createElement(v8, {
            LayoutOrder = v30:getNextOrder()
        }), 
        FooterButtons = v2.createElement(l_Pane_0, {
            LayoutOrder = v30:getNextOrder(), 
            Size = UDim2.fromScale(1, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            Layout = Enum.FillDirection.Horizontal, 
            HorizontalAlignment = Enum.HorizontalAlignment.Right, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            Spacing = l_Stylizer_0.ButtonSpacing
        }, {
            RevertButton = v2.createElement(l_Button_0, {
                Size = l_Stylizer_0.RevertButtonSize, 
                Text = l_Localization_0:getText("ScriptConversion", "Revert"), 
                OnClick = v24.openDialog, 
                StyleModifier = if v24.revertEnabled() then nil else l_StyleModifier_0.Disabled, 
                LayoutOrder = v30:getNextOrder()
            }), 
            ConvertButton = v2.createElement(l_Button_0, {
                Style = "RoundPrimary", 
                Size = l_Stylizer_0.ReplaceButtonSize, 
                Text = l_Localization_0:getText("ScriptConversion", "Replace"), 
                OnClick = v24.onConvertClicked, 
                LayoutOrder = v30:getNextOrder()
            })
        })
    });
end;
return v3.connect(function(v31, _)
    return {
        selection = v31.ScriptConversion.selection
    };
end, function(v33)
    return {
        ReplaceWithRules = function(v34, v35, v36, v37)
            v33(v5(v34, v35, v36, v37));
        end, 
        RevertScripts = function(v38, v39, v40)
            v33(v6(v38, v39, v40));
        end
    };
end)((l_ContextServices_0.withContext({
    Analytics = l_ContextServices_0.Analytics, 
    Plugin = l_ContextServices_0.Plugin, 
    Localization = l_ContextServices_0.Localization, 
    Stylizer = l_ContextServices_0.Stylizer, 
    ScriptConversionContext = v9
})(v18)));
