local l_script_FirstAncestor_0 = script:FindFirstAncestor("CompositorDebugger");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Packages.RoactRodux);
local v3 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_copy_0 = v3.Dash.copy;
local l_Stylizer_0 = v3.Style.Stylizer;
local l_Pane_0 = v3.UI.Pane;
local l_Actions_0 = l_script_FirstAncestor_0.Src.Actions;
local v10 = require(l_Actions_0.SetActiveLayersFilter);
local v11 = require(l_Actions_0.SetHistoryField);
local v12 = require(l_Actions_0.SetLayerFilter);
local l_Components_0 = l_script_FirstAncestor_0.Src.Components;
local v14 = require(l_Components_0.CompositorSelector);
local v15 = require(l_Components_0.LayerPanel);
local v16 = require(l_Components_0.LayerTree);
local v17 = require(l_Components_0.MainSplitPane);
local v18 = require(l_Components_0.Toolbar);
local l_Util_0 = l_script_FirstAncestor_0.Src.Util;
local v20 = require(l_Util_0.debugFlags);
local v21 = require(l_Util_0.Constants);
local l_Thunks_0 = l_script_FirstAncestor_0.Src.Thunks;
local v23 = require(l_Thunks_0.SetFrameBufferDuration);
local v24 = require(l_Thunks_0.ToggleAdornment);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v26 = require(script.filterChildren);
local v27 = v1.PureComponent:extend("MainComponent");
v27.init = function(v28)
    v28.openedTimestamp = nil;
    v28.state = {
        layout = Enum.FillDirection.Vertical
    };
    v28.onToggleAdornment = function(v29)
        v28.props.ToggleAdornment(v29.id);
    end;
    v28.onAbsoluteSizeChanged = function(v30)
        v28:setState({
            layout = if v30.AbsoluteSize.Y < v30.AbsoluteSize.X then Enum.FillDirection.Horizontal else Enum.FillDirection.Vertical
        });
    end;
end;
v27.readSettings = function(v31)
    local l_props_0 = v31.props;
    local v33 = l_props_0.Plugin:get();
    local l_v33_Setting_0 = v33:GetSetting(v21.SETTINGS.LayerFilters);
    if l_v33_Setting_0 ~= nil then
        for v35, v36 in l_v33_Setting_0, nil, nil do
            l_props_0.SetLayerFilter(v35, v36);
        end;
    end;
    local l_v33_Setting_1 = v33:GetSetting(v21.SETTINGS.ActiveLayersFilter);
    if l_v33_Setting_1 ~= nil then
        l_props_0.SetActiveLayersFilter(l_v33_Setting_1);
    end;
    local v38 = v33:GetSetting(v21.SETTINGS.FrameBufferDuration) or 10;
    if not v21.TIMECONTROLS_INVERVALS[v38] then
        v38 = 10;
    end;
    l_props_0.SetFrameBufferDuration(v38);
end;
v27.didMount = function(v39)
    v39.openedTimestamp = os.clock();
    v39:readSettings();
end;
v27.willUnmount = function(v40)
    v40.props.Analytics:report("onPluginClosed", os.clock() - v40.openedTimestamp);
end;
v27.render = function(v41)
    local l_props_1 = v41.props;
    local l_state_0 = v41.state;
    local l_Stylizer_1 = l_props_1.Stylizer;
    local l_layout_0 = l_state_0.layout;
    local v46 = nil;
    local v47 = l_props_1.Overrides and l_props_1.Overrides[l_props_1.SelectedLayer];
    local l_ExpandedSections_0 = l_props_1.ExpandedSections;
    local v49 = {
        UDim.new(0.35, 0), 
        UDim.new(0.25, 0)
    };
    local v50 = {
        UDim.new(0.6, 0), 
        UDim.new(0.4, 0)
    };
    local v51 = l_props_1.FrameBuffer and l_props_1.FrameBuffer[1];
    if not (not v51 or not l_props_1.HistoryOffset) and l_props_1.HistoryOffset ~= 0 then
        local v52 = v51.timestamp + l_props_1.HistoryOffset;
        for v53 = 2, l_props_1.FrameBuffer:getSize() do
            if l_props_1.FrameBuffer[v53] then
                if v51.timestamp >= v52 then
                    v51 = l_props_1.FrameBuffer[v53];
                else
                    break;
                end;
            end;
        end;
    end;
    local v54 = v51 and v51.payload;
    if v54 then
        local v55, v56 = v26(v54.children, l_props_1.LayerFilters, l_props_1.ActiveLayersFilter);
        if v56 then
            v54 = l_copy_0(v54);
            v54.children = v55;
        end;
        v46 = v51.layerMap and v51.layerMap[l_props_1.SelectedLayer];
    end;
    return v1.createElement(l_Pane_0, {
        Size = UDim2.fromScale(1, 1), 
        [v1.Change.AbsoluteSize] = v41.onAbsoluteSizeChanged
    }, {
        CompositorSelector = v1.createElement(v14), 
        MainSplitPane = v1.createElement(v17, {
            MinSizes = v49, 
            InitialSizes = v50, 
            Layout = l_layout_0
        }, {
            v1.createElement(l_Pane_0, {
                LayoutOrder = 1, 
                Layout = Enum.FillDirection.Vertical, 
                VerticalAlignment = Enum.VerticalAlignment.Top
            }, {
                Toolbar = v1.createElement(v18, {
                    FrameBuffer = l_props_1.FrameBuffer, 
                    LayoutOrder = 1, 
                    Size = UDim2.new(1, 0, 0, l_Stylizer_1.ToolbarHeight)
                }), 
                LayerTree = v1.createElement(v16, {
                    LayoutOrder = 3, 
                    Size = UDim2.new(1, 0, 1, -l_Stylizer_1.ToolbarHeight), 
                    FramePayload = v54, 
                    Adornments = l_props_1.Adornments, 
                    OnToggleAdornment = v41.onToggleAdornment
                })
            }), 
            v1.createElement(v15, {
                LayoutOrder = 2, 
                LayerData = v46, 
                FrameBuffer = l_props_1.FrameBuffer, 
                ExpandedSections = l_ExpandedSections_0, 
                Overrides = v47, 
                ShowRawPayload = v20.ShowRawPayload
            })
        })
    });
end;
return (v2.connect(function(v57)
    return {
        FrameBuffer = v57.DebugData.FrameBuffer, 
        Overrides = v57.DebugData.Overrides, 
        ActiveLayersFilter = v57.Status.ActiveLayersFilter, 
        Adornments = v57.Status.Adornments, 
        ExpandedSections = v57.Status.ExpandedSections, 
        HistoryField = v57.Status.HistoryField, 
        HistoryOffset = v57.Status.HistoryOffset, 
        LayerFilters = v57.Status.LayerFilters, 
        SelectedLayer = v57.Status.SelectedLayer
    };
end, function(v58)
    return {
        SetActiveLayersFilter = function(v59)
            v58(v10(v59));
        end, 
        SetFrameBufferDuration = function(v60)
            v58(v23(v60));
        end, 
        SetHistoryField = function(v61, v62, v63)
            v58(v11(v61, v62, v63));
        end, 
        SetLayerFilter = function(v64, v65)
            v58(v12(v64, v65));
        end, 
        ToggleAdornment = function(v66)
            v58(v24(v66));
        end
    };
end)((l_withContext_0({
    Analytics = l_ContextServices_0.Analytics, 
    Plugin = l_ContextServices_0.Plugin, 
    Stylizer = l_Stylizer_0
})(v27))));
