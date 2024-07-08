local l_script_FirstAncestor_0 = script:FindFirstAncestor("R15Migrator");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local _ = require(l_script_FirstAncestor_0.Packages.RoactRodux);
local v3 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Dash_0 = v3.Dash;
local l_append_0 = l_Dash_0.append;
local l_join_0 = l_Dash_0.join;
local l_keys_0 = l_Dash_0.keys;
local l_map_0 = l_Dash_0.map;
local l_Pane_0 = v3.UI.Pane;
local _ = l_script_FirstAncestor_0.Src.Actions;
local v13 = require(script.TagComponent);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local _ = l_script_FirstAncestor_0.Src.Util;
local v16 = v1.PureComponent:extend("TagsBar");
v16.init = function(v17)
    v17.state = {
        tags = {}, 
        _Ref = {
            Filters = nil
        }
    };
end;
local function v24(v18, v19, v20, v21)
    local v22 = l_keys_0(v19[v20]);
    table.sort(v22);
    l_append_0(v18, l_map_0(v22, function(v23)
        return {
            Label = string.format("%s %s", v20, if not (v23 ~= "Assigned") or v23 == "Unassigned" then v21:getText("ScriptPane", v23) else v23), 
            Data = {
                RigType = v20, 
                InstanceName = v23
            }
        };
    end));
end;
local function _(v25, v26)
    local v27 = {};
    v24(v27, v25.rigFilters, "R6", v26);
    v24(v27, v25.rigFilters, "R15", v26);
    return v27;
end;
v16.getDerivedStateFromProps = function(v29, v30)
    if v29.Filters ~= v30._Ref.Filters then
        local l_Filters_0 = v29.Filters;
        local l_Localization_0 = v29.Localization;
        local v33 = {};
        v24(v33, l_Filters_0.rigFilters, "R6", l_Localization_0);
        v24(v33, l_Filters_0.rigFilters, "R15", l_Localization_0);
        return {
            tags = v33, 
            _Ref = l_join_0(v30._Ref, {
                Filters = v29.Filters
            })
        };
    else
        return ;
    end;
end;
v16.render = function(v34)
    local l_state_0 = v34.state;
    local l_props_0 = v34.props;
    return v1.createElement(l_Pane_0, {
        LayoutOrder = l_props_0.LayoutOrder, 
        Size = l_props_0.Size, 
        Layout = Enum.FillDirection.Horizontal, 
        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
        VerticalAlignment = Enum.VerticalAlignment.Center, 
        Spacing = 4, 
        ClipsDescendants = true
    }, (l_map_0(l_state_0.tags, function(v37, v38)
        return v1.createElement(v13, {
            LayoutOrder = v38, 
            Tag = v37, 
            OnClosed = l_props_0.OnFilterClosed
        });
    end)));
end;
return (l_withContext_0({
    Analytics = l_ContextServices_0.Analytics, 
    Localization = l_ContextServices_0.Localization, 
    Stylizer = v3.Style.Stylizer
})(v16));
