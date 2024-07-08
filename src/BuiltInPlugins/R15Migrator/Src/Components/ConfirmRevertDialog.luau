local l_script_FirstAncestor_0 = script:FindFirstAncestor("R15Migrator");
local v1 = require(l_script_FirstAncestor_0.Packages.Roact);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_ContextServices_0 = v2.ContextServices;
local l_UI_0 = v2.UI;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_StyledDialog_0 = l_UI_0.StyledDialog;
local v7 = v1.PureComponent:extend("ConfirmRevertDialog");
v7.render = function(v8)
    local l_props_0 = v8.props;
    local l_Localization_0 = l_props_0.Localization;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local l_OnConfirm_0 = l_props_0.OnConfirm;
    local l_OnClose_0 = l_props_0.OnClose;
    return v1.createElement(l_StyledDialog_0, {
        Style = "AcceptCancel", 
        Modal = true, 
        Title = l_Localization_0:getText("ScriptConversion", "RevertingScripts"), 
        MinContentSize = l_Stylizer_0.MinContentSize, 
        Buttons = {
            {
                Key = "Confirm", 
                Text = l_Localization_0:getText("ScriptConversion", "Confirm")
            }, 
            {
                Key = "Cancel", 
                Text = l_Localization_0:getText("ScriptConversion", "Cancel")
            }
        }, 
        OnButtonPressed = function(v14)
            if not (not (v14 == "Confirm") or not l_OnConfirm_0) then
                l_OnConfirm_0();
            end;
            if l_OnClose_0 then
                l_OnClose_0();
            end;
        end, 
        OnClose = l_OnClose_0
    }, {
        Contents = v1.createElement(l_TextLabel_0, {
            Text = l_Localization_0:getText("ScriptConversion", "RevertWarning"), 
            TextWrapped = true
        })
    });
end;
return (l_ContextServices_0.withContext({
    Localization = l_ContextServices_0.Localization, 
    Stylizer = l_ContextServices_0.Stylizer
})(v7));
