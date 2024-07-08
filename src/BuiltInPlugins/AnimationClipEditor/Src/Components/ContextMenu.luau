local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Roact);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_ContextServices_0 = v2.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_showContextMenu_0 = v2.UI.showContextMenu;
local v6 = v1.PureComponent:extend("ContextMenu");
v6.showMenu = function(v7)
    local l_props_0 = v7.props;
    local l_Actions_0 = l_props_0.Actions;
    local v10 = l_props_0.Plugin:get();
    l_props_0.OnMenuOpened();
    l_showContextMenu_0(v10, l_Actions_0);
end;
v6.didMount = function(v11)
    v11:showMenu();
end;
v6.didUpdate = function(v12)
    v12:showMenu();
end;
v6.render = function(_)
    return nil;
end;
return (l_withContext_0({
    Plugin = l_ContextServices_0.Plugin
})(v6));
