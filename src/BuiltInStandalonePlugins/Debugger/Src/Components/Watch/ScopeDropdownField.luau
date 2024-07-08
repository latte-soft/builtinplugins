local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.RoactRodux);
local v3 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Localization_0 = l_ContextServices_0.Localization;
local l_Analytics_0 = l_ContextServices_0.Analytics;
local v8 = require(l_Parent_0.Src.Resources.AnalyticsEventNames);
local l_Stylizer_0 = v3.Style.Stylizer;
local v10 = require(l_Parent_0.Src.Components.Common.DropdownField);
local v11 = require(l_Parent_0.Src.Thunks.Watch.FilterScopeWatchThunk);
local v12 = require(l_Parent_0.Src.Util.flatListToString);
local v13 = v1.PureComponent:extend("ScopeDropdownField");
local v14 = {
    LocalScope = "Local", 
    UpvalueScope = "Upvalue", 
    GlobalScope = "Global"
};
local _ = function(v15, v16)
    for _, v18 in pairs(v15) do
        if v18 == v16 then
            return true;
        end;
    end;
    return false;
end;
v13.init = function(v20)
    v20.keyColumns = {
        [1] = "AllScopes", 
        [2] = v14.LocalScope, 
        [3] = v14.UpvalueScope, 
        [4] = v14.GlobalScope
    };
    v20.clickCallback = function(v21)
        v20.props.onScopeFilterChange(v21);
        v20.props.Analytics:report(v8.WatchScopeEdited, v12(v21));
    end;
end;
v13.render = function(v22)
    local l_props_0 = v22.props;
    local l_Stylizer_1 = l_props_0.Stylizer;
    local l_Localization_1 = l_props_0.Localization;
    return v1.createElement(v10, {
        KeyTexts = v22.keyColumns, 
        Tooltips = {
            [1] = nil, 
            [2] = l_Localization_1:getText("Watch", "LocalTooltip"), 
            [3] = l_Localization_1:getText("Watch", "UpvalueTooltip"), 
            [4] = l_Localization_1:getText("Watch", "GlobalTooltip")
        }, 
        NumDisplay = l_props_0.NumEnabledChoices, 
        MaxDisplay = 3, 
        ClickCallback = v22.clickCallback, 
        KeyStates = l_props_0.KeyStates, 
        Localization = l_Localization_1, 
        Style = l_Stylizer_1, 
        Widget = "Watch", 
        DropdownWidth = 100, 
        ShouldShowDropdownIcon = l_props_0.ShouldShowDropdownIcon, 
        Tooltip = l_Localization_1:getText("Watch", "FilterScopes"), 
        LayoutOrder = l_props_0.LayoutOrder
    });
end;
return (v2.connect(function(v26, _)
    local l_listOfEnabledScopes_0 = v26.Watch.listOfEnabledScopes;
    local v29 = {};
    local l_LocalScope_0 = v14.LocalScope;
    local v31;
    for _, v33 in pairs(l_listOfEnabledScopes_0) do
        if v33 == l_LocalScope_0 then
            v31 = true;
            goto label0 --[[  true, false  ]];
        end;
    end;
    v31 = false;
    ::label0::;
    v29[2] = v31;
    l_LocalScope_0 = v14.UpvalueScope;
    for _, v35 in pairs(l_listOfEnabledScopes_0) do
        if v35 == l_LocalScope_0 then
            v31 = true;
            goto label1 --[[  true, false  ]];
        end;
    end;
    v31 = false;
    ::label1::;
    v29[3] = v31;
    l_LocalScope_0 = v14.GlobalScope;
    for _, v37 in pairs(l_listOfEnabledScopes_0) do
        if v37 == l_LocalScope_0 then
            v31 = true;
            goto label2 --[[  true, false  ]];
        end;
    end;
    v31 = false;
    ::label2::;
    v29[4] = v31;
    return {
        NumEnabledChoices = #l_listOfEnabledScopes_0, 
        KeyStates = v29
    };
end, function(v38)
    return {
        onScopeFilterChange = function(v39)
            return v38(v11(v39));
        end
    };
end)((l_withContext_0({
    Analytics = l_Analytics_0, 
    Localization = l_Localization_0, 
    Stylizer = l_Stylizer_0
})(v13))));
