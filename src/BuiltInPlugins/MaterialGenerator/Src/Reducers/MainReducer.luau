local l_Parent_0 = script.Parent.Parent.Parent;
return (require(l_Parent_0.Packages.Rodux).combineReducers({
    AppStateReducer = require(l_Parent_0.Src.Reducers.AppStateReducer), 
    MaterialsReducer = require(l_Parent_0.Src.Reducers.MaterialsReducer)
}));
