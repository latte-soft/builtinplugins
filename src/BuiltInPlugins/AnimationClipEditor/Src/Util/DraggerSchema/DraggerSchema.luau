return {
    Selection = require(script.Parent.Selection), 
    TransformHandlesImplementation = require(script.Parent.TransformHandlesImplementation), 
    getSelectionBoxComponent = require(script.Parent.getSelectionBoxComponent), 
    HoverEscapeDetector = require(script.Parent.HoverEscapeDetector), 
    getMouseTarget = require(script.Parent.getMouseTarget), 
    setHover = require(script.Parent.setHover), 
    setActivePoint = require(script.Parent.setActivePoint), 
    isExclusiveSelectable = require(script.Parent.isExclusiveSelectable), 
    dispatchWorldClick = require(script.Parent.dispatchWorldClick), 
    getNextSelectables = require(script.Parent.getNextSelectables), 
    getSelectableWithCache = require(script.Parent.getSelectableWithCache), 
    beginBoxSelect = require(script.Parent.beginBoxSelect), 
    endBoxSelect = require(script.Parent.endBoxSelect), 
    BoundsChangedTracker = require(script.Parent.BoundsChangedTracker), 
    SelectionInfo = require(script.Parent.SelectionInfo), 
    addUndoWaypoint = require(script.Parent.addUndoWaypoint)
};
