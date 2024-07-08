local l_script_FirstAncestor_0 = script:FindFirstAncestor("R15Migrator");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local _ = require(l_script_FirstAncestor_0.Packages.RoactRodux);
local v3 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local _ = v3.Dash.join;
local l_UI_0 = v3.UI;
local l_LinkText_0 = l_UI_0.LinkText;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_Tooltip_0 = l_UI_0.Tooltip;
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v12 = require(l_script_FirstAncestor_0.Src.Util.ScriptReplacement);
local v13 = v1.PureComponent:extend("ScriptLinkCell");
v13.init = function(v14)
    v14.onLinkClick = function()
        v12.goToScriptInstance(v14.props.Value.Script, v14.props.Value.Range);
    end;
end;
v13.render = function(v15)
    local _ = v15.state;
    local l_props_0 = v15.props;
    local l_Localization_0 = l_props_0.Localization;
    local l_Value_0 = l_props_0.Value;
    if not l_Value_0.Range then
        return v1.createElement(l_TextLabel_0, {
            Text = l_Value_0.Script:GetFullName(), 
            TextTruncate = Enum.TextTruncate.AtEnd, 
            TextXAlignment = Enum.TextXAlignment.Left
        }, {
            Tooltip = v1.createElement(l_Tooltip_0, {
                Text = l_Value_0.Script:GetFullName()
            })
        });
    else
        return v1.createElement(l_LinkText_0, {
            Text = l_Localization_0:getText("ScriptPane", "LineColumn", {
                line = l_Value_0.Range.startLine, 
                column = l_Value_0.Range.startCharacter
            }), 
            OnClick = v15.onLinkClick
        });
    end;
end;
return (l_withContext_0({
    Analytics = l_ContextServices_0.Analytics, 
    Localization = l_ContextServices_0.Localization, 
    Stylizer = v3.Style.Stylizer
})(v13));
