local l_script_FirstAncestor_0 = script:FindFirstAncestor("AttachmentTool");
local l_ChangeHistoryService_0 = game:GetService("ChangeHistoryService");
local l_DraggerFramework_0 = l_script_FirstAncestor_0.Packages.DraggerFramework;
local v3 = require(l_script_FirstAncestor_0.Packages.Roact);
local v4 = require(l_DraggerFramework_0.Utility.SelectionWrapper);
local v5 = require(l_script_FirstAncestor_0.Src.Util.AttachmentMover);
local v6 = require(l_DraggerFramework_0.Utility.DragHelper);
local v7 = require(l_script_FirstAncestor_0.Src.Util.AttachmentToolRenderer);
local v8 = require(l_script_FirstAncestor_0.Src.Util.AttachmentToolAnimator);
local v9 = require(l_DraggerFramework_0.Flags.getFFlagDraggerSnapToPartsLua);
local v10 = {};
v10.__index = v10;
local v11 = Vector3.new();
local v12 = {
    AllowDragSelect = true, 
    ShowLocalSpaceIndicator = false, 
    WasAutoSelected = false, 
    ShowPivotIndicator = false, 
    ShowDragSelect = true
};
local v13 = {
    AnalyticsName = true
};
v10.new = function(v14, v15, v16, v17, v18, v19, v20)
    for v21, _ in pairs(v16) do
        if v12[v21] == nil and v13[v21] == nil then
            error("Unexpected AttachmentToolModel prop `" .. v21 .. "`");
        end;
    end;
    local v23 = {};
    for v24, _ in pairs(v13) do
        local v26 = v16[v24];
        if v26 == nil then
            error("Required prop `" .. v24 .. "` missing from AttachmentToolModel props");
        else
            v23[v24] = v26;
        end;
    end;
    for v27, v28 in pairs(v12) do
        if v16[v27] ~= nil then
            v23[v27] = v16[v27];
        else
            v23[v27] = v28;
        end;
    end;
    local v29 = setmetatable({
        _draggerContext = v14, 
        _draggerSchema = v15, 
        _modelProps = v23, 
        _closePluginCallback = v17, 
        _requestRenderCallback = v18, 
        _markViewDirtyCallback = v19, 
        _markSelectionDirtyCallback = v20, 
        _selectionWrapper = nil, 
        _attachmentMover = v5.new(), 
        _attachment = nil, 
        _tiltRotate = CFrame.new(), 
        _recordingIdentifier = nil, 
        _attachmentStack = {}, 
        _redoAttachmentStack = {}
    }, v10);
    v29._attachmentToolRenderer = v7.new(v29._draggerContext, v29._draggerSchema, v29);
    v29._attachmentToolAnimator = v8.new(v29);
    v29._undoConnection = l_ChangeHistoryService_0.OnUndo:Connect(function(v30)
        if v30 == "AttachmenToolDragging" then
            v29:_onUndo();
            return ;
        else
            if not (v29._attachment and v29._attachment.Parent) then
                v29._attachment = nil;
                v29:_updateAttachment();
                v29:_updateSelectionInfo();
            end;
            return ;
        end;
    end);
    v29._redoConnection = l_ChangeHistoryService_0.OnRedo:Connect(function(v31)
        if v31 == "AttachmenToolDragging" then
            v29:_onRedo();
            return ;
        else
            if not (v29._attachment and v29._attachment.Parent) then
                v29._attachment = nil;
                v29:_updateAttachment();
                v29:_updateSelectionInfo();
            end;
            return ;
        end;
    end);
    return v29;
end;
v10.render = function(v32)
    return v3.createElement(v3.Portal, {
        target = v32._draggerContext:getGuiParent()
    }, {
        DraggerUI = v3.createElement("Folder", {}, v32._attachmentToolRenderer:render())
    });
end;
v10.update = function(v33)
    if v33._draggerContext:isSimulating() then
        v33._markViewDirtyCallback();
    end;
end;
v10.getSelectionWrapper = function(v34)
    return v34._selectionWrapper;
end;
v10.getSchema = function(v35)
    return v35._draggerSchema;
end;
v10.doesAllowDragSelect = function(v36)
    return v36._modelProps.AllowDragSelect;
end;
v10.shouldShowDragSelect = function(v37)
    return v37._modelProps.ShowDragSelect;
end;
v10.shouldShowLocalSpaceIndicator = function(v38)
    return v38._modelProps.ShowLocalSpaceIndicator;
end;
v10.shouldShowSelectionDot = function(v39)
    return v39._modelProps.ShowSelectionDot;
end;
v10.shouldUseCollisionTransparency = function(v40)
    return v40._modelProps.UseCollisionsTransparency;
end;
v10.shouldAlignDraggedObjects = function(v41)
    return v41._draggerContext:shouldAlignDraggedObjects();
end;
v10._isDraggingAttachment = function(v42)
    return v42._attachment and v42._attachmentMover:isMovingThisAttachment(v42._attachment);
end;
v10._updateAttachment = function(v43)
    local v44 = v43._draggerContext:getMouseRay();
    local v45 = nil;
    if v43._lastDragTarget then
        v45 = v43._lastDragTarget.targetMatrix;
    end;
    local v46 = v6.getDragTarget(if not v43._attachment then {} else {
        v43._attachment
    }, CFrame.new(), v11, v11, v11, v44, if not v43._draggerContext:shouldGridSnap() then nil else v43._draggerContext:getGridSize(), v43._tiltRotate, v45, v43:shouldAlignDraggedObjects() and not v43._draggerContext:isAltKeyDown(), false, v43._draggerContext:getSoftSnapMarginFactor(), if not v9 then nil else v43._draggerContext:shouldPartSnap());
    if not (not v46 or not v46.targetPart) then
        v43._lastDragTarget = v46;
        if not v43._attachmentToolAnimator:inProgress() then
            if not v43:_isDraggingAttachment() then
                local v47 = if not v43._selectionWrapper then {} else v43._selectionWrapper:get();
                if not (v43._recordingIdentifier and l_ChangeHistoryService_0:IsRecordingInProgress(v43._recordingIdentifier)) then
                    v43._recordingIdentifier = l_ChangeHistoryService_0:TryBeginRecording("AttachmenToolDragging", "Placing Attachment");
                end;
                v43._attachment = Instance.new("Attachment", v46.targetPart);
                table.insert(v47, v43._attachment);
                if not v43._selectionWrapper then
                    local v48 = v43._draggerSchema.Selection.new();
                    v48:Set(v47);
                    v43._selectionWrapper = v4.new(v48);
                else
                    v43._selectionWrapper:set(v47);
                end;
                v43._attachment.WorldCFrame = v46.mainCFrame;
                v43._tiltRotate = CFrame.new();
                v43:_updateSelectionInfo();
                v43._attachmentMover:setDragged(v43._attachment);
            else
                v43._attachmentMover:moveTo(v46.mainCFrame, v46.targetPart);
                return ;
            end;
        end;
    end;
end;
v10._rotateAttachment = function(v49, v50)
    local v51 = nil;
    if v49._lastDragTarget then
        v51 = v49._lastDragTarget.targetMatrix;
    end;
    local v52 = v6.updateTiltRotate(v49._draggerContext:getCameraCFrame(), v49._draggerContext:getMouseRay(), if not v49._attachment then {} else {
        v49._attachment
    }, CFrame.new(), v51, v49._tiltRotate, v50, v49:shouldAlignDraggedObjects() and not v49._draggerContext:isAltKeyDown(), if not v49._draggerContext:shouldGridSnap() then nil else v49._draggerContext:getGridSize());
    if not v49._lastDragTarget then
        v49._tiltRotate = v52;
    else
        v49._attachmentToolAnimator:beginAnimation(v52);
    end;
    v49:_updateAttachment();
    v49:_scheduleRender();
end;
v10._isAttachmentInSelection = function(v53)
    if v53._attachment and v53._selectionWrapper then
        return table.find(v53._selectionWrapper:get(), v53._attachment) ~= nil;
    else
        return true;
    end;
end;
v10._closeTool = function(v54)
    v54._closePluginCallback();
end;
v10._processSelected = function(v55)
    if v55._modelProps.ShowPivotIndicator then
        v55._oldShowPivot = v55._draggerContext:setPivotIndicator(true);
    end;
    v55._draggerContext:setMouseIcon("");
    v55._boundsChangedTracker = v55._draggerSchema.BoundsChangedTracker.new(v55._draggerContext, function(_)
        v55._markSelectionDirtyCallback();
    end);
    v55._boundsChangedTracker:install();
    v55._draggerContext:getSelection():Set({});
    v55._selectionWrapper = v4.new(v55._draggerContext:getSelection());
    v55._selectionChangedConnection = v55._selectionWrapper.onSelectionExternallyChanged:Connect(function()
        v55:_processSelectionChanged();
    end);
    v55:_updateSelectionInfo();
end;
v10._onUndo = function(v57)
    v57._attachmentToolAnimator:forceFinish();
    if v57._attachmentMover:isMovingThisAttachment(v57._attachment) then
        v57._attachmentMover:commit();
    end;
    table.insert(v57._redoAttachmentStack, v57._attachment);
    local v58 = v57._selectionWrapper:get();
    v57._attachment = table.remove(v57._attachmentStack);
    if not v57._attachment then
        if not ((not (#v58 == 1) or not v58[1]:IsA("Attachment")) or not v58[1].Parent) then
            v57._attachment = v58[1];
            v57._attachmentMover:setDragged(v57._attachment);
        end;
    elseif not v57._attachment.Parent then
        v57._attachment = nil;
    else
        v57._attachmentMover:setDragged(v57._attachment);
    end;
    if #v57._attachmentStack > 0 then
        table.insert(v58, v57._attachmentStack[#v57._attachmentStack]);
        v57._selectionWrapper:set(v58);
    end;
    v57:_updateAttachment();
    v57:_updateSelectionInfo();
end;
v10._onRedo = function(v59)
    v59._attachmentToolAnimator:forceFinish();
    if v59._attachmentMover:isMovingThisAttachment(v59._attachment) then
        v59._attachmentMover:commit();
    end;
    if #v59._redoAttachmentStack == 0 then
        return ;
    else
        local v60 = v59._selectionWrapper:get();
        local v61 = table.find(v60, v59._attachmentStack[#v59._attachmentStack]);
        if v61 then
            table.remove(v60, v61);
        end;
        table.insert(v59._attachmentStack, v59._attachment);
        v59._attachment = table.remove(v59._redoAttachmentStack);
        if v59._attachment then
            if not v59._attachment.Parent then
                v59._attachment = nil;
            else
                v59._attachmentMover:setDragged(v59._attachment);
            end;
        end;
        v59:_updateAttachment();
        v59:_updateSelectionInfo();
        return ;
    end;
end;
v10._processDeselected = function(v62)
    if v62._isMouseDown then
        v62:_processMouseUp();
    end;
    if v62._modelProps.ShowPivotIndicator then
        v62._draggerContext:setPivotIndicator(v62._oldShowPivot);
    end;
    v62._selectionWrapper:destroy();
    v62._selectionWrapper = nil;
    v62._boundsChangedTracker:uninstall();
    v62._selectionChangedConnection:Disconnect();
    v62._selectionChangedConnection = nil;
    if not (not v62._attachment or not v62._attachment.Parent) then
        v62._attachment:Destroy();
    end;
    v62._attachment = nil;
    v62._redoAttachmentStack = {};
    v62._attachmentStack = {};
    v62._undoConnection:Disconnect();
    v62._undoConnection = nil;
    v62._redoConnection:Disconnect();
    v62._redoConnection = nil;
    if not (not v62._recordingIdentifier or not l_ChangeHistoryService_0:IsRecordingInProgress(v62._recordingIdentifier)) then
        l_ChangeHistoryService_0:FinishRecording(v62._recordingIdentifier, Enum.FinishRecordingOperation.Commit);
    end;
    v62._recordingIdentifier = nil;
end;
v10._processSelectionChanged = function(v63)
    v63:_updateSelectionInfo();
    if not ((not v63._selectionWrapper or v63:_isAttachmentInSelection()) or v63._isMouseDown) then
        if v63._attachment.Parent then
            local v64 = v63._selectionWrapper:get();
            table.insert(v64, v63._attachment);
            v63._selectionWrapper:set(v64);
        else
            v63:_scheduleRender();
            return ;
        end;
    end;
    v63:_scheduleRender();
end;
local v65 = table.freeze({
    [Enum.KeyCode.RightShift] = true, 
    [Enum.KeyCode.LeftShift] = true, 
    [Enum.KeyCode.RightControl] = true, 
    [Enum.KeyCode.LeftControl] = true, 
    [Enum.KeyCode.RightAlt] = true, 
    [Enum.KeyCode.LeftAlt] = true
});
v10._processKeyDown = function(v66, v67)
    if v67 == Enum.KeyCode.R then
        v66:_rotateAttachment((Vector3.new(0, 1, 0)));
        return ;
    elseif v67 == Enum.KeyCode.T then
        v66:_rotateAttachment((Vector3.new(1, 0, 0)));
        return ;
    elseif v67 == Enum.KeyCode.H then
        v66._draggerContext:setSetting("HotkeyUsageHidden", not v66._draggerContext:getSetting("HotkeyUsageHidden"));
        v66:_scheduleRender();
        return ;
    else
        if v65[v67] then
            v66:_updateAttachment();
            v66:_scheduleRender();
        end;
        return ;
    end;
end;
v10._processKeyUp = function(v68, v69)
    if v69 == Enum.KeyCode.Escape then
        v68:_closeTool();
        return ;
    else
        if v65[v69] then
            v68:_updateAttachment();
            v68:_scheduleRender();
        end;
        return ;
    end;
end;
v10._processMouseDown = function(v70)
    if not v70._isMouseDown then
        v70._isMouseDown = true;
        v70._attachmentMover:commit();
        v70._selectionWrapper:set({
            v70._attachment
        });
        table.insert(v70._attachmentStack, v70._attachment);
        v70._attachment = nil;
        v70:_updateSelectionInfo();
        v70:_updateAttachment();
        v70:_updateSelectionInfo();
        return ;
    else
        return ;
    end;
end;
v10._processMouseUp = function(v71)
    v71._isMouseDown = false;
    if not (not v71._recordingIdentifier or not l_ChangeHistoryService_0:IsRecordingInProgress(v71._recordingIdentifier)) then
        l_ChangeHistoryService_0:FinishRecording(v71._recordingIdentifier, Enum.FinishRecordingOperation.Commit);
        v71._redoAttachmentStack = {};
        v71._recordingIdentifier = nil;
    end;
end;
v10._processViewChanged = function(v72)
    v72:_updateAttachment();
    v72:_scheduleRender();
end;
v10._updateSelectionInfo = function(v73, v74)
    if not v74 then
        v73._selectionInfo = v73._draggerSchema.SelectionInfo.new(v73._draggerContext, v73._selectionWrapper:get());
    else
        v73._selectionInfo = v74;
    end;
    v73._boundsChangedTracker:setSelection(v73._selectionInfo);
end;
v10._processMouseEnter = function(_)
end;
v10._processMouseLeave = function(_)
end;
v10._scheduleRender = function(v77)
    v77._requestRenderCallback();
end;
return v10;
