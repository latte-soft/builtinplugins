game:DefineFastFlag("TerrainToolsBrushUseIsKeyDown", false);
local l_TerrainToolsBrushUseIsKeyDown_0 = game:GetFastFlag("TerrainToolsBrushUseIsKeyDown");
local l_TerrainEditorOverhaul_0 = game:GetFastFlag("TerrainEditorOverhaul");
local l_Parent_0 = script.Parent.Parent.Parent;
local v3 = require(l_Parent_0.Packages.Framework);
local v4 = require(l_Parent_0.Packages.Cryo);
local l_Signal_0 = v3.Util.Signal;
local v6 = require(l_Parent_0.Src.Util.Constants);
local v7 = require(l_Parent_0.Src.Util.TerrainEnums);
local l_BrushShape_0 = v7.BrushShape;
local l_FlattenMode_0 = v7.FlattenMode;
local l_PivotType_0 = v7.PivotType;
local l_PlaneLockType_0 = v7.PlaneLockType;
local l_ToolId_0 = v7.ToolId;
local v13 = require(l_Parent_0.Src.Util.quickWait);
local v14 = require(l_Parent_0.Src.TerrainWorldUI.TerrainBrushCursor);
local v15 = require(l_Parent_0.Src.TerrainWorldUI.TerrainBrushCursorGrid);
local v16 = require(l_Parent_0.Src.TerrainOperations.DEPRECATED_performTerrainBrushOperation);
local v17 = require(l_Parent_0.Src.Util.createToolAnalytics);
local l_ChangeHistoryService_0 = game:GetService("ChangeHistoryService");
local l_Players_0 = game:GetService("Players");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_Workspace_0 = game:GetService("Workspace");
local v22 = game:DefineFastFlag("TerrainBrushRaycastFix", false);
if require(l_Parent_0.Src.Flags.getFFlagTerrainEditorUseTerrainChannels)() then
    v16 = require(l_Parent_0.Src.TerrainOperations.performTerrainBrushOperation);
end;
local function _(v23, v24, v25, v26)
    local v27 = v24:Dot(v26);
    if v27 == 0 then
        return nil, nil;
    else
        local v28 = (v25 - v23):Dot(v26) / v27;
        return v23 + v24 * v28, v28;
    end;
end;
local function v34(v30, v31)
    local v32 = Vector3.new(1, 1, 1) * (v31 % v6.VOXEL_RESOLUTION);
    local v33 = (v30 - v32) / v6.VOXEL_RESOLUTION + Vector3.new(0.5, 0.5, 0.5);
    return Vector3.new(math.floor(v33.x), math.floor(v33.y), (math.floor(v33.z))) * v6.VOXEL_RESOLUTION + v32;
end;
local function _()
    local l_lookVector_0 = l_Workspace_0.CurrentCamera.CoordinateFrame.lookVector;
    return Vector3.new(math.round(l_lookVector_0.x), math.round(l_lookVector_0.y), (math.round(l_lookVector_0.z))).Unit;
end;
local function _()
    return l_UserInputService_0:IsKeyDown(Enum.KeyCode.LeftShift) or l_UserInputService_0:IsKeyDown(Enum.KeyCode.RightShift);
end;
local function _()
    return l_UserInputService_0:IsKeyDown(Enum.KeyCode.LeftControl) or l_UserInputService_0:IsKeyDown(Enum.KeyCode.RightControl);
end;
local function _()
    return l_UserInputService_0:IsKeyDown(Enum.KeyCode.LeftAlt) or l_UserInputService_0:IsKeyDown(Enum.KeyCode.RightAlt);
end;
local function _()
    return l_UserInputService_0:IsKeyDown(Enum.KeyCode.B);
end;
local function _(v41)
    local l_currentTool_0 = v41.currentTool;
    local v43 = nil;
    local v44 = nil;
    if l_currentTool_0 == l_ToolId_0.Flatten then
        v43 = l_PlaneLockType_0.Off;
        v44 = true;
    end;
    return v4.Dictionary.join(v41, {
        autoMaterial = v44, 
        planeLock = v43
    });
end;
local v46 = {};
v46.__index = v46;
v46.new = function(v47)
    assert(v47 and type(v47) == "table", "TerrainBrush requires an options table");
    local v48 = setmetatable({
        _terrain = v47.terrain, 
        _mouse = v47.mouse, 
        _analytics = v47.analytics, 
        _operationSettings = {
            currentTool = v47.tool, 
            baseSizeHeightLocked = not not l_TerrainEditorOverhaul_0 or nil, 
            brushShape = l_BrushShape_0.Sphere, 
            cursorSize = v6.INITIAL_BRUSH_SIZE, 
            cursorHeight = v6.INITIAL_BRUSH_SIZE, 
            strength = v6.INITIAL_BRUSH_STRENGTH, 
            material = Enum.Material.Grass, 
            autoMaterial = false, 
            flattenMode = l_FlattenMode_0.Both, 
            pivot = l_PivotType_0.Center, 
            planeLock = l_PlaneLockType_0.Off, 
            ignoreWater = true, 
            ignoreParts = true, 
            fixedPlane = false, 
            editPlaneMode = false, 
            snapToVoxels = false, 
            heightPicker = false, 
            planeCFrame = nil, 
            planePositionY = v6.INITIAL_PLANE_POSITION_Y, 
            centerPoint = Vector3.new(0, 0, 0), 
            targetPoint = Vector3.new(0, 0, 0), 
            planePoint = Vector3.new(0, 0, 0), 
            planeNormal = Vector3.new(0, 1, 0)
        }, 
        _isRunning = false, 
        _currentLoopTag = nil, 
        _mouseDown = false, 
        _mouseClick = false, 
        _mouseOrigin = Vector2.new(0, 0), 
        _scrollWheelPosition = 0, 
        _downKeys = not l_TerrainToolsBrushUseIsKeyDown_0 and {} or nil, 
        _connections = {}, 
        _cursor = v14.new(v47.terrain), 
        _cursorGrid = v15.new(), 
        _planePositionYChanged = l_Signal_0.new(), 
        _heightPickerSet = l_Signal_0.new(), 
        _requestBrushSizeChanged = l_Signal_0.new(), 
        _requestBrushStrengthChanged = l_Signal_0.new(), 
        _materialSelectRequested = l_Signal_0.new(), 
        _isTerrainDirty = false, 
        _tool = v47.tool
    }, v46);
    assert(v48._terrain, "TerrainBrush needs a terrain instance");
    assert(v48._mouse, "TerrainBrush needs a mouse instance");
    local v49 = false;
    if v48._operationSettings.currentTool ~= nil then
        v49 = v48._operationSettings.currentTool ~= l_ToolId_0.None;
    end;
    assert(v49, "TerrainBrush needs a tool passed to constructor");
    v48._raycastParams = RaycastParams.new();
    v48._raycastParams.BruteForceAllSlow = true;
    return v48;
end;
v46.destroy = function(v50)
    v50:stop();
end;
v46.subscribeToPlanePositionYChanged = function(v51, ...)
    return v51._planePositionYChanged:Connect(...);
end;
v46.subscribeToHeightPickerSet = function(v52, ...)
    return v52._heightPickerSet:Connect(...);
end;
v46.subscribeToRequestBrushSizeChanged = function(v53, ...)
    return v53._requestBrushSizeChanged:Connect(...);
end;
v46.subscribeToRequestBrushStrengthChanged = function(v54, ...)
    return v54._requestBrushStrengthChanged:Connect(...);
end;
v46.subscribeToMaterialSelectRequested = function(v55, ...)
    return v55._materialSelectRequested:Connect(...);
end;
v46.updateSettings = function(v56, v57)
    assert(v57.currentTool == nil, "Unable to change terrain brush tool");
    v57.currentTool = nil;
    v56.brushMode = v57.brushMode;
    local v58 = v4.Dictionary.join(v56._operationSettings, v57);
    local l_currentTool_1 = v58.currentTool;
    local v60 = nil;
    local v61 = nil;
    if l_currentTool_1 == l_ToolId_0.Flatten then
        v60 = l_PlaneLockType_0.Off;
        v61 = true;
    end;
    v56._operationSettings = v4.Dictionary.join(v58, {
        autoMaterial = v61, 
        planeLock = v60
    });
    v56:_updateCursor();
end;
v46.start = function(v62)
    if not v62._isRunning then
        v62._isRunning = true;
        v62:_connectInput();
        v62:_run();
        return ;
    else
        return ;
    end;
end;
v46.stop = function(v63)
    v63:_saveChanges();
    if v63._isRunning then
        v63._currentLoopTag = nil;
        v63._mouseDown = false;
        v63._mouseClick = false;
        if not l_TerrainToolsBrushUseIsKeyDown_0 then
            v63._downKeys = {};
        end;
        v63:_disconnectAllConnections();
        v63:_destroyCursor();
        v63._isRunning = false;
        return ;
    else
        return ;
    end;
end;
v46.getCachedTerrainSize = function(v64)
    return (math.min(((v64._operationSettings.cursorSize / 2) * v6.VOXEL_RESOLUTION) * 5, 500));
end;
v46._updateCursor = function(v65)
    if not v14.isVisibleForOperation(v65._operationSettings) then
        v65._cursor:hide();
    else
        if not l_TerrainEditorOverhaul_0 then
            v65._cursor:maybeCreate();
        else
            v65._cursor:createOnce();
        end;
        v65._cursor:update({
            size = v65._operationSettings.cursorSize, 
            height = v65._operationSettings.cursorHeight, 
            strength = v65._operationSettings.strength, 
            location = v65._operationSettings.targetPoint, 
            shape = v65._operationSettings.brushShape, 
            pivot = v65._operationSettings.pivot, 
            mouseDown = v65._mouseDown, 
            adjusting = ((l_UserInputService_0:IsKeyDown(Enum.KeyCode.LeftShift) or l_UserInputService_0:IsKeyDown(Enum.KeyCode.RightShift)) or l_UserInputService_0:IsKeyDown(Enum.KeyCode.LeftControl)) or l_UserInputService_0:IsKeyDown(Enum.KeyCode.RightControl)
        });
    end;
    local v66 = nil;
    local v67 = nil;
    if not (v65._operationSettings.planeCFrame ~= nil) or not v65._operationSettings.editPlaneMode then
        v66 = v65._operationSettings.planePoint;
        v67 = v65._operationSettings.planeNormal;
    else
        v66 = v65._operationSettings.planeCFrame.Position;
        v67 = v65._operationSettings.planeCFrame.LookVector;
    end;
    if not v15.isVisibleForOperation(v65._operationSettings) then
        v65._cursorGrid:hide();
        return ;
    else
        v65._cursorGrid:maybeCreate();
        v65._cursorGrid:update({
            cursorSize = v65._operationSettings.cursorSize, 
            planePoint = v66, 
            planeNormal = v67, 
            mouseDown = v65._mouseDown, 
            planeCFrame = v65._operationSettings.planeCFrame, 
            planeLock = v65._operationSettings.planeLock, 
            editPlaneMode = v65._operationSettings.editPlaneMode
        });
        return ;
    end;
end;
v46._destroyCursor = function(v68)
    v68._cursor:destroy();
    v68._cursorGrid:destroy();
end;
v46._disconnectAllConnections = function(v69)
    for _, v71 in pairs(v69._connections) do
        v71:Disconnect();
    end;
    v69._connections = {};
end;
v46._saveChanges = function(v72)
    if v72._isTerrainDirty then
        l_ChangeHistoryService_0:SetWaypoint("Terrain " .. v72._operationSettings.currentTool);
        v72._isTerrainDirty = false;
    end;
end;
v46._needToCacheTerrainPhysics = function(v73)
    if not ((v73._operationSettings.currentTool ~= l_ToolId_0.Add and v73._operationSettings.currentTool ~= l_ToolId_0.Subtract) and (not l_TerrainEditorOverhaul_0 or v73._operationSettings.currentTool ~= l_ToolId_0.Draw)) or v73._operationSettings.currentTool == l_ToolId_0.Paint and v73._operationSettings.target == Enum.Material.Air then
        return v73._operationSettings.planeLock == l_PlaneLockType_0.Off;
    else
        return false;
    end;
end;
v46._connectInput = function(v74)
    local function _(v75, v76)
        if v74._connections[v75] then
            v74._connections[v75]:Disconnect();
        end;
        v74._connections[v75] = v75:Connect(v76);
    end;
    local l_InputBegan_0 = l_UserInputService_0.InputBegan;
    local function v81(v79, v80)
        if not l_TerrainToolsBrushUseIsKeyDown_0 then
            v74._downKeys[v79.KeyCode] = true;
        end;
        if (not (v79.UserInputType == Enum.UserInputType.MouseButton1) or v80) or not v74._isRunning then
            if l_TerrainEditorOverhaul_0 and v79.KeyCode == Enum.KeyCode.B then
                v74._mouseOrigin = Vector2.new(v74._mouse.X, v74._mouse.Y);
                v74._brushStrength = v74._operationSettings.strength;
                v74._brushSize = v74._operationSettings.cursorSize;
                v74._brushHeight = v74._operationSettings.cursorHeight;
                v74._scrollWheelPosition = 0;
            elseif not (not l_TerrainEditorOverhaul_0 or not l_UserInputService_0:IsKeyDown(Enum.KeyCode.B)) and (not (v79.KeyCode ~= Enum.KeyCode.LeftShift) or v79.KeyCode == Enum.KeyCode.RightShift) then
                v74._mouseOrigin = Vector2.new(v74._mouse.X, v74._mouse.Y);
                v74._brushStrength = v74._operationSettings.strength;
                v74._brushSize = v74._operationSettings.cursorSize;
                v74._brushHeight = v74._operationSettings.cursorHeight;
            elseif not (not l_TerrainEditorOverhaul_0 or not l_UserInputService_0:IsKeyDown(Enum.KeyCode.B)) and (not (v79.KeyCode ~= Enum.KeyCode.LeftControl) or v79.KeyCode == Enum.KeyCode.RightControl) then
                v74._mouseOrigin = Vector2.new(v74._mouse.X, v74._mouse.Y);
                v74._brushStrength = v74._operationSettings.strength;
                v74._brushSize = v74._operationSettings.cursorSize;
                v74._brushHeight = v74._operationSettings.cursorHeight;
            end;
        else
            if v22 then
                if not v74:_needToCacheTerrainPhysics() then
                    if (l_UserInputService_0:IsKeyDown(Enum.KeyCode.LeftShift) or l_UserInputService_0:IsKeyDown(Enum.KeyCode.RightShift)) and v74._operationSettings.currentTool == l_ToolId_0.Smooth then
                        v74._terrainCachePoint = v74._operationSettings.targetPoint;
                    end;
                else
                    v74._terrainCacheID = workspace:CacheCurrentTerrain("", v74._operationSettings.targetPoint, v74:getCachedTerrainSize());
                    v74._terrainCachePoint = v74._operationSettings.targetPoint;
                end;
            end;
            v74._mouseDown = true;
            v74._mouseClick = true;
            v74._brushStrength = v74._operationSettings.strength;
            v74._brushSize = v74._operationSettings.cursorSize;
            v74._brushHeight = v74._operationSettings.cursorHeight;
            v74._scrollWheelPosition = 0;
        end;
        if l_TerrainEditorOverhaul_0 and (not (v79.KeyCode ~= Enum.KeyCode.LeftAlt) or v79.KeyCode == Enum.KeyCode.RightAlt) then
            v74._mouse.Icon = "rbxasset://SystemCursors/Cross";
        end;
    end;
    if v74._connections[l_InputBegan_0] then
        v74._connections[l_InputBegan_0]:Disconnect();
    end;
    v74._connections[l_InputBegan_0] = l_InputBegan_0:Connect(v81);
    l_InputBegan_0 = l_UserInputService_0.InputEnded;
    v81 = function(v82, _)
        if not l_TerrainToolsBrushUseIsKeyDown_0 then
            v74._downKeys[v82.KeyCode] = nil;
        end;
        if not (v82.UserInputType == Enum.UserInputType.MouseButton1) or not v74._mouseDown then
            if not (not l_TerrainEditorOverhaul_0 or not l_UserInputService_0:IsKeyDown(Enum.KeyCode.B)) and (not (v82.KeyCode ~= Enum.KeyCode.LeftShift) or v82.KeyCode == Enum.KeyCode.RightShift) then
                v74._mouseOrigin = Vector2.new(v74._mouse.X, v74._mouse.Y);
                v74._brushStrength = v74._operationSettings.strength;
                v74._brushSize = v74._operationSettings.cursorSize;
                v74._brushHeight = v74._operationSettings.cursorHeight;
            elseif not (not l_TerrainEditorOverhaul_0 or not l_UserInputService_0:IsKeyDown(Enum.KeyCode.B)) and (not (v82.KeyCode ~= Enum.KeyCode.LeftControl) or v82.KeyCode == Enum.KeyCode.RightControl) then
                v74._mouseOrigin = Vector2.new(v74._mouse.X, v74._mouse.Y);
                v74._brushStrength = v74._operationSettings.strength;
                v74._brushSize = v74._operationSettings.cursorSize;
                v74._brushHeight = v74._operationSettings.cursorHeight;
            elseif l_TerrainEditorOverhaul_0 and (not (v82.KeyCode ~= Enum.KeyCode.LeftShift) or v82.KeyCode == Enum.KeyCode.RightShift) then
                v74._restoreCachedTerrain = true;
            end;
        else
            if not (not v22 or not v74._terrainCacheID) then
                workspace:ClearCachedTerrain(v74._terrainCacheID);
                v74._terrainCacheID = nil;
            end;
            v74._mouseDown = false;
            v74._brushStrength = v74._operationSettings.strength;
            v74._brushSize = v74._operationSettings.cursorSize;
            v74._brushHeight = v74._operationSettings.cursorHeight;
            v74._scrollWheelPosition = 0;
            v74._mouseOrigin = Vector2.new(v74._mouse.X, v74._mouse.Y);
            v74:_saveChanges();
        end;
        if l_TerrainEditorOverhaul_0 and v82.KeyCode == Enum.KeyCode.B then
            v74._scrollMouseDiff = nil;
        end;
        if l_TerrainEditorOverhaul_0 and (not (v82.KeyCode ~= Enum.KeyCode.LeftAlt) or v82.KeyCode == Enum.KeyCode.RightAlt) then
            v74._mouse.Icon = "rbxasset://SystemCursors/Arrow";
        end;
    end;
    if v74._connections[l_InputBegan_0] then
        v74._connections[l_InputBegan_0]:Disconnect();
    end;
    v74._connections[l_InputBegan_0] = l_InputBegan_0:Connect(v81);
    if not l_TerrainToolsBrushUseIsKeyDown_0 then
        l_InputBegan_0 = l_UserInputService_0.WindowFocusReleased;
        v81 = function()
            v74._downKeys = {};
        end;
        if v74._connections[l_InputBegan_0] then
            v74._connections[l_InputBegan_0]:Disconnect();
        end;
        v74._connections[l_InputBegan_0] = l_InputBegan_0:Connect(v81);
    end;
    if not l_TerrainEditorOverhaul_0 then
        l_InputBegan_0 = function(v84)
            local _ = nil;
            if if not l_TerrainToolsBrushUseIsKeyDown_0 then v74._downKeys[Enum.KeyCode.LeftShift] or v74._downKeys[Enum.KeyCode.RightShift] else l_UserInputService_0:IsKeyDown(Enum.KeyCode.LeftShift) or l_UserInputService_0:IsKeyDown(Enum.KeyCode.RightShift) then
                local v86 = v84 / 10;
                local v87 = v74._operationSettings.cursorSize * v86;
                local v88 = v74._operationSettings.cursorHeight * v86;
                if math.abs(v87) < 1 then
                    v87 = math.sign(v87);
                end;
                if math.abs(v88) < 1 then
                    v88 = math.sign(v88);
                end;
                v74._requestBrushSizeChanged:Fire(math.max(v6.MIN_BRUSH_SIZE, (math.min(v6.MAX_BRUSH_SIZE, (math.round(v74._operationSettings.cursorSize + v87))))), (math.max(v6.MIN_BRUSH_SIZE, (math.min(v6.MAX_BRUSH_SIZE, (math.round(v74._operationSettings.cursorHeight + v88)))))));
            end;
            local _ = nil;
            if if not l_TerrainToolsBrushUseIsKeyDown_0 then v74._downKeys[Enum.KeyCode.LeftControl] or v74._downKeys[Enum.KeyCode.RightControl] else l_UserInputService_0:IsKeyDown(Enum.KeyCode.LeftControl) or l_UserInputService_0:IsKeyDown(Enum.KeyCode.RightControl) then
                v74._requestBrushStrengthChanged:Fire((math.max(0.1, (math.min(1, v74._operationSettings.strength + v84 * 0.1)))));
            end;
        end;
        v81 = v74._mouse.WheelForward;
        local l_l_InputBegan_0_0 = l_InputBegan_0 --[[ copy: 2 -> 5 ]];
        local function v91()
            l_l_InputBegan_0_0(1);
        end;
        if v74._connections[v81] then
            v74._connections[v81]:Disconnect();
        end;
        v74._connections[v81] = v81:Connect(v91);
        v81 = v74._mouse.WheelBackward;
        local l_l_InputBegan_0_1 = l_InputBegan_0 --[[ copy: 2 -> 6 ]];
        v91 = function()
            l_l_InputBegan_0_1(-1);
        end;
        if v74._connections[v81] then
            v74._connections[v81]:Disconnect();
        end;
        v74._connections[v81] = v81:Connect(v91);
    end;
    if l_TerrainEditorOverhaul_0 then
        l_InputBegan_0 = function()
            local v93 = (v74._scrollMouseDiff or Vector2.new(v74._mouse.X, v74._mouse.Y) - v74._mouseOrigin).X + v74._scrollWheelPosition;
            if not l_UserInputService_0:IsKeyDown(Enum.KeyCode.B) or not (l_UserInputService_0:IsKeyDown(Enum.KeyCode.LeftShift) or l_UserInputService_0:IsKeyDown(Enum.KeyCode.RightShift)) then
                if not l_UserInputService_0:IsKeyDown(Enum.KeyCode.B) or not (l_UserInputService_0:IsKeyDown(Enum.KeyCode.LeftControl) or l_UserInputService_0:IsKeyDown(Enum.KeyCode.RightControl)) then
                    if l_UserInputService_0:IsKeyDown(Enum.KeyCode.B) then
                        local v94 = math.floor((math.clamp(v74._brushSize + v93 / 10, v6.MIN_BRUSH_SIZE, v6.MAX_BRUSH_SIZE)));
                        if not v74._operationSettings.baseSizeHeightLocked then
                            v74._requestBrushSizeChanged:Fire(v94, v74._brushHeight);
                        else
                            v74._requestBrushSizeChanged:Fire(v94, v94);
                            return ;
                        end;
                    end;
                    return ;
                else
                    local v95 = math.floor((math.clamp(v74._brushHeight + v93 / 10, v6.MIN_BRUSH_SIZE, v6.MAX_BRUSH_SIZE)));
                    v74._requestBrushSizeChanged:Fire(v74._brushSize, v95);
                    if not v74._operationSettings.baseSizeHeightLocked then
                        v74._requestBrushSizeChanged:Fire(v74._brushSize, v95);
                        return ;
                    else
                        v74._requestBrushSizeChanged:Fire(v95, v95);
                        return ;
                    end;
                end;
            else
                v74._requestBrushStrengthChanged:Fire((math.clamp(v74._operationSettings.strength + v93 * 0.005, 0.1, 1)));
                return ;
            end;
        end;
        v81 = v74._mouse.WheelForward;
        local function v97()
            if l_UserInputService_0:IsKeyDown(Enum.KeyCode.B) then
                workspace.CurrentCamera:Zoom(-1);
                local l_v74_0 = v74;
                l_v74_0._scrollWheelPosition = l_v74_0._scrollWheelPosition + v6.SCROLL_WHEEL_SPEED;
                if not v74._scrollMouseDiff then
                    v74._scrollMouseDiff = Vector2.new(v74._mouse.X, v74._mouse.Y) - v74._mouseOrigin;
                end;
            end;
            l_InputBegan_0();
        end;
        if v74._connections[v81] then
            v74._connections[v81]:Disconnect();
        end;
        v74._connections[v81] = v81:Connect(v97);
        v81 = v74._mouse.WheelBackward;
        v97 = function()
            if l_UserInputService_0:IsKeyDown(Enum.KeyCode.B) then
                workspace.CurrentCamera:Zoom(1);
                local l_v74_1 = v74;
                l_v74_1._scrollWheelPosition = l_v74_1._scrollWheelPosition - v6.SCROLL_WHEEL_SPEED;
                if not v74._scrollMouseDiff then
                    v74._scrollMouseDiff = Vector2.new(v74._mouse.X, v74._mouse.Y) - v74._mouseOrigin;
                end;
            end;
            l_InputBegan_0();
        end;
        if v74._connections[v81] then
            v74._connections[v81]:Disconnect();
        end;
        v74._connections[v81] = v81:Connect(v97);
        v81 = v74._mouse.Move;
        v97 = function()
            if not v74._mouseDown and not v74._scrollMouseDiff then
                l_InputBegan_0();
                return ;
            else
                return ;
            end;
        end;
        if v74._connections[v81] then
            v74._connections[v81]:Disconnect();
        end;
        v74._connections[v81] = v81:Connect(v97);
    end;
end;
v46.putPlanePositionYIntoVector = function(v99, v100)
    return (Vector3.new(v100.x, v99._operationSettings.planePositionY or 0, v100.z));
end;
v46._run = function(v101)
    v101._isRunning = true;
    local v102 = Vector3.new(0, 0, 0);
    local v103 = Vector3.new(0, 1, 0);
    local v104 = Vector3.new(0, 0, 0);
    local v105 = tick();
    local v106 = true;
    local v107 = {};
    v101._currentLoopTag = v107;
    while true do
        if v101._currentLoopTag and v101._currentLoopTag == v107 then
            if v101._mouse then
                if (not l_TerrainEditorOverhaul_0 or not l_UserInputService_0:IsKeyDown(Enum.KeyCode.B)) or v101._mouseDown then
                    local l_currentTool_2 = v101._operationSettings.currentTool;
                    local l_heightPicker_0 = v101._operationSettings.heightPicker;
                    local v110 = v101._operationSettings.planeLock ~= l_PlaneLockType_0.Off;
                    local v111 = v101._operationSettings.planeLock == l_PlaneLockType_0.Manual;
                    local l_fixedPlane_0 = v101._operationSettings.fixedPlane;
                    local l_snapToVoxels_0 = v101._operationSettings.snapToVoxels;
                    local l_ignoreWater_0 = v101._operationSettings.ignoreWater;
                    local l_editPlaneMode_0 = v101._operationSettings.editPlaneMode;
                    local l_planeCFrame_0 = v101._operationSettings.planeCFrame;
                    local l_ignoreParts_0 = v101._operationSettings.ignoreParts;
                    if l_TerrainEditorOverhaul_0 then
                        if (not (not (v101._tool ~= l_ToolId_0.Sculpt) or v101._tool == l_ToolId_0.Draw) or not (l_UserInputService_0:IsKeyDown(Enum.KeyCode.LeftShift) or l_UserInputService_0:IsKeyDown(Enum.KeyCode.RightShift))) or l_UserInputService_0:IsKeyDown(Enum.KeyCode.B) then
                            if v101._tool then
                                v101._operationSettings.currentTool = v101._tool;
                            end;
                        else
                            v101._operationSettings.currentTool = l_ToolId_0.Smooth;
                        end;
                    end;
                    local v118 = tick();
                    local v119 = (v101._operationSettings.cursorSize * 0.5) * v6.VOXEL_RESOLUTION;
                    local l_p_0 = v101._mouse.Origin.p;
                    if not l_ignoreParts_0 then
                        local v121 = if not l_TerrainEditorOverhaul_0 then {
                            v101._cursor:getCursorPart()
                        } else {};
                        if not (not l_Players_0.LocalPlayer or not l_Players_0.LocalPlayer.Character) then
                            table.insert(v121, l_Players_0.LocalPlayer.Character);
                        end;
                        v101._raycastParams.FilterType = Enum.RaycastFilterType.Blacklist;
                        v101._raycastParams.FilterDescendantsInstances = v121;
                    else
                        local v122 = {
                            v101._terrain
                        };
                        if l_Workspace_0:FindFirstChild("Baseplate") then
                            table.insert(v122, l_Workspace_0:FindFirstChild("Baseplate"));
                        end;
                        v101._raycastParams.FilterType = Enum.RaycastFilterType.Whitelist;
                        v101._raycastParams.FilterDescendantsInstances = v122;
                    end;
                    local l_Direction_0 = v101._mouse.UnitRay.Direction;
                    local v124 = nil;
                    local v125 = nil;
                    local v126 = nil;
                    local v127 = nil;
                    v101._raycastParams.IgnoreWater = l_ignoreWater_0;
                    v101._raycastParams.BruteForceAllSlow = true;
                    local v128 = l_Workspace_0:Raycast(l_p_0, l_Direction_0 * 10000, v101._raycastParams);
                    if not ((not v22 or not v101._mouseDown) or not v101:_needToCacheTerrainPhysics()) then
                        local v129 = not not v128 and v128.Position or v104;
                        if v101:getCachedTerrainSize() * 0.9 < (v129 - v101._terrainCachePoint).magnitude then
                            workspace:CacheCurrentTerrain(v101._terrainCacheID, v129, v101:getCachedTerrainSize());
                            v101._terrainCachePoint = v129;
                        end;
                        v128 = l_Workspace_0:RaycastCachedTerrain(v101._terrainCacheID, l_p_0, l_Direction_0 * 10000, l_ignoreWater_0);
                    end;
                    if not v128 then
                        v124 = nil;
                        v126 = nil;
                        local l_lookVector_1 = l_Workspace_0.CurrentCamera.CoordinateFrame.lookVector;
                        v127 = Vector3.new(math.round(l_lookVector_1.x), math.round(l_lookVector_1.y), (math.round(l_lookVector_1.z))).Unit;
                        local v131 = Vector3.new(0, 0, 0);
                        local v132 = Vector3.new(0, 1, 0);
                        local v133 = l_Direction_0:Dot(v132);
                        local v134;
                        if v133 == 0 then
                            v134 = nil;
                            l_lookVector_1 = nil;
                        else
                            local v135 = (v131 - l_p_0):Dot(v132) / v133;
                            v134 = l_p_0 + l_Direction_0 * v135;
                            l_lookVector_1 = v135;
                        end;
                        v125 = if (not not v134 and l_lookVector_1) and l_lookVector_1 >= 0 then v134 else l_p_0 + l_Direction_0 * 10000;
                    else
                        v124 = v128.Instance;
                        v125 = v128.Position;
                        v126 = v128.Material;
                        v127 = v128.Normal;
                    end;
                    if l_currentTool_2 == l_ToolId_0.Add then
                        v125 = v125 - l_Direction_0 * 0.05;
                    elseif not (l_currentTool_2 ~= l_ToolId_0.Subtract and l_currentTool_2 ~= l_ToolId_0.Paint) or l_currentTool_2 == l_ToolId_0.Grow then
                        v125 = v125 + l_Direction_0 * 0.05;
                    end;
                    if not (not l_heightPicker_0 and (((not (l_currentTool_2 == l_ToolId_0.Flatten) or not v101._mouseClick) or l_fixedPlane_0) or v110)) then
                        v101._planePositionYChanged:Fire(not not l_snapToVoxels_0 and v34(v125, v119).y or v125.y - 1);
                    end;
                    local v136 = nil;
                    v136 = if not l_TerrainToolsBrushUseIsKeyDown_0 then v101._downKeys[Enum.KeyCode.LeftShift] or v101._downKeys[Enum.KeyCode.RightShift] else l_UserInputService_0:IsKeyDown(Enum.KeyCode.LeftShift) or l_UserInputService_0:IsKeyDown(Enum.KeyCode.RightShift);
                    local v137 = (l_fixedPlane_0 and not l_heightPicker_0) and v101._operationSettings.planePositionY ~= nil;
                    local v138 = true;
                    if (not v110 or not v136) or l_TerrainEditorOverhaul_0 then
                        if not (not v101._mouseDown or v101._mouseClick) then
                            v138 = false;
                        end;
                    else
                        v138 = false;
                    end;
                    if v138 then
                        if not v111 or not l_editPlaneMode_0 then
                            if (not v111 or l_editPlaneMode_0) or not l_planeCFrame_0 then
                                v102 = not not v137 and v101:putPlanePositionYIntoVector(v125) or v125;
                                if not (l_currentTool_2 ~= l_ToolId_0.Flatten) or v110 then
                                    local v139, v140;
                                    if l_currentTool_2 == l_ToolId_0.Flatten then
                                        v140 = Vector3.new(0, 1, 0);
                                        if v140 then
                                            goto label0;
                                        end;
                                    end;
                                    v139 = l_Workspace_0.CurrentCamera.CoordinateFrame.lookVector;
                                    v140 = Vector3.new(math.round(v139.x), math.round(v139.y), (math.round(v139.z))).Unit;
                                    ::label0::;
                                    v103 = v140;
                                else
                                    v103 = v127;
                                end;
                            else
                                v102 = v101._operationSettings.planeCFrame.Position;
                                v103 = l_planeCFrame_0.LookVector;
                            end;
                        else
                            v102 = v101._operationSettings.planeCFrame.Position;
                            v103 = Vector3.new(0, 1, 0);
                        end;
                        v106 = true;
                    end;
                    local l_v102_0 = v102;
                    local l_v103_0 = v103;
                    local v143 = l_Direction_0:Dot(l_v103_0);
                    local v144 = if v143 == 0 then nil else l_p_0 + l_Direction_0 * ((l_v102_0 - l_p_0):Dot(l_v103_0) / v143) or l_p_0;
                    l_v102_0 = nil;
                    if l_snapToVoxels_0 then
                        v125 = v34(v125, v119);
                        l_v102_0 = v34(v144, v119);
                    end;
                    if v137 then
                        l_v102_0 = v101:putPlanePositionYIntoVector(l_v102_0 or v144);
                    end;
                    if v110 then
                        v125 = l_v102_0 or v144;
                        l_v102_0 = v144;
                    end;
                    v101._operationSettings.targetPoint = v125;
                    v101._operationSettings.planePoint = l_v102_0 or v144;
                    v101._operationSettings.planeNormal = v103;
                    if v101._mouseDown then
                        if v101._mouseClick then
                            v105 = v118;
                            v104 = v125;
                        end;
                        l_v103_0 = nil;
                        l_v103_0 = if not l_TerrainToolsBrushUseIsKeyDown_0 then v101._downKeys[Enum.KeyCode.LeftAlt] or v101._downKeys[Enum.KeyCode.RightAlt] else l_UserInputService_0:IsKeyDown(Enum.KeyCode.LeftAlt) or l_UserInputService_0:IsKeyDown(Enum.KeyCode.RightAlt);
                        v143 = nil;
                        if not ((((not l_TerrainEditorOverhaul_0 or not l_v103_0) or not v101._mouseClick) or not v124) or not v124:IsA("Terrain")) then
                            v101._materialSelectRequested:Fire(v126, l_UserInputService_0:IsKeyDown(Enum.KeyCode.LeftShift) or l_UserInputService_0:IsKeyDown(Enum.KeyCode.RightShift));
                            v143 = true;
                        end;
                        local v145;
                        if not v101._mouseClick then
                            v145 = false;
                            if not (v105 + 0.1 < v118) then
                                goto label1;
                            end;
                        end;
                        v145 = not l_editPlaneMode_0 and not v143;
                        ::label1::;
                        if v145 then
                            v101._mouseClick = false;
                            if v106 then
                                if v101._analytics then
                                    v101._analytics:report("useBrushToolExtended", v17(v101._operationSettings));
                                end;
                                v106 = false;
                            end;
                            local v146 = l_UserInputService_0:IsKeyDown(Enum.KeyCode.LeftControl) or l_UserInputService_0:IsKeyDown(Enum.KeyCode.RightControl);
                            if l_TerrainEditorOverhaul_0 or not l_v103_0 then
                                v101._operationSettings.brushMode = v101.brushMode;
                                if not (not l_TerrainEditorOverhaul_0 or not v146) then
                                    if v101.brushMode == v7.BrushMode.Add then
                                        v101._operationSettings.brushMode = v7.BrushMode.Subtract;
                                    elseif v101.brushMode == v7.BrushMode.Subtract then
                                        v101._operationSettings.brushMode = v7.BrushMode.Add;
                                    end;
                                end;
                                local v147 = v125 - v104;
                                local l_magnitude_0 = v147.magnitude;
                                local v149 = v119 * 0.5;
                                if v22 then
                                    if v149 < l_magnitude_0 then
                                        local l_unit_0 = v147.unit;
                                        l_magnitude_0 = math.min(l_magnitude_0, v149 * 2 + 20);
                                        local v151 = math.ceil(l_magnitude_0 / v149 - 0.1);
                                        for v152 = 1, v151 do
                                            v101._operationSettings.centerPoint = v104 + (l_unit_0 * l_magnitude_0) * (v152 / v151);
                                            if not v101._restoreCachedTerrain then
                                                v16(v101._terrain, v101._operationSettings);
                                            end;
                                        end;
                                        v125 = v104 + l_unit_0 * l_magnitude_0;
                                    else
                                        v101._operationSettings.centerPoint = v125;
                                        if not v101._restoreCachedTerrain then
                                            v16(v101._terrain, v101._operationSettings);
                                        end;
                                    end;
                                    v101._isTerrainDirty = true;
                                    v104 = v125;
                                    v101._restoreCachedTerrain = false;
                                else
                                    local v153 = true;
                                    if v149 < l_magnitude_0 then
                                        local l_unit_1 = v147.unit;
                                        local v155 = math.min(l_magnitude_0, v149 * 2 + 20);
                                        local v156 = math.ceil(v155 / v149 - 0.1);
                                        if not (not (l_currentTool_2 == l_ToolId_0.Add) or v110) and math.abs((l_Direction_0:Dot(v147.unit))) > 0.99 then
                                            v153 = false;
                                        end;
                                        if v153 then
                                            for v157 = 1, v156 do
                                                v101._operationSettings.centerPoint = v104 + (l_unit_1 * v155) * (v157 / v156);
                                                v16(v101._terrain, v101._operationSettings);
                                            end;
                                            v125 = v104 + l_unit_1 * v155;
                                        end;
                                    else
                                        if not (not (l_currentTool_2 == l_ToolId_0.Add) or v110) then
                                            local v158 = l_Direction_0:Dot(v147.unit);
                                            if (v147 - Vector3.new(0, 0, 0)).magnitude >= 0.01 and math.abs(v158) >= 0.99 then
                                                v153 = false;
                                            end;
                                        end;
                                        if v153 then
                                            v101._operationSettings.centerPoint = v125;
                                            v16(v101._terrain, v101._operationSettings);
                                        end;
                                    end;
                                    if v153 then
                                        v101._isTerrainDirty = true;
                                        v104 = v125;
                                    end;
                                end;
                            elseif not (not v124 or not v124:IsA("Terrain")) then
                                v101._materialSelectRequested:Fire(v126, l_UserInputService_0:IsKeyDown(Enum.KeyCode.LeftShift) or l_UserInputService_0:IsKeyDown(Enum.KeyCode.RightShift));
                            end;
                        end;
                        if not (not (l_currentTool_2 == l_ToolId_0.Flatten) or not l_heightPicker_0) then
                            v101._heightPickerSet:Fire(false);
                        end;
                    end;
                    v101:_updateCursor();
                    v13();
                else
                    v13();
                end;
            else
                warn("No mouse in TerrainBrush:_run()");
                return ;
            end;
        else
            return ;
        end;
    end;
end;
return v46;
