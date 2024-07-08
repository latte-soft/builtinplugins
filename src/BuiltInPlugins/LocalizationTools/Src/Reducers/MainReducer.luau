local l_Parent_0 = script.Parent.Parent.Parent;
return require(l_Parent_0.Packages.Rodux).combineReducers({
    PluginMetadata = require(l_Parent_0.Src.Reducers.PluginMetadata), 
    Message = require(l_Parent_0.Src.Reducers.Message), 
    CloudTable = require(l_Parent_0.Src.Reducers.CloudTable)
});
