return require(script:FindFirstAncestor("CompositorDebugger").Packages.Rodux).combineReducers({
    DebugData = require(script.Parent.DebugData), 
    Status = require(script.Parent.Status)
});
