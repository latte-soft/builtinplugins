local l_Parent_0 = script.Parent.Parent.Parent;
return require(l_Parent_0.Packages.Rodux).combineReducers({
    Status = require(l_Parent_0.Src.Reducers.Status), 
    History = require(l_Parent_0.Src.Reducers.History)
});
