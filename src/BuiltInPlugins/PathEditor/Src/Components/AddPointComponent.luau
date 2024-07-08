if not game:GetFastFlag("PathEditorRotation") then
    local l_Parent_0 = script.Parent.Parent.Parent;
    local _ = require(l_Parent_0.Src.Types);
    local v2 = require(l_Parent_0.Packages.React);
    local v3 = require(l_Parent_0.Packages.RoactRodux);
    local v4 = require(l_Parent_0.Packages.Framework);
    local l_Actions_0 = l_Parent_0.Src.Actions;
    local v6 = require(l_Actions_0.SetIsDraggingPoint);
    local v7 = require(l_Actions_0.SetAddPointSubMode);
    local l_Thunks_0 = l_Parent_0.Src.Thunks;
    local v9 = require(l_Thunks_0.AddControlPoint);
    local v10 = require(l_Thunks_0.SetControlPointTangent);
    local v11 = require(l_Thunks_0.SelectControlPoint);
    local l_Components_0 = l_Parent_0.Src.Components;
    local v13 = require(l_Components_0.DraggablePoint);
    local v14 = require(l_Components_0.GuiShim);
    local v15 = require(l_Components_0.Line);
    local l_Image_0 = v4.UI.Image;
    local v17 = require(l_Parent_0.Src.Resources.Constants);
    local l_Util_0 = l_Parent_0.Src.Util;
    local v19 = require(l_Util_0.getAbsolutePosition);
    local v20 = require(l_Util_0.makeNewPath2DControlPoint);
    local v21 = require(l_Util_0.getSnapToControlPoint);
    local v22 = require(l_Util_0.getUDim2FromVector2);
    local v23 = require(l_Util_0.getUDim2OffsetFromScale);
    local v24 = require(l_Util_0.getPositionMatchesControlPoint);
    local v25 = require(l_Util_0.getPosOnCurveOffset);
    local v26 = require(l_Util_0.getClosestControlPointToPosition);
    local v27 = game:defineFastFlag("PathEditorInsertPointSnappingFix", false);
    local v28 = v2.Component:extend("AddPointComponent");
    v28.init = function(v29)
        v29.onDragAreaClicked = function(v30)
            local l_props_0 = v29.props;
            local v32 = v19(l_props_0.SelectedObject);
            local l_ParentAbsPos_0 = l_props_0.ParentAbsPos;
            local l_ParentAbsSize_0 = l_props_0.ParentAbsSize;
            local v35 = v22(v30 - v32);
            if l_props_0.AddPointSubMode == "Append" then
                l_props_0.dispatchAddControlPoint(v21(v35, l_props_0.ControlPoints, l_ParentAbsPos_0, l_ParentAbsSize_0), #l_props_0.ControlPoints + 1);
                return ;
            elseif l_props_0.AddPointSubMode == "Prepend" then
                l_props_0.dispatchAddControlPoint(v21(v35, l_props_0.ControlPoints, l_ParentAbsPos_0, l_ParentAbsSize_0), 1);
                return ;
            else
                local v36 = v24(v35, l_props_0.ControlPoints[1], l_ParentAbsPos_0, l_ParentAbsSize_0);
                local v37 = v24(v35, l_props_0.ControlPoints[#l_props_0.ControlPoints], l_ParentAbsPos_0, l_ParentAbsSize_0);
                if not v36 then
                    if not v37 then
                        if #l_props_0.ControlPoints > 1 then
                            local v38 = if not v27 then v26(l_props_0.SelectedObject, v30) else v26(l_props_0.SelectedObject, v30 - v32);
                            local v39 = v38[1] + 2;
                            local v40 = v38[2];
                            local v41 = v38[3];
                            if v40 ~= nil and v40 < v17.SnapToSegmentEpsilon then
                                l_props_0.dispatchAddControlPoint(v25(l_props_0.SelectedObject, v41) + (v22(l_ParentAbsPos_0) - v22(v32)), v39);
                            end;
                        end;
                        return ;
                    else
                        l_props_0.dispatchSetAddPointSubMode("Append");
                        return ;
                    end;
                else
                    l_props_0.dispatchSetAddPointSubMode("Prepend");
                    return ;
                end;
            end;
        end;
        v29.onDragAreaHoverMoved = function(v42)
            v29:setState({
                dragLocation = v42
            });
            local l_props_1 = v29.props;
            if (#l_props_1.ControlPoints > 0 and l_props_1.SelectedObject ~= nil) and l_props_1.AddPointSubMode == "Unselected" then
                local v44 = v22(v42 - v19(l_props_1.SelectedObject));
                if not v24(v44, l_props_1.ControlPoints[1], l_props_1.ParentAbsPos, l_props_1.ParentAbsSize) then
                    if not v24(v44, l_props_1.ControlPoints[#l_props_1.ControlPoints], l_props_1.ParentAbsPos, l_props_1.ParentAbsSize) then
                        if l_props_1.SelectedControlPointIndex ~= 0 then
                            l_props_1.dispatchSelectControlPoint(0);
                            v29:setState({
                                hoveringSelectablePoint = false
                            });
                        end;
                    else
                        l_props_1.dispatchSelectControlPoint(#l_props_1.ControlPoints);
                        v29:setState({
                            hoveringSelectablePoint = true
                        });
                        return ;
                    end;
                else
                    l_props_1.dispatchSelectControlPoint(1);
                    v29:setState({
                        hoveringSelectablePoint = true
                    });
                    return ;
                end;
            end;
        end;
        v29.onDragAreaDragged = function(_, v46)
            local l_props_2 = v29.props;
            local l_SelectedObject_0 = l_props_2.SelectedObject;
            local v49 = l_props_2.AddPointSubMode == "Append" and "Right" or "Left";
            if (#l_props_2.ControlPoints > 0 and l_SelectedObject_0 ~= nil) and l_props_2.AddPointSubMode ~= "Unselected" then
                l_props_2.dispatchSetControlPointTangent(l_SelectedObject_0.SelectedControlPoint, v49, v46, false, false);
            end;
        end;
        v29:setState({
            hoveringSelectablePoint = false
        });
    end;
    v28.render = function(v50)
        local l_props_3 = v50.props;
        local l_state_0 = v50.state;
        if not l_props_3.SelectedObject or l_props_3.Path2DToolMode ~= "AddPoint" then
            return nil;
        else
            local v53 = v19(l_props_3.SelectedObject);
            local v54 = #l_props_3.ControlPoints == 0;
            if #l_props_3.ControlPoints < 2 and l_props_3.AddPointSubMode ~= "Append" then
                l_props_3.dispatchSetAddPointSubMode("Append");
            end;
            local v55 = nil;
            local v56 = nil;
            if v54 or l_props_3.AddPointSubMode == "Unselected" then
                v55 = UDim2.new();
            else
                if l_props_3.AddPointSubMode == "Append" then
                    v56 = l_props_3.ControlPoints[#l_props_3.ControlPoints];
                elseif l_props_3.AddPointSubMode == "Prepend" then
                    v56 = l_props_3.ControlPoints[1];
                end;
                if v56 ~= nil and l_props_3.SelectedObject ~= nil then
                    v55 = v23(v56.Position, l_props_3.SelectedObject.Parent) + v22(v53);
                end;
            end;
            local v57 = if l_state_0.dragLocation ~= nil then v22(l_state_0.dragLocation) else UDim2.new();
            local v58 = (not l_props_3.ToolbarHovered and not l_props_3.IsDraggingPoint) and l_state_0.dragLocation ~= nil;
            local l_v58_0 = v58;
            if l_v58_0 then
                l_v58_0 = not v54;
                if l_v58_0 then
                    l_v58_0 = false;
                    if v56 ~= nil then
                        l_v58_0 = l_props_3.AddPointSubMode ~= "Unselected";
                    end;
                end;
            end;
            local v60 = false;
            if not (not (l_props_3.AddPointSubMode ~= "Unselected") or not v58) and l_props_3.SelectedObject ~= nil then
                v57 = v23(v21(v22(l_state_0.dragLocation - v53), l_props_3.ControlPoints, l_props_3.ParentAbsPos, l_props_3.ParentAbsSize) + v22(v53), l_props_3.SelectedObject.Parent);
                v60 = true;
            elseif (not (not (l_props_3.AddPointSubMode == "Unselected") or not v58) and #l_props_3.ControlPoints > 1) and l_props_3.SelectedObject ~= nil then
                local v61 = v19(l_props_3.SelectedObject.Parent);
                local v62 = if not v27 then v26(l_props_3.SelectedObject, l_state_0.dragLocation) else v26(l_props_3.SelectedObject, l_state_0.dragLocation - v61);
                local v63 = v62[2];
                local v64 = v62[3];
                if v63 ~= nil and v63 < v17.SnapToSegmentEpsilon then
                    v57 = v25(l_props_3.SelectedObject, v64) + v22(v61);
                    v60 = not l_state_0.hoveringSelectablePoint;
                end;
            end;
            local v65 = nil;
            if (l_v58_0 and v56 ~= nil) and l_props_3.SelectedObject ~= nil then
                local v66 = v23(if l_props_3.AddPointSubMode == "Append" then v56.RightTangent else v56.LeftTangent, l_props_3.SelectedObject.Parent);
                v65 = {
                    v20(v55, v66, v66), 
                    v20(v57)
                };
            end;
            return v2.createElement(not game:GetFastFlag("PathEditorSurfaceGui") and "ScreenGui" or v14, {
                DisplayOrder = 3, 
                ZIndexBehavior = Enum.ZIndexBehavior.Sibling
            }, {
                v2.createElement(v13, {
                    Style = "AddPoint", 
                    Size = UDim2.fromScale(1, 1), 
                    FollowCursorOnDrag = false, 
                    OnSelected = v50.onDragAreaClicked, 
                    OnDragStart = function(_)
                        l_props_3.dispatchSetIsDraggingPoint(true);
                    end, 
                    OnDragMoved = v50.onDragAreaDragged, 
                    OnDragEnd = function()
                        l_props_3.dispatchSetIsDraggingPoint(false);
                    end, 
                    OnHoverMoved = v50.onDragAreaHoverMoved
                }, {
                    Line = if not l_v58_0 then nil else v2.createElement(v15, {
                        Color = if not l_props_3.SelectedObject then nil else l_props_3.SelectedObject.Color3, 
                        Style = "Tangent", 
                        Thickness = if not l_props_3.SelectedObject then nil else l_props_3.SelectedObject.Thickness, 
                        ControlPoints = v65
                    }), 
                    ControlPoint = if not v60 then nil else v2.createElement(l_Image_0, {
                        Style = "ControlPoint", 
                        Position = v57, 
                        ZIndex = 1
                    })
                })
            });
        end;
    end;
    return v3.connect(function(v68, _)
        return {
            Refreshed = v68.PathReducer.Refreshed, 
            SelectedObject = v68.PathReducer.SelectedObject, 
            ParentAbsPos = v68.PathReducer.ParentAbsPos, 
            ParentAbsSize = v68.PathReducer.ParentAbsSize, 
            Path2DToolMode = v68.PathReducer.Path2DToolMode, 
            ControlPoints = v68.PathReducer.ControlPoints, 
            ToolbarHovered = v68.PathReducer.ToolbarHovered, 
            IsDraggingPoint = v68.PathReducer.IsDraggingPoint, 
            AddPointSubMode = v68.PathReducer.AddPointSubMode
        };
    end, function(v70)
        return {
            dispatchAddControlPoint = function(v71, v72)
                v70(v9(v71, v72));
            end, 
            dispatchSelectControlPoint = function(v73)
                v70(v11(v73));
            end, 
            dispatchSetControlPointTangent = function(v74, v75, v76, v77, v78)
                v70(v10(v74, v75, v76, v77, v78));
            end, 
            dispatchSetIsDraggingPoint = function(v79)
                v70(v6(v79));
            end, 
            dispatchSetAddPointSubMode = function(v80)
                v70(v7(v80));
            end
        };
    end)(v28);
else
    local l_Parent_1 = script.Parent.Parent.Parent;
    local _ = require(l_Parent_1.Src.Types);
    local v83 = require(l_Parent_1.Packages.React);
    local v84 = require(l_Parent_1.Packages.RoactRodux);
    local v85 = require(l_Parent_1.Packages.Framework);
    local l_Actions_1 = l_Parent_1.Src.Actions;
    local v87 = require(l_Actions_1.SetIsDraggingPoint);
    local v88 = require(l_Actions_1.SetAddPointSubMode);
    local l_Thunks_1 = l_Parent_1.Src.Thunks;
    local v90 = require(l_Thunks_1.AddControlPoint);
    local v91 = require(l_Thunks_1.SetControlPointTangent);
    local v92 = require(l_Thunks_1.SelectControlPoint);
    local l_Components_1 = l_Parent_1.Src.Components;
    local v94 = require(l_Components_1.DraggablePoint);
    local v95 = require(l_Components_1.GuiShim);
    local v96 = require(l_Components_1.Line);
    local l_Image_1 = v85.UI.Image;
    local v98 = require(l_Parent_1.Src.Resources.Constants);
    local l_Util_1 = l_Parent_1.Src.Util;
    local v100 = require(l_Util_1.getClosestControlPointToPosition);
    local v101 = require(l_Util_1.getPositionMatchesControlPoint);
    local v102 = require(l_Util_1.getSnapToControlPoint);
    local v103 = require(l_Util_1.getUDim2FromVector2);
    local v104 = require(l_Util_1.makeNewPath2DControlPoint);
    local v105 = require(l_Util_1.getRelativePosFromAbsPos);
    local v106 = require(l_Util_1.getAbsPosFromRelative);
    local v107 = game:DefineFastFlag("PathEditorShowInsertDragTangents", false);
    local v108 = v83.Component:extend("AddPointComponent");
    v108.init = function(v109)
        v109.onDragAreaClicked = function(v110)
            if v109.props.SelectedObject == nil then
                return ;
            else
                local l_props_4 = v109.props;
                local l_Parent_2 = l_props_4.SelectedObject.Parent;
                v110 = v105(v110, l_Parent_2);
                if l_props_4.AddPointSubMode == "Append" then
                    l_props_4.dispatchAddControlPoint(v102(v110, l_props_4.ControlPoints, l_Parent_2), #l_props_4.ControlPoints + 1);
                    return ;
                elseif l_props_4.AddPointSubMode == "Prepend" then
                    l_props_4.dispatchAddControlPoint(v102(v110, l_props_4.ControlPoints, l_Parent_2), 1);
                    return ;
                else
                    local v113 = v101(v110, l_props_4.ControlPoints[1], l_Parent_2);
                    local v114 = v101(v110, l_props_4.ControlPoints[#l_props_4.ControlPoints], l_Parent_2);
                    if not v113 then
                        if not v114 then
                            if #l_props_4.ControlPoints > 1 then
                                local v115 = v100(l_props_4.SelectedObject, v110);
                                local v116 = v115[1] + 2;
                                local v117 = v115[2];
                                local v118 = v115[3];
                                if v117 ~= nil and v117 < v98.SnapToSegmentEpsilon then
                                    l_props_4.dispatchAddControlPoint(l_props_4.SelectedObject:GetPositionOnCurve(v118), if not v107 then v116 else math.floor(v116));
                                end;
                            end;
                            return ;
                        else
                            l_props_4.dispatchSetAddPointSubMode("Append");
                            return ;
                        end;
                    else
                        l_props_4.dispatchSetAddPointSubMode("Prepend");
                        return ;
                    end;
                end;
            end;
        end;
        v109.onDragAreaHoverMoved = function(v119, v120)
            if v120 or v109.props.SelectedObject == nil then
                return ;
            else
                local l_props_5 = v109.props;
                local l_Parent_3 = l_props_5.SelectedObject.Parent;
                local v123 = v105(v119, l_Parent_3);
                v109:setState({
                    dragLocationAbs = v119, 
                    dragLocationRelative = v123
                });
                if (#l_props_5.ControlPoints > 0 and l_props_5.SelectedObject ~= nil) and l_props_5.AddPointSubMode == "Unselected" then
                    if not v101(v123, l_props_5.ControlPoints[1], l_Parent_3) then
                        if not v101(v123, l_props_5.ControlPoints[#l_props_5.ControlPoints], l_Parent_3) then
                            if l_props_5.SelectedControlPointIndex ~= 0 then
                                l_props_5.dispatchSelectControlPoint(0);
                                v109:setState({
                                    hoveringSelectablePoint = false
                                });
                            end;
                        else
                            l_props_5.dispatchSelectControlPoint(#l_props_5.ControlPoints);
                            v109:setState({
                                hoveringSelectablePoint = true
                            });
                            return ;
                        end;
                    else
                        l_props_5.dispatchSelectControlPoint(1);
                        v109:setState({
                            hoveringSelectablePoint = true
                        });
                        return ;
                    end;
                end;
                return ;
            end;
        end;
        v109.onDragAreaDragged = function(_, v125)
            if v109.props.SelectedObject == nil then
                return ;
            else
                local l_props_6 = v109.props;
                local l_SelectedObject_1 = l_props_6.SelectedObject;
                local v128 = l_props_6.AddPointSubMode == "Append" and "Right" or "Left";
                if (#l_props_6.ControlPoints > 0 and l_SelectedObject_1 ~= nil) and (not (l_props_6.AddPointSubMode == "Unselected") or l_props_6.SelectedControlPointIndex ~= 0) then
                    l_props_6.dispatchSetControlPointTangent(l_SelectedObject_1.SelectedControlPoint, v128, v125, false, false);
                end;
                return ;
            end;
        end;
        v109:setState({
            hoveringSelectablePoint = false
        });
    end;
    v108.render = function(v129)
        local l_props_7 = v129.props;
        local l_state_1 = v129.state;
        if l_props_7.SelectedObject == nil then
            return nil;
        else
            local l_SelectedObject_2 = l_props_7.SelectedObject;
            if not (l_props_7.Path2DToolMode == "AddPoint") or l_SelectedObject_2.Parent == nil then
                return nil;
            else
                local l_Parent_4 = l_SelectedObject_2.Parent;
                local v134 = #l_props_7.ControlPoints == 0;
                if #l_props_7.ControlPoints < 2 and l_props_7.AddPointSubMode ~= "Append" then
                    l_props_7.dispatchSetAddPointSubMode("Append");
                end;
                local v135 = nil;
                local v136 = nil;
                if v134 or l_props_7.AddPointSubMode == "Unselected" then
                    v135 = UDim2.new();
                else
                    if l_props_7.AddPointSubMode == "Append" then
                        v136 = l_props_7.ControlPoints[#l_props_7.ControlPoints];
                    elseif l_props_7.AddPointSubMode == "Prepend" then
                        v136 = l_props_7.ControlPoints[1];
                    end;
                    if v136 ~= nil then
                        v135 = v103(v106(v136.Position, l_Parent_4), l_Parent_4);
                    end;
                end;
                local v137 = if l_state_1.dragLocationAbs ~= nil then v103(l_state_1.dragLocationAbs) else UDim2.new();
                local v138 = (not l_props_7.ToolbarHovered and not l_props_7.IsDraggingPoint) and l_state_1.dragLocationAbs ~= nil;
                local l_v138_0 = v138;
                if l_v138_0 then
                    l_v138_0 = not v134;
                    if l_v138_0 then
                        l_v138_0 = false;
                        if v136 ~= nil then
                            l_v138_0 = l_props_7.AddPointSubMode ~= "Unselected";
                        end;
                    end;
                end;
                local v140 = false;
                if not (l_props_7.AddPointSubMode ~= "Unselected") or not v138 then
                    if not (not (l_props_7.AddPointSubMode == "Unselected") or not v138) and #l_props_7.ControlPoints > 1 then
                        local v141 = v100(l_SelectedObject_2, l_state_1.dragLocationRelative);
                        local v142 = v141[2];
                        local v143 = v141[3];
                        if v142 ~= nil and v142 < v98.SnapToSegmentEpsilon then
                            v137 = v103(v106(l_SelectedObject_2:GetPositionOnCurve(v143), l_Parent_4));
                            v140 = not l_state_1.hoveringSelectablePoint;
                        end;
                    end;
                else
                    v137 = v103(v106(v102(l_state_1.dragLocationRelative, l_props_7.ControlPoints, l_Parent_4), l_Parent_4), l_Parent_4);
                    v140 = true;
                end;
                local v144 = nil;
                if (l_v138_0 and v136 ~= nil) and l_SelectedObject_2 ~= nil then
                    local v145 = if l_props_7.AddPointSubMode == "Append" then v136.RightTangent else v136.LeftTangent;
                    v144 = {
                        v104(v135, v145, v145), 
                        v104(v137)
                    };
                end;
                return v83.createElement(not game:GetFastFlag("PathEditorSurfaceGui") and "ScreenGui" or v95, {
                    DisplayOrder = 3, 
                    ZIndexBehavior = Enum.ZIndexBehavior.Sibling
                }, {
                    v83.createElement(v94, {
                        Style = "AddPoint", 
                        Size = UDim2.fromScale(1, 1), 
                        FollowCursorOnDrag = false, 
                        OnSelected = v129.onDragAreaClicked, 
                        OnDragStart = function(_)
                            l_props_7.dispatchSetIsDraggingPoint(true);
                        end, 
                        OnDragMoved = v129.onDragAreaDragged, 
                        OnDragEnd = function()
                            l_props_7.dispatchSetIsDraggingPoint(false);
                        end, 
                        OnHoverMoved = v129.onDragAreaHoverMoved
                    }, {
                        Line = if not l_v138_0 then nil else v83.createElement(v96, {
                            Color = l_SelectedObject_2.Color3, 
                            Style = "Tangent", 
                            Thickness = l_SelectedObject_2.Thickness, 
                            ControlPoints = v144
                        }), 
                        ControlPoint = if not v140 then nil else v83.createElement(l_Image_1, {
                            Style = "ControlPoint", 
                            Position = v137, 
                            ZIndex = 1
                        })
                    })
                });
            end;
        end;
    end;
    return v84.connect(function(v147, _)
        return {
            Refreshed = v147.PathReducer.Refreshed, 
            SelectedObject = v147.PathReducer.SelectedObject, 
            ParentAbsPos = v147.PathReducer.ParentAbsPos, 
            ParentAbsSize = v147.PathReducer.ParentAbsSize, 
            ParentAbsRotation = v147.PathReducer.ParentAbsRotation, 
            Path2DToolMode = v147.PathReducer.Path2DToolMode, 
            ControlPoints = v147.PathReducer.ControlPoints, 
            ToolbarHovered = v147.PathReducer.ToolbarHovered, 
            IsDraggingPoint = v147.PathReducer.IsDraggingPoint, 
            AddPointSubMode = v147.PathReducer.AddPointSubMode, 
            SelectedControlPointIndex = v147.PathReducer.SelectedControlPointIndex
        };
    end, function(v149)
        return {
            dispatchAddControlPoint = function(v150, v151)
                v149(v90(v150, v151));
            end, 
            dispatchSelectControlPoint = function(v152)
                v149(v92(v152));
            end, 
            dispatchSetControlPointTangent = function(v153, v154, v155, v156, v157)
                v149(v91(v153, v154, v155, v156, v157));
            end, 
            dispatchSetIsDraggingPoint = function(v158)
                v149(v87(v158));
            end, 
            dispatchSetAddPointSubMode = function(v159)
                v149(v88(v159));
            end
        };
    end)(v108);
end;
