local l_script_FirstAncestor_0 = script:FindFirstAncestor("R15Migrator");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_ContextServices_0 = v2.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Dash_0 = v2.Dash;
local l_append_0 = l_Dash_0.append;
local _ = l_Dash_0.join;
local l_map_0 = l_Dash_0.map;
local l_UI_0 = v2.UI;
local l_IconButton_0 = l_UI_0.IconButton;
local l_showContextMenu_0 = l_UI_0.showContextMenu;
local _ = l_script_FirstAncestor_0.Src.Actions;
local _ = l_script_FirstAncestor_0.Src.Components;
local _ = require(l_script_FirstAncestor_0.Src.Util.ScriptReplacement);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local _ = l_script_FirstAncestor_0.Src.Util;
local v17 = v1.PureComponent:extend("ScriptFilterButton");
local function v23(v18, v19, v20, v21, v22)
    return {
        Text = v22 or v18 .. " " .. v19, 
        Checked = v20[v18] and v20[v18][v19], 
        Data = {
            RigType = v18, 
            InstanceName = v19
        }, 
        OnItemClicked = v21
    };
end;
v17.init = function(v24)
    v24.showMenu = function()
        local l_props_0 = v24.props;
        local l_Localization_0 = l_props_0.Localization;
        l_showContextMenu_0(l_props_0.Plugin:get(), (l_append_0(l_map_0(l_props_0.InstanceNames, function(v27)
            return (v23("R6", v27, l_props_0.Filters, l_props_0.OnFilterSelected));
        end), {
            {
                ShowSeparator = true
            }, 
            v23("R15", "Unassigned", l_props_0.Filters, l_props_0.OnFilterSelected, "R15 " .. l_Localization_0:getText("ScriptPane", "Unassigned")), 
            (v23("R15", "Assigned", l_props_0.Filters, l_props_0.OnFilterSelected, "R15 " .. l_Localization_0:getText("ScriptPane", "Assigned")))
        })));
    end;
end;
v17.render = function(v28)
    local _ = v28.state;
    local l_props_1 = v28.props;
    return v1.createElement(l_IconButton_0, {
        LayoutOrder = l_props_1.LayoutOrder, 
        Size = l_props_1.Size, 
        LeftIcon = "rbxasset://textures/StudioSharedUI/Filter.png", 
        OnClick = v28.showMenu
    });
end;
return (l_withContext_0({
    Localization = l_ContextServices_0.Localization, 
    Stylizer = v2.Style.Stylizer, 
    Plugin = l_ContextServices_0.Plugin
})(v17));
