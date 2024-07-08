local l_Parent_0 = script.Parent.Parent.Parent;
return (require(l_Parent_0.Packages.Rodux).combineReducers({
    PluginInfo = require(l_Parent_0.Src.Reducers.PluginInfo), 
    PluginPermissions = require(l_Parent_0.Src.Reducers.PluginPermissions), 
    Management = require(l_Parent_0.Src.Reducers.Management)
}));
