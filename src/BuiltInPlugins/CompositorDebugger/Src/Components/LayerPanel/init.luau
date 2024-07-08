local l_script_FirstAncestor_0 = script:FindFirstAncestor("CompositorDebugger");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Packages.RoactRodux);
local v3 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Analytics_0 = l_ContextServices_0.Analytics;
local l_Localization_0 = l_ContextServices_0.Localization;
local l_Stylizer_0 = v3.Style.Stylizer;
local l_UI_0 = v3.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_Tabs_0 = l_UI_0.Tabs;
local _ = l_UI_0.TextLabel;
local l_Components_0 = l_script_FirstAncestor_0.Src.Components;
local v14 = require(l_Components_0.LayerView);
local v15 = require(l_Components_0.HistoryGraph);
local l_Util_0 = l_script_FirstAncestor_0.Src.Util;
local v17 = require(l_Util_0.AnalyticsEnums);
local v18 = require(l_Util_0.Constants);
local _ = require(l_Util_0.debugFlags);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v21 = v1.PureComponent:extend("LayerPanel");
v21.init = function(v22)
    v22.state = {
        lastTabSwitch = os.clock(), 
        selectedTab = v18.LAYER_TABS.LayerData, 
        oldTab = v18.LAYER_TABS.LayerData
    };
    v22.switchToTab = function(v23, v24)
        if v23 == v22.state.selectedTab then
            return ;
        else
            v22.props.Analytics:report("onLayerTabChanged", v17.LAYER_TABS[v22.state.selectedTab], v17.LAYER_TABS[v23], v24, os.clock() - v22.state.lastTabSwitch);
            v22:setState({
                lastTabSwitch = os.clock(), 
                oldTab = v22.state.selectedTab, 
                selectedTab = v23
            });
            return ;
        end;
    end;
end;
v21.isVisualizationEnabled = function(_, v26)
    return v21.Visualizers.getModule(v26) ~= nil;
end;
v21.didUpdate = function(v27, v28)
    local l_props_0 = v27.props;
    local l_state_0 = v27.state;
    local v31 = ((l_props_0.HistoryField and l_props_0.HistoryField.id) and l_props_0.HistoryField.section) and l_props_0.HistoryField.field;
    if not (l_state_0.selectedTab == v18.LAYER_TABS.History and not v31) and (not (l_state_0.selectedTab == v18.LAYER_TABS.Visualization) or v27:isVisualizationEnabled(l_props_0.LayerData)) then
        if v31 and (not ((v28.HistoryField and l_props_0.HistoryField.id == v28.HistoryField.id) and l_props_0.HistoryField.section == v28.HistoryField.section) or l_props_0.HistoryField.field ~= v28.HistoryField.field) then
            v27.switchToTab(v18.LAYER_TABS.History, v17.TAB_SWITCH_REASONS.HistoryIcon);
        end;
        return ;
    else
        v27.switchToTab(v18.LAYER_TABS.LayerData, v17.TAB_SWITCH_REASONS.NoData);
        return ;
    end;
end;
v21.render = function(v32)
    local l_state_1 = v32.state;
    local l_props_1 = v32.props;
    local l_Stylizer_1 = l_props_1.Stylizer;
    local l_Localization_1 = l_props_1.Localization;
    local l_LayerData_0 = l_props_1.LayerData;
    local l_ShowRawPayload_0 = l_props_1.ShowRawPayload;
    local v39 = {
        {
            Key = v18.LAYER_TABS.LayerData, 
            Label = l_Localization_1:getText("LayerPanel", v18.LAYER_TABS.LayerData)
        }, 
        {
            Key = v18.LAYER_TABS.Visualization, 
            Label = l_Localization_1:getText("LayerPanel", v18.LAYER_TABS.Visualization), 
            Disabled = not v32:isVisualizationEnabled(l_LayerData_0)
        }, 
        {
            Key = v18.LAYER_TABS.History, 
            Label = l_Localization_1:getText("LayerPanel", v18.LAYER_TABS.History), 
            Disabled = not (((l_props_1.HistoryField and l_props_1.HistoryField.id) and l_props_1.HistoryField.section) and l_props_1.HistoryField.field)
        }
    };
    if l_ShowRawPayload_0 then
        table.insert(v39, {
            Key = v18.LAYER_TABS.RawData, 
            Label = l_Localization_1:getText("LayerPanel", v18.LAYER_TABS.RawData)
        });
    end;
    local v40 = v21.Visualizers.getModule(l_LayerData_0);
    return v1.createElement(l_Pane_0, {
        Layout = Enum.FillDirection.Vertical, 
        VerticalAlignment = Enum.VerticalAlignment.Top, 
        HorizontalAlignment = Enum.HorizontalAlignment.Left
    }, {
        Tabs = v1.createElement(l_Tabs_0, {
            LayoutOrder = 1, 
            Tabs = v39, 
            SelectedTab = v32.state.selectedTab, 
            OnTabSelected = function(v41)
                v32.switchToTab(v41.Key, v17.TAB_SWITCH_REASONS.Manual);
            end
        }), 
        LayerData = if l_state_1.selectedTab == v18.LAYER_TABS.LayerData then v1.createElement(v14, {
            Size = UDim2.new(1, 0, 1, -l_Stylizer_1.TabsHeight - 1), 
            LayoutOrder = 2, 
            LayerData = l_props_1.LayerData, 
            ExpandedSections = l_props_1.ExpandedSections, 
            Overrides = l_props_1.Overrides
        }) else nil, 
        Visualization = if l_state_1.selectedTab == v18.LAYER_TABS.Visualization and v40 then v1.createElement(l_Pane_0, {
            Size = UDim2.new(1, 0, 1, -l_Stylizer_1.TabsHeight - 1), 
            LayoutOrder = 2
        }, {
            Content = v1.createElement(v40, {
                Stylizer = l_Stylizer_1, 
                LayerData = l_props_1.LayerData, 
                Overrides = l_props_1.Overrides
            })
        }) else nil, 
        History = if l_state_1.selectedTab == v18.LAYER_TABS.History then v1.createElement(l_Pane_0, {
            Size = UDim2.new(1, 0, 1, -l_Stylizer_1.TabsHeight - 1), 
            LayoutOrder = 2
        }, {
            HistoryGraph = v1.createElement(v15, {
                FrameBuffer = l_props_1.FrameBuffer, 
                HistoryField = l_props_1.HistoryField
            })
        }) else nil, 
        RawData = if l_state_1.selectedTab == v18.LAYER_TABS.RawData then v1.createElement(v14, {
            Size = UDim2.new(1, 0, 1, -l_Stylizer_1.TabsHeight - 1), 
            LayoutOrder = 2, 
            LayerData = l_LayerData_0, 
            RawMode = true
        }) else nil
    });
end;
v21 = l_withContext_0({
    Analytics = l_Analytics_0, 
    Localization = l_Localization_0, 
    Stylizer = l_Stylizer_0
})(v21);
v21 = v2.connect(function(v42, _)
    return {
        HistoryField = v42.Status.HistoryField
    };
end, function(_)
    return {};
end)(v21);
v21.Visualizers = require(script.Visualizers);
return v21;
