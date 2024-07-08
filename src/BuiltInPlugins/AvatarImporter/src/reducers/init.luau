local l_Parent_0 = script.Parent.Parent;
return require(l_Parent_0.Packages.Rodux).combineReducers({
    plugin = require(l_Parent_0.src.reducers.PluginReducer), 
    error = require(l_Parent_0.src.reducers.ErrorReducer)
});
