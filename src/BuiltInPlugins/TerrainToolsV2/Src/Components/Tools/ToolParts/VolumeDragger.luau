local l_Parent_0 = script.Parent.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.Framework);
local l_DraggerFramework_0 = l_Parent_0.Packages.DraggerFramework;
local l_ContextServices_0 = v2.ContextServices;
local l_Pane_0 = v2.UI.Pane;
local l_withContext_0 = v2.ContextServices.withContext;
local v7 = require(l_DraggerFramework_0.DraggerTools.DraggerToolComponent);
local v8 = require(l_Parent_0.Src.RegionDraggerSchema);
local v9 = require(l_DraggerFramework_0.Implementation.DraggerContext_PluginImpl);
local v10 = require(l_DraggerFramework_0.Handles.MoveHandles);
local v11 = require(l_DraggerFramework_0.Handles.RotateHandles);
local v12 = require(l_DraggerFramework_0.Handles.ExtrudeHandles);
local v13 = require(l_Parent_0.Src.Components.ApplyTransformNote);
local v14 = require(l_Parent_0.Src.Components.RegionVisual);
local v15 = require(l_Parent_0.Src.ContextItems);
local l_Terrain_0 = v15.Terrain;
local v17 = require(l_Parent_0.Src.Util.Constants);
local v18 = require(l_Parent_0.Src.Util.NormalizeSelection);
local v19 = require(l_Parent_0.Src.Util.getDraggedRegion);
local v20 = require(l_Parent_0.Src.Util.TerrainEnums);
local v21 = require(l_Parent_0.Src.Util.getVoxelAlignedRegion);
local l_ChangeHistoryService_0 = game:GetService("ChangeHistoryService");
local l_TerrainEditorOverhaul_0 = game:GetFastFlag("TerrainEditorOverhaul");
local v24 = v1.PureComponent:extend(script.Name);
v24.init = function(v25)
    local l_props_0 = v25.props;
    v25.draggerSelection = v8.Selection.new(l_props_0.TargetCFrame, l_props_0.TargetSize);
    v25.draggerContext = v9.new(l_Parent_0.Parent, game, settings(), v25.draggerSelection);
    v25.draggerUndoStack = {};
    v25.draggerRedoStack = {};
    v25.draggerContext.snapToGridSize = function(v27, v28)
        local l_GridSize_0 = v27._studioService.GridSize;
        local v30 = math.floor(l_GridSize_0 / v17.GRID_SIZE + 0.5) * v17.GRID_SIZE;
        if v30 <= 0 then
            v30 = v17.GRID_SIZE;
        end;
        if math.abs(v30 - v17.DISABLED_GRID_SIZE) < 0.001 then
            return v28;
        elseif v25.props.SnapToVoxels then
            return math.floor(v28 / v30 + 0.5) * v30;
        else
            return math.floor(v28 / l_GridSize_0) * l_GridSize_0;
        end;
    end;
    v25.draggerContext.endSelectionOnDrag = function()
        v25.startPoint = nil;
    end;
    v25.draggerContext.updateRegion = function(v31, v32)
        local l_SetRegion_0 = v25.props.SetRegion;
        local v34 = {
            size = v32, 
            transform = v31
        };
        v25.draggerSelection:SetRegion(v34);
        l_SetRegion_0(v34, true);
    end;
    v25.draggerContext.DEPRECATED_updateSelectionOnDrag = function(v35)
        local l_SetRegion_1 = v25.props.SetRegion;
        v25.draggerSelection:SetRegion(v35);
        l_SetRegion_1(v35, true);
    end;
    v25.draggerContext.updateSelectionOnDrag = function(v37, v38)
        local l_SetRegion_2 = v25.props.SetRegion;
        if not v25.startPoint then
            v25.startPoint = v37;
        end;
        local v40 = v19(v25.startPoint, v38);
        v25.draggerSelection:SetRegion(v40);
        l_SetRegion_2(v40, true);
    end;
    v25.draggerContext.addWaypoint = function(v41)
        if not v25.draggerUndoStack[v41] then
            v25.draggerUndoStack[v41] = {};
        end;
        l_ChangeHistoryService_0:SetWaypoint(v41);
        table.insert(v25.draggerUndoStack[v41], v25.lastRegion);
        v25.lastRegion = {
            size = v25.props.TargetSize, 
            transform = v25.props.TargetCFrame
        };
    end;
    v25.draggerProps = {
        Mouse = l_Parent_0.Parent:GetMouse(), 
        DraggerContext = v25.draggerContext, 
        DraggerSchema = v8, 
        DraggerSettings = {
            AnalyticsName = "DraggerFrameworkRegionSelect", 
            AllowDragSelect = true, 
            AllowFreeformDrag = false, 
            ShowDragSelect = false, 
            ShowLocalSpaceIndicator = true, 
            ShowPivotIndicator = true, 
            HandlesList = {
                v12.new(v25.draggerContext, {
                    ShowBoundingBox = false, 
                    Summonable = false
                }, v8.ExtrudeHandlesImplementation.new(v25.draggerContext)), 
                v10.new(v25.draggerContext, {
                    ShowBoundingBox = false, 
                    Summonable = false, 
                    Outset = 1
                }, v8.TransformHandlesImplementation.new(v25.draggerContext))
            }
        }
    };
    if l_props_0.ShowRotation then
        table.insert(v25.draggerProps.DraggerSettings.HandlesList, v11.new(v25.draggerContext, {
            ShowBoundingBox = false, 
            Summonable = false, 
            Outset = 1
        }, v8.TransformHandlesImplementation.new(v25.draggerContext)));
    end;
end;
v24.didUpdate = function(v42, v43)
    local l_props_1 = v42.props;
    local l_Region_0 = l_props_1.Region;
    local l_SourceCFrame_0 = l_props_1.SourceCFrame;
    local l_SourceSize_0 = l_props_1.SourceSize;
    local v48 = l_props_1.Terrain:get();
    if not (v42.draggerSelection:Get()[1].Region.transform == l_props_1.TargetCFrame) or v42.draggerSelection:Get()[1].Region.size ~= l_props_1.TargetSize then
        v42.draggerSelection:SetRegionWaypoint({
            transform = l_props_1.TargetCFrame, 
            size = l_props_1.TargetSize
        });
    end;
    if v43.SnapToVoxels ~= l_props_1.SnapToVoxels then
        local v49 = math.floor(v42.draggerContext._studioService.GridSize / v17.GRID_SIZE + 0.5) * v17.GRID_SIZE;
        if v49 <= 0 then
            v49 = v17.GRID_SIZE;
        end;
        local v50, v51 = v21(l_props_1.TargetCFrame, l_props_1.TargetSize, v49);
        local v52 = {
            size = v51, 
            transform = v50
        };
        v42.draggerSelection:SetRegion(v52);
        v42.props.SetRegion(v52, true);
    end;
    if not (v43.SourceCFrame == l_props_1.SourceCFrame) or v43.SourceSize ~= l_props_1.SourceSize then
        if not l_TerrainEditorOverhaul_0 or not l_Region_0 then
            v42:setState({
                lines = v48:GetTerrainWireframe(l_SourceCFrame_0, l_SourceSize_0)
            });
        else
            l_Region_0.Parent = game:GetService("CoreGui");
            v42:setState({
                lines = l_Region_0:GetRegionWireframe()
            });
            return ;
        end;
    end;
end;
v24.didMount = function(v53)
    local l_props_2 = v53.props;
    local l_Region_1 = l_props_2.Region;
    local l_SourceCFrame_1 = l_props_2.SourceCFrame;
    local l_SourceSize_1 = l_props_2.SourceSize;
    local v58 = l_props_2.Terrain:get();
    v53.activated = l_props_2.PluginActivationController:subscribeToToolActivated(function(v59)
        if v17.ToolUsesRegion[v59] then
            v53.enable();
        end;
    end);
    v53.deactivated = l_props_2.PluginActivationController:subscribeToToolDeactivated(function(v60)
        if v17.ToolUsesRegion[v60] then
            v53.disable();
        end;
    end);
    local v61 = {
        TerrainTransform = true, 
        TerrainFill = true, 
        TerrainCut = true, 
        TerrainDelete = true
    };
    v53.onUndo = l_ChangeHistoryService_0.OnUndo:Connect(function(v62)
        if v53.draggerUndoStack[v62] and #v53.draggerUndoStack[v62] > 0 then
            if not v53.draggerRedoStack[v62] then
                v53.draggerRedoStack[v62] = {};
            end;
            local v63 = v53.draggerUndoStack[v62][#v53.draggerUndoStack[v62]];
            table.insert(v53.draggerRedoStack[v62], {
                transform = v53.props.TargetCFrame, 
                size = v53.props.TargetSize
            });
            table.remove(v53.draggerUndoStack[v62], #v53.draggerUndoStack[v62]);
            v53.lastRegion = v63;
            v53.props.SetRegion(v63, false);
        end;
        if v61[v62] then
            if not v53.props.Region then
                if not (not v53.props.SourceCFrame or not v53.props.SourceSize) then
                    v53:setState({
                        lines = v58:GetTerrainWireframe(v53.props.SourceCFrame, v53.props.SourceSize)
                    });
                end;
            else
                v53:setState({
                    lines = v53.props.Region:GetRegionWireframe()
                });
                return ;
            end;
        end;
    end);
    v53.onRedo = l_ChangeHistoryService_0.OnRedo:Connect(function(v64)
        if v53.draggerRedoStack[v64] and #v53.draggerRedoStack[v64] > 0 then
            local v65 = v53.draggerRedoStack[v64][#v53.draggerRedoStack[v64]];
            table.insert(v53.draggerUndoStack[v64], {
                transform = v53.props.TargetCFrame, 
                size = v53.props.TargetSize
            });
            table.remove(v53.draggerRedoStack[v64], #v53.draggerRedoStack[v64]);
            v53.lastRegion = v65;
            v53.props.SetRegion(v65, false);
        end;
        if v61[v64] then
            if not v53.props.Region then
                if not (not v53.props.SourceCFrame or not v53.props.SourceSize) then
                    v53:setState({
                        lines = v58:GetTerrainWireframe(v53.props.SourceCFrame, v53.props.SourceSize)
                    });
                end;
            else
                v53:setState({
                    lines = v53.props.Region:GetRegionWireframe()
                });
                return ;
            end;
        end;
    end);
    v53.enable = function()
        v53:setState({
            visual = true
        });
    end;
    v53.disable = function()
        v53:setState({
            visual = false
        });
    end;
    v53.draggerUndoStack = {};
    v53.draggerRedoStack = {};
    v53.lastRegion = {
        transform = l_props_2.SourceCFrame, 
        size = l_props_2.SourceSize
    };
    l_ChangeHistoryService_0:SetWaypoint("Mounting");
    if not l_Region_1 then
        if not (not l_SourceCFrame_1 or not l_SourceSize_1) then
            v53:setState({
                lines = v58:GetTerrainWireframe(l_SourceCFrame_1, l_SourceSize_1), 
                visual = true
            });
        end;
        return ;
    else
        l_Region_1.Parent = game:GetService("CoreGui");
        v53:setState({
            lines = l_Region_1:GetRegionWireframe(), 
            visual = true
        });
        return ;
    end;
end;
v24.willUnmount = function(v66)
    if v66.activated then
        v66.activated:Disconnect();
    end;
    if v66.deactivated then
        v66.deactivated:Disconnect();
    end;
    if v66.onUndo then
        v66.onUndo:Disconnect();
    end;
    if v66.onRedo then
        v66.onRedo:Disconnect();
    end;
end;
v24.enable = function(_)
end;
v24.disable = function(_)
end;
v24.render = function(v69)
    local l_props_3 = v69.props;
    local v71 = l_props_3.Terrain:get();
    local l_VolumeDragger_0 = v69.props.Stylizer.VolumeDragger;
    local l_TargetCFrame_0 = l_props_3.TargetCFrame;
    local l_TargetSize_0 = l_props_3.TargetSize;
    local l_SourceCFrame_2 = l_props_3.SourceCFrame;
    local l_SourceSize_2 = l_props_3.SourceSize;
    local v77 = nil;
    if l_props_3.Tool == v20.ToolId.Select then
        local v78, v79 = v18(l_SourceCFrame_2, l_SourceSize_2);
        l_TargetCFrame_0 = v78;
        l_TargetSize_0 = v79;
    elseif l_props_3.Tool == v20.ToolId.Transform then
        v77 = Vector3.new(l_TargetSize_0.X / l_SourceSize_2.X, l_TargetSize_0.Y / l_SourceSize_2.Y, l_TargetSize_0.Z / l_SourceSize_2.Z);
    end;
    return v1.createElement(l_Pane_0, {
        Size = UDim2.fromOffset(0, 0)
    }, {
        Dragger = if not v69.state.visual then nil else v1.createElement(v7, v69.draggerProps), 
        Visual = if not v69.state.visual then nil else v1.createElement(v14, {
            Adornee = v71, 
            AlwaysOnTop = true, 
            Color = if l_props_3.Tool == v20.ToolId.Transform then l_VolumeDragger_0.TransformColor else l_VolumeDragger_0.SelectColor, 
            LineThickness = l_VolumeDragger_0.LineThickness, 
            Lines = v69.state.lines, 
            Scale = v77, 
            Size = l_TargetSize_0, 
            Transform = l_TargetCFrame_0, 
            Transparency = l_VolumeDragger_0.Transparency, 
            Wireframe = l_props_3.Wireframe
        }), 
        Tooltip = if l_props_3.Tool == v20.ToolId.Transform and l_props_3.ShowTooltip then v1.createElement(v13) else nil
    });
end;
return l_withContext_0({
    PluginActivationController = v15.PluginActivationController, 
    Terrain = l_Terrain_0, 
    Stylizer = l_ContextServices_0.Stylizer
})(v24);
