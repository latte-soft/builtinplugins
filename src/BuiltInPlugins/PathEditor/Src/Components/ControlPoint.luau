local l_Parent_0 = script.Parent.Parent.Parent;
local _ = require(l_Parent_0.Src.Types);
local v2 = require(l_Parent_0.Packages.React);
local v3 = require(l_Parent_0.Packages.RoactRodux);
local l_ContextServices_0 = require(l_Parent_0.Packages.Framework).ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Plugin_0 = l_ContextServices_0.Plugin;
local l_Localization_0 = l_ContextServices_0.Localization;
local l_Actions_0 = l_Parent_0.Src.Actions;
local v9 = require(l_Actions_0.DeselectControlPoint);
local v10 = require(l_Actions_0.LockSelectedControlPoint);
local v11 = require(l_Actions_0.SelectTangentSide);
local l_Thunks_0 = l_Parent_0.Src.Thunks;
local v13 = require(l_Thunks_0.OnControlPointDoubleClicked);
local v14 = require(l_Thunks_0.OnControlPointDragged);
local v15 = require(l_Thunks_0.OpenContextMenu);
local v16 = require(l_Thunks_0.RecordChangeHistory);
local v17 = require(l_Thunks_0.RemoveControlPoint);
local v18 = require(l_Thunks_0.SelectControlPoint);
local _ = require(l_Thunks_0.SetControlPointTangent);
local _ = require(l_Parent_0.Src.Resources.Constants);
local l_Util_0 = l_Parent_0.Src.Util;
local v22 = require(l_Util_0.getAbsolutePosition);
local v23 = require(l_Util_0.getAbsPosFromRelative);
local v24 = require(l_Util_0.getAbsPosFromUDim2);
local v25 = require(l_Util_0.getTangentNameForSide);
local v26 = require(l_Util_0.getVector2FromUDim2Scale);
local v27 = require(l_Util_0.makeNewPath2DControlPoint);
local v28 = require(l_Util_0.rotatePoint);
local l_Components_0 = l_Parent_0.Src.Components;
local v30 = require(l_Components_0.DraggablePoint);
local v31 = require(l_Components_0.Line);
local v32 = require(l_Components_0.TangentPoint);
local l_PathEditorRotation_0 = game:GetFastFlag("PathEditorRotation");
local v34 = v2.Component:extend("ControlPoint");
v34.init = function(v35)
    v35.tangentPoints = {};
end;
v34.renderTangent = function(v36, v37, v38)
    local l_props_0 = v36.props;
    if v37 ~= "Left" and v37 ~= "Right" then
        error("invalid tangent side: " .. v37);
        return ;
    elseif l_props_0.showTangents or l_props_0.showTangentsPhantom then
        local l_showTangentsPhantom_0 = l_props_0.showTangentsPhantom;
        local v41 = v25(v37);
        local v42 = nil;
        v42 = if not l_PathEditorRotation_0 then v26(l_props_0.point[v41], l_props_0.SelectedObject.Parent) else v28(v26(l_props_0.point[v41], l_props_0.SelectedObject.Parent), Vector2.new(), l_props_0.ParentAbsRotation);
        if v42 == Vector2.zero then
            return nil;
        else
            local _ = #l_props_0.ControlPoints;
            return v2.createElement(v2.Fragment, {}, {
                [v41 .. "Point"] = v2.createElement(v32, {
                    index = l_props_0.index, 
                    absolutePosition = v38 + v42, 
                    position = v42, 
                    side = v37, 
                    isPhantom = l_showTangentsPhantom_0, 
                    Disabled = l_props_0.Disabled
                }), 
                [v41 .. "Line"] = v2.createElement(v31, {
                    ZIndex = -1, 
                    Style = not l_showTangentsPhantom_0 and "Tangent" or "PhantomTangent", 
                    Position = UDim2.fromOffset(v38.X, v38.Y), 
                    ControlPoints = {
                        v27(UDim2.new(), UDim2.new(), UDim2.new()), 
                        v27(UDim2.fromOffset(v42.X, v42.Y), UDim2.new(), UDim2.new())
                    }
                })
            });
        end;
    else
        return nil;
    end;
end;
v34.render = function(v44)
    local l_props_1 = v44.props;
    local _ = v44.state;
    local v47 = nil;
    v47 = if not l_PathEditorRotation_0 then v24(l_props_1.point.Position, v22(l_props_1.SelectedObject), l_props_1.ParentAbsSize) else v23(l_props_1.point.Position, l_props_1.SelectedObject.Parent);
    local v48 = "ControlPoint";
    if ((l_props_1.Path2DToolMode == "AddPoint" and l_props_1.AddPointSubMode == "Unselected") and l_props_1.index ~= 1) and l_props_1.index ~= #l_props_1.ControlPoints then
        v48 = "PhantomControlPoint";
    end;
    return v2.createElement(v2.Fragment, {}, {
        Point = v2.createElement(v30, {
            ZIndex = if not l_props_1.LockSelectedControlPoint then l_props_1.DeselectedControlPointIndex == l_props_1.index and -1 or 0 else 1, 
            AbsolutePosition = v47, 
            Style = v48, 
            IsSelected = l_props_1.isSelected, 
            FollowCursorOnDrag = false, 
            Disabled = l_props_1.Disabled, 
            OnDoubleClicked = function()
                l_props_1.dispatchOnControlPointDoubleClicked(l_props_1.index);
            end, 
            OnSelected = function()
                l_props_1.dispatchSelectControlPoint(l_props_1.index);
            end, 
            OnDeselected = function()
                l_props_1.dispatchSelectControlPoint(0);
            end, 
            OnDragStart = function()
                l_props_1.dispatchRecordChangeHistory("Move Control Point");
                l_props_1.dispatchLockSelectedControlPoint(true);
                if l_props_1.Path2DToolMode == "AddTangent" then
                    local l_ControlPoints_0 = l_props_1.ControlPoints;
                    local v50 = l_props_1.index == #l_ControlPoints_0 and "Left" or "Right";
                    local v51 = v50 == "Right" and "Left" or "Right";
                    local v52 = l_ControlPoints_0[l_props_1.index];
                    local v53 = v25(v50);
                    local v54 = v25(v51);
                    local v55 = if v52[v53] ~= nil then v52[v53] else UDim2.new();
                    local v56 = if v52[v54] ~= nil then v52[v54] else UDim2.new();
                    if v55 == UDim2.new() and v56 == UDim2.new() then
                        v50 = v51;
                    end;
                    l_props_1.dispatchSelectControlPoint(l_props_1.index);
                    l_props_1.dispatchSelectTangentSide(v50);
                end;
            end, 
            OnDragMoved = function(v57, v58)
                l_props_1.dispatchOnControlPointDragged(l_props_1.index, v57, v58);
            end, 
            OnDragEnd = function(_, _)
                l_props_1.dispatchLockSelectedControlPoint(false);
                l_props_1.dispatchRecordChangeHistory();
            end, 
            OnRightClicked = function()
                l_props_1.dispatchSelectControlPoint(l_props_1.index);
                l_props_1.dispatchOpenContextMenu(l_props_1.PluginContext, l_props_1.Localization);
            end
        }), 
        LeftTangent = v44:renderTangent("Left", v47), 
        RightTangent = v44:renderTangent("Right", v47)
    });
end;
return v3.connect(function(v61, _)
    return {
        Path2DToolMode = v61.PathReducer.Path2DToolMode, 
        AddPointSubMode = v61.PathReducer.AddPointSubMode, 
        ControlPoints = v61.PathReducer.ControlPoints, 
        SelectedObject = v61.PathReducer.SelectedObject, 
        ParentAbsPos = v61.PathReducer.ParentAbsPos, 
        ParentAbsSize = v61.PathReducer.ParentAbsSize, 
        ParentAbsRotation = v61.PathReducer.ParentAbsRotation, 
        LockSelectedControlPoint = v61.PathReducer.LockSelectedControlPoint, 
        DeselectedControlPointIndex = v61.PathReducer.DeselectedControlPointIndex
    };
end, function(v63)
    return {
        dispatchOnControlPointDragged = function(v64, v65, v66)
            v63(v14(v64, v65, v66));
        end, 
        dispatchOnControlPointDoubleClicked = function(v67)
            v63(v13(v67));
        end, 
        dispatchRemoveControlPoint = function(v68)
            v63(v17(v68));
        end, 
        dispatchSelectControlPoint = function(v69)
            v63(v18(v69));
            v63(v11(nil));
        end, 
        dispatchDeselectControlPoint = function()
            v63(v9());
        end, 
        dispatchSelectTangentSide = function(v70)
            v63(v11(v70));
        end, 
        dispatchLockSelectedControlPoint = function(v71)
            v63(v10(v71));
        end, 
        dispatchOpenContextMenu = function(v72, v73)
            v63(v15(v72, v73));
        end, 
        dispatchRecordChangeHistory = function(v74)
            v63(v16(v74));
        end
    };
end)((l_withContext_0({
    PluginContext = l_Plugin_0, 
    Localization = l_Localization_0
})(v34)));
