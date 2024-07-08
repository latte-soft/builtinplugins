local l_Parent_0 = script.Parent.Parent.Parent;
return (require(l_Parent_0.Packages.Rodux).combineReducers({
    status = require(l_Parent_0.Src.Reducers.Status), 
    previewStatus = require(l_Parent_0.Src.Reducers.PreviewStatus), 
    selectItem = require(l_Parent_0.Src.Reducers.SelectItem), 
    controlsPanelBlocker = require(l_Parent_0.Src.Reducers.ControlsPanelBlocker), 
    previewAssets = require(l_Parent_0.Src.Reducers.PreviewAssets), 
    animation = require(l_Parent_0.Src.Reducers.Animation)
}));
