local l_Parent_0 = script.Parent.Parent.Parent;
return (require(l_Parent_0.Packages.Rodux).combineReducers({
    Screen = require(l_Parent_0.Src.Reducers.Screen), 
    ExistingGame = require(l_Parent_0.Src.Reducers.ExistingGame), 
    NewGameSettings = require(l_Parent_0.Src.Reducers.NewGameSettings), 
    PublishedPlace = require(l_Parent_0.Src.Reducers.PublishedPlace), 
    PublishInProgress = require(l_Parent_0.Src.Reducers.PublishInProgress), 
    GroupsHavePermission = require(l_Parent_0.Src.Reducers.GroupsHavePermission), 
    Policy = require(l_Parent_0.Src.Reducers.Policy), 
    SelectedGroup = require(l_Parent_0.Src.Reducers.SelectedGroup)
}));
