return require(script.Parent.Parent.Parent.Packages.Rodux).combineReducers({
    Targets = require(script.Parent.TargetReducer), 
    RoactInspector = require(script.Parent.RoactInspectorReducer)
});
