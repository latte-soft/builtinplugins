local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.RoactRodux);
local v3 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v6 = require(l_Parent_0.Src.ContextServices.NetworkingContext);
local l_Pane_0 = v3.UI.Pane;
local v8 = require(l_Parent_0.Src.Networking.Requests.GetPolicySettings);
local v9 = require(l_Parent_0.Src.Thunks.UpdatePolicyBooleanItem);
local v10 = require(l_Parent_0.Src.Thunks.UpdatePolicyListItem);
local v11 = require(l_Parent_0.Src.Thunks.UpdatePolicyListItemModuleExpanded);
local v12 = require(l_Parent_0.Src.Components.ToggleItemModule);
local v13 = require(l_Parent_0.Src.Components.ListItemsModule);
local v14 = v1.PureComponent:extend("PolicySection");
v14.didMount = function(v15)
    v15.props.loadAllPolicyItems(v15.props.Networking:get(), (v15.props.Plugin:get()));
end;
v14.render = function(v16)
    local l_props_0 = v16.props;
    local l_LayoutOrder_0 = l_props_0.LayoutOrder;
    local l_mainSwitchEnabled_0 = l_props_0.mainSwitchEnabled;
    local l_allPolicies_0 = l_props_0.allPolicies;
    local l_allPolicySortedKeys_0 = l_props_0.allPolicySortedKeys;
    local l_policySettingStatus_0 = l_props_0.policySettingStatus;
    local l_updateToggleItem_0 = l_props_0.updateToggleItem;
    local l_updateListItem_0 = l_props_0.updateListItem;
    local l_policyListItemsModuleExpanded_0 = l_props_0.policyListItemsModuleExpanded;
    local l_updatePolicySettingListItemModuleExpanded_0 = l_props_0.updatePolicySettingListItemModuleExpanded;
    if l_props_0.customPoliciesEnabled then
        local v27 = {};
        local v28 = {};
        for _, v30 in ipairs(l_allPolicySortedKeys_0) do
            if type(l_allPolicies_0[v30]) == "boolean" then
                v27["Toggle" .. v30] = v1.createElement(v12, {
                    Key = v30, 
                    IsOn = l_policySettingStatus_0[v30], 
                    Enabled = l_mainSwitchEnabled_0, 
                    ToggleCallback = l_updateToggleItem_0
                });
            elseif type(l_allPolicies_0[v30]) == "table" then
                v28["List" .. v30] = v1.createElement(v13, {
                    LabelText = v30, 
                    Enabled = l_mainSwitchEnabled_0, 
                    Items = l_allPolicies_0[v30], 
                    ListItemsCheckBoxCallback = l_updateListItem_0, 
                    ListStatus = l_policySettingStatus_0[v30], 
                    ListItemsModuleExpansionCallback = l_updatePolicySettingListItemModuleExpanded_0, 
                    Expanded = l_policyListItemsModuleExpanded_0
                });
            end;
        end;
        return v1.createElement(l_Pane_0, {
            AutomaticSize = Enum.AutomaticSize.Y, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            Layout = Enum.FillDirection.Vertical, 
            LayoutOrder = l_LayoutOrder_0
        }, {
            ToggleElementsFrame = v1.createElement(l_Pane_0, {
                AutomaticSize = Enum.AutomaticSize.Y, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                Layout = Enum.FillDirection.Vertical, 
                LayoutOrder = 1
            }, v27), 
            ListElementsFrame = v1.createElement(l_Pane_0, {
                AutomaticSize = Enum.AutomaticSize.Y, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                Layout = Enum.FillDirection.Vertical, 
                LayoutOrder = 2
            }, v28)
        });
    else
        return nil;
    end;
end;
return v2.connect(function(v31, _)
    if not game:GetFastFlag("PlayerEmulatorDropdownOpenedStateTrackingEnabled") then
        return {
            mainSwitchEnabled = v31.MainSwitch.mainSwitchEnabled, 
            customPoliciesEnabled = v31.CustomPolicySwitch.customPoliciesEnabled, 
            allPolicies = v31.Policies.allPolicies, 
            allPolicySortedKeys = v31.Policies.allPolicySortedKeys, 
            policySettingStatus = v31.Policies.policySettingStatus
        };
    else
        return {
            mainSwitchEnabled = v31.MainSwitch.mainSwitchEnabled, 
            customPoliciesEnabled = v31.CustomPolicySwitch.customPoliciesEnabled, 
            allPolicies = v31.Policies.allPolicies, 
            allPolicySortedKeys = v31.Policies.allPolicySortedKeys, 
            policySettingStatus = v31.Policies.policySettingStatus, 
            policyListItemsModuleExpanded = v31.Policies.policyListItemsModuleExpanded
        };
    end;
end, function(v33)
    return {
        loadAllPolicyItems = function(v34, v35)
            v33(v8(v34, v35));
        end, 
        updateToggleItem = function(v36, v37, v38)
            v33(v9(v36, v37, v38));
        end, 
        updateListItem = function(v39, v40, v41)
            v33(v10(v39, v40, v41));
        end, 
        updatePolicySettingListItemModuleExpanded = function(v42)
            v33(v11(v42));
        end
    };
end)((l_withContext_0({
    Networking = v6, 
    Plugin = l_ContextServices_0.Plugin
})(v14)));
