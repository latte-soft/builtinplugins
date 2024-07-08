local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Roact);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_ContextServices_0 = v2.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local _ = l_ContextServices_0.Localization;
local l_Tooltip_0 = v2.UI.Tooltip;
local v7 = v1.PureComponent:extend("Tooltip");
v7.render = function(v8)
    local l_props_0 = v8.props;
    local l_Text_0 = l_props_0.Text;
    local l_TextKey_0 = l_props_0.TextKey;
    local l_ShowDelay_0 = l_props_0.ShowDelay;
    local l_Priority_0 = l_props_0.Priority;
    local l_Localization_1 = v8.props.Localization;
    assert(l_Text_0 or l_TextKey_0, "Expected either a Text or TextKey prop.");
    local v15 = nil;
    if not l_Text_0 then
        if l_TextKey_0 then
            v15 = l_Localization_1:getText("Tooltip", l_TextKey_0);
        end;
    else
        v15 = l_Text_0;
    end;
    return v1.createElement(l_Tooltip_0, {
        Text = v15, 
        ShowDelay = l_ShowDelay_0, 
        Enabled = true, 
        Priority = l_Priority_0 or -100
    });
end;
return (l_withContext_0({
    Localization = l_ContextServices_0.Localization
})(v7));
