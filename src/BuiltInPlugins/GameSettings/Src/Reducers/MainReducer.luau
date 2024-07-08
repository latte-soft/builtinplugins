local l_Parent_0 = script.Parent.Parent.Parent;
return require(l_Parent_0.Packages.Rodux).combineReducers({
    Settings = require(l_Parent_0.Src.Reducers.Settings), 
    Status = require(l_Parent_0.Src.Reducers.Status), 
    MorpherEditorRoot = require(l_Parent_0.Pages.AvatarPage.Reducers.MorpherEditorRoot), 
    CollaboratorSearch = require(l_Parent_0.Pages.PermissionsPage.Reducers.CollaboratorSearch), 
    PageLoadState = require(l_Parent_0.Src.Reducers.PageLoadState), 
    PageSaveState = require(l_Parent_0.Src.Reducers.PageSaveState), 
    Metadata = require(l_Parent_0.Src.Reducers.GameMetadata), 
    GameOwnerMetadata = require(l_Parent_0.Src.Reducers.GameOwnerMetadata), 
    EditAsset = require(l_Parent_0.Src.Reducers.EditAsset), 
    ComponentLoadState = require(l_Parent_0.Src.Reducers.ComponentLoadState)
});
