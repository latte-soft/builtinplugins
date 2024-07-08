local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
return require(l_script_FirstAncestor_0.Packages.Dash).join(require(l_script_FirstAncestor_0.Packages.DraggerSchemaTemplate.DraggerSchema), {
    addUndoWaypoint = require(script.addUndoWaypoint), 
    dispatchWorldClick = require(script.dispatchWorldClick), 
    endBoxSelect = require(script.endBoxSelect), 
    getNextSelectables = require(script.getNextSelectables), 
    isExclusiveSelectable = require(script.isExclusiveSelectable), 
    ExtrudeHandlesImplementation = require(script.ExtrudeHandlesImplementation), 
    getMouseTarget = require(script.getMouseTarget), 
    Selection = require(script.Selection), 
    SelectionInfo = require(script.SelectionInfo), 
    TransformHandlesImplementation = require(script.TransformHandlesImplementation), 
    updateBoxSelect = require(script.updateBoxSelect)
});
