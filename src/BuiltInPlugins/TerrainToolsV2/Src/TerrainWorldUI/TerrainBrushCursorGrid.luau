local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Src.Util.Constants);
local v2 = require(l_Parent_0.Src.Util.TerrainEnums);
local l_ToolId_0 = v2.ToolId;
local l_PlaneLockType_0 = v2.PlaneLockType;
local l_CoreGui_0 = game:GetService("CoreGui");
local function _()
    local l_Part_0 = Instance.new("Part");
    l_Part_0.Name = "LinePart";
    l_Part_0.Transparency = 1;
    l_Part_0.TopSurface = Enum.SurfaceType.Smooth;
    l_Part_0.BottomSurface = Enum.SurfaceType.Smooth;
    l_Part_0.Anchored = true;
    l_Part_0.CanCollide = false;
    l_Part_0.Locked = true;
    l_Part_0.CastShadow = false;
    l_Part_0.Archivable = false;
    local l_SelectionBox_0 = Instance.new("SelectionBox");
    l_SelectionBox_0.Name = "SelectionBox";
    l_SelectionBox_0.Adornee = l_Part_0;
    l_SelectionBox_0.Archivable = false;
    l_SelectionBox_0.Parent = l_Part_0;
    return l_Part_0;
end;
local function _(v9, v10, v11, v12)
    if v10 then
        v11 = 0.5 + 0.5 * v11;
    end;
    local l_BoxHandleAdornment_0 = Instance.new("BoxHandleAdornment");
    l_BoxHandleAdornment_0.Name = "BoxHandle";
    l_BoxHandleAdornment_0.Adornee = v9;
    l_BoxHandleAdornment_0.Archivable = false;
    l_BoxHandleAdornment_0.Parent = v9;
    l_BoxHandleAdornment_0.AlwaysOnTop = v10;
    l_BoxHandleAdornment_0.ZIndex = not v10 and -1 or 0;
    l_BoxHandleAdornment_0.Transparency = v11;
    l_BoxHandleAdornment_0.Color = v12;
    return l_BoxHandleAdornment_0;
end;
local function _()
    local l_ScreenGui_0 = Instance.new("ScreenGui");
    l_ScreenGui_0.Name = "TerrainBrushGui";
    l_ScreenGui_0.Archivable = false;
    return l_ScreenGui_0;
end;
local function _()
    local l_Part_1 = Instance.new("Part");
    l_Part_1.Name = "LinePart";
    l_Part_1.Transparency = 1;
    l_Part_1.TopSurface = Enum.SurfaceType.Smooth;
    l_Part_1.BottomSurface = Enum.SurfaceType.Smooth;
    l_Part_1.Anchored = true;
    l_Part_1.CanCollide = false;
    l_Part_1.Locked = true;
    l_Part_1.CastShadow = false;
    l_Part_1.Archivable = false;
    return l_Part_1;
end;
local v19 = {};
v19.__index = v19;
v19.new = function()
    return (setmetatable({
        _cursorGui = nil, 
        _cursorGridPart = nil, 
        _cursorGridParts = {}, 
        _cursorGridPartsOnTop = {}
    }, v19));
end;
v19.isVisibleForOperation = function(v20)
    if v20.currentTool == l_ToolId_0.None then
        return false;
    else
        local v21 = v20.planeLockActive and v20.planeLock ~= l_PlaneLockType_0.Off;
        local v22 = true;
        if v20.currentTool ~= l_ToolId_0.Flatten then
            v22 = v21 or v20.heightPicker;
        end;
        return v22;
    end;
end;
v19.destroy = function(v23)
    if v23._cursorGridParts and type(v23._cursorGridParts) == "table" then
        for _, v25 in ipairs(v23._cursorGridParts) do
            if v25 then
                v25:Destroy();
            end;
        end;
    end;
    v23._cursorGridParts = {};
    if v23._cursorGui then
        v23._cursorGui:Destroy();
    end;
    if v23._cursorGridPart then
        v23._cursorGridPart:Destroy();
        v23._cursorGridPart = nil;
    end;
end;
v19.hide = function(v26)
    if v26._cursorGui then
        v26._cursorGui.Parent = nil;
    end;
end;
v19.maybeCreate = function(v27)
    if v27._cursorGui then
        if not v27._cursorGui.Parent then
            v27:destroy();
            local l_ScreenGui_1 = Instance.new("ScreenGui");
            l_ScreenGui_1.Name = "TerrainBrushGui";
            l_ScreenGui_1.Archivable = false;
            v27._cursorGui = l_ScreenGui_1;
        end;
    else
        local l_ScreenGui_2 = Instance.new("ScreenGui");
        l_ScreenGui_2.Name = "TerrainBrushGui";
        l_ScreenGui_2.Archivable = false;
        v27._cursorGui = l_ScreenGui_2;
    end;
    v27._cursorGui.Parent = l_CoreGui_0;
end;
v19.update = function(v30, v31)
    v30:_updateInternal(v31.planePoint, v31.planeNormal, v31.cursorSize, not v31.mouseDown and 0.3 or 0.8, nil, v31.planeLock, v31.planeCFrame, v31.editPlaneMode);
end;
v19._updateInternal = function(v32, v33, v34, v35, v36, v37, v38, v39, v40)
    v36 = v36 or 0.95;
    v37 = BrickColor.new(v37 or "Institutional white");
    local v41 = v35 * v1.VOXEL_RESOLUTION;
    local v42 = CFrame.new(v33, v33 + v34);
    local v43 = CFrame.new(Vector3.new(0, 0, 0), v34);
    local v44 = nil;
    v44 = if v38 == l_PlaneLockType_0.Manual and v39 then v39:PointToObjectSpace(v33) else v43:PointToObjectSpace(v33);
    local _ = (Vector3.new((v44.x / v41) % 1, (v44.y / v41) % 1, 0) - Vector3.new(0.5, 0.5, 0)) * -v41;
    if not v32._cursorGridParts or type(v32._cursorGridParts) ~= "table" then
        v32._cursorGridParts = {};
    end;
    if not v32._cursorGui then
        local l_ScreenGui_3 = Instance.new("ScreenGui");
        l_ScreenGui_3.Name = "TerrainBrushGui";
        l_ScreenGui_3.Archivable = false;
        v32._cursorGui = l_ScreenGui_3;
    end;
    if not v32._cursorGridPart then
        local l_Part_2 = Instance.new("Part");
        l_Part_2.Name = "LinePart";
        l_Part_2.Transparency = 1;
        l_Part_2.TopSurface = Enum.SurfaceType.Smooth;
        l_Part_2.BottomSurface = Enum.SurfaceType.Smooth;
        l_Part_2.Anchored = true;
        l_Part_2.CanCollide = false;
        l_Part_2.Locked = true;
        l_Part_2.CastShadow = false;
        l_Part_2.Archivable = false;
        v32._cursorGridPart = l_Part_2;
    end;
    v32._cursorGridPart.Parent = v32._cursorGui;
    if not (v38 == l_PlaneLockType_0.Manual) or not v39 then
        v32._cursorGridPart.CFrame = v42;
    else
        v32._cursorGridPart.CFrame = (v39 - v39.Position) + v33;
    end;
    for v48 = 1, 10 do
        local v49 = (((v48 - ((v44.Y / v41) % 1 or 0)) - 1.5) / 9) % 1;
        local v50 = (v41 * 9) * math.sin((math.acos(v49 * 1.99 - 0.995)));
        local v51 = ((v49 - 0.5) * 9) * v41;
        local v52 = (((v48 - ((v44.X / v41) % 1 or 0)) - 1.5) / 9) % 1;
        local v53 = (v41 * 9) * math.sin((math.acos(v52 * 1.99 - 0.995)));
        local v54 = ((v52 - 0.5) * 9) * v41;
        local v55 = v32._cursorGridParts[v48];
        local v56 = v32._cursorGridPartsOnTop[v48];
        local v57 = v32._cursorGridParts[10 + v48];
        local v58 = v32._cursorGridPartsOnTop[10 + v48];
        if not v55 then
            local l__cursorGridPart_0 = v32._cursorGridPart;
            local l_v36_0 = v36;
            local l_v37_0 = v37;
            local l_BoxHandleAdornment_1 = Instance.new("BoxHandleAdornment");
            l_BoxHandleAdornment_1.Name = "BoxHandle";
            l_BoxHandleAdornment_1.Adornee = l__cursorGridPart_0;
            l_BoxHandleAdornment_1.Archivable = false;
            l_BoxHandleAdornment_1.Parent = l__cursorGridPart_0;
            l_BoxHandleAdornment_1.AlwaysOnTop = false;
            l_BoxHandleAdornment_1.ZIndex = -1;
            l_BoxHandleAdornment_1.Transparency = l_v36_0;
            l_BoxHandleAdornment_1.Color = l_v37_0;
            v55 = l_BoxHandleAdornment_1;
            v32._cursorGridParts[v48] = v55;
        end;
        if not v56 then
            local l__cursorGridPart_1 = v32._cursorGridPart;
            local l_v36_1 = v36;
            local l_v37_1 = v37;
            l_v36_1 = 0.5 + 0.5 * l_v36_1;
            local l_BoxHandleAdornment_2 = Instance.new("BoxHandleAdornment");
            l_BoxHandleAdornment_2.Name = "BoxHandle";
            l_BoxHandleAdornment_2.Adornee = l__cursorGridPart_1;
            l_BoxHandleAdornment_2.Archivable = false;
            l_BoxHandleAdornment_2.Parent = l__cursorGridPart_1;
            l_BoxHandleAdornment_2.AlwaysOnTop = true;
            l_BoxHandleAdornment_2.ZIndex = 0;
            l_BoxHandleAdornment_2.Transparency = l_v36_1;
            l_BoxHandleAdornment_2.Color = l_v37_1;
            v56 = l_BoxHandleAdornment_2;
            v32._cursorGridPartsOnTop[v48] = v56;
        end;
        if not v57 then
            local l__cursorGridPart_2 = v32._cursorGridPart;
            local l_v36_2 = v36;
            local l_v37_2 = v37;
            local l_BoxHandleAdornment_3 = Instance.new("BoxHandleAdornment");
            l_BoxHandleAdornment_3.Name = "BoxHandle";
            l_BoxHandleAdornment_3.Adornee = l__cursorGridPart_2;
            l_BoxHandleAdornment_3.Archivable = false;
            l_BoxHandleAdornment_3.Parent = l__cursorGridPart_2;
            l_BoxHandleAdornment_3.AlwaysOnTop = false;
            l_BoxHandleAdornment_3.ZIndex = -1;
            l_BoxHandleAdornment_3.Transparency = l_v36_2;
            l_BoxHandleAdornment_3.Color = l_v37_2;
            v57 = l_BoxHandleAdornment_3;
            v32._cursorGridParts[10 + v48] = v57;
        end;
        if not v58 then
            local l__cursorGridPart_3 = v32._cursorGridPart;
            local l_v36_3 = v36;
            local l_v37_3 = v37;
            l_v36_3 = 0.5 + 0.5 * l_v36_3;
            local l_BoxHandleAdornment_4 = Instance.new("BoxHandleAdornment");
            l_BoxHandleAdornment_4.Name = "BoxHandle";
            l_BoxHandleAdornment_4.Adornee = l__cursorGridPart_3;
            l_BoxHandleAdornment_4.Archivable = false;
            l_BoxHandleAdornment_4.Parent = l__cursorGridPart_3;
            l_BoxHandleAdornment_4.AlwaysOnTop = true;
            l_BoxHandleAdornment_4.ZIndex = 0;
            l_BoxHandleAdornment_4.Transparency = l_v36_3;
            l_BoxHandleAdornment_4.Color = l_v37_3;
            v58 = l_BoxHandleAdornment_4;
            v32._cursorGridPartsOnTop[10 + v48] = v58;
        end;
        local v75 = math.pow((game:GetService("Workspace").CurrentCamera.CFrame.Position - v33).Magnitude, 0.5) / v1.GRID_LINE_WIDTH;
        local v76 = Vector3.new(v50, v75, v75);
        local v77 = CFrame.new(0, v51, 0);
        local v78 = Vector3.new(v75, v53, v75);
        local v79 = CFrame.new(v54, 0, 0);
        v55.Size = v76;
        v55.CFrame = v77;
        v56.Size = v76;
        v56.CFrame = v77;
        v56.Visible = v40;
        v57.Size = v78;
        v57.CFrame = v79;
        v58.Size = v78;
        v58.CFrame = v79;
        v58.Visible = v40;
    end;
end;
return v19;
