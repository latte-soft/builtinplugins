local l_script_FirstAncestor_0 = script:FindFirstAncestor("R15Migrator");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local v2 = require(l_script_FirstAncestor_0.Packages.Roact);
local v3 = require(l_script_FirstAncestor_0.Packages.RoactRodux);
local l_ContextServices_0 = v1.ContextServices;
local l_UI_0 = v1.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_Tabs_0 = l_UI_0.Tabs;
local l_LayoutOrderIterator_0 = v1.Util.LayoutOrderIterator;
local l_Actions_0 = l_script_FirstAncestor_0.Src.Actions;
local v10 = require(l_Actions_0.SetSelectedTab);
local v11 = require(l_Actions_0.SetAllTabsData);
local v12 = require(l_script_FirstAncestor_0.Src.Util.TabsData);
local l_Components_0 = l_script_FirstAncestor_0.Src.Components;
local v14 = require(l_Components_0.Summary.SummaryPane);
local v15 = require(l_Components_0.CharacterConversionPane);
local v16 = require(l_Components_0.ScriptConversionPane);
local v17 = require(l_Components_0.ScriptPane);
local v18 = require(l_Components_0.AnimationConversionPane);
local v19 = require(l_Components_0.IconTab);
local l_R15MigScriptsPane_0 = game:GetFastFlag("R15MigScriptsPane");
local v21 = v2.PureComponent:extend("MainTabsView");
v21.init = function(v22)
    local l_props_0 = v22.props;
    v22.onTabSelected = function(v24)
        l_props_0.setSelectedTab(v24.Key);
    end;
end;
v21.didMount = function(v25)
    local l_props_1 = v25.props;
    local l_Localization_0 = l_props_1.Localization;
    local l_isSuccessfullyPublished_0 = l_props_1.isSuccessfullyPublished;
    l_props_1.setAllTabsData((v12.getAllTabsData(l_Localization_0, function(v29)
        if not l_isSuccessfullyPublished_0 then
            return true;
        else
            return v29 == v12.Summary;
        end;
    end)));
    l_props_1.setSelectedTab(v12.Summary);
end;
v21.render = function(v30)
    local l_props_2 = v30.props;
    local l_selectedTab_0 = l_props_2.selectedTab;
    local l_allTabsData_0 = l_props_2.allTabsData;
    local l_Stylizer_0 = v30.props.Stylizer;
    local l_LayoutOrder_0 = v30.props.LayoutOrder;
    local v36 = l_LayoutOrderIterator_0.new();
    return v2.createElement(l_Pane_0, {
        Layout = Enum.FillDirection.Horizontal, 
        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
        VerticalAlignment = Enum.VerticalAlignment.Top, 
        LayoutOrder = l_LayoutOrder_0, 
        BackgroundColor = l_Stylizer_0.BackgroundColor
    }, {
        Tabs = if not not l_allTabsData_0 and l_selectedTab_0 then v2.createElement(l_Tabs_0, {
            LayoutOrder = v36:getNextOrder(), 
            Tabs = l_allTabsData_0, 
            SelectedTab = v12.findTabData(l_selectedTab_0, l_allTabsData_0), 
            OnTabSelected = v30.onTabSelected, 
            FillDirection = Enum.FillDirection.Vertical, 
            TabComponent = v19
        }) else nil, 
        View = v2.createElement(l_Pane_0, {
            LayoutOrder = v36:getNextOrder(), 
            Size = l_Stylizer_0.TabPaneSize, 
            BackgroundColor = l_Stylizer_0.ViewBackgroundColor
        }, {
            SummaryPane = if not not l_selectedTab_0 and l_selectedTab_0 == v12.Summary then v2.createElement(v14, {
                OnResetPlugin = l_props_2.OnResetPlugin
            }) else nil, 
            ScriptConversionPane = if not not l_selectedTab_0 and l_selectedTab_0 == v12.ScriptConversion then v2.createElement(if not l_R15MigScriptsPane_0 then v16 else v17, {
                OnResetPlugin = l_props_2.OnResetPlugin
            }) else nil, 
            ScriptConversionPaneDeprecated = if (not not l_R15MigScriptsPane_0 and l_selectedTab_0) and l_selectedTab_0 == v12.ScriptConversionDeprecated then v2.createElement(v16, {
                OnResetPlugin = l_props_2.OnResetPlugin
            }) else nil, 
            CharacterConversion = if not not l_selectedTab_0 and l_selectedTab_0 == v12.CharacterConversion then v2.createElement(v15, {
                OnResetPlugin = l_props_2.OnResetPlugin
            }) else nil, 
            AnimationConversionPane = if not not l_selectedTab_0 and l_selectedTab_0 == v12.AnimationConversion then v2.createElement(v18, {
                OnResetPlugin = l_props_2.OnResetPlugin
            }) else nil
        })
    });
end;
return v3.connect(function(v37)
    return {
        selectedTab = v37.PanelSelection.selectedTab, 
        allTabsData = v37.PanelSelection.allTabsData, 
        isSuccessfullyPublished = v37.ConversionProgress.isSuccessfullyPublished
    };
end, function(v38)
    return {
        setSelectedTab = function(v39)
            v38(v10(v39));
        end, 
        setAllTabsData = function(v40)
            v38(v11(v40));
        end
    };
end)((l_ContextServices_0.withContext({
    Localization = l_ContextServices_0.Localization, 
    Stylizer = l_ContextServices_0.Stylizer
})(v21)));
