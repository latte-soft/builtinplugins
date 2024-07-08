local l_Parent_0 = script.Parent.Parent.Parent;
return require(l_Parent_0.Packages.Rodux).combineReducers({
    Asset = require(l_Parent_0.Src.Reducers.Asset), 
    Clipboard = require(l_Parent_0.Src.Reducers.Clipboard), 
    SessionStats = require(l_Parent_0.Src.Reducers.SessionStats), 
    Window = require(l_Parent_0.Src.Reducers.Window)
});
