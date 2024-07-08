return {
    EVENTS = {
        DebugData = "DebugData", 
        PropertyOverrides = "PropertyOverrides", 
        LayerAdornments = "LayerAdornments", 
        DebugPose = "DebugPose"
    }, 
    FOLDERS = {
        CompositorDebugger = "__RobloxCompositorDebugger", 
        Server = "Server", 
        Client = "Client", 
        AdornmentHandles = "AdornmentHandles"
    }, 
    LAYER_TABS = {
        LayerData = "LayerData", 
        Visualization = "Visualization", 
        History = "History", 
        RawData = "RawData"
    }, 
    LAYERVIEW_ACTIONS = {
        Clear = "Clear", 
        History = "History", 
        NoOp = "NoOp"
    }, 
    SETTINGS = {
        LayerFilters = "CD_LayerFilters", 
        ActiveLayersFilter = "CD_ActiveLayersFilter", 
        FrameBufferDuration = "CD_FrameBufferDuration"
    }, 
    DEFAULT_TIMECONTROLS_INTERVAL = 10, 
    FRAMERATE = 60, 
    TIMECONTROLS_INVERVALS = {
        [10] = {
            Minor = 1, 
            Major = 5
        }, 
        [30] = {
            Minor = 1, 
            Medium = 5, 
            Major = 10
        }, 
        [60] = {
            Minor = 5, 
            Major = 10
        }
    }
};
