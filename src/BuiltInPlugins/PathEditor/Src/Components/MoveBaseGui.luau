local l_Parent_0 = script.Parent.Parent.Parent;
local _ = require(l_Parent_0.Src.Types);
local v2 = require(l_Parent_0.Packages.React);
local v3 = require(l_Parent_0.Packages.RoactRodux);
local l_withContext_0 = require(l_Parent_0.Packages.Framework).ContextServices.withContext;
local l_Actions_0 = l_Parent_0.Src.Actions;
local v6 = require(l_Actions_0.PathChanged);
local v7 = require(l_Actions_0.ToggleMoveTool);
local v8 = require(l_Parent_0.Src.Thunks.SetPathPosition);
local l_Util_0 = l_Parent_0.Src.Util;
local v10 = require(l_Util_0.getAbsolutePosition);
local v11 = require(l_Util_0.rotatePoint);
local v12 = require(l_Parent_0.Src.Util.getUDim2ScaleFromOffset);
local l_Components_0 = l_Parent_0.Src.Components;
local v14 = require(l_Components_0.DraggablePoint);
local v15 = require(l_Components_0.GuiShim);
local l_PathEditorRotation_0 = game:GetFastFlag("PathEditorRotation");
local v17 = v2.PureComponent:extend("MoveBaseGui");
v17.render = function(v18)
    local l_props_0 = v18.props;
    if not l_props_0.SelectedObject or l_props_0.Path2DToolMode ~= "DoneEditing" then
        return nil;
    else
        local v20 = v10(l_props_0.SelectedObject.Parent);
        local v21 = if not l_PathEditorRotation_0 then v10(l_props_0.SelectedObject) else nil;
        local l_BoundingRect_0 = l_props_0.SelectedObject:GetBoundingRect();
        local l_Min_0 = l_BoundingRect_0.Min;
        local v24 = Vector2.new(l_BoundingRect_0.Width, l_BoundingRect_0.Height);
        local v25 = if not l_PathEditorRotation_0 then v21 else nil;
        return v2.createElement(not game:GetFastFlag("PathEditorSurfaceGui") and "ScreenGui" or v15, {
            DisplayOrder = 2
        }, {
            RubberbandPane = v2.createElement(v14, {
                AbsoluteSize = v24, 
                AbsolutePosition = l_Min_0, 
                Style = "RubberBand", 
                FollowCursorOnDrag = if not l_PathEditorRotation_0 then nil else false, 
                OnSelected = function()
                end, 
                OnHover = function()
                end, 
                OnDeselected = function()
                end, 
                OnDragStart = function(_)
                    if not l_PathEditorRotation_0 then
                        v18:setState({
                            extentsOffset = v25
                        });
                        return ;
                    else
                        v18:setState({
                            startingParentPos = v11(v20, v20 + 0.5 * l_props_0.ParentAbsSize, 1 * l_props_0.ParentAbsRotation)
                        });
                        return ;
                    end;
                end, 
                OnDragMoved = function(_, v28)
                    if not l_PathEditorRotation_0 then
                        if v18.state.extentsOffset ~= nil then
                            v28 = (v28 - v20) + v18.state.extentsOffset;
                            l_props_0.dispatchSetPathPosition((v12(UDim2.fromOffset(v28.X, v28.Y), l_props_0.SelectedObject.Parent)));
                        end;
                    elseif v18.state.startingParentPos ~= nil then
                        l_props_0.dispatchSetPathPosition(v28, v18.state.startingParentPos);
                        return ;
                    end;
                end, 
                OnDragEnd = function(_, v30)
                    if not l_PathEditorRotation_0 then
                        if v18.state.extentsOffset ~= nil then
                            v30 = (v30 - v20) + v18.state.extentsOffset;
                            l_props_0.dispatchSetPathPosition(v12(UDim2.fromOffset(v30.X, v30.Y), l_props_0.SelectedObject.Parent), true);
                        end;
                    elseif v18.state.startingParentPos ~= nil then
                        l_props_0.dispatchSetPathPosition(v30, v18.state.startingParentPos, true);
                        return ;
                    end;
                end, 
                OnDoubleClicked = function()
                    l_props_0.dispatchToggleMoveTool();
                end
            })
        });
    end;
end;
return v3.connect(function(v31, _)
    return {
        Refreshed = v31.PathReducer.Refreshed, 
        SelectedObject = v31.PathReducer.SelectedObject, 
        Path2DToolMode = v31.PathReducer.Path2DToolMode, 
        ParentAbsRotation = v31.PathReducer.ParentAbsRotation, 
        ParentAbsSize = v31.PathReducer.ParentAbsSize
    };
end, function(v33)
    return {
        dispatchPathChanged = function(v34)
            v33(v6(v34));
        end, 
        dispatchToggleMoveTool = function()
            v33(v7());
        end, 
        dispatchSetPathPosition = not l_PathEditorRotation_0 and function(v35, v36)
            v33(v8(v35, v36));
        end or function(v37, v38, v39)
            v33(v8(v37, v38, v39));
        end
    };
end)((l_withContext_0({})(v17)));
