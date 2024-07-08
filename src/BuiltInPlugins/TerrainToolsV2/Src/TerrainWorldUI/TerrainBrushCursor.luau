local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Src.Util.Constants);
local v2 = require(l_Parent_0.Src.Util.TerrainEnums);
local l_BrushShape_0 = v2.BrushShape;
local l_ToolId_0 = v2.ToolId;
local v5 = require(l_Parent_0.Src.Util.applyPivot);
local l_TerrainEditorOverhaul_0 = game:GetFastFlag("TerrainEditorOverhaul");
local l_CoreGui_0 = game:GetService("CoreGui");
local v8 = nil;
local v9 = nil;
local v10 = nil;
local v11 = nil;
if not l_TerrainEditorOverhaul_0 then
    v9 = {
        [l_BrushShape_0.Sphere] = Enum.PartType.Ball, 
        [l_BrushShape_0.Cube] = Enum.PartType.Block, 
        [l_BrushShape_0.Cylinder] = Enum.PartType.Cylinder
    };
    v10 = function(v12)
        return 0.9 - v12 * 0.3;
    end;
    v11 = function()
        local l_Part_0 = Instance.new("Part");
        l_Part_0.Name = "TerrainBrushCursorPart";
        l_Part_0.TopSurface = Enum.SurfaceType.Smooth;
        l_Part_0.BottomSurface = Enum.SurfaceType.Smooth;
        l_Part_0.CastShadow = false;
        l_Part_0.Locked = true;
        l_Part_0.Anchored = true;
        l_Part_0.CanCollide = false;
        l_Part_0.BrickColor = BrickColor.new("Toothpaste");
        l_Part_0.Material = Enum.Material.Neon;
        l_Part_0.Archivable = false;
        l_Part_0.Size = Vector3.new(v1.VOXEL_RESOLUTION, v1.VOXEL_RESOLUTION, v1.VOXEL_RESOLUTION);
        l_Part_0.Shape = v9[l_BrushShape_0.Sphere];
        l_Part_0.Transparency = v10(v1.INITIAL_BRUSH_STRENGTH);
        return l_Part_0;
    end;
else
    v8 = function()
        local v14 = l_CoreGui_0:FindFirstChild("TerrainCursor") or Instance.new("Folder");
        v14.Name = "TerrainCursor";
        v14.Parent = l_CoreGui_0;
        local l_SphereHandleAdornment_0 = Instance.new("SphereHandleAdornment");
        l_SphereHandleAdornment_0.Name = "SphereCursorOnTop";
        l_SphereHandleAdornment_0.Radius = v1.VOXEL_RESOLUTION / 2;
        l_SphereHandleAdornment_0.Transparency = v1.TERRAIN_BRUSH_TRANSPARENCY;
        l_SphereHandleAdornment_0.Color = BrickColor.new("White");
        l_SphereHandleAdornment_0.AlwaysOnTop = true;
        l_SphereHandleAdornment_0.ZIndex = 0;
        l_SphereHandleAdornment_0.Parent = v14;
        local l_SphereHandleAdornment_1 = Instance.new("SphereHandleAdornment");
        l_SphereHandleAdornment_1.Name = "SphereCursorOutline";
        l_SphereHandleAdornment_1.Radius = v1.VOXEL_RESOLUTION / 2;
        l_SphereHandleAdornment_1.Transparency = v1.TERRAIN_BRUSH_TRANSPARENCY;
        l_SphereHandleAdornment_1.Color = BrickColor.new("White");
        l_SphereHandleAdornment_1.Parent = v14;
        local l_BoxHandleAdornment_0 = Instance.new("BoxHandleAdornment");
        l_BoxHandleAdornment_0.Name = "BoxCursorOnTop";
        l_BoxHandleAdornment_0.Size = Vector3.new(v1.VOXEL_RESOLUTION, v1.VOXEL_RESOLUTION, v1.VOXEL_RESOLUTION);
        l_BoxHandleAdornment_0.Transparency = v1.TERRAIN_BRUSH_TRANSPARENCY;
        l_BoxHandleAdornment_0.Color = BrickColor.new("White");
        l_BoxHandleAdornment_0.AlwaysOnTop = true;
        l_BoxHandleAdornment_0.ZIndex = 0;
        l_BoxHandleAdornment_0.Parent = v14;
        local l_BoxHandleAdornment_1 = Instance.new("BoxHandleAdornment");
        l_BoxHandleAdornment_1.Name = "BoxCursorOutline";
        l_BoxHandleAdornment_1.Size = Vector3.new(v1.VOXEL_RESOLUTION, v1.VOXEL_RESOLUTION, v1.VOXEL_RESOLUTION);
        l_BoxHandleAdornment_1.Transparency = v1.TERRAIN_BRUSH_TRANSPARENCY;
        l_BoxHandleAdornment_1.Color = BrickColor.new("White");
        l_BoxHandleAdornment_1.Parent = v14;
        local l_CylinderHandleAdornment_0 = Instance.new("CylinderHandleAdornment");
        l_CylinderHandleAdornment_0.Name = "CylinderCursorOnTop";
        l_CylinderHandleAdornment_0.Height = v1.VOXEL_RESOLUTION;
        l_CylinderHandleAdornment_0.Radius = v1.VOXEL_RESOLUTION / 2;
        l_CylinderHandleAdornment_0.Transparency = v1.TERRAIN_BRUSH_TRANSPARENCY;
        l_CylinderHandleAdornment_0.Color = BrickColor.new("White");
        l_CylinderHandleAdornment_0.AlwaysOnTop = true;
        l_CylinderHandleAdornment_0.ZIndex = 0;
        l_CylinderHandleAdornment_0.Parent = v14;
        local l_CylinderHandleAdornment_1 = Instance.new("CylinderHandleAdornment");
        l_CylinderHandleAdornment_1.Name = "CylinderCursorOutline";
        l_CylinderHandleAdornment_1.Height = v1.VOXEL_RESOLUTION;
        l_CylinderHandleAdornment_1.Radius = v1.VOXEL_RESOLUTION / 2;
        l_CylinderHandleAdornment_1.Transparency = v1.TERRAIN_BRUSH_TRANSPARENCY;
        l_CylinderHandleAdornment_1.Color = BrickColor.new("White");
        l_CylinderHandleAdornment_1.Parent = v14;
        local l_SphereHandleAdornment_2 = Instance.new("SphereHandleAdornment");
        l_SphereHandleAdornment_2.Name = "Central";
        l_SphereHandleAdornment_2.Radius = 0.15;
        l_SphereHandleAdornment_2.Transparency = 0.25;
        l_SphereHandleAdornment_2.Color = BrickColor.new("White");
        l_SphereHandleAdornment_2.Parent = v14;
        return {
            CursorFolder = v14, 
            Central = l_SphereHandleAdornment_2, 
            Sphere = {
                OnTop = l_SphereHandleAdornment_0, 
                Outline = l_SphereHandleAdornment_1
            }, 
            Cube = {
                OnTop = l_BoxHandleAdornment_0, 
                Outline = l_BoxHandleAdornment_1
            }, 
            Cylinder = {
                OnTop = l_CylinderHandleAdornment_0, 
                Outline = l_CylinderHandleAdornment_1
            }
        };
    end;
end;
local v22 = {};
v22.__index = v22;
v22.new = function(v23)
    return (setmetatable({
        _terrain = v23, 
        _cursor = nil, 
        _cursorPart = nil, 
        _cursorFolder = nil, 
        _brushShape = "Sphere"
    }, v22));
end;
v22.isVisibleForOperation = function(v24)
    if v24.currentTool == l_ToolId_0.None then
        return false;
    else
        return (v24.planeLockActive and not v24.heightPicker) and not v24.editPlaneMode;
    end;
end;
if not l_TerrainEditorOverhaul_0 then
    v22.getCursorPart = function(v25)
        return v25._cursorPart;
    end;
    v22.destroy = function(v26)
        if v26._cursorPart then
            v26._cursorPart:Destroy();
            v26._cursorPart = nil;
        end;
        if v26._cursorFolder then
            v26._cursorFolder:Destroy();
            v26._cursorFolder = nil;
        end;
    end;
    v22.hide = function(v27)
        if v27._cursorPart then
            v27._cursorPart.Parent = nil;
        end;
    end;
    v22.maybeCreate = function(v28)
        if not v28._cursorFolder then
            v28._cursorFolder = Instance.new("Folder");
            v28._cursorFolder.Name = "TerrainCursorPart";
        end;
        if not v28._cursorFolder.Parent then
            v28._cursorFolder.Parent = game:GetService("Workspace");
        end;
        if not v28._cursorPart then
            v28._cursorPart = v11();
        end;
        v28._cursorPart.Parent = v28._cursorFolder;
    end;
    v22.update = function(v29, v30)
        if v29._cursorPart then
            local v31 = v30.size * v1.VOXEL_RESOLUTION;
            local v32 = v30.height * v1.VOXEL_RESOLUTION;
            local l_shape_0 = v30.shape;
            v29._cursorPart.Shape = v9[v30.shape];
            if not v30.mouseDown then
                v29._cursorPart.Transparency = v10(v30.strength);
            else
                v29._cursorPart.Transparency = 0.9;
            end;
            if l_shape_0 == l_BrushShape_0.Cylinder then
                v29._cursorPart.Size = Vector3.new(v32, v31, v31);
            else
                v29._cursorPart.Size = Vector3.new(v31, v32, v31) + Vector3.new(0.1, 0.1, 0.1);
            end;
            v29._cursorPart.CFrame = CFrame.new((v5(v30.pivot, v30.location, v32)));
            if l_shape_0 == l_BrushShape_0.Cylinder then
                v29._cursorPart.Rotation = Vector3.new(0, 0, 90);
            end;
            return ;
        else
            return ;
        end;
    end;
else
    v22.destroy = function(v34)
        if v34._cursor then
            v34._cursor.CursorFolder:Destroy();
        end;
    end;
    v22.createOnce = function(v35)
        if not v35._cursor then
            v35._cursor = v8();
        end;
    end;
    v22.hide = function(v36)
        if v36._cursor then
            v36._cursor.Central.Adornee = nil;
            for _, v38 in v36._cursor, nil, nil do
                if typeof(v38) == "table" then
                    for _, v40 in v38, nil, nil do
                        v40.Adornee = nil;
                    end;
                end;
            end;
            return ;
        else
            return ;
        end;
    end;
    v22.show = function(v41, v42, v43, v44, v45, v46, v47)
        if v41._cursor then
            v41._cursor.Central.Adornee = game.Workspace.Terrain;
            v41._cursor.Central.CFrame = v45;
            v41._cursor.Central.Radius = math.abs((game.Workspace.CurrentCamera.CFrame.Position - v45.Position).Magnitude / 128);
            for _, v49 in v41._cursor[v42], nil, nil do
                v49.Adornee = game.Workspace.Terrain;
                v49.CFrame = v45;
                if v42 == "Cylinder" then
                    v49.CFrame = CFrame.Angles(1.5707963267948966, 0, 0) + v49.CFrame.Position;
                    v49.Height = v47 or v46;
                    v49.Radius = v46 / 2;
                elseif v42 == "Cube" then
                    v49.Size = Vector3.new(v46, v47 or v46, v46);
                elseif v42 == "Sphere" then
                    v49.Radius = v46 / 2;
                end;
                if not v43 or v44 then
                    v49.Transparency = v1.TERRAIN_BRUSH_TRANSPARENCY;
                else
                    v49.Transparency = v1.TERRAIN_BRUSH_TRANSPARENCY_MOUSE_DOWN;
                end;
            end;
            return ;
        else
            return ;
        end;
    end;
    v22.update = function(v50, v51)
        if v50._cursor then
            local v52 = v51.size * v1.VOXEL_RESOLUTION;
            local v53 = v51.height * v1.VOXEL_RESOLUTION;
            local l_shape_1 = v51.shape;
            local l_mouseDown_0 = v51.mouseDown;
            local l_adjusting_0 = v51.adjusting;
            local v57 = v5(v51.pivot, v51.location, v53);
            if v50._brushShape ~= l_shape_1 then
                v50:hide();
                v50._brushShape = l_shape_1;
            end;
            v50:show(l_shape_1, l_mouseDown_0, l_adjusting_0, CFrame.new(v57), v52, v53);
            return ;
        else
            return ;
        end;
    end;
end;
return v22;
