return {
    CallstackActionIds = {
        CopySelected = "CopySelected", 
        SelectAll = "SelectAll"
    }, 
    WatchActionIds = {
        DeleteWatch = "DeleteWatch", 
        DeleteAllWatches = "DeleteAllWatches"
    }, 
    LogpointActions = {
        EditLogpoint = "EditLogpoint", 
        EnableLogpoint = "EnableLogpoint", 
        DisableLogpoint = "DisableLogpoint", 
        DeleteLogpoint = "DeleteLogpoint"
    }, 
    BreakpointActions = {
        EditBreakpoint = "EditBreakpoint", 
        EnableBreakpoint = "EnableBreakpoint", 
        DisableBreakpoint = "DisableBreakpoint", 
        DeleteBreakpoint = "DeleteBreakpoint"
    }, 
    CommonActions = {
        GoToScript = "GoToScript"
    }, 
    StepActionIds = {
        simulationResumeActionV2 = "simulationResumeActionV2", 
        simulationPauseActionV2 = "simulationPauseActionV2", 
        stepOverActionV2 = "stepOverActionV2", 
        stepIntoActionV2 = "stepIntoActionV2", 
        stepOutActionV2 = "stepOutActionV2"
    }, 
    HEADER_HEIGHT = 28, 
    ICON_SIZE = 16, 
    BUTTON_SIZE = 28, 
    BUTTON_PADDING = 2, 
    COLUMN_HEADER_HEIGHT = 24, 
    ROW_HEIGHT = 22, 
    DebugpointIconTable = {
        breakpointDisabled = "rbxasset://textures/Debugger/Breakpoints/" .. "breakpoint_disabled@2x.png", 
        breakpointEnabled = "rbxasset://textures/Debugger/Breakpoints/" .. "breakpoint_enabled@2x.png", 
        conditionalDisabled = "rbxasset://textures/Debugger/Breakpoints/" .. "conditional_disabled@2x.png", 
        conditionalEnabled = "rbxasset://textures/Debugger/Breakpoints/" .. "conditional_enabled@2x.png", 
        invalidBreakpoint = "rbxasset://textures/Debugger/Breakpoints/" .. "invalid_breakpoint@2x.png", 
        invalidLogpoint = "rbxasset://textures/Debugger/Breakpoints/" .. "invalid_logpoint@2x.png", 
        logpointDisabled = "rbxasset://textures/Debugger/Breakpoints/" .. "logpoint_disabled@2x.png", 
        logpointEnabled = "rbxasset://textures/Debugger/Breakpoints/" .. "logpoint_enabled@2x.png", 
        client = "rbxasset://textures/Debugger/Breakpoints/" .. "client@2x.png", 
        server = "rbxasset://textures/Debugger/Breakpoints/" .. "server@2x.png"
    }, 
    SeparationToken = "_", 
    GameStateTypes = {
        Client = "StudioGameStateType_PlayClient", 
        Server = "StudioGameStateType_PlayServer", 
        Edit = "StudioGameStateType_Edit"
    }, 
    DebugpointType = {
        Breakpoint = "Breakpoint", 
        Logpoint = "Logpoint"
    }, 
    DebuggerPauseReason = {
        Unknown = "Enum.DebuggerPauseReason.Unknown", 
        Requested = "Enum.DebuggerPauseReason.Requested", 
        Breakpoint = "Enum.DebuggerPauseReason.Breakpoint", 
        Exception = "Enum.DebuggerPauseReason.Exception", 
        SingleStep = "Enum.DebuggerPauseReason.SingleStep", 
        Entrypoint = "Enum.DebuggerPauseReason.Entrypoint"
    }, 
    DebuggerStatus = {
        Success = "Enum.DebuggerStatus.Success", 
        Timeout = "Enum.DebuggerStatus.Timeout", 
        ConnectionLost = "Enum.DebuggerStatus.ConnectionLost", 
        InvalidResponse = "Enum.DebuggerStatus.InvalidResponse", 
        InternalError = "Enum.DebuggerStatus.InternalError", 
        InvalidState = "Enum.DebuggerStatus.InvalidState", 
        RpcError = "Enum.DebuggerStatus.RpcError", 
        InvalidArgument = "Enum.DebuggerStatus.InvalidArgument", 
        ConnectionClosed = "Enum.DebuggerStatus.ConnectionClosed"
    }, 
    GetIntForGST = function(v0)
        return ({
            StudioGameStateType_Edit = 0, 
            StudioGameStateType_PlayClient = 1, 
            StudioGameStateType_PlayServer = 2, 
            StudioGameStateType_Standalone = 3
        })[v0];
    end, 
    LogpointActionsOrder = {
        [1] = "EditLogpoint", 
        [2] = "EnableLogpoint", 
        [3] = "DisableLogpoint", 
        [4] = "DeleteLogpoint", 
        [5] = "GoToScript"
    }, 
    BreakpointActionsOrder = {
        [1] = "EditBreakpoint", 
        [2] = "EnableBreakpoint", 
        [3] = "DisableBreakpoint", 
        [4] = "DeleteBreakpoint", 
        [5] = "GoToScript"
    }, 
    EnableKey = 2, 
    DisableKey = 3, 
    CallstackActionsOrder = {
        [1] = "CopySelected", 
        [2] = "SelectAll"
    }, 
    WatchActionsOrder = {
        [1] = "DeleteWatch", 
        [2] = "DeleteAllWatches"
    }, 
    ColumnSize = "ColumnSize", 
    Tab = "Tab", 
    ScopeFilter = "ScopeFilter", 
    ColumnFilter = "ColumnFilter", 
    ColumnSizeVariables = "ColumnSizeVariables", 
    ColumnSizeMyWatches = "ColumnSizeMyWatches", 
    WatchVariables = "WatchVariables", 
    kInvalidDebuggerConnectionId = -1, 
    DummyRowName = " ", 
    VariablesColumnFilter = "VariablesColumnFilter", 
    MyWatchesColumnFilter = "MyWatchesColumnFilter"
};
