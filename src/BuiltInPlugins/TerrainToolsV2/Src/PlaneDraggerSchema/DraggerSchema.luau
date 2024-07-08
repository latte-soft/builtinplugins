local function v0()
end;
return {
    getMouseTarget = require(script.Parent.getMouseTarget), 
    beginBoxSelect = require(script.Parent.beginBoxSelect), 
    SelectionInfo = require(script.Parent.SelectionInfo), 
    Selection = require(script.Parent.Selection), 
    FreeformDragger = require(script.Parent.FreeformDragger), 
    TransformHandlesImplementation = require(script.Parent.TransformHandlesImplementation), 
    BoundsChangedTracker = require(script.Parent.BoundsChangedTracker), 
    getSelectionBoxComponent = v0, 
    isExclusiveSelectable = require(script.Parent.isExclusiveSelectable), 
    endBoxSelect = v0, 
    getNextSelectables = v0, 
    getSelectableWithCache = v0, 
    setActivePoint = v0, 
    dispatchWorldClick = require(script.Parent.dispatchWorldClick), 
    addUndoWaypoint = require(script.Parent.addUndoWaypoint), 
    setHover = v0, 
    HoverEscapeDetector = require(script.Parent.HoverEscapeDetector)
};
