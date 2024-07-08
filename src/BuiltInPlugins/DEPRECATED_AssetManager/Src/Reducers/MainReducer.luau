local l_Parent_0 = script.Parent.Parent.Parent;
return (require(l_Parent_0.Packages.Rodux).combineReducers({
    AssetManagerReducer = require(l_Parent_0.Src.Reducers.AssetManagerReducer), 
    Screen = require(l_Parent_0.Src.Reducers.Screen)
}));
