local l_Parent_0 = script.Parent.Parent.Parent;
return (require(l_Parent_0.Packages.Rodux).combineReducers({
    Example = require(l_Parent_0.Src.Reducers.Example), 
    DraftsServiceStatus = require(l_Parent_0.Src.Reducers.DraftsServiceStatus), 
    Drafts = require(l_Parent_0.Src.Reducers.DraftsReducer)
}));
