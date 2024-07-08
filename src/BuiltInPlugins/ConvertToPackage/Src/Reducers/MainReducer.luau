local l_Parent_0 = script.Parent.Parent.Parent;
return (require(l_Parent_0.Packages.Rodux).combineReducers({
    AssetConfigReducer = require(l_Parent_0.Src.Reducers.AssetConfigReducer), 
    GroupReducer = require(l_Parent_0.Src.Reducers.GroupReducer), 
    NetworkReducer = require(l_Parent_0.Src.Reducers.NetworkReducer)
}));
