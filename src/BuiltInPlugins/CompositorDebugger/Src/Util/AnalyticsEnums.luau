local v0 = require(script:FindFirstAncestor("CompositorDebugger").Src.Util.Constants);
return {
    LAYER_TABS = {
        [v0.LAYER_TABS.LayerData] = 0, 
        [v0.LAYER_TABS.Visualization] = 1, 
        [v0.LAYER_TABS.History] = 2, 
        [v0.LAYER_TABS.RawData] = 3
    }, 
    TAB_SWITCH_REASONS = {
        Manual = 0, 
        HistoryIcon = 1, 
        NoData = 2
    }
};
