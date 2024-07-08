local l_script_FirstAncestor_0 = script:FindFirstAncestor("R15Migrator");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local _ = require(l_script_FirstAncestor_0.Packages.RoactRodux);
local v3 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local _ = v3.Dash.join;
local l_SelectInput_0 = v3.UI.SelectInput;
local _ = l_script_FirstAncestor_0.Src.Actions;
local _ = l_script_FirstAncestor_0.Src.Components;
local _ = require(l_script_FirstAncestor_0.Src.Types);
local _ = l_script_FirstAncestor_0.Src.Util;
local v12 = v1.PureComponent:extend("DropdownCell");
v12.init = function(v13)
    v13.state = {
        SelectedId = v13.props.SelectedId or "Unassigned"
    };
    v13.onItemActivated = function(v14, v15)
        local l_props_0 = v13.props;
        if v13.state.SelectedId ~= v14.Id then
            v13:setState({
                SelectedId = v14.Id
            });
        end;
        if l_props_0.OnChanged then
            l_props_0.OnChanged(v14, v15);
        end;
    end;
end;
v12.getDerivedStateFromProps = function(v17, _)
    return {
        SelectedId = v17.Value
    };
end;
v12.render = function(v19)
    local l_state_0 = v19.state;
    local l_props_1 = v19.props;
    return v1.createElement(l_SelectInput_0, {
        Size = UDim2.fromScale(1, 1), 
        Items = l_props_1.Schema.Options, 
        OnItemActivated = v19.onItemActivated, 
        SelectedId = l_state_0.SelectedId, 
        Enabled = not l_props_1.Disabled
    }, {});
end;
return (l_withContext_0({
    Analytics = l_ContextServices_0.Analytics, 
    Localization = l_ContextServices_0.Localization, 
    Stylizer = v3.Style.Stylizer
})(v12));
