local v0 = require(script.Parent.Parent.Parent.Packages.DraggerSchemaCore.DraggerSchema);
return {
    SelectionInfo = require(script.Parent.SelectionInfo), 
    BoundsChangedTracker = require(script.Parent.BoundsChangedTracker), 
    dispatchWorldClick = require(script.Parent.dispatchWorldClick), 
    MoveHandlesImplementation = require(script.Parent.MoveHandlesImplementation), 
    RotateHandlesImplementation = require(script.Parent.RotateHandlesImplementation), 
    FreeformDragger = require(script.Parent.FreeformDragger), 
    isExclusiveSelectable = v0.isExclusiveSelectable, 
    getMouseTarget = v0.getMouseTarget, 
    getNextSelectables = v0.getNextSelectables, 
    getSelectableWithCache = v0.getSelectableWithCache, 
    Selection = v0.Selection, 
    getSelectionBoxComponent = v0.getSelectionBoxComponent, 
    HoverEscapeDetector = v0.HoverEscapeDetector, 
    setHover = v0.setHover, 
    setActivePoint = v0.setActivePoint, 
    beginBoxSelect = v0.beginBoxSelect, 
    endBoxSelect = v0.endBoxSelect, 
    addUndoWaypoint = v0.addUndoWaypoint
};
