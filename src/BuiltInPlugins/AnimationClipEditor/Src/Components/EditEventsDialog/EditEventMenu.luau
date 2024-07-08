local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Roact);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local v3 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local l_ContextServices_0 = v2.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v6 = require(l_script_FirstAncestor_0.Src.Components.ContextMenu);
local v7 = v1.PureComponent:extend("EditEventMenu");
v7.makeMenuActions = function(v8, v9)
    local l_props_0 = v8.props;
    local v11 = {};
    local function v13(v12)
        l_props_0.OnMenuItemClicked(v12.Data);
    end;
    table.insert(v11, {
        Text = v9:getText("ContextMenu", "EditEventName"), 
        Data = v3.ACTION_KEYS.Edit, 
        OnItemClicked = v13
    });
    table.insert(v11, {
        Text = v9:getText("ContextMenu", "DeleteAllSameEvents"), 
        Data = v3.ACTION_KEYS.Delete, 
        OnItemClicked = v13
    });
    return v11;
end;
v7.render = function(v14)
    local l_Localization_0 = v14.props.Localization;
    local l_props_1 = v14.props;
    return not not l_props_1.ShowMenu and v1.createElement(v6, {
        Actions = v14:makeMenuActions(l_Localization_0), 
        OnMenuOpened = l_props_1.OnMenuOpened
    }) or nil;
end;
return (l_withContext_0({
    Localization = l_ContextServices_0.Localization
})(v7));
