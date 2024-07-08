local l_Parent_0 = script.Parent.Parent;
return require(l_Parent_0.Packages.Cryo).Dictionary.join(require(l_Parent_0.Packages.DraggerSchemaTemplate.DraggerSchema), {
    addUndoWaypoint = require(script.addUndoWaypoint), 
    beginBoxSelect = require(script.beginBoxSelect), 
    dispatchWorldClick = require(script.dispatchWorldClick), 
    endBoxSelect = require(script.endBoxSelect), 
    isExclusiveSelectable = require(script.isExclusiveSelectable), 
    ExtrudeHandlesImplementation = require(script.ExtrudeHandlesImplementation), 
    getMouseTarget = require(script.getMouseTarget), 
    Selection = require(script.Selection), 
    SelectionInfo = require(script.SelectionInfo), 
    TransformHandlesImplementation = require(script.TransformHandlesImplementation), 
    updateBoxSelect = require(script.updateBoxSelect)
});
