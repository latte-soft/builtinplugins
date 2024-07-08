local l_Parent_0 = script.Parent.Parent.Parent;
local _ = require(l_Parent_0.Src.Types);
local v2 = require(l_Parent_0.Packages.Rodux);
local v3 = require(l_Parent_0.Packages.Dash);
local v4 = require(l_Parent_0.Src.Resources.Constants);
local l_Actions_0 = l_Parent_0.Src.Actions;
local v6 = require(l_Actions_0.ChangeControlPointState);
local v7 = require(l_Actions_0.ClearPathSelection);
local v8 = require(l_Actions_0.DeselectControlPoint);
local v9 = require(l_Actions_0.LockSelectedControlPoint);
local v10 = require(l_Actions_0.PathChanged);
local v11 = require(l_Actions_0.SelectControlPoint);
local v12 = require(l_Actions_0.SelectPath);
local v13 = require(l_Actions_0.SelectTangentSide);
local v14 = require(l_Actions_0.SetAddPointSubMode);
local v15 = require(l_Actions_0.SetIsDraggingPoint);
local v16 = require(l_Actions_0.SetRecording);
local v17 = require(l_Actions_0.ToggleAddPointTool);
local v18 = require(l_Actions_0.ToggleAddTangentTool);
local v19 = require(l_Actions_0.ToggleDone);
local v20 = require(l_Actions_0.ToggleMirrored);
local v21 = require(l_Actions_0.ToggleMoveTool);
local v22 = require(l_Actions_0.ToggleSharp);
local v23 = require(l_Actions_0.ToolbarHovered);
local l_Util_0 = l_Parent_0.Src.Util;
local v25 = require(l_Util_0.findTopLevelGui);
local v26 = require(l_Util_0.getControlPointStates);
local v27 = require(l_Util_0.getAbsolutePosition);
local v28 = require(l_Util_0.isHierarchyValidForPath2D);
local v29 = require(l_Util_0.hasProperty);
local l_PathEditorRotation_0 = game:GetFastFlag("PathEditorRotation");
local l_PathEditorMaxControlPointDisableAdd_0 = game:GetFastFlag("PathEditorMaxControlPointDisableAdd");
return (v2.createReducer({
    AddPointSubMode = "Unselected", 
    ChangeHistoryServiceRecording = nil, 
    ControlPoints = {}, 
    ControlPointStates = {}, 
    DeselectedControlPointIndex = 0, 
    IsDraggingPoint = false, 
    LockedPoint = nil, 
    LockSelectedControlPoint = false, 
    ParentAbsPos = Vector2.zero, 
    ParentAbsSize = Vector2.zero, 
    ParentAbsRotation = 0, 
    Path2DToolMode = "DoneEditing", 
    Refreshed = 0, 
    ScalePositionMode = true, 
    SelectedControlPointIndex = 0, 
    SelectedObject = nil, 
    SelectedObjectGui = nil, 
    SelectedTangentSide = nil, 
    ToolbarHovered = false
}, {
    [v16.name] = function(v32, v33)
        return v3.join(v32, {
            ChangeHistoryServiceRecording = if not v33.Recording then v3.None else v33.Recording
        });
    end, 
    [v14.name] = function(v34, v35)
        return v3.join(v34, {
            AddPointSubMode = v35.SubMode
        });
    end, 
    [v15.name] = function(v36, v37)
        return v3.join(v36, {
            IsDraggingPoint = v37.Dragging
        });
    end, 
    [v23.name] = function(v38, v39)
        return v3.join(v38, {
            IsDraggingPoint = if not v39.Hovered then nil else false, 
            ToolbarHovered = v39.Hovered
        });
    end, 
    [v19.name] = function(v40)
        return v3.join(v40, {
            Path2DToolMode = v40.Path2DToolMode == "DoneEditing" and "Move" or "DoneEditing"
        });
    end, 
    [v21.name] = function(v41)
        return v3.join(v41, {
            SelectedTangentSide = nil, 
            Path2DToolMode = "Move"
        });
    end, 
    [v17.name] = function(v42)
        return v3.join(v42, {
            Path2DToolMode = "AddPoint", 
            AddPointSubMode = #v42.ControlPoints < 2 and "Append" or "Unselected", 
            SelectedControlPointIndex = 0, 
            SelectedTangentSide = nil
        });
    end, 
    [v18.name] = function(v43)
        return v3.join(v43, {
            Path2DToolMode = "AddTangent", 
            SelectedTangentSide = nil
        });
    end, 
    [v10.name] = function(v44, v45)
        local _ = v45.PropChanged;
        local l_SelectedObject_0 = v44.SelectedObject;
        if l_SelectedObject_0 == nil then
            return v44;
        else
            if not game:GetFastFlag("PathEditorSurfaceGui") then
                if not (not (v45.PropChanged == "Parent") or l_SelectedObject_0.Parent:IsA("GuiBase2d")) then
                    return v44;
                end;
            elseif not (not (v45.PropChanged == "Parent") or v28(l_SelectedObject_0)) then
                return v44;
            end;
            local l_l_SelectedObject_0_ControlPoints_0 = l_SelectedObject_0:GetControlPoints();
            local v49 = nil;
            if #l_SelectedObject_0:GetControlPoints() ~= #v44.ControlPointStates then
                v49 = v26(l_l_SelectedObject_0_ControlPoints_0);
            end;
            return v3.join(v44, {
                Refreshed = tick(), 
                ControlPoints = l_l_SelectedObject_0_ControlPoints_0, 
                ControlPointStates = v49, 
                ParentAbsPos = v27(l_SelectedObject_0.Parent), 
                ParentAbsSize = l_SelectedObject_0.Parent.AbsoluteSize, 
                Path2DToolMode = (not not l_PathEditorMaxControlPointDisableAdd_0 and v4.MaxControlPoints <= #l_l_SelectedObject_0_ControlPoints_0) and "Move" or nil, 
                ParentAbsRotation = if not l_PathEditorRotation_0 then nil else if not not l_PathEditorRotation_0 and v29(l_SelectedObject_0.Parent, "AbsoluteRotation") then l_SelectedObject_0.Parent.AbsoluteRotation else 0, 
                SelectedObjectGui = if not game:GetFastFlag("PathEditorSurfaceGui") then nil else v25(l_SelectedObject_0)
            });
        end;
    end, 
    [v12.name] = function(v50, v51)
        if v51.object == v50.SelectedObject then
            return v50;
        else
            local l_object_0 = v51.object;
            if l_object_0 == nil then
                return v50;
            else
                local l_l_object_0_ControlPoints_0 = l_object_0:GetControlPoints();
                return v3.join(v50, {
                    SelectedObject = l_object_0, 
                    SelectedObjectGui = if not game:GetFastFlag("PathEditorSurfaceGui") then nil else v25(l_object_0), 
                    ControlPoints = l_l_object_0_ControlPoints_0, 
                    ControlPointStates = v26(l_l_object_0_ControlPoints_0), 
                    SelectedControlPointIndex = 0, 
                    SelectedTangentSide = nil, 
                    ParentAbsPos = v27(l_object_0.Parent), 
                    ParentAbsSize = l_object_0.Parent.AbsoluteSize, 
                    ParentAbsRotation = if not l_PathEditorRotation_0 then nil else if not not l_PathEditorRotation_0 and v29(l_object_0.Parent, "AbsoluteRotation") then l_object_0.Parent.AbsoluteRotation else 0, 
                    Path2DToolMode = #l_l_object_0_ControlPoints_0 > 1 and "DoneEditing" or "AddPoint", 
                    AddPointSubMode = #l_l_object_0_ControlPoints_0 > 1 and "Unselected" or "Append"
                });
            end;
        end;
    end, 
    [v7.name] = function(v54, _)
        return v3.join(v54, {
            SelectedObject = v3.None, 
            SelectedObjectGui = nil, 
            ControlPoints = {}, 
            ControlPointStates = {}, 
            SelectedControlPointIndex = 0, 
            SelectedTangentSide = nil, 
            LockSelectedControlPoint = false, 
            Path2DToolMode = "DoneEditing"
        });
    end, 
    [v11.name] = function(v56, v57)
        local l_DeselectedControlPointIndex_0 = v56.DeselectedControlPointIndex;
        if l_DeselectedControlPointIndex_0 == v57.Index then
            l_DeselectedControlPointIndex_0 = 0;
        end;
        return v3.join(v56, {
            SelectedTangentSide = nil, 
            SelectedControlPointIndex = v57.Index, 
            DeselectedControlPointIndex = l_DeselectedControlPointIndex_0
        });
    end, 
    [v13.name] = function(v59, v60)
        return v3.join(v59, {
            SelectedTangentSide = if not v60.Side then v3.None else v60.Side
        });
    end, 
    [v8.name] = function(v61, _)
        return v3.join(v61, {
            SelectedControlPointIndex = 0, 
            DeselectedControlPointIndex = v61.SelectedControlPointIndex
        });
    end, 
    [v9.name] = function(v63, v64)
        local l_SelectedControlPointIndex_0 = v63.SelectedControlPointIndex;
        local l_ControlPoints_0 = v63.ControlPoints;
        if not (v63.SelectedControlPointIndex > 0) or #v63.ControlPoints < v63.SelectedControlPointIndex then
            v64.Locked = false;
        end;
        return v3.join(v63, {
            LockSelectedControlPoint = v64.Locked, 
            LockedPoint = if not v64.Locked then nil else l_ControlPoints_0[l_SelectedControlPointIndex_0]
        });
    end, 
    [v20.name] = function(v67, v68)
        local l_Index_0 = v68.Index;
        local v70 = table.clone(v67.ControlPointStates);
        v70[l_Index_0] = table.clone(v70[l_Index_0]);
        v70[l_Index_0].Mirrored = not v70[l_Index_0].Mirrored;
        return v3.join(v67, {
            ControlPointStates = v70
        });
    end, 
    [v22.name] = function(v71, v72)
        local l_Index_1 = v72.Index;
        local v74 = table.clone(v71.ControlPointStates);
        v74[l_Index_1] = table.clone(v74[l_Index_1]);
        v74[l_Index_1].Sharp = not v74[l_Index_1].Sharp;
        return v3.join(v71, {
            ControlPointStates = v74
        });
    end, 
    [v6.name] = function(v75, v76)
        local l_Index_2 = v76.Index;
        local v78 = table.clone(v75.ControlPointStates);
        v78[l_Index_2] = v76.State;
        return v3.join(v75, {
            ControlPointStates = v78
        });
    end
}));
