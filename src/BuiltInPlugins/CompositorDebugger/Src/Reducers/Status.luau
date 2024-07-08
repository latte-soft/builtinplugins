local l_script_FirstAncestor_0 = script:FindFirstAncestor("CompositorDebugger");
local v1 = require(l_script_FirstAncestor_0.Packages.Rodux);
local l_Dash_0 = require(l_script_FirstAncestor_0.Packages.Framework).Dash;
local l_join_0 = l_Dash_0.join;
local l_None_0 = l_Dash_0.None;
local _ = require(l_script_FirstAncestor_0.Src.Types);
local l_Actions_0 = l_script_FirstAncestor_0.Src.Actions;
local v7 = require(l_Actions_0.SetActiveLayersFilter);
local v8 = require(l_Actions_0.SetActor);
local v9 = require(l_Actions_0.SetAdornments);
local v10 = require(l_Actions_0.SetDebugDataEvent);
local v11 = require(l_Actions_0.SetDebugPoseEvent);
local v12 = require(l_Actions_0.SetExpandedSections);
local v13 = require(l_Actions_0.SetHistoryField);
local v14 = require(l_Actions_0.SetHistoryOffset);
local v15 = require(l_Actions_0.SetLayerAdornmentEvent);
local v16 = require(l_Actions_0.SetLayerFilter);
local v17 = require(l_Actions_0.SetPropertyOverrideEvent);
local v18 = require(l_Actions_0.SetSelectedLayer);
local v19 = require(l_Actions_0.SetSendPayloadAnalytics);
local _ = require(l_script_FirstAncestor_0.Src.Util.Constants);
return (v1.createReducer({
    ActiveLayersFilter = false, 
    Actor = nil, 
    Adornments = {}, 
    DebugDataConnection = nil, 
    DebugDataEvent = nil, 
    DebugPoseEvent = nil, 
    ExpandedSections = {
        layerDetails = true, 
        props = true, 
        state = true, 
        watches = true
    }, 
    HistoryField = {}, 
    HistoryOffset = nil, 
    LayerAdornmentEvent = nil, 
    LayerFilters = {
        CrossFade = true
    }, 
    PropertyOverrideEvent = nil, 
    SelectedLayer = nil, 
    SendPayloadAnalytics = false
}, {
    [v7.name] = function(v21, v22)
        return l_join_0(v21, {
            ActiveLayersFilter = v22.activeLayersFilter
        });
    end, 
    [v10.name] = function(v23, v24)
        return l_join_0(v23, {
            DebugDataEvent = v24.event, 
            DebugDataConnection = v24.connection
        });
    end, 
    [v19.name] = function(v25, v26)
        return l_join_0(v25, {
            SendPayloadAnalytics = v26.enable
        });
    end, 
    [v13.name] = function(v27, v28)
        return l_join_0(v27, {
            HistoryField = {
                id = v28.id, 
                section = v28.section, 
                field = v28.field
            }
        });
    end, 
    [v14.name] = function(v29, v30)
        return l_join_0(v29, {
            HistoryOffset = v30.historyOffset
        });
    end, 
    [v15.name] = function(v31, v32)
        return l_join_0(v31, {
            LayerAdornmentEvent = v32.event
        });
    end, 
    [v17.name] = function(v33, v34)
        return l_join_0(v33, {
            PropertyOverrideEvent = v34.event
        });
    end, 
    [v8.name] = function(v35, v36)
        return l_join_0(v35, {
            Actor = v36.actor or l_None_0
        });
    end, 
    [v11.name] = function(v37, v38)
        return l_join_0(v37, {
            DebugPoseEvent = v38.event
        });
    end, 
    [v18.name] = function(v39, v40)
        return l_join_0(v39, {
            SelectedLayer = v40.selectedLayer or l_None_0
        });
    end, 
    [v12.name] = function(v41, v42)
        return l_join_0(v41, {
            ExpandedSections = v42.expandedSections
        });
    end, 
    [v9.name] = function(v43, v44)
        return l_join_0(v43, {
            Adornments = v44.adornments
        });
    end, 
    [v16.name] = function(v45, v46)
        return l_join_0(v45, {
            LayerFilters = l_join_0(v45.LayerFilters, v46.layerFilters)
        });
    end
}));
