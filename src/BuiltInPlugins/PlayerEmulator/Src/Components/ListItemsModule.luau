local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Cryo);
local v2 = require(l_Parent_0.Packages.Roact);
local v3 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_ExpandablePane_0 = v3.UI.ExpandablePane;
local v7 = require(l_Parent_0.Src.Components.CheckBoxModule);
local l_getSocialMediaReferencesAllowed_0 = require(l_Parent_0.Src.Util.PlayerEmulatorUtilities).getSocialMediaReferencesAllowed;
local v9 = v2.PureComponent:extend("ListItemsModule");
v9.init = function(v10, v11)
    v10.state = {
        expanded = v11.Expanded
    };
    v10.onExpandedStateChanged = function()
        v11.ListItemsModuleExpansionCallback(not v10.state.expanded);
        v10:setState({
            expanded = not v10.state.expanded
        });
    end;
    v10.checkBoxCallback = function(v12)
        v11.ListItemsCheckBoxCallback(v11.LabelText, v12, v11.Plugin:get());
    end;
end;
v9.render = function(v13)
    local l_state_0 = v13.state;
    local l_props_0 = v13.props;
    local l_Enabled_0 = l_props_0.Enabled;
    local l_expanded_0 = l_state_0.expanded;
    local l_LabelText_0 = l_props_0.LabelText;
    local v19 = l_props_0.Items or {};
    local l_ListStatus_0 = l_props_0.ListStatus;
    local v21 = {};
    for _, v23 in pairs(v19) do
        v21["Item" .. v23] = v2.createElement(v7, {
            Enabled = l_Enabled_0, 
            ItemKey = v23, 
            Selected = v1.List.find(l_ListStatus_0, v23) ~= nil, 
            CheckBoxCallback = v13.checkBoxCallback
        });
    end;
    return not not l_getSocialMediaReferencesAllowed_0() and v2.createElement(l_ExpandablePane_0, {
        Expanded = l_expanded_0, 
        OnExpandedChanged = v13.onExpandedStateChanged, 
        Text = l_LabelText_0
    }, v21) or nil;
end;
return (l_withContext_0({
    Plugin = l_ContextServices_0.Plugin, 
    Stylizer = l_ContextServices_0.Stylizer
})(v9));
