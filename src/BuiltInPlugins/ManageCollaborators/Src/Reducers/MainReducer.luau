return (require(script.Parent.Parent.Parent.Packages.Rodux).combineReducers({
    GameOwnerMetadata = require(script.Parent.GameOwnerMetadata), 
    Permissions = require(script.Parent.Permissions), 
    GroupMetadata = require(script.Parent.GroupMetadata), 
    GroupRolePermissions = require(script.Parent.GroupRolePermissions), 
    CollaboratorSearch = require(script.Parent.CollaboratorSearch), 
    LoadState = require(script.Parent.LoadState), 
    SaveState = require(script.Parent.SaveState)
}));
