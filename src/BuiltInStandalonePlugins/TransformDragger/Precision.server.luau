local l_plugin_0 = plugin;
local _ = settings;
local l_RunService_0 = game:GetService("RunService");
local v3 = game:DefineFastFlag("DeactivateTransformToolCorrectly", false);
local v4 = game:DefineFastFlag("RemoveTransformToolDefaultShortcut", false);
local v5 = game:DefineFastFlag("TransformToolCorrectCamera", false);
local v6 = game:DefineFastFlag("TransformToolFixDeferredDrag", false);
local v7 = game:DefineFastFlag("TransformToolCursor", false);
local v8 = require(script.Parent.Collision);
local v9 = require(script.Parent.Utility);
local v10 = require(script.Parent.List);
local v11 = require(script.Parent.Selection);
local v12 = require(script.Parent.Metapart);
local v13 = require(script.Parent.FuzzyMath);
local v14 = require(script.Parent.Round);
local v15 = require(script.Parent.Extent);
local v16 = require(script.Parent.Adornments);
local v17 = require(script.Parent.Input);
local v18 = require(script.Parent.Rubberband);
local v19 = require(script.Parent.Analytics);
local l_UserInputService_0 = game:GetService("UserInputService");
local l_Workspace_0 = game:GetService("Workspace");
local l_Selection_0 = game:GetService("Selection");
local l_StudioService_0 = game:GetService("StudioService");
local v24 = nil;
local v25 = nil;
local v26 = 0;
local v27 = nil;
do
    local l_v24_0, l_v25_0, l_v26_0, l_v27_0 = v24, v25, v26, v27;
    analyticsSessionBegin = function()
        l_v26_0 = tick();
        l_v24_0 = {
            freeformDrags = 0, 
            handleDrags = 0, 
            clickSelects = 0, 
            dragSelects = 0, 
            dragTilts = 0, 
            dragRotates = 0, 
            toolName = "Transform", 
            wasAutoSelected = false
        };
        v19:sendEvent("toolSelected", {
            toolName = "Transform", 
            wasAutoSelected = false
        });
        v19:reportCounter("studioLua" .. "Transform" .. "DraggerSelected");
    end;
    analyticsSendSession = function()
        l_v24_0.duration = tick() - l_v26_0;
        v19:sendEvent("toolSession", l_v24_0);
    end;
    local l_l_UserInputService_0_0 = l_UserInputService_0 --[[ copy: 20 -> 111 ]];
    analyticsSendClick = function(v33, v34)
        v19:sendEvent("clickedObject", {
            altPressed = l_l_UserInputService_0_0:IsKeyDown(Enum.KeyCode.LeftAlt), 
            ctrlPressed = l_l_UserInputService_0_0:IsKeyDown(Enum.KeyCode.LeftControl), 
            shiftPressed = l_l_UserInputService_0_0:IsKeyDown(Enum.KeyCode.LeftShift), 
            clickedAttachment = v33 and v33:IsA("Attachment"), 
            clickedConstraint = v33 and (v33:IsA("Constraint") or v33:IsA("WeldConstraint")), 
            didAlterSelection = v34
        });
        if v34 then
            l_v24_0.clickSelects = l_v24_0.clickSelects + 1;
        end;
    end;
    local l_l_Selection_0_0 = l_Selection_0 --[[ copy: 22 -> 112 ]];
    analyticsRecordFreeformDragBegin = function()
        local v36 = 0;
        for _, v38 in pairs(l_l_Selection_0_0:Get()) do
            if v38:IsA("BasePart") then
                v36 = v36 + 1;
            end;
            for _, v40 in pairs(v38:GetDescendants()) do
                if v40:IsA("BasePart") then
                    v36 = v36 + 1;
                end;
            end;
        end;
        l_v24_0.freeformDrags = l_v24_0.freeformDrags + 1;
        l_v25_0 = {
            dragTilts = 0, 
            dragRotates = 0, 
            partCount = v36, 
            attachmentCount = 0, 
            timeToStartDrag = 0
        };
        l_v27_0 = nil;
    end;
    local l_l_Workspace_0_0 = l_Workspace_0 --[[ copy: 21 -> 113 ]];
    analyticsRecordFreeformDragUpdate = function(v42)
        if l_v25_0 then
            l_v25_0.dragTargetType = "Polygon";
            if not l_v27_0 then
                l_v25_0.dragDistance = 0;
                l_v27_0 = v42;
            else
                l_v25_0.dragDistance = (v42 - l_v27_0).Magnitude;
            end;
            l_v25_0.distanceToCamera = (l_l_Workspace_0_0.CurrentCamera.CFrame.Position - v42).Magnitude;
        end;
    end;
    local l_l_StudioService_0_0 = l_StudioService_0 --[[ copy: 23 -> 114 ]];
    analyticsSendFreeformDragged = function()
        if l_v25_0 then
            l_v25_0.gridSize = l_l_StudioService_0_0.GridSize;
            l_v25_0.toolName = "Transform";
            l_v25_0.wasAutoSelected = false;
            l_v25_0.joinSurfaces = false;
            l_v25_0.useConstraints = false;
            v19:sendEvent("freeformDragged", l_v25_0);
            l_v25_0 = nil;
        end;
    end;
    analyticsSendHandleDragged = function(v44)
        v19:sendEvent("handleDragged", {
            toolName = "Transform", 
            gridSize = l_l_StudioService_0_0.GridSize, 
            rotateIncrement = l_l_StudioService_0_0.RotateIncrement, 
            useLocalSpace = false, 
            joinSurfaces = false, 
            useConstraints = false, 
            haveCollisions = false, 
            wasAutoSelected = false
        });
        v19:sendEvent("transformHandleDragged", {
            gridSize = l_l_StudioService_0_0.GridSize, 
            rotateIncrement = l_l_StudioService_0_0.RotateIncrement, 
            handleName = v44
        });
    end;
    analyticsSendBoxSelect = function()
        v19:sendEvent("boxSelected", {
            toolName = "Transform", 
            objectCount = #l_l_Selection_0_0:Get(), 
            altPressed = l_l_UserInputService_0_0:IsKeyDown(Enum.KeyCode.LeftAlt), 
            ctrlPressed = l_l_UserInputService_0_0:IsKeyDown(Enum.KeyCode.LeftControl), 
            shiftPressed = l_l_UserInputService_0_0:IsKeyDown(Enum.KeyCode.LeftShift), 
            wasAutoSelected = false
        });
    end;
    analyticsSendSetPlane = function()
        v19:sendEvent("setPlane", {
            toolName = "Transform"
        });
    end;
end;
l_UserInputService_0 = false;
l_Workspace_0 = false;
l_Selection_0 = l_plugin_0:GetMouse(true);
v17.setMouse(l_Selection_0);
l_StudioService_0 = false;
v24 = false;
v25 = true;
v26 = game:GetService("CoreGui");
v27 = game:GetService("UserInputService");
local v45 = nil;
local v46 = nil;
local v47 = false;
local v48 = nil;
local _ = {
    n = 0
};
local v50 = nil;
local v51 = nil;
local v52 = nil;
local v53 = Vector3.new(0, 0, 0);
local v54 = nil;
local v55 = nil;
local v56 = nil;
local v57 = nil;
local v58 = nil;
local v59 = nil;
local v60 = nil;
local v61 = nil;
local v62 = nil;
local v63 = 0;
local v64 = nil;
local v65 = nil;
local v66 = nil;
local v67 = nil;
local v68 = nil;
local v69 = nil;
local v70 = nil;
local v71 = nil;
local v72 = nil;
local v73 = CFrame.new();
local v74 = nil;
local v75 = nil;
local v76 = nil;
local v77 = nil;
local v78 = nil;
local v79 = nil;
local v80 = nil;
local v81 = nil;
local v82 = nil;
local v83 = nil;
local v84 = nil;
local v85 = nil;
local v86 = nil;
local v87 = false;
local v88 = false;
local v89 = false;
local v90 = nil;
local v91 = nil;
v16.setWorkplaneAccessor(function()
    return v73, v63;
end);
local v92 = {
    [0] = "None", 
    [1] = "Translate", 
    [2] = "ScaleEdge", 
    [3] = "ScaleEdge", 
    [4] = "ScaleEdge", 
    [5] = "ScaleEdge", 
    [6] = "ScaleEdge", 
    [7] = "ScaleCorner", 
    [8] = "ScaleCorner", 
    [9] = "ScaleCorner", 
    [10] = "ScaleCorner", 
    [11] = "Rotate", 
    [12] = "Rotate", 
    [13] = "Rotate", 
    [14] = "Plane"
};
local _ = {};
local v94 = false;
local v95 = {};
local function v97(v96)
    if not v96:IsA("Wrapped") then
        if v96:IsA("BasePart") then
            workspace:UnjoinFromOutsiders({
                v96
            });
        end;
        return ;
    else
        workspace:UnjoinFromOutsiders({
            v96.Object
        });
        return ;
    end;
end;
local function _()
    workspace:JoinToOutsiders(v11.getFilteredSelection(), l_plugin_0:GetJoinMode());
end;
local function _()
    workspace:UnjoinFromOutsiders((v11.getFilteredSelection()));
end;
local v100 = {};
local function v101(v102)
    if not (not v102:IsA("BasePart") or not v102:GetRootPart()) then
        v100[v102:GetRootPart()] = true;
    end;
    for _, v104 in ipairs((v102:GetChildren())) do
        v101(v104);
    end;
end;
local function v108()
    local v105 = v11.getFilteredSelection();
    v100 = {};
    for _, v107 in ipairs(v105) do
        v101(v107);
    end;
    return v100;
end;
local function v114(v109, v110)
    v100 = {};
    v101(v109);
    local l_v109_ModelCFrame_0 = v109:GetModelCFrame();
    for v112, _ in pairs(v100) do
        v112.CFrame = v110:toWorldSpace(l_v109_ModelCFrame_0:toObjectSpace(v112.CFrame));
    end;
end;
local _ = function(v115, v116)
    for v117, _ in pairs((v108())) do
        v117.CFrame = v116:toWorldSpace(v115:toObjectSpace(v117.CFrame));
    end;
end;
local function v121()
    if #v11.getFilteredSelection() > 0 then
        if not v48 then
            v48 = Instance.new("Part", game.CoreGui);
            v48.Name = "RotateAdornPart";
        end;
        local v120 = v11.getFilteredSelectionMetapart();
        v48.CFrame = v120.CFrame;
        v48.Size = v120.Size;
        v16.adornInstanceWithRotate(v48);
    end;
end;
local function _()
    local v122 = v11.getFilteredSelectionMetapart();
    if v122 then
        v122.ClearCache();
    end;
    updateInvisiblePart();
    v121();
end;
local function v125()
    l_StudioService_0 = false;
    v16.grabHandle();
    local v124 = v16.getCurrentHandle();
    if not (not (v124 == 0) or v16.isPlaneSelectingModeOn()) then
        selectPart();
    end;
    if v124 == 14 then
        v74 = l_Selection_0.Origin.p;
        analyticsSendSetPlane();
    elseif v16.getCurrentAdornment() then
        v74 = v16.getAdornmentWorldCFrame(v16.getCurrentAdornment()[1]).p;
    end;
    grabHandle(v124, v74);
end;
local function v126()
    v74 = nil;
    if l_StudioService_0 then
        if not v18.isRubberBandDragInProgress() then
            analyticsSendFreeformDragged();
        else
            analyticsSendBoxSelect();
        end;
    end;
    if not v18.isRubberBandDragInProgress() then
        releaseHandle();
    end;
    releasePart();
    v16.releaseHandle();
    v47 = false;
end;
l_plugin_0:OnInvoke("buttonClicked", function(_)
    if not l_Workspace_0 or not Off then
        if not (not l_UserInputService_0 or not On) then
            On();
        end;
        return ;
    else
        Off();
        return ;
    end;
end);
l_plugin_0:OnInvoke("Disable", function()
    l_plugin_0:Deactivate();
end);
l_plugin_0.Deactivation:connect(function()
    if not (not l_Workspace_0 or not Off) then
        Off();
    end;
end);
squaredMagnitude = function(v128)
    return (v128.X * v128.X + v128.Y * v128.Y) + v128.Z * v128.Z;
end;
vector3Direction = function(v129)
    local v130 = 1 / math.sqrt((squaredMagnitude(v129)));
    return (Vector3.new(v129.X * v130, v129.Y * v130, v129.Z * v130));
end;
vector3LessThanOrEqualTo = function(v131, v132)
    local v133 = false;
    if v131.x <= v132.x then
        v133 = false;
        if v131.y <= v132.y then
            v133 = v131.z <= v132.z;
        end;
    end;
    return v133;
end;
vector3GreaterThanOrEqualTo = function(v134, v135)
    local v136 = false;
    if v135.x <= v134.x then
        v136 = false;
        if v135.y <= v134.y then
            v136 = v135.z <= v134.z;
        end;
    end;
    return v136;
end;
createPlane = function(v137, v138, v139)
    local v140 = vector3Direction(((v138 - v137):Cross(v139 - v137)));
    return {
        v0 = v137, 
        v1 = v138, 
        v2 = v139, 
        normal = v140, 
        distance = v140:Dot(v137)
    };
end;
rayPlaneIntersection = function(v141, v142)
    return v141.Origin + v141.Direction * (-(-v142.distance + v141.Origin:Dot(v142.normal)) / v141.Direction:Dot(v142.normal));
end;
boxSideTest = function(v143, v144, v145, _)
    local v147 = v145 * v144;
    local v148 = v143.Origin + v143.Direction * (-(-v144:Dot(v147) + v143.Origin:Dot(v144)) / v143.Direction:Dot(v144));
    if (((((not (v147.x == 0) or v148.x <= v145.x) and (not (v147.x == 0) or -v145.x <= v148.x)) and (not (v147.y == 0) or v148.y <= v145.y)) and (not (v147.y == 0) or -v145.y <= v148.y)) and (not (v147.z == 0) or v148.z <= v145.z)) and (not (v147.z == 0) or -v145.z <= v148.z) then
        return v148;
    else
        return nil;
    end;
end;
rayBoxIntersection = function(v149, v150, v151)
    v151 = v151 / 2;
    local v152 = Ray.new(v150:pointToObjectSpace(v149.Origin), v150:pointToObjectSpace(v149.Direction + v150.p).unit);
    if v152.Origin.x < -v151.x and v152.Direction.x > 0 then
        local v153 = boxSideTest(v152, Vector3.new(-1, 0, 0), v151);
        if v153 then
            return v150:pointToWorldSpace(v153);
        end;
    elseif v151.x < v152.Origin.x and v152.Direction.x < 0 then
        local v154 = boxSideTest(v152, Vector3.new(1, 0, 0), v151, true);
        if v154 then
            return v150:pointToWorldSpace(v154);
        end;
    end;
    if v152.Origin.y < -v151.y and v152.Direction.y > 0 then
        local v155 = boxSideTest(v152, Vector3.new(0, -1, 0), v151);
        if v155 then
            return v150:pointToWorldSpace(v155);
        end;
    elseif v151.y < v152.Origin.y and v152.Direction.y < 0 then
        local v156 = boxSideTest(v152, Vector3.new(0, 1, 0), v151);
        if v156 then
            return v150:pointToWorldSpace(v156);
        end;
    end;
    if v152.Origin.z < -v151.z and v152.Direction.z > 0 then
        local v157 = boxSideTest(v152, Vector3.new(0, 0, -1), v151);
        if v157 then
            return v150:pointToWorldSpace(v157);
        end;
    elseif v151.z < v152.Origin.z and v152.Direction.z < 0 then
        local v158 = boxSideTest(v152, Vector3.new(0, 0, 1), v151);
        if v158 then
            return v150:pointToWorldSpace(v158);
        end;
    end;
    return v150:pointToWorldSpace((Vector3.new(0, 0, 0)));
end;
projectVectorToPlane = function(v159, v160)
    return v159 - v159:Dot(v160.Unit) * v160.Unit;
end;
local function _(v161, v162, v163, v164, v165)
    if not v163 then
        v163 = {};
    end;
    return v8.moveUntilCollide(v161, v163, v164, v162, v165);
end;
local _ = function(v167, _, v169, v170)
    v8.SafeMove(v167, v169, v170);
end;
local function _(v172, v173, v174)
    v8.SafeMove(v172, v10.createIgnoreListGivenWhiteList(game.Workspace, v174), v173);
end;
local function _(v176, v177)
    v176.CFrame = v177 * v176.CFrame;
end;
getRotationalIntervalFromGrid = function()
    local l_GridSize_0 = l_plugin_0.GridSize;
    if not v13.fuzzyCompare(l_GridSize_0, 0.2) then
        if not v13.fuzzyCompare(l_GridSize_0, 0.01) then
            return 45;
        else
            return 1;
        end;
    else
        return 15;
    end;
end;
roundToNearestGrid = function(v180)
    local l_GridSize_1 = l_plugin_0.GridSize;
    if l_GridSize_1 ~= 0 then
        return v14.roundToNearest(v180, l_GridSize_1);
    else
        return v180;
    end;
end;
Vector3ToNearestGrid = function(v182)
    return (Vector3.new(roundToNearestGrid(v182.X), roundToNearestGrid(v182.Y), roundToNearestGrid(v182.Z)));
end;
getScaleHandleLocalVector = function(v183)
    if v183 == 2 then
        return (Vector3.new(1, 0, 0));
    elseif v183 == 3 then
        return (Vector3.new(-1, 0, 0));
    elseif v183 == 4 then
        return (Vector3.new(0, 0, 1));
    elseif v183 == 5 then
        return (Vector3.new(0, 0, -1));
    elseif v183 == 6 then
        return (Vector3.new(0, 1, 0));
    elseif v183 == 7 then
        return (Vector3.new(1, 0, 1));
    elseif v183 == 8 then
        return (Vector3.new(1, 0, -1));
    elseif v183 == 9 then
        return (Vector3.new(-1, 0, 1));
    elseif v183 == 10 then
        return (Vector3.new(-1, 0, -1));
    else
        return (Vector3.new(0, 0, 0));
    end;
end;
snapVector3ByHandle = function(v184, v185)
    if not ((((v185 ~= 2 and v185 ~= 3) and v185 ~= 7) and v185 ~= 8) and v185 ~= 9) or v185 == 10 then
        v184 = Vector3.new(math.max(roundToNearestGrid(v184.X), l_plugin_0.GridSize), v184.Y, v184.Z);
    end;
    if not ((((v185 ~= 4 and v185 ~= 5) and v185 ~= 7) and v185 ~= 8) and v185 ~= 9) or v185 == 10 then
        v184 = Vector3.new(v184.X, v184.Y, (math.max(roundToNearestGrid(v184.Z), l_plugin_0.GridSize)));
    end;
    if not (v185 ~= 6) or v185 == 1 then
        v184 = Vector3.new(v184.X, math.max(roundToNearestGrid(v184.Y), l_plugin_0.GridSize), v184.Z);
    end;
    return v184;
end;
getSelectedPart = function()
    local v186 = v11.getFilteredSelection();
    if #v186 < 1 then
        return nil;
    else
        return v186[1];
    end;
end;
getCurrentSelectionWithChildren = function(v187, v188)
    if not v188 then
        v188 = {};
    end;
    if not v187 then
        v187 = v11.getFilteredSelection();
    end;
    for _, v190 in pairs(v187) do
        if v190:IsA("BasePart") then
            table.insert(v188, v190);
        end;
        if #v190:GetChildren() then
            v188 = getCurrentSelectionWithChildren(v190:GetChildren(), v188);
        end;
    end;
    return v188;
end;
setPartPosition = function(v191, v192)
    v191.CFrame = (v191.CFrame - v191.CFrame.p) + v192;
end;
setPartRotation = function(v193, v194)
    v193.CFrame = (v194 - v194.p) + v193.CFrame.p;
end;
cosineSimilarity = function(v195, v196)
    return (math.deg((math.acos(((v195.x * v196.x + v195.y * v196.y) + v195.z * v196.z) / (math.sqrt((math.pow(v195.x, 2) + math.pow(v195.y, 2)) + math.pow(v195.z, 2)) * math.sqrt((math.pow(v196.x, 2) + math.pow(v196.y, 2)) + math.pow(v196.z, 2)))))));
end;
setWaypoint = function()
    removeDragPart();
    local v197 = v11.getFilteredSelectionMetapart();
    local v198 = v16.getCurrentHandle();
    local v199 = "Unknown";
    if not (((((((v198 ~= 2 and v198 ~= 6) and v198 ~= 4) and v198 ~= 3) and v198 ~= 5) and v198 ~= 7) and v198 ~= 9) and v198 ~= 10) or v198 == 8 then
        v199 = "Scale";
    elseif v198 == 1 then
        v199 = "Move";
    elseif not (v198 ~= 11 and v198 ~= 12) or v198 == 13 then
        v199 = "Rotate";
    end;
    if v197 and (not (v197.CFrame == v54) or v197.Size ~= v51) then
        game:GetService("ChangeHistoryService"):SetWaypoint(v199);
    end;
end;
local function _(v200)
    game:GetService("Selection"):Set(v200);
end;
rotateCFrame = function(v202, v203)
    if v203 == 1 then
        return v202 * CFrame.Angles(3.141592653589793, 0, 0);
    elseif v203 == 3 then
        return v202 * CFrame.Angles(0, 0, -1.5707963267948966);
    elseif v203 == 2 then
        return v202 * CFrame.Angles(0, 0, 1.5707963267948966);
    elseif v203 == 4 then
        return v202 * CFrame.Angles(-1.5707963267948966, 0, 0);
    else
        if v203 == 5 then
            v202 = v202 * CFrame.Angles(1.5707963267948966, 0, 0);
        end;
        return v202;
    end;
end;
updateInvisiblePart = function()
    if v64 then
        local v204 = v11.getFilteredSelection();
        if #v204 < 1 then
            return ;
        else
            if #v204 > 1 then
            end;
            local v205 = v11.getFilteredSelectionMetapart();
            if not v59 then
                v15.setPartCFrameToExtents(v64, nil);
            elseif not v205 then
                local l_CFrame_0 = v59.CFrame;
                v64.CFrame = CFrame.new(v64.CFrame.p);
                v15.setPartCFrameToExtents(v64, rotateCFrame(l_CFrame_0, v62));
            else
                v205.UpdatePlaneCFrame = v73;
                v64.CFrame = v205.PlaneAlignedCFrame;
                v64.Size = v205.PlaneAlignedSize;
            end;
            if v60 then
                v63 = -v64.CFrame:pointToObjectSpace(v60).y;
            end;
            return ;
        end;
    else
        return ;
    end;
end;
local function _()
    v16.resetDragger();
end;
local function v214(v208, v209, v210)
    if not ((((v208:IsA("Part") and v210 ~= 1) and v210 ~= 13) and v210 ~= 12) and v210 ~= 11) or v210 == 14 then
        return v209;
    elseif v208.Shape == Enum.PartType.Ball then
        local l_Y_0 = v209.Y;
        return v210 == 6 and Vector3.new(l_Y_0, l_Y_0, l_Y_0) or v209;
    elseif v208.Shape == Enum.PartType.Cylinder then
        if v210 == 6 then
            local l_Y_1 = v209.Y;
            return (Vector3.new(0, l_Y_1, l_Y_1));
        else
            local l_Z_0 = v209.Z;
            return (Vector3.new(v209.X, l_Z_0, l_Z_0));
        end;
    else
        return v209;
    end;
end;
local v215 = 0;
local v216 = false;
local v217 = nil;
preUpdatePart = function()
    local v218 = v16.getCurrentHandle();
    if v218 == 0 then
        return ;
    elseif v74 then
        if v218 == 14 then
            return ;
        else
            local v219 = v16.getCurrentAdornment();
            local l_Adornee_0 = v219[1].Adornee;
            if l_Adornee_0 then
                local v221 = v16.getAdornmentWorldCFrame(v219[1]);
                local l_UnitRay_0 = l_Selection_0.UnitRay;
                if not (v218 ~= 1) or v218 == 6 then
                    local l_Unit_0 = (l_Adornee_0.CFrame:pointToWorldSpace((Vector3.new(0, 1, 0))) - l_Adornee_0.CFrame.p).Unit;
                    local v224 = l_UnitRay_0.Direction - l_UnitRay_0.Direction:Dot(l_Unit_0) * l_Unit_0;
                    local v225 = l_UnitRay_0.Origin + l_UnitRay_0.Direction * (-(-v224:Dot(v221.p) + l_UnitRay_0.Origin:Dot(v224)) / l_UnitRay_0.Direction:Dot(v224));
                    local _ = v74 - l_Unit_0.Unit * 800;
                    local v227 = Ray.new(v74, l_Unit_0.Unit):ClosestPoint(v225);
                    local v228 = Vector3.new(0, 1, 0);
                    if v227 == v74 then
                        v227 = Ray.new(v74, -l_Unit_0.Unit):ClosestPoint(v225);
                        v228 = v228 * -1;
                    end;
                    v50 = (v227 - v74).Magnitude * v228;
                elseif not (v218 ~= 2) or v218 == 3 then
                    local l_Unit_1 = (l_Adornee_0.CFrame:pointToWorldSpace((Vector3.new(1, 0, 0))) - l_Adornee_0.CFrame.p).Unit;
                    local v230 = l_UnitRay_0.Direction - l_UnitRay_0.Direction:Dot(l_Unit_1) * l_Unit_1;
                    local v231 = l_UnitRay_0.Origin + l_UnitRay_0.Direction * (-(-v230:Dot(v221.p) + l_UnitRay_0.Origin:Dot(v230)) / l_UnitRay_0.Direction:Dot(v230));
                    local _ = v74 - l_Unit_1.Unit * 800;
                    local v233 = Ray.new(v74, l_Unit_1.Unit):ClosestPoint(v231);
                    local v234 = Vector3.new(1, 0, 0);
                    if v233 == v74 then
                        v233 = Ray.new(v74, -l_Unit_1.Unit):ClosestPoint(v231);
                        v234 = v234 * -1;
                    end;
                    v50 = (v233 - v74).Magnitude * v234;
                    if v218 == 3 then
                        v50 = v50 * -1;
                    end;
                elseif not (v218 ~= 4) or v218 == 5 then
                    local l_Unit_2 = (l_Adornee_0.CFrame:pointToWorldSpace((Vector3.new(0, 0, 1))) - l_Adornee_0.CFrame.p).Unit;
                    local v236 = l_UnitRay_0.Direction - l_UnitRay_0.Direction:Dot(l_Unit_2) * l_Unit_2;
                    local v237 = l_UnitRay_0.Origin + l_UnitRay_0.Direction * (-(-v236:Dot(v221.p) + l_UnitRay_0.Origin:Dot(v236)) / l_UnitRay_0.Direction:Dot(v236));
                    local _ = v74 - l_Unit_2.Unit * 800;
                    local v239 = Ray.new(v74, l_Unit_2.Unit):ClosestPoint(v237);
                    local v240 = Vector3.new(0, 0, 1);
                    if v239 == v74 then
                        v239 = Ray.new(v74, -l_Unit_2.Unit):ClosestPoint(v237);
                        v240 = v240 * -1;
                    end;
                    v50 = (v239 - v74).Magnitude * v240;
                    if v218 == 5 then
                        v50 = v50 * -1;
                    end;
                elseif not ((v218 ~= 7 and v218 ~= 10) and v218 ~= 8) or v218 == 9 then
                    local l_Unit_3 = (l_Adornee_0.CFrame:pointToWorldSpace((Vector3.new(0, 1, 0))) - l_Adornee_0.CFrame.p).Unit;
                    v50 = v52:pointToObjectSpace((l_UnitRay_0.Origin + l_UnitRay_0.Direction * (-(-l_Unit_3:Dot(v221.p) + l_UnitRay_0.Origin:Dot(l_Unit_3)) / l_UnitRay_0.Direction:Dot(l_Unit_3))) + v52.p) - v52:pointToObjectSpace(v74 + v52.p);
                    if not (v218 ~= 9) or v218 == 10 then
                        v50 = v50 * Vector3.new(-1, 1, 1);
                    end;
                    if not (v218 ~= 8) or v218 == 10 then
                        v50 = v50 * Vector3.new(1, 1, -1);
                    end;
                elseif not (v218 ~= 11 and v218 ~= 12) or v218 == 13 then
                    local l_Unit_4 = (l_Adornee_0.CFrame:pointToWorldSpace((Vector3.new(v218 == 13 and 1 or 0, v218 == 12 and 1 or 0, v218 == 11 and 1 or 0))) - l_Adornee_0.CFrame.p).Unit;
                    v217 = l_UnitRay_0.Origin + l_UnitRay_0.Direction * (-(-l_Unit_4:Dot(v221.p) + l_UnitRay_0.Origin:Dot(l_Unit_4)) / l_UnitRay_0.Direction:Dot(l_Unit_4));
                    v50 = v52:pointToObjectSpace(v217 + v52.p) - v52:pointToObjectSpace(v74 + v52.p);
                    v216 = false;
                end;
                if v75 then
                    v50 = v50 - v75;
                    return ;
                else
                    v75 = v50;
                    return ;
                end;
            else
                return ;
            end;
        end;
    else
        return ;
    end;
end;
local v243 = nil;
local function _(v244)
    return v244 > 0 and math.ceil(v244 * 1000000 - 0.5) / 1000000 or math.floor(v244 * 1000000 + 0.5) / 1000000;
end;
local function _(v246)
    local v247, v248, v249, v250, v251, v252, v253, v254, v255, v256, v257, v258 = v246:components();
    return CFrame.new(sanitizeFloat(v247), sanitizeFloat(v248), sanitizeFloat(v249), sanitizeFloat(v250), sanitizeFloat(v251), sanitizeFloat(v252), sanitizeFloat(v253), sanitizeFloat(v254), sanitizeFloat(v255), sanitizeFloat(v256), sanitizeFloat(v257), sanitizeFloat(v258));
end;
getShapeRenderSize = function(v260, v261)
    if v260 == Enum.PartType.Cylinder then
        local v262 = math.min(v261.Y, v261.Z);
        return (Vector3.new(v261.X, v262, v262));
    else
        return v261;
    end;
end;
updatePivotAndChildAttachments = function(v263, v264, v265)
    if v263:IsA("BasePart") then
        local l_v263_Children_0 = v263:GetChildren();
        local l_Shape_0 = v263.Shape;
        v264 = getShapeRenderSize(l_Shape_0, v264);
        v265 = getShapeRenderSize(l_Shape_0, v265);
        for v268 = 1, #l_v263_Children_0 do
            local v269 = l_v263_Children_0[v268];
            if v269:IsA("Attachment") then
                v269.Position = (v269.Position / v264) * v265;
            end;
        end;
        v263:UpdatePivot(v264, v265);
        return ;
    else
        return ;
    end;
end;
local function _()
    return l_RunService_0:IsRunning();
end;
updatePart = function()
    local v271 = v11.getFilteredSelectionMetapart();
    local v272 = v11.getFilteredSelection();
    local v273 = v16.getCurrentHandle();
    if v273 == 0 then
        return ;
    else
        if not (not l_RunService_0:IsRunning() or v94) then
            local v274 = getCurrentSelectionWithChildren();
            v94 = true;
            for v275, v276 in ipairs(v274) do
                v95[v275] = v276.Anchored;
                v276.Anchored = true;
            end;
        end;
        preUpdatePart();
        if (((not ((v51 and v52 or v273 == 1) and v50) and v273 ~= 11) and v273 ~= 12) and v273 ~= 13) and v273 ~= 14 then
            return ;
        else
            local v277 = true;
            if selectedPart then
                workspace:UnjoinFromOutsiders((v11.getFilteredSelection()));
            end;
            local v278 = nil;
            local v279 = nil;
            if not (not selectedPart or v243) then
                v278 = selectedPart.CFrame;
                v279 = selectedPart.Size;
            end;
            v89 = true;
            local v280 = v11.getFilteredSelection();
            if #v280 == 0 then
                v16.resetDragger();
                return ;
            else
                local v281 = false;
                if l_plugin_0.CollisionEnabled then
                    v64.Parent = workspace;
                    if v10.itemsHasItemNotInList(v64:GetTouchingParts(), v280) then
                        v281 = true;
                    end;
                    v64.Parent = nil;
                end;
                v50 = v214(selectedPart, v50, v273);
                if v273 == 6 then
                    local v282 = -v16.getYScale();
                    v50 = v50 * -v282;
                    selectedPart.Size = snapVector3ByHandle(v51 + v50, v273);
                    workspace:UnjoinFromOutsiders((v11.getFilteredSelection()));
                    v97(selectedPart);
                    selectedPart.CFrame = v52:toWorldSpace(CFrame.new(v282 * ((v51 - selectedPart.Size) / 2)));
                    local v283 = v9.distanceVector3(v278.p, selectedPart.CFrame.p);
                    local l_unit_0 = (v278.p - selectedPart.CFrame.p).unit;
                    if l_plugin_0.CollisionEnabled and #selectedPart:GetTouchingParts() > 0 then
                        selectedPart.Size = v279;
                        workspace:UnjoinFromOutsiders((v11.getFilteredSelection()));
                        v97(selectedPart);
                        selectedPart.CFrame = v278;
                        if not v281 then
                            local l_selectedPart_0 = selectedPart;
                            local v286 = nil;
                            local v287 = l_unit_0 * -1;
                            local v288 = v283 * 2;
                            if not v286 then
                                v286 = {};
                            end;
                            local _ = v8.moveUntilCollide(l_selectedPart_0, v286, v287, 1.0E-5, v288);
                            l_selectedPart_0 = v9.distanceVector3(v278.p, selectedPart.CFrame.p);
                            v286 = v278.p - selectedPart.CFrame.p;
                            selectedPart.Size = v279 - (l_selectedPart_0 * getScaleHandleLocalVector(v273)) * v282;
                            workspace:UnjoinFromOutsiders((v11.getFilteredSelection()));
                            v97(selectedPart);
                            selectedPart.CFrame = v278 - v286 / 2;
                        else
                            return ;
                        end;
                    end;
                    local v290 = selectedPart.CFrame:pointToWorldSpace((selectedPart.Size / 2) * Vector3.new(0, 1, 0)) - selectedPart.CFrame.p;
                    local v291 = nil;
                    v291 = if not v5 then game.Workspace.Camera.CoordinateFrame.lookVector else game.Workspace.CurrentCamera.CFrame.LookVector;
                    v16.scaleOne(selectedPart.CFrame:pointToWorldSpace((selectedPart.Size / 2) * Vector3.new(0, -1, 0)), selectedPart.CFrame:pointToWorldSpace((selectedPart.Size / 2) * Vector3.new(0, 1, 0)), (v291 - v291:Dot(v290) * v290):Cross(v290).unit);
                elseif not (v273 ~= 2) or v273 == 4 then
                    workspace:UnjoinFromOutsiders((v11.getFilteredSelection()));
                    v97(selectedPart);
                    selectedPart.Size = snapVector3ByHandle(v51 + v50, v273);
                    selectedPart.CFrame = v52:toWorldSpace(CFrame.new(-((v51 - selectedPart.Size) * 0.5)));
                    local v292 = v9.distanceVector3(v278.p, selectedPart.CFrame.p);
                    local l_unit_1 = (v278.p - selectedPart.CFrame.p).unit;
                    if l_plugin_0.CollisionEnabled and #selectedPart:GetTouchingParts() > 0 then
                        selectedPart.Size = v279;
                        workspace:UnjoinFromOutsiders((v11.getFilteredSelection()));
                        v97(selectedPart);
                        selectedPart.CFrame = v278;
                        if not v281 then
                            local l_selectedPart_1 = selectedPart;
                            local v295 = nil;
                            local v296 = l_unit_1 * -1;
                            local v297 = v292 * 2;
                            if not v295 then
                                v295 = {};
                            end;
                            local _ = v8.moveUntilCollide(l_selectedPart_1, v295, v296, 1.0E-5, v297);
                            l_selectedPart_1 = v9.distanceVector3(v278.p, selectedPart.CFrame.p);
                            v295 = v278.p - selectedPart.CFrame.p;
                            selectedPart.Size = v279 + l_selectedPart_1 * getScaleHandleLocalVector(v273);
                            workspace:UnjoinFromOutsiders((v11.getFilteredSelection()));
                            v97(selectedPart);
                            selectedPart.CFrame = v278 - v295 / 2;
                        else
                            return ;
                        end;
                    end;
                    if v273 == 2 then
                        local _ = nil;
                        local v300 = v9.getVector3Sign(if not v5 then selectedPart.CFrame:pointToObjectSpace(game.Workspace.Camera.CoordinateFrame.p) else selectedPart.CFrame:PointToObjectSpace(game.Workspace.CurrentCamera.CFrame.Position));
                        v16.scaleOne(selectedPart.CFrame:pointToWorldSpace((selectedPart.Size / 2) * Vector3.new(-1, -1, v300.z)), selectedPart.CFrame:pointToWorldSpace((selectedPart.Size / 2) * Vector3.new(1, -1, v300.z)), selectedPart.CFrame:pointToWorldSpace(v300 * Vector3.new(0, 0, 1)) - selectedPart.CFrame.p);
                    elseif v273 == 4 then
                        local _ = nil;
                        local v302 = v9.getVector3Sign(if not v5 then selectedPart.CFrame:pointToObjectSpace(game.Workspace.Camera.CoordinateFrame.p) else selectedPart.CFrame:PointToObjectSpace(game.Workspace.CurrentCamera.CFrame.Position));
                        v16.scaleOne(selectedPart.CFrame:pointToWorldSpace((selectedPart.Size / 2) * Vector3.new(v302.x, -1, -1)), selectedPart.CFrame:pointToWorldSpace((selectedPart.Size / 2) * Vector3.new(v302.x, -1, 1)), selectedPart.CFrame:pointToWorldSpace(v302 * Vector3.new(1, 0, 0)) - selectedPart.CFrame.p);
                    end;
                elseif not (v273 ~= 3) or v273 == 5 then
                    workspace:UnjoinFromOutsiders((v11.getFilteredSelection()));
                    v97(selectedPart);
                    selectedPart.Size = snapVector3ByHandle(v51 + v50, v273);
                    selectedPart.CFrame = v52:toWorldSpace(CFrame.new((v51 - selectedPart.Size) * 0.5));
                    local v303 = v9.distanceVector3(v278.p, selectedPart.CFrame.p);
                    local l_unit_2 = (v278.p - selectedPart.CFrame.p).unit;
                    if l_plugin_0.CollisionEnabled and #selectedPart:GetTouchingParts() > 0 then
                        selectedPart.Size = v279;
                        workspace:UnjoinFromOutsiders((v11.getFilteredSelection()));
                        v97(selectedPart);
                        selectedPart.CFrame = v278;
                        if not v281 then
                            local l_selectedPart_2 = selectedPart;
                            local v306 = nil;
                            local v307 = l_unit_2 * -1;
                            local v308 = v303 * 2;
                            if not v306 then
                                v306 = {};
                            end;
                            local _ = v8.moveUntilCollide(l_selectedPart_2, v306, v307, 1.0E-5, v308);
                            l_selectedPart_2 = v9.distanceVector3(v278.p, selectedPart.CFrame.p);
                            v306 = v278.p - selectedPart.CFrame.p;
                            selectedPart.Size = v279 - l_selectedPart_2 * getScaleHandleLocalVector(v273);
                            workspace:UnjoinFromOutsiders((v11.getFilteredSelection()));
                            v97(selectedPart);
                            selectedPart.CFrame = v278 - v306 / 2;
                        else
                            return ;
                        end;
                    end;
                    if v273 == 3 then
                        local _ = nil;
                        local v311 = v9.getVector3Sign(if not v5 then selectedPart.CFrame:pointToObjectSpace(game.Workspace.Camera.CoordinateFrame.p) else selectedPart.CFrame:PointToObjectSpace(game.Workspace.CurrentCamera.CFrame.Position));
                        v16.scaleOne(selectedPart.CFrame:pointToWorldSpace((selectedPart.Size / 2) * Vector3.new(-1, -1, v311.z)), selectedPart.CFrame:pointToWorldSpace((selectedPart.Size / 2) * Vector3.new(1, -1, v311.z)), selectedPart.CFrame:pointToWorldSpace(v311 * Vector3.new(0, 0, 1)) - selectedPart.CFrame.p);
                    elseif v273 == 5 then
                        local _ = nil;
                        local v313 = v9.getVector3Sign(if not v5 then selectedPart.CFrame:pointToObjectSpace(game.Workspace.Camera.CoordinateFrame.p) else selectedPart.CFrame:PointToObjectSpace(game.Workspace.CurrentCamera.CFrame.Position));
                        v16.scaleOne(selectedPart.CFrame:pointToWorldSpace((selectedPart.Size / 2) * Vector3.new(v313.x, -1, -1)), selectedPart.CFrame:pointToWorldSpace((selectedPart.Size / 2) * Vector3.new(v313.x, -1, 1)), selectedPart.CFrame:pointToWorldSpace(v313 * Vector3.new(1, 0, 0)) - selectedPart.CFrame.p);
                    end;
                elseif v273 == 7 then
                    workspace:UnjoinFromOutsiders((v11.getFilteredSelection()));
                    v97(selectedPart);
                    selectedPart.Size = snapVector3ByHandle(v51 + v50, v273);
                    selectedPart.CFrame = v52:toWorldSpace(CFrame.new(-((v51 - selectedPart.Size) / 2)));
                    local _ = nil;
                    local v315 = v9.getVector3Sign(if not v5 then selectedPart.CFrame:pointToObjectSpace(game.Workspace.Camera.CoordinateFrame.p) else selectedPart.CFrame:PointToObjectSpace(game.Workspace.CurrentCamera.CFrame.Position));
                    v16.scaleOne(selectedPart.CFrame:pointToWorldSpace((selectedPart.Size / 2) * Vector3.new(-1, -1, v315.z)), selectedPart.CFrame:pointToWorldSpace((selectedPart.Size / 2) * Vector3.new(1, -1, v315.z)), selectedPart.CFrame:pointToWorldSpace(v315 * Vector3.new(0, 0, 1)) - selectedPart.CFrame.p);
                    v16.scaleTwo(selectedPart.CFrame:pointToWorldSpace((selectedPart.Size / 2) * Vector3.new(v315.x, -1, -1)), selectedPart.CFrame:pointToWorldSpace((selectedPart.Size / 2) * Vector3.new(v315.x, -1, 1)), selectedPart.CFrame:pointToWorldSpace(v315 * Vector3.new(1, 0, 0)) - selectedPart.CFrame.p);
                elseif v273 == 9 then
                    workspace:UnjoinFromOutsiders((v11.getFilteredSelection()));
                    v97(selectedPart);
                    selectedPart.Size = snapVector3ByHandle(v51 + v50, v273);
                    selectedPart.CFrame = v52:toWorldSpace(CFrame.new(-((v51 - selectedPart.Size) / 2) * Vector3.new(-1, 0, 1)));
                    local _ = nil;
                    local v317 = v9.getVector3Sign(if not v5 then selectedPart.CFrame:pointToObjectSpace(game.Workspace.Camera.CoordinateFrame.p) else selectedPart.CFrame:PointToObjectSpace(game.Workspace.CurrentCamera.CFrame.Position));
                    v16.scaleOne(selectedPart.CFrame:pointToWorldSpace((selectedPart.Size / 2) * Vector3.new(-1, -1, v317.z)), selectedPart.CFrame:pointToWorldSpace((selectedPart.Size / 2) * Vector3.new(1, -1, v317.z)), selectedPart.CFrame:pointToWorldSpace(v317 * Vector3.new(0, 0, 1)) - selectedPart.CFrame.p);
                    v16.scaleTwo(selectedPart.CFrame:pointToWorldSpace((selectedPart.Size / 2) * Vector3.new(v317.x, -1, -1)), selectedPart.CFrame:pointToWorldSpace((selectedPart.Size / 2) * Vector3.new(v317.x, -1, 1)), selectedPart.CFrame:pointToWorldSpace(v317 * Vector3.new(1, 0, 0)) - selectedPart.CFrame.p);
                elseif v273 == 10 then
                    workspace:UnjoinFromOutsiders((v11.getFilteredSelection()));
                    v97(selectedPart);
                    selectedPart.Size = snapVector3ByHandle(v51 + v50, v273);
                    selectedPart.CFrame = v52:toWorldSpace(CFrame.new(-((v51 - selectedPart.Size) / 2) * Vector3.new(-1, 0, -1)));
                    local _ = nil;
                    local v319 = v9.getVector3Sign(if not v5 then selectedPart.CFrame:pointToObjectSpace(game.Workspace.Camera.CoordinateFrame.p) else selectedPart.CFrame:PointToObjectSpace(game.Workspace.CurrentCamera.CFrame.Position));
                    v16.scaleOne(selectedPart.CFrame:pointToWorldSpace((selectedPart.Size / 2) * Vector3.new(-1, -1, v319.z)), selectedPart.CFrame:pointToWorldSpace((selectedPart.Size / 2) * Vector3.new(1, -1, v319.z)), selectedPart.CFrame:pointToWorldSpace(v319 * Vector3.new(0, 0, 1)) - selectedPart.CFrame.p);
                    v16.scaleTwo(selectedPart.CFrame:pointToWorldSpace((selectedPart.Size / 2) * Vector3.new(v319.x, -1, -1)), selectedPart.CFrame:pointToWorldSpace((selectedPart.Size / 2) * Vector3.new(v319.x, -1, 1)), selectedPart.CFrame:pointToWorldSpace(v319 * Vector3.new(1, 0, 0)) - selectedPart.CFrame.p);
                elseif v273 == 8 then
                    workspace:UnjoinFromOutsiders((v11.getFilteredSelection()));
                    v97(selectedPart);
                    selectedPart.Size = snapVector3ByHandle(v51 + v50, v273);
                    selectedPart.CFrame = v52:toWorldSpace(CFrame.new(-((v51 - selectedPart.Size) / 2) * Vector3.new(1, 0, -1)));
                    local _ = nil;
                    local v321 = v9.getVector3Sign(if not v5 then selectedPart.CFrame:pointToObjectSpace(game.Workspace.Camera.CoordinateFrame.p) else selectedPart.CFrame:PointToObjectSpace(game.Workspace.CurrentCamera.CFrame.Position));
                    v16.scaleOne(selectedPart.CFrame:pointToWorldSpace((selectedPart.Size / 2) * Vector3.new(-1, -1, v321.z)), selectedPart.CFrame:pointToWorldSpace((selectedPart.Size / 2) * Vector3.new(1, -1, v321.z)), selectedPart.CFrame:pointToWorldSpace(v321 * Vector3.new(0, 0, 1)) - selectedPart.CFrame.p);
                    v16.scaleTwo(selectedPart.CFrame:pointToWorldSpace((selectedPart.Size / 2) * Vector3.new(v321.x, -1, -1)), selectedPart.CFrame:pointToWorldSpace((selectedPart.Size / 2) * Vector3.new(v321.x, -1, 1)), selectedPart.CFrame:pointToWorldSpace(v321 * Vector3.new(1, 0, 0)) - selectedPart.CFrame.p);
                elseif v273 == 1 then
                    local l_CFrame_1 = v64.CFrame;
                    v64.CFrame = v65:toWorldSpace(CFrame.new(v50));
                    local v323 = -v64.CFrame:pointToObjectSpace(v60).y - v64.Size.Y / 2;
                    local v324 = -v64.CFrame:pointToObjectSpace(v60).y + v64.Size.Y / 2;
                    local v325 = roundToNearestGrid(v323);
                    local v326 = roundToNearestGrid(v324);
                    local v327 = v325 - v323;
                    local v328 = v326 - v324;
                    v64.CFrame = (v64.CFrame - v64.CFrame.p) + v64.CFrame:pointToWorldSpace((Vector3.new(0, math.abs(v327) <= math.abs(v328) and v327 or v328, 0)));
                    if not l_plugin_0.CollisionEnabled then
                        v271.TranslateFromTo(l_CFrame_1, v64.CFrame);
                    else
                        local v329 = v64.CFrame.p - l_CFrame_1.p;
                        local v330 = v9.distanceVector3(l_CFrame_1.p, v64.CFrame.p);
                        if not v271.CanSimulate then
                            v64.Parent = workspace;
                            if v10.itemsHasItemNotInList(v64:GetTouchingParts(), v271.Children) then
                                local l_Unit_5 = v329.Unit;
                                v64.CFrame = l_CFrame_1;
                                local _ = v8.moveUntilCollide(v64, v271.Children or {}, l_Unit_5, 2.0E-4, v330);
                            end;
                            v64.Parent = nil;
                            v271.TranslateFromTo(l_CFrame_1, v64.CFrame);
                        else
                            v271.TranslateFromTo(l_CFrame_1, v64.CFrame);
                            if v10.itemsHasItemNotInList(v271:GetTouchingParts(), v271.Children) then
                                local l_Unit_6 = v329.Unit;
                                v271.TranslateFromTo(v64.CFrame, l_CFrame_1);
                                v8.moveUntilCollideMetapart(v271, v271.Children, l_Unit_6, v330);
                            end;
                        end;
                    end;
                elseif v273 == 11 then
                    local v334 = v51 * 0.5;
                    local v335 = v52:pointToObjectSpace(v74);
                    v335 = v335.Z / math.abs(v335.Z);
                    local v336 = math.max(v51.X, v51.Y);
                    local v337 = (v52:toWorldSpace(CFrame.new((Vector3.new(0, 0, v334.Z * v335)))).p - v217).magnitude < v336;
                    local v338 = v52:pointToObjectSpace(v54);
                    local v339 = v338 + v50;
                    local v340 = v14.roundToNearest(math.deg(math.atan2(v339.Y, v339.X) - math.atan2(v338.Y, v338.X)), not v337 and 1 or 22.5);
                    local v341 = v52 * CFrame.Angles(0, 0, (math.rad(v340)));
                    if not v271:IsA("BasePart") then
                        if not v271:IsA("Model") or v271:IsA("Workspace") then
                            if v271:IsA("Grouping") then
                                local l_CFrame_2 = v271.CFrame;
                                v271.CFrame = v341;
                                if l_plugin_0.CollisionEnabled and #v271:GetTouchingParts() > 0 then
                                    v271.CFrame = l_CFrame_2;
                                end;
                            end;
                        else
                            local l_v271_ModelCFrame_0 = v271:GetModelCFrame();
                            v114(v271, v341);
                            if l_plugin_0.CollisionEnabled and #v271:GetTouchingParts() > 0 then
                                v114(v271, l_v271_ModelCFrame_0);
                            end;
                        end;
                    else
                        v271.CFrame = v341;
                    end;
                    if not (not v271 or l_plugin_0.CollisionEnabled and v10.itemsHasItemNotInList(v271:GetTouchingParts(), v280)) then
                        local _ = (v52:pointToWorldSpace((Vector3.new(0, 0, 1))) - v52.p).Unit;
                        local l_unit_3 = (v52:pointToObjectSpace(v74) * Vector3.new(1, 1, 0)).unit;
                        local v346 = cosineSimilarity(Vector3.new(0, -1, 0), l_unit_3);
                        v16.showRotate(v52:toWorldSpace(CFrame.new((Vector3.new(0, 0, v334.Z * v335)))) * CFrame.Angles(0, 0, (math.rad(if l_unit_3.X > 0 then v346 + 90 else if l_unit_3.Y > 0 then (v346 + 180) + 45 else v346 - 45))), v336, v340, v217);
                    end;
                elseif v273 == 12 then
                    local v347 = v51 * 0.5;
                    local v348 = v52:pointToObjectSpace(v74);
                    v348 = v348.Y / math.abs(v348.Y);
                    local v349 = math.max(v51.X, v51.Z);
                    local v350 = (v52:toWorldSpace(CFrame.new((Vector3.new(0, v347.Y * v348, 0)))).p - v217).magnitude < v349;
                    local v351 = v52:pointToObjectSpace(v54);
                    local v352 = v351 + v50;
                    local v353 = v14.roundToNearest(math.deg(math.atan2(v352.Z, v352.X) - math.atan2(v351.Z, v351.X)), not v350 and 1 or 22.5);
                    local v354 = v52 * CFrame.Angles(0, -math.rad(v353), 0);
                    if not v271:IsA("BasePart") then
                        if not (not v271:IsA("Grouping") and (not v271:IsA("Model") or v271:IsA("Workspace"))) then
                            local l_CFrame_3 = v271.CFrame;
                            v271.CFrame = v354;
                            if l_plugin_0.CollisionEnabled and #v271:GetTouchingParts() > 0 then
                                v271.CFrame = l_CFrame_3;
                            end;
                        end;
                    else
                        v271.CFrame = v354;
                    end;
                    if not (not v271 or l_plugin_0.CollisionEnabled and v10.itemsHasItemNotInList(v271:GetTouchingParts(), v280)) then
                        local _ = (v52:pointToWorldSpace((Vector3.new(v273 == 13 and 1 or 0, v273 == 12 and 1 or 0, v273 == 11 and 1 or 0))) - v52.p).Unit;
                        local l_unit_4 = (v52:pointToObjectSpace(v74) * Vector3.new(1, 0, 1)).unit;
                        v16.showRotate(v52:toWorldSpace(CFrame.new((Vector3.new(0, v347.Y * v348, 0)))) * CFrame.Angles(1.5707963267948966, 0, (math.rad(cosineSimilarity(Vector3.new(0, 0, -1), l_unit_4) * (l_unit_4.X > 0 and 1 or -1) + 90))), v349, v353, v217);
                    end;
                elseif v273 == 13 then
                    local v358 = v51 * 0.5;
                    local v359 = v52:pointToObjectSpace(v74);
                    v359 = v359.X / math.abs(v359.X);
                    local v360 = math.max(v51.Y, v51.Z);
                    local v361 = (v52:toWorldSpace(CFrame.new((Vector3.new(v358.X * v359, 0, 0)))).p - v217).magnitude < v360;
                    local v362 = v52:pointToObjectSpace(v54);
                    local v363 = v362 + v50;
                    local v364 = v14.roundToNearest(math.deg(math.atan2(v363.Z, v363.Y) - math.atan2(v362.Z, v362.Y)), not v361 and 1 or 22.5);
                    local v365 = v52 * CFrame.Angles(math.rad(v364), 0, 0);
                    if not v271:IsA("BasePart") then
                        if not v271:IsA("Model") or v271:IsA("Workspace") then
                            if v271:IsA("Grouping") then
                                local l_CFrame_4 = v271.CFrame;
                                v271.CFrame = v365;
                                if l_plugin_0.CollisionEnabled and #v271:GetTouchingParts() > 0 then
                                    v271.CFrame = l_CFrame_4;
                                end;
                            end;
                        else
                            local l_v271_ModelCFrame_1 = v271:GetModelCFrame();
                            v114(v271, v365);
                            if l_plugin_0.CollisionEnabled and #v271:GetTouchingParts() > 0 then
                                v114(v271, l_v271_ModelCFrame_1);
                            end;
                        end;
                    else
                        v271.CFrame = v365;
                    end;
                    if not (not v271 or l_plugin_0.CollisionEnabled and v10.itemsHasItemNotInList(v271:GetTouchingParts(), v280)) then
                        local _ = (v52:pointToWorldSpace((Vector3.new(1, 0, 0))) - v52.p).Unit;
                        local l_unit_5 = (v52:pointToObjectSpace(v74) * Vector3.new(0, 1, 1)).unit;
                        v16.showRotate(v52:toWorldSpace(CFrame.new((Vector3.new(v358.X * v359, 0, 0)))) * CFrame.Angles(0, 1.5707963267948966, (math.rad(cosineSimilarity(Vector3.new(0, 0, -1), l_unit_5) * (l_unit_5.Y > 0 and 1 or -1) + 180))), v360, v364, v217);
                    end;
                elseif v273 == 14 then
                    v16.setAllAdornVisibility(false);
                    if not v47 then
                        if v16.isPlaneSelectingModeOn() then
                            v47 = true;
                            if not v45 then
                                v45 = Instance.new("Part", v26);
                                v45.Size = Vector3.new(50, 50, 0.01);
                                v45.Position = Vector3.new(0, 0, 0);
                                v45.Transparency = 1;
                            end;
                            if not v46 then
                                v46 = Instance.new("BoxHandleAdornment", v26);
                                v46.Visible = false;
                                v46.Adornee = v45;
                                v46.Size = v46.Adornee.Size;
                                v46.Transparency = 0.6;
                                v46.Color3 = Color3.new(0.14901960784313725, 0.5333333333333333, 0.9411764705882353);
                            end;
                        else
                            return ;
                        end;
                    end;
                else
                    v277 = false;
                end;
                if not ((not ((l_plugin_0.CollisionEnabled and #game:GetService("Selection"):Get() == 1) and (not (((((((((v273 ~= 6 and v273 ~= 4) and v273 ~= 3) and v273 ~= 5) and v273 ~= 7) and v273 ~= 9) and v273 ~= 10) and v273 ~= 8) and v273 ~= 11) and v273 ~= 12) or v273 == 13)) or not selectedPart) or not v10.itemsHasItemNotInList(selectedPart:GetTouchingParts(), v272)) then
                    if v278 then
                        selectedPart.CFrame = v278;
                    end;
                    if v279 then
                        selectedPart.Size = v279;
                    end;
                end;
                if selectedPart then
                    updatePivotAndChildAttachments(selectedPart, v279, selectedPart.Size);
                end;
                if v277 then
                    updateDragPart();
                end;
                if (v273 ~= 11 and v273 ~= 12) and v273 ~= 13 then
                    updateInvisiblePart();
                end;
                if v273 == 1 then
                    v121();
                end;
                v25 = true;
                return ;
            end;
        end;
    end;
end;
updateDragPart = function()
    if not v90 then
        v90 = Instance.new("Part", nil);
        v90.Name = "DragParte1b1aec5";
        v90.BottomSurface = Enum.SurfaceType.Smooth;
        v90.TopSurface = Enum.SurfaceType.Smooth;
        v90.Transparency = 1;
        v97(v90);
    end;
    if not v91 then
        v91 = Instance.new("BoxHandleAdornment", v26);
        v91.Visible = false;
        v91.Color3 = Color3.new(0.14901960784313725, 0.5333333333333333, 0.9411764705882353);
        v91.Transparency = 0.5;
        v91.AlwaysOnTop = true;
    end;
    if v90 then
        if #game:GetService("Selection"):Get() == 1 then
            local v370 = v12.convertToPart(game:GetService("Selection"):Get()[1]);
            v90.Size = v370.Size;
            v90.CFrame = v370.CFrame;
        else
            v90.Size = v64.Size;
            v90.CFrame = v64.CFrame;
        end;
        v90.Name = "DragParte1b1aec5";
        v90.Archivable = false;
        v90.Parent = nil;
        v90.BottomSurface = Enum.SurfaceType.Smooth;
        v90.TopSurface = Enum.SurfaceType.Smooth;
        v97(v90);
    end;
    if not (not v91 or not selectedPart) then
        v91.Adornee = v90;
        v91.Size = v91.Adornee.Size;
        v91.AlwaysOnTop = true;
        v91.CFrame = v90.CFrame - v90.CFrame.p;
    end;
end;
grabPart = function()
    updateInvisiblePart();
    local v371 = v11.getFilteredSelectionMetapart();
    if v371 then
        v55 = true;
        v51 = v371.Size;
        v52 = v371.CFrame;
        v65 = v371.PlaneAlignedCFrame;
        local v372 = getBestExtentRotation();
        if v372 then
            originalDragPartOrientation = v372 + v65.p;
            updateDragPart();
            setPartRotation(v90, originalDragPartOrientation);
            v15.setPartCFrameToExtents(v90, originalDragPartOrientation);
            return ;
        else
            return ;
        end;
    else
        return ;
    end;
end;
getAllFaceNormals = function(v373)
    local v374 = {};
    table.insert(v374, (v373.CFrame:pointToWorldSpace((Vector3.new(1, 0, 0))) - v373.CFrame.p).Unit);
    table.insert(v374, (v373.CFrame:pointToWorldSpace((Vector3.new(-1, 0, 0))) - v373.CFrame.p).Unit);
    table.insert(v374, (v373.CFrame:pointToWorldSpace((Vector3.new(0, 1, 0))) - v373.CFrame.p).Unit);
    table.insert(v374, (v373.CFrame:pointToWorldSpace((Vector3.new(0, -1, 0))) - v373.CFrame.p).Unit);
    table.insert(v374, (v373.CFrame:pointToWorldSpace((Vector3.new(0, 0, 1))) - v373.CFrame.p).Unit);
    table.insert(v374, (v373.CFrame:pointToWorldSpace((Vector3.new(0, 0, -1))) - v373.CFrame.p).Unit);
    return v374;
end;
getDirectedNormalsFromPart = function(v375, v376)
    local v377 = getAllFaceNormals(v375);
    local v378 = {};
    local v379 = v64.CFrame:pointToWorldSpace((Vector3.new(0, 1, 0))) - v64.Position;
    local v380 = v379:Cross(v376) / v379:Cross(v376).Magnitude;
    for _, v382 in ipairs(v377) do
        if v13.fuzzyCompareVector3(projectVectorToPlane(projectVectorToPlane(v382, v379), v380).Unit, v376) then
            table.insert(v378, v382);
        end;
    end;
    return v378;
end;
getClosestNormalFromPart = function(v383, v384)
    local v385 = nil;
    local v386 = {};
    for v387 = 1, 3 do
        for v388 = 1, 2 do
            local v389 = v383.CFrame:pointToWorldSpace(Vector3.new(v387 == 1 and 1 or 0, v387 == 2 and 1 or 0, v387 == 3 and 1 or 0) * (v388 == 1 and 1 or -1)) - v383.CFrame.p;
            local v390 = cosineSimilarity(v389.Unit, v384);
            if not (v385 ~= nil) or v390 < v385 then
                v385 = v390;
                v386 = {
                    v389.Unit
                };
            elseif v390 == v385 then
                table.insert(v386, v389.Unit);
            end;
        end;
    end;
    if v385 ~= v385 then
        for _, v392 in ipairs(v386) do
            v392 = v392 * -1;
        end;
    end;
    return v386;
end;
getFirstPart = function(v393)
    local v394 = nil;
    for _, v396 in ipairs(v393) do
        if not v396:IsA("BasePart") then
            v394 = getFirstPart(v396:GetChildren());
            if v394 then
                return v394;
            end;
        else
            return v396;
        end;
    end;
    return nil;
end;
getBestExtentRotation = function()
    local v397 = game:GetService("Selection"):Get();
    if #v397 == 0 then
        return CFrame.new();
    else
        for _, v399 in ipairs(v397) do
            if not v399:IsA("Model") or v399:IsA("Workspace") then
                if v399:IsA("BasePart") then
                    return v399.CFrame;
                end;
            elseif not v399.PrimaryPart then
                local v400 = getFirstPart(v397);
                if v400 then
                    return v400.CFrame;
                else
                    return CFrame.new();
                end;
            else
                return v399.PrimaryPart.CFrame;
            end;
        end;
        return nil;
    end;
end;
getNormalOfFace = function(v401, v402)
    if v401 and v402 then
        local v403 = v401.Size / 2;
        local v404 = v401.CFrame:pointToObjectSpace(v402);
        local v405 = Vector3.new(0, 0, 0);
        if not v13.fuzzyCompare(v404.X, v403.X) then
            if not v13.fuzzyCompare(v404.X, -v403.X) then
                if not v13.fuzzyCompare(v404.Y, v403.Y) then
                    if not v13.fuzzyCompare(v404.Y, -v403.Y) then
                        if not v13.fuzzyCompare(v404.Z, v403.Z) then
                            if v13.fuzzyCompare(v404.Z, -v403.Z) then
                                v405 = Vector3.new(0, 0, -1);
                            end;
                        else
                            v405 = Vector3.new(0, 0, 1);
                        end;
                    else
                        v405 = Vector3.new(0, -1, 0);
                    end;
                else
                    v405 = Vector3.new(0, 1, 0);
                end;
            else
                v405 = Vector3.new(-1, 0, 0);
            end;
        else
            v405 = Vector3.new(1, 0, 0);
        end;
        return v401.CFrame:pointToWorldSpace(v405) - v401.CFrame.p;
    else
        return ;
    end;
end;
getNormalFromClosestPoint = function(v406, v407)
    if v406 and v407 then
        local v408 = v406.CFrame:pointToObjectSpace(v407);
        local v409 = v406.Size / 2;
        local v410 = v9.absVector3(v408);
        local v411 = v409.x / v409.z;
        local v412 = v410.x / v410.z;
        local _ = Vector3.new(0, 0, 0);
        return (v406.CFrame:pointToWorldSpace(if v411 < v412 then if v409.x / v409.y < v410.x / v410.y then if v408.x < 0 then Vector3.new(-1, 0, 0) else Vector3.new(1, 0, 0) else if v408.y < 0 then Vector3.new(0, -1, 0) else Vector3.new(0, 1, 0) else if v409.y / v409.z < v410.y / v410.z then if v408.y < 0 then Vector3.new(0, -1, 0) else Vector3.new(0, 1, 0) else if v408.z < 0 then Vector3.new(0, 0, -1) else Vector3.new(0, 0, 1)) - v406.CFrame.p).Unit;
    else
        return nil;
    end;
end;
normalExistsInTable = function(v414, v415)
    for _, v417 in pairs(v414) do
        if v417[2] == v415 then
            return true;
        end;
    end;
    return false;
end;
getNormalOfCollidingFace = function(v418, v419, v420)
    local v421 = v420 * -1;
    return v418 + ((v419 - v418):Dot(v421) / v421:Dot(v421)) * v421;
end;
sanitizeFloat = function(v422)
    return v422 > 0 and math.ceil(v422 * 1000000 - 0.5) / 1000000 or math.floor(v422 * 1000000 + 0.5) / 1000000;
end;
sanitizeVector3 = function(v423)
    return (Vector3.new(sanitizeFloat(v423.x), sanitizeFloat(v423.y), sanitizeFloat(v423.z)));
end;
sanitizeCFrame = function(v424)
    local v425, v426, v427, v428, v429, v430, v431, v432, v433, v434, v435, v436 = v424:components();
    return CFrame.new(sanitizeFloat(v425), sanitizeFloat(v426), sanitizeFloat(v427), v428, v429, v430, v431, v432, v433, v434, v435, v436);
end;
local v437 = true;
local v438 = false;
movePart = function(v439, v440)
    v16.setAllAdornVisibility(false);
    if v59 then
        if v90 then
            v438 = true;
            v25 = true;
            local v441 = getCurrentSelectionWithChildren();
            if not (not l_RunService_0:IsRunning() or v94) then
                v94 = true;
                for v442, v443 in ipairs(v441) do
                    v95[v442] = v443.Anchored;
                    v443.Anchored = true;
                end;
            end;
            local v444 = getBestExtentRotation();
            if v444 and selectedPart then
                setPartRotation(v90, #v441 > 1 and v73 or v444);
                if v437 then
                    v437 = false;
                    v15.setPartCFrameToExtents(v90, v90.CFrame);
                end;
                local l_CFrame_5 = v90.CFrame;
                if not v87 then
                    v439 = v64.CFrame:pointToWorldSpace(v64.CFrame:pointToObjectSpace(v439 + v90.Position) * Vector3.new(1, 0, 1)) - v64.Position;
                end;
                local v446 = v11.getFilteredSelectionMetapart();
                setPartPosition(v90, v65.p + v439);
                workspace:UnjoinFromOutsiders((v11.getFilteredSelection()));
                local v447 = v73:toObjectSpace(v90.CFrame);
                local v448 = {};
                local _ = selectedPart.Size / 2;
                local v450 = v90.Size / 2;
                v448[1] = v73:pointToObjectSpace(v90.CFrame:pointToWorldSpace(v450 * Vector3.new(-1, -1, -1)));
                v448[2] = v73:pointToObjectSpace(v90.CFrame:pointToWorldSpace(v450 * Vector3.new(-1, -1, 1)));
                v448[3] = v73:pointToObjectSpace(v90.CFrame:pointToWorldSpace(v450 * Vector3.new(-1, 1, -1)));
                v448[4] = v73:pointToObjectSpace(v90.CFrame:pointToWorldSpace(v450 * Vector3.new(-1, 1, 1)));
                v448[5] = v73:pointToObjectSpace(v90.CFrame:pointToWorldSpace(v450 * Vector3.new(1, -1, -1)));
                v448[6] = v73:pointToObjectSpace(v90.CFrame:pointToWorldSpace(v450 * Vector3.new(1, -1, 1)));
                v448[7] = v73:pointToObjectSpace(v90.CFrame:pointToWorldSpace(v450 * Vector3.new(1, 1, -1)));
                v448[8] = v73:pointToObjectSpace(v90.CFrame:pointToWorldSpace(v450 * Vector3.new(1, 1, 1)));
                local v451 = 100;
                local v452 = 100;
                local v453 = 100;
                local v454 = 0;
                local v455 = 0;
                local v456 = 0;
                for v457 = 1, #v448 do
                    local v458 = v448[v457].x - roundToNearestGrid(v448[v457].x);
                    local v459 = v448[v457].y - roundToNearestGrid(v448[v457].y);
                    local v460 = v448[v457].z - roundToNearestGrid(v448[v457].z);
                    if math.abs(v458) < v451 then
                        v451 = math.abs(v458);
                        v454 = v458;
                    end;
                    if math.abs(v459) < v452 then
                        v452 = math.abs(v459);
                        v455 = v459;
                    end;
                    if math.abs(v460) < v453 then
                        v453 = math.abs(v460);
                        v456 = v460;
                    end;
                end;
                v447 = sanitizeCFrame(v447 - sanitizeVector3(Vector3.new(v454, v455, v456) * Vector3.new(1, 0, 1)));
                if not v440 or v87 then
                    v90.CFrame = (v90.CFrame - v90.CFrame.p) + sanitizeVector3((v73:pointToWorldSpace(v447.p)));
                    if v87 then
                        local _ = v90.CFrame.p;
                        v90.Parent = game.Workspace;
                        v8.SafeMove(v90, game.Selection:Get(), (Vector3.new(0, 1, 0)));
                        v90.Parent = nil;
                        local _ = v90.CFrame.p;
                        v87 = false;
                    end;
                else
                    local v463 = v64.CFrame:pointToWorldSpace((Vector3.new(0, 1, 0))) - v64.Position;
                    setPartPosition(v90, v73:toWorldSpace(v447).p);
                    if originalDragPartOrientation then
                        setPartRotation(v90, #v441 > 1 and v73 or originalDragPartOrientation);
                        local l_CFrame_6 = v90.CFrame;
                        table.insert(v441, v90);
                        v90.Parent = workspace;
                        v90.CFrame = l_CFrame_5;
                        v90.CFrame = l_CFrame_6;
                        if v10.itemsHasItemNotInList(v90:GetTouchingParts(), v441) then
                            local l_Unit_10 = (v90.CFrame.p - l_CFrame_5.p).Unit;
                            if l_Unit_10.x ~= l_Unit_10.x then
                                l_Unit_10 = Vector3.new(0, 0, 0);
                            end;
                            local v466 = {};
                            v8.SafeMove(v90, v441, l_Unit_10 * -1);
                            if v9.distanceVector3(l_CFrame_5.p, l_CFrame_6.p) <= v9.distanceVector3(v90.CFrame.p, l_CFrame_6.p) then
                                v90.CFrame = l_CFrame_5;
                            end;
                            local l_CFrame_7 = v90.CFrame;
                            v90.CFrame = v90.CFrame + l_Unit_10 * 1.0E-4;
                            local v468 = 0;
                            while not v10.itemsHasItemNotInList(v90:GetTouchingParts(), v441) and v468 < 100 do
                                v90.CFrame = v90.CFrame + l_Unit_10 * 1.0E-4;
                                v468 = v468 + 1;
                            end;
                            local _ = v90.CFrame;
                            local v470 = v10.filterOutItems(v441, v90:GetTouchingParts());
                            local v471 = {};
                            local _ = tick();
                            for _, v474 in pairs(v470) do
                                table.insert(v471, v474.CFrame - v474.CFrame.p);
                                local l_Unit_11 = getNormalFromClosestPoint(v474, (getNormalOfCollidingFace(v90.CFrame.p, v474.CFrame.p, v463))).Unit;
                                l_Unit_11 = l_Unit_11 - l_Unit_11:Dot(v463.Unit) * v463.Unit;
                                l_Unit_11 = v14.roundVector3ToNearest(Vector3.new(if not v13.fuzzyCompare(0, l_Unit_11.x) then l_Unit_11.x else 0, if not v13.fuzzyCompare(0, l_Unit_11.y) then l_Unit_11.y else 0, if not v13.fuzzyCompare(0, l_Unit_11.z) then l_Unit_11.z else 0), 1.0E-4);
                                if not normalExistsInTable(v466, l_Unit_11) then
                                    table.insert(v466, {
                                        v474, 
                                        l_Unit_11
                                    });
                                end;
                            end;
                            local _ = tick();
                            local v477 = {};
                            local v478 = {};
                            for _, v480 in pairs(v466) do
                                v90.CFrame = l_CFrame_5;
                                local v481, v482 = v15.getPartBounds(v90, v480[1].CFrame);
                                v481 = v480[1].CFrame:pointToObjectSpace(v481);
                                v482 = v480[1].CFrame:pointToObjectSpace(v482);
                                v90.CFrame = l_CFrame_6;
                                local v483, v484 = v15.getPartBounds(v90, v480[1].CFrame);
                                v483 = v480[1].CFrame:pointToObjectSpace(v483);
                                v484 = v480[1].CFrame:pointToObjectSpace(v484);
                                local v485, v486 = v15.unionVector3NoSpaceChange(v483, v481, v482);
                                v485, v486 = v15.unionVector3NoSpaceChange(v484, v485, v486);
                                v481 = v485;
                                v482 = v486;
                                v485 = l_CFrame_7.p;
                                setPartPosition(v90, v480[1].CFrame.p);
                                v8.SafeMove(v90, v10.createIgnoreListGivenWhiteList(game.Workspace, {
                                    v480[1]
                                }), v480[2]);
                                local l_Unit_12 = (v14.roundVector3ToNearest(v485, 1.0E-4) - v14.roundVector3ToNearest(v90.CFrame.p, 1.0E-4)).Unit;
                                if v9.distanceVector3(l_CFrame_6.p, l_CFrame_7.p - l_Unit_12) < v9.distanceVector3(l_CFrame_6.p, l_CFrame_7.p + l_Unit_12) then
                                    l_Unit_12 = l_Unit_12 * -1;
                                end;
                                l_Unit_12 = getClosestNormalFromPart(v480[1], l_Unit_12 - l_Unit_12:Dot(v463.Unit) * v463.Unit);
                                l_Unit_12 = if #l_Unit_12 > 0 then l_Unit_12[1] else nil;
                                l_Unit_12 = Vector3.new(if not v13.fuzzyCompare(0, l_Unit_12.x) then l_Unit_12.x else 0, if not v13.fuzzyCompare(0, l_Unit_12.y) then l_Unit_12.y else 0, if not v13.fuzzyCompare(0, l_Unit_12.z) then l_Unit_12.z else 0);
                                setPartPosition(v90, l_CFrame_7.p - v480[2]);
                                v8.SafeMove(v90, v10.createIgnoreListGivenWhiteList(game.Workspace, {
                                    v480[1]
                                }), l_Unit_12);
                                local v488 = v9.distanceVector3(v90.CFrame.p, l_CFrame_6);
                                v90.CFrame = l_CFrame_6;
                                v8.SafeMove(v90, v10.createIgnoreListGivenWhiteList(game.Workspace, {
                                    v480[1]
                                }), v480[2]);
                                local v489 = v9.distanceVector3(v90.CFrame.p, l_CFrame_7);
                                if v489 < v488 then
                                    v488 = v489;
                                end;
                                v90.CFrame = l_CFrame_7;
                                local v490 = game.Selection:Get();
                                table.insert(v490, v480[1]);
                                local l_v90_0 = v90;
                                local l_v490_0 = v490;
                                local l_l_Unit_12_0 = l_Unit_12;
                                local l_v488_0 = v488;
                                if not l_v490_0 then
                                    l_v490_0 = {};
                                end;
                                if v8.moveUntilCollide(l_v90_0, l_v490_0, l_l_Unit_12_0, 2.0E-4, l_v488_0) then
                                    local _ = v9.distanceVector3(v90.CFrame.p, l_CFrame_7.p);
                                else
                                    local l_p_2 = v90.CFrame.p;
                                    v90.CFrame = l_CFrame_6;
                                    l_v90_0 = (v90.CFrame.p - l_p_2).Unit;
                                    v8.SafeMove(v90, v441, v480[2]);
                                end;
                                local v497 = nil;
                                l_v90_0 = v480[1].CFrame:pointToObjectSpace(v90.CFrame.p);
                                l_v490_0 = vector3LessThanOrEqualTo(l_v90_0, v482);
                                l_l_Unit_12_0 = vector3GreaterThanOrEqualTo(l_v90_0, v481);
                                if not (not l_v490_0 or not l_l_Unit_12_0) then
                                    if v10.itemsHasItemNotInList(v90:GetTouchingParts(), v441) then
                                        v497 = v90.CFrame.p;
                                    else
                                        table.insert(v477, v90.CFrame.p);
                                    end;
                                end;
                                v90.CFrame = l_CFrame_6;
                                v8.SafeMove(v90, v441, v480[2]);
                                l_v90_0 = v480[1].CFrame:pointToObjectSpace(v90.CFrame.p);
                                if not ((not vector3LessThanOrEqualTo(l_v90_0, v482) or not vector3GreaterThanOrEqualTo(l_v90_0, v481)) or v10.itemsHasItemNotInList(v90:GetTouchingParts(), v441)) then
                                    table.insert(v477, v90.CFrame.p);
                                end;
                                l_v488_0 = getDirectedNormalsFromPart(v90, v480[2]);
                                if v497 then
                                    for _, v499 in pairs(l_v488_0) do
                                        if not v10.itemExistsInList(v499, v478) then
                                            table.insert(v478, v499);
                                            setPartPosition(v90, v497);
                                            v8.SafeMove(v90, v441, v499);
                                            l_v90_0 = v480[1].CFrame:pointToObjectSpace(v90.CFrame.p);
                                            if not v10.itemsHasItemNotInList(v90:GetTouchingParts(), v441) then
                                                table.insert(v477, v90.CFrame.p);
                                            end;
                                        end;
                                    end;
                                end;
                            end;
                            local _ = tick();
                            local l_p_3 = l_CFrame_5.p;
                            local v502 = v9.distanceVector3(l_p_3, l_CFrame_6.p);
                            for _, v504 in pairs(v477) do
                                local v505 = v9.distanceVector3(v504, l_CFrame_6.p);
                                if v505 < v502 then
                                    v502 = v505;
                                    l_p_3 = v504;
                                end;
                            end;
                            setPartPosition(v90, l_p_3);
                        end;
                        if v9.distanceVector3(l_CFrame_5.p, l_CFrame_6.p) < v9.distanceVector3(v90.CFrame.p, l_CFrame_6.p) then
                            setPartPosition(v90, l_CFrame_5.p);
                        end;
                        if v10.itemsHasItemNotInList(v90:GetTouchingParts(), v441) then
                            local _ = v10.filterOutItems(v441, v90:GetTouchingParts());
                            v90.CFrame = l_CFrame_5;
                        end;
                        v90.Parent = nil;
                    else
                        return ;
                    end;
                end;
                v446.TranslateFromTo(l_CFrame_5, v90.CFrame);
                return ;
            else
                return ;
            end;
        else
            return ;
        end;
    else
        return ;
    end;
end;
planeDrag = function()
    v16.setAllAdornVisibility(false);
    local v507 = nil;
    local l_UnitRay_1 = l_Selection_0.UnitRay;
    local v509 = RaycastParams.new();
    v509.BruteForceAllSlow = true;
    local v510 = game:GetService("Workspace"):Raycast(l_UnitRay_1.Origin, l_UnitRay_1.Direction * 800, v509);
    if v510 then
        if not v510.Instance:IsA("Terrain") then
            v507 = v510.Instance;
            v46.Visible = true;
            local v511 = v507 and rayBoxIntersection(l_UnitRay_1, v507.CFrame, v507.Size);
            if not (not v507 or not v511) then
                local v512 = v507.CFrame:pointToObjectSpace(v511);
                local v513 = nil;
                local v514 = nil;
                local v515 = nil;
                local v516 = v507.Size / 2;
                local v517 = Vector3.new(50, 50, 0.01);
                local l_v511_0 = v511;
                v45.CFrame = v507.CFrame;
                v45.CFrame = v45.CFrame * CFrame.Angles(0, 1.5707963267948966, 0);
                if not v13.fuzzyCompare(math.abs(v512.X), v516.X) then
                    if not v13.fuzzyCompare(math.abs(v512.Y), v516.Y) then
                        if v13.fuzzyCompare(math.abs(v512.Z), v516.Z) then
                            v513 = v512 + Vector3.new(0, 1, 0);
                            v514 = v512 + Vector3.new(1, 1, 0);
                            v515 = v512 + Vector3.new(1, 0, 0);
                            v45.CFrame = v45.CFrame * CFrame.Angles(0, 1.5707963267948966, 0);
                            if not v13.fuzzyCompare(v512.Z, v516.Z) then
                                v517 = Vector3.new(v507.Size.x, v507.Size.y, 0.01);
                                l_v511_0 = Vector3.new(0, 0, -v516.z);
                            else
                                v517 = Vector3.new(v507.Size.x, v507.Size.y, 0.01);
                                l_v511_0 = Vector3.new(0, 0, v516.z);
                            end;
                        end;
                    else
                        v513 = v512 + Vector3.new(0, 0, 1);
                        v514 = v512 + Vector3.new(1, 0, 1);
                        v515 = v512 + Vector3.new(1, 0, 0);
                        v45.CFrame = v45.CFrame * CFrame.Angles(1.5707963267948966, 0, 0);
                        if not v13.fuzzyCompare(v512.Y, v516.Y) then
                            v517 = Vector3.new(v507.Size.z, v507.Size.x, 0.01);
                            l_v511_0 = Vector3.new(0, -v516.y, 0);
                        else
                            v517 = Vector3.new(v507.Size.z, v507.Size.x, 0.01);
                            l_v511_0 = Vector3.new(0, v516.y, 0);
                        end;
                    end;
                else
                    v513 = v512 + Vector3.new(0, 0, 1);
                    v514 = v512 + Vector3.new(0, 1, 1);
                    v515 = v512 + Vector3.new(0, 1, 0);
                    if not v13.fuzzyCompare(v512.X, v516.X) then
                        v517 = Vector3.new(v507.Size.z, v507.Size.y, 0.01);
                        l_v511_0 = Vector3.new(-v516.x, 0, 0);
                    else
                        v517 = Vector3.new(v507.Size.z, v507.Size.y, 0.01);
                        l_v511_0 = Vector3.new(v516.x, 0, 0);
                    end;
                end;
                if not ((not v513 or not v514) or not v515) then
                    local v519 = v507.CFrame:pointToObjectSpace(v511) - v512;
                    local v520 = v513 + v519;
                    local v521 = v514 + v519;
                    local v522 = v515 + v519;
                    v513 = v507.CFrame:pointToWorldSpace(v513);
                    v514 = v507.CFrame:pointToWorldSpace(v514);
                    v515 = v507.CFrame:pointToWorldSpace(v515);
                    v520 = v507.CFrame:pointToWorldSpace(v520);
                    v521 = v507.CFrame:pointToWorldSpace(v521);
                    v522 = v507.CFrame:pointToWorldSpace(v522);
                    v57 = createPlane(v513, v514, v515);
                    v58 = createPlane(v520, v521, v522);
                    v45.CFrame = (v45.CFrame - v45.CFrame.p) + v507.CFrame:pointToWorldSpace(l_v511_0);
                    v45.Size = v517;
                    v46.Size = v517;
                end;
                v16.drawPlaneCenter((v507.CFrame - v507.CFrame.p) + v507.CFrame:pointToWorldSpace((v507.Size * 0.5) * (v512 / v9.absVector3(v512))));
            end;
            return ;
        else
            return ;
        end;
    else
        return ;
    end;
end;
freeDrag = function()
    if not v88 then
        if not v47 then
            if v55 then
                v77 = nil;
                local l_UnitRay_2 = l_Selection_0.UnitRay;
                l_UnitRay_2 = Ray.new(l_UnitRay_2.Origin, l_UnitRay_2.Direction * 800);
                if v58 then
                    local v524 = rayPlaneIntersection(l_UnitRay_2, v58);
                    if not v87 then
                        local v525 = (v524 - l_UnitRay_2.Origin) / l_UnitRay_2.Unit.Direction;
                        if not (v525.X >= 0 and v525.Y >= 0) or v525.Z < 0 then
                            return ;
                        end;
                    end;
                    if v87 then
                        v524 = rayPlaneIntersection(l_UnitRay_2, v57);
                        local v526 = RaycastParams.new();
                        v526.FilterDescendantsInstances = game.Selection:Get();
                        v526.BruteForceAllSlow = true;
                        local v527 = workspace:Raycast(l_UnitRay_2.Origin, l_UnitRay_2.Direction, v526);
                        local v528 = nil;
                        v528 = if not v527 then l_UnitRay_2.Origin + l_UnitRay_2.Direction else v527.Position;
                        local l_p_4 = workspace.CurrentCamera.CoordinateFrame.p;
                        local v530 = v9.distanceVector3(v528, l_p_4);
                        local v531 = v9.distanceVector3(v524, l_p_4);
                        if v13.fuzzyCompareVector3(l_UnitRay_2.Direction.Unit, (l_p_4 - v524).Unit) then
                            v531 = 800;
                        end;
                        if v531 < 2 then
                            v531 = 800;
                        end;
                        if v531 > 500 and v530 > 500 then
                            v524 = l_p_4 + l_UnitRay_2.Direction.Unit * 30;
                        end;
                    end;
                    local v532 = Vector3.new(0, 0, 0);
                    if not selectedPart then
                        local v533 = v11.getFilteredSelection();
                        if not v533 or #v533 == 0 then
                            return ;
                        else
                            selectedPart = v12.convertToPart(v533[1]);
                        end;
                    else
                        v532 = selectedPart.Position;
                    end;
                    if v56 then
                        if not l_StudioService_0 then
                            analyticsRecordFreeformDragBegin();
                            l_StudioService_0 = true;
                        end;
                        analyticsRecordFreeformDragUpdate(v524);
                        movePart(v524 - v56, l_plugin_0.CollisionEnabled);
                        v53 = v53 + (selectedPart.Position - v532);
                        updateInvisiblePart();
                        return ;
                    else
                        return ;
                    end;
                else
                    return ;
                end;
            else
                l_StudioService_0 = true;
                v18.updateRubberBand(Vector2.new(l_Selection_0.X, l_Selection_0.Y));
                return ;
            end;
        else
            planeDrag();
            return ;
        end;
    else
        selectPart();
        v88 = false;
        return ;
    end;
end;
selectDragPlane = function(v534)
    local v535 = nil;
    if not v16.isOverPlaneSelect() then
        v535 = l_Selection_0.UnitRay;
        v535 = Ray.new(v535.Origin, v535.Direction * 800);
        local v536 = nil;
        local v537 = nil;
        local v538 = nil;
        if not v534 then
            local v539 = RaycastParams.new();
            v539.BruteForceAllSlow = true;
            local v540 = game.Workspace:Raycast(v535.Origin, v535.Direction, v539);
            if v540 then
                v536 = v540.Instance;
            end;
        else
            v536 = Instance.new("Part", v26);
            v536.Size = Vector3.new(100, 1, 100);
            v536.CFrame = CFrame.new(0, -0.5, 0);
            v538 = Vector3.new(0, 0, 0);
            v537 = Vector3.new(0, 1, 0);
        end;
        if v536 then
            if not v534 then
                v538 = rayBoxIntersection(v535, v536.CFrame, v536.Size);
            end;
            if v59 then
                v59:Destroy();
            end;
            v59 = v536;
            v60 = v538;
            local v541 = Instance.new("Part", v26);
            v541.Size = v59.Size;
            v541.CFrame = v59.CFrame;
            v59 = v541;
            v61 = v59.CFrame:toWorldSpace(CFrame.new(v59.Size / 2));
            v62 = nil;
            local v542 = nil;
            local v543 = nil;
            if not (not v59 or not v60) then
                v542 = v59.CFrame:pointToObjectSpace(v60);
                local v544 = nil;
                local v545 = nil;
                local v546 = nil;
                local v547 = nil;
                local v548 = nil;
                local v549 = nil;
                local v550 = nil;
                v69 = v547;
                v70 = v548;
                v71 = v549;
                v72 = v550;
                v543 = v59.Size / 2;
                if not v13.fuzzyCompare(math.abs(v542.X), v543.X) then
                    if not v13.fuzzyCompare(math.abs(v542.Y), v543.Y) then
                        if v13.fuzzyCompare(math.abs(v542.Z), v543.Z) then
                            v544 = v542 + Vector3.new(0, 1, 0);
                            v545 = v542 + Vector3.new(1, 1, 0);
                            v546 = v542 + Vector3.new(1, 0, 0);
                            v69 = Vector3.new(0, 0, v542.Z) + Vector3.new(-1, 1, 0) * v543;
                            v70 = Vector3.new(0, 0, v542.Z) + Vector3.new(1, 1, 0) * v543;
                            v71 = Vector3.new(0, 0, v542.Z) + Vector3.new(-1, -1, 0) * v543;
                            v72 = Vector3.new(0, 0, v542.Z) + Vector3.new(1, -1, 0) * v543;
                            if not v13.fuzzyCompare(v542.Z, v543.Z) then
                                v62 = 4;
                            else
                                v62 = 5;
                            end;
                        end;
                    else
                        v544 = v542 + Vector3.new(0, 0, 1);
                        v545 = v542 + Vector3.new(1, 0, 1);
                        v546 = v542 + Vector3.new(1, 0, 0);
                        v69 = Vector3.new(0, v542.Y, 0) + Vector3.new(-1, 0, 1) * v543;
                        v70 = Vector3.new(0, v542.Y, 0) + Vector3.new(1, 0, 1) * v543;
                        v71 = Vector3.new(0, v542.Y, 0) + Vector3.new(-1, 0, -1) * v543;
                        v72 = Vector3.new(0, v542.Y, 0) + Vector3.new(1, 0, -1) * v543;
                        if not v13.fuzzyCompare(v542.Y, v543.Y) then
                            v62 = 1;
                        else
                            v62 = 0;
                        end;
                    end;
                else
                    v544 = v542 + Vector3.new(0, 0, 1);
                    v545 = v542 + Vector3.new(0, 1, 1);
                    v546 = v542 + Vector3.new(0, 1, 0);
                    v69 = Vector3.new(v542.X, 0, 0) + Vector3.new(0, -1, 1) * v543;
                    v70 = Vector3.new(v542.X, 0, 0) + Vector3.new(0, 1, 1) * v543;
                    v71 = Vector3.new(v542.X, 0, 0) + Vector3.new(0, -1, -1) * v543;
                    v72 = Vector3.new(v542.X, 0, 0) + Vector3.new(0, 1, -1) * v543;
                    if not v13.fuzzyCompare(v542.X, v543.X) then
                        v62 = 2;
                    else
                        v62 = 3;
                    end;
                end;
                if not ((not v544 or not v545) or not v546) then
                    v66 = v544;
                    v67 = v545;
                    v68 = v546;
                    v57 = createPlane(v59.CFrame:pointToWorldSpace(v544), v59.CFrame:pointToWorldSpace(v545), (v59.CFrame:pointToWorldSpace(v546)));
                    v58 = nil;
                end;
            end;
            v73 = v59.CFrame - (v59.CFrame:pointToWorldSpace(v543 * v9.cleanVector3((v542 / v9.absVector3(v542)) * -1)) - v59.CFrame.p);
            if not (v62 ~= 2) or v62 == 3 then
                v73 = v73 * CFrame.Angles(0, 0, 1.5707963267948966);
            elseif not (v62 ~= 5) or v62 == 4 then
                v73 = v73 * CFrame.Angles(1.5707963267948966, 0, 0);
            end;
            updateInvisiblePart();
            local v551 = v11.getFilteredSelectionMetapart();
            if v551 then
                v551.UpdatePlaneCFrame = v73;
            end;
            v16.setPlaneSelectingMode(false);
            return ;
        else
            v16.setPlaneSelectingMode(false);
            return ;
        end;
    else
        v16.setPlaneSelectingMode(false);
        return ;
    end;
end;
removeDragPart = function()
    local v552 = {};
    local v553 = false;
    for _, v555 in ipairs((game:GetService("Selection"):Get())) do
        if (v555.Parent ~= v26 and v555.Name ~= "DragParte1b1aec5") and v555.Name ~= "InvisibleParte1b1aec5" then
            table.insert(v552, v555);
        else
            v555.Parent = game:GetService("CoreGui");
            v553 = true;
        end;
    end;
    if v553 then
        game:GetService("Selection"):Set(v552);
    end;
end;
releasePart = function()
    v437 = true;
    v215 = 0;
    if v94 then
        local v556 = getCurrentSelectionWithChildren();
        v94 = false;
        for v557, v558 in ipairs(v556) do
            v558.Anchored = v95[v557];
        end;
        v95 = {};
    end;
    v18.finishRubberbandDrag();
    recreateAdornment();
    setWaypoint();
    if not v55 then
        if v89 then
            workspace:JoinToOutsiders(v11.getFilteredSelection(), l_plugin_0:GetJoinMode());
        end;
    else
        if not (not (#game.Selection:Get() == 1) or not game.Selection:Get()[1]:IsA("BasePart")) then
            v16.setAllAdornVisibility(true);
        end;
        v53 = Vector3.new(0, 0, 0);
        v86 = nil;
        if v438 then
            workspace:JoinToOutsiders(v11.getFilteredSelection(), l_plugin_0:GetJoinMode());
        end;
    end;
    v438 = false;
    v87 = false;
    v89 = false;
    v55 = false;
    originalDragPartOrientation = nil;
    if v90 then
        v91.Visible = false;
        v90.Parent = nil;
        v91.Adornee = v90;
        v91.Size = v91.Adornee.Size;
        v91.AlwaysOnTop = true;
        v91.CFrame = v90.CFrame - v90.CFrame.p;
    end;
    if not (not v47 or not v16.isPlaneSelectingModeOn()) then
        selectDragPlane();
        v47 = false;
    end;
    if v46 then
        v46:Destroy();
        v46 = nil;
    end;
    if v45 then
        v45:Destroy();
        v45 = nil;
    end;
    v56 = nil;
end;
grabHandle = function(v559, v560)
    if v560 then
        v54 = v560;
        v50 = Vector3.new(0, 0, 0);
        if ((v559 ~= 11 and v559 ~= 12) and v559 ~= 13) and v559 ~= 14 then
            updateDragPart();
        end;
        local v561 = v11.getFilteredSelectionMetapart();
        if v561 then
            v52 = v561.CFrame;
            v51 = v561.Size;
            v65 = v64.CFrame;
            v75 = nil;
            preUpdatePart();
            return ;
        else
            return ;
        end;
    else
        return ;
    end;
end;
releaseHandle = function()
    v243 = nil;
    v215 = 0;
    local v562 = v16.getCurrentHandle();
    if v562 == 0 then
        return ;
    else
        if v562 ~= 14 then
            analyticsSendHandleDragged(v92[v562]);
        end;
        workspace:JoinToOutsiders(v11.getFilteredSelection(), l_plugin_0:GetJoinMode());
        v54 = nil;
        v50 = nil;
        v51 = nil;
        v52 = nil;
        v65 = nil;
        return ;
    end;
end;
recreateAdornment = function()
    if v25 then
        v25 = false;
        if not v64 then
            v64 = Instance.new("Part", nil);
            v64.Name = "InvisibleParte1b1aec5";
            v64.TopSurface = Enum.SurfaceType.Smooth;
            v64.BottomSurface = Enum.SurfaceType.Smooth;
            v64.Archivable = false;
            v64.Transparency = 1;
        end;
        if not v76 then
            v76 = Instance.new("Part");
        end;
        v16.adornInstanceWithTranslate(v64);
        v16.adornInstanceWithPlane(v64);
        local v563 = v11.getFilteredSelection();
        if #v563 > 0 then
            v16.setPlaneVisibility(true);
            if not (#v563 == 1) or not v563[1]:IsA("BasePart") then
                v16.setScaleAdornVisibility(false);
            else
                v16.adornInstanceWithScale(v563[1]);
            end;
        end;
        v121();
        updateInvisiblePart();
        return ;
    else
        return ;
    end;
end;
isInSelection = function(v564)
    if v564 then
        for _, v566 in ipairs((game.Selection:Get())) do
            if v566 == v564 then
                return true;
            end;
        end;
        return false;
    else
        return nil;
    end;
end;
getHighestModelParent = function(v567)
    if v567 then
        if v567 == game.Workspace then
            return nil;
        else
            local v568 = getHighestModelParent(v567.Parent);
            if v568 ~= nil then
                return v568;
            elseif not v567:IsA("Model") then
                return nil;
            else
                return v567;
            end;
        end;
    else
        return nil;
    end;
end;
getPVInstanceForPart = function(v569)
    local v570 = getHighestModelParent(v569);
    if v570 ~= nil then
        return v570;
    elseif not v569:IsA("PVInstance") or v569:IsA("Workspace") then
        return nil;
    else
        return v569;
    end;
end;
getTopPVInstance = function(v571)
    if v571 then
        if v571.Parent == game.Workspace then
            if not v571:IsA("PVInstance") or v571:IsA("Workspace") then
                return nil;
            else
                return v571;
            end;
        else
            local v572 = getTopPVInstance(v571.Parent);
            if v572 then
                return v572;
            elseif not v571:IsA("PVInstance") or v571:IsA("Workspace") then
                return nil;
            else
                return v571;
            end;
        end;
    else
        return nil;
    end;
end;
findPartInstance = function(v573)
    for _, v575 in ipairs(v573) do
        if v575:IsA("BasePart") then
            return v575;
        end;
    end;
    for _, v577 in ipairs(v573) do
        local v578 = findPartInstance(v577:GetChildren());
        if v578 then
            return v578;
        end;
    end;
    return nil;
end;
isAncestorSelected = function(v579)
    if v579.Parent then
        if not v10.itemExistsInList(v579.Parent, game.Selection:Get()) then
            return isAncestorSelected(v579.Parent);
        else
            return v579.Parent;
        end;
    else
        return nil;
    end;
end;
selectPart = function(v580)
    v77 = nil;
    local l_UnitRay_3 = l_Selection_0.UnitRay;
    local v582 = RaycastParams.new();
    v582.BruteForceAllSlow = true;
    local v583 = game:GetService("Workspace"):Raycast(l_UnitRay_3.Origin, l_UnitRay_3.Direction * 800, v582);
    local v584 = nil;
    local v585 = nil;
    if v583 then
        v584 = v583.Instance;
        v585 = v583.Position;
    end;
    local v586 = false;
    if v10.itemExistsInList(v584, game.Selection:Get()) then
        v586 = true;
    end;
    if v580 then
        local v587 = findPartInstance(v580);
        v585 = v587.CFrame.p;
        if v587 then
            v584 = v587;
        end;
        if v585.y < 0 then
            v585 = v585 * Vector3.new(1, 0, 1);
        end;
    end;
    if not ((not v584 or not v584.Locked) or v87) then
        v584 = nil;
    end;
    if not ((not v584 or v27:IsKeyDown(Enum.KeyCode.LeftAlt)) or v586) then
        v584 = isAncestorSelected(v584) or getPVInstanceForPart(v584);
    end;
    local v588 = false;
    if not v584 then
        v18.startRubberbandDrag(Vector2.new(l_Selection_0.X, l_Selection_0.Y));
        if #game.Selection:Get() > 0 then
            v588 = true;
        end;
    else
        if isInSelection(v584) then
            if v27:IsKeyDown(Enum.KeyCode.LeftControl) then
                local v589 = {};
                for _, v591 in ipairs(game.Selection:Get()) do
                    if v591 ~= v584 then
                        table.insert(v589, v591);
                    end;
                end;
                game:GetService("Selection"):Set(v589);
                v588 = true;
            end;
        else
            if not v27:IsKeyDown(Enum.KeyCode.LeftControl) then
                game:GetService("Selection"):Set({
                    v584
                });
            else
                local v592 = game.Selection:Get();
                table.insert(v592, v584);
                game:GetService("Selection"):Set(v592);
            end;
            v588 = true;
        end;
        v56 = v585;
        if not ((not v66 or not v67) or not v68) then
            v584 = v12.convertToPart(v584);
            local v593 = v59.CFrame:pointToObjectSpace(v585) - v59.CFrame:pointToObjectSpace(v60);
            v58 = createPlane(v59.CFrame:pointToWorldSpace(v66 + v593), v59.CFrame:pointToWorldSpace(v67 + v593), (v59.CFrame:pointToWorldSpace(v68 + v593)));
            local v594 = (v584.CFrame - v584.CFrame.p) + v56;
            local v595 = CFrame.new(v594.p) * (v59.CFrame - v59.CFrame.p);
            if v27:IsKeyDown(Enum.KeyCode.LeftShift) then
                v25 = true;
                local v596 = v11.getFilteredSelectionMetapart();
                v596.CFrame = v595:toWorldSpace(v594:toObjectSpace(v596.CFrame));
            end;
        end;
        if not v6 then
            grabPart();
        else
            task.defer(grabPart);
        end;
    end;
    analyticsSendClick(v584, v588);
    recreateAdornment();
end;
waypointChanged = function()
    removeDragPart();
    if l_Workspace_0 then
        v16.resetDragger();
        v121(v11.getFilteredSelection());
        updateInvisiblePart();
        return ;
    else
        return ;
    end;
end;
selectionChanged = function()
    v25 = true;
    v11.updateSelection();
    v16.resetDragger();
    if not v18.isRubberBandDragInProgress() then
        local v597 = v11.getCurrentSelection();
        local v598 = v11.getFilteredSelectionMetapart();
        if not (not (#v597 == 0) or not v87) then
            v87 = false;
            releasePart();
        end;
        if v90 then
            v90.Parent = nil;
        end;
        if v598 then
            v51 = v598.Size;
            v52 = v598.CFrame;
        end;
        if #v597 == 1 then
            selectedPart = v12.convertToPart(v597[1]);
        end;
        recreateAdornment();
        return ;
    else
        return ;
    end;
end;
onDragEnter = function(v599)
    if #v599 == 0 then
        return ;
    else
        v87 = true;
        if not v17.getButtonState(v17.Enum.Key.MOUSE_BUTTON1) then
            v17.setButtonState(v17.Enum.Key.MOUSE_BUTTON1, true);
            selectPart(v599);
        end;
        return ;
    end;
end;
local function v600()
    if not v16.isPlaneSelectingModeOn() then
        v16.setPlaneSelectingMode(true);
        v47 = true;
        if not v45 then
            v45 = Instance.new("Part", v26);
            v45.Size = Vector3.new(50, 50, 0.01);
            v45.Position = Vector3.new(0, 0, 0);
            v45.Transparency = 1;
        end;
        if not v46 then
            v46 = Instance.new("BoxHandleAdornment", v26);
            v46.Visible = false;
            v46.Adornee = v45;
            v46.Size = v46.Adornee.Size;
            v46.Transparency = 0.6;
            v46.Color3 = Color3.new(0.14901960784313725, 0.5333333333333333, 0.9411764705882353);
        end;
        return ;
    else
        v16.setPlaneSelectingMode(false);
        v47 = false;
        v46.Visible = false;
        v16.clearExtraAdorns();
        return ;
    end;
end;
keyPress = function(v601, v602)
    if not v602 then
        if v601.UserInputType == Enum.UserInputType.Keyboard then
            if v601.UserInputState == Enum.UserInputState.Begin then
                if l_Workspace_0 and v601.KeyCode == Enum.KeyCode.Space then
                    v600();
                end;
                if not (not (not v4 and v601.KeyCode == Enum.KeyCode.Five) or not v27:IsKeyDown(Enum.KeyCode.LeftControl) and not v27:IsKeyDown(Enum.KeyCode.RightControl)) then
                    if l_Workspace_0 then
                        Off();
                        return ;
                    else
                        On();
                        return ;
                    end;
                end;
            end;
        elseif l_Workspace_0 and v601.UserInputType == Enum.UserInputType.MouseButton1 then
            if v601.UserInputState == Enum.UserInputState.Begin then
                v17.setButtonState(v17.Enum.Key.MOUSE_BUTTON1, true);
                v125();
                return ;
            elseif v601.UserInputState == Enum.UserInputState.End then
                v17.setButtonState(v17.Enum.Key.MOUSE_BUTTON1, v17.Enum.State.UP);
                v126();
            end;
        end;
        return ;
    else
        return ;
    end;
end;
inputChanged = function(v603)
    if not (not v17.getButtonState(v17.Enum.Key.MOUSE_BUTTON1) or v603.UserInputType ~= Enum.UserInputType.MouseMovement) or v16.isPlaneSelectingModeOn() and v16.getCurrentHandle() == 14 then
        if not v52 then
            local v604 = v11.getFilteredSelectionMetapart();
            if v604 then
                v52 = v604.CFrame;
            end;
        end;
        if not v51 then
            local v605 = v11.getFilteredSelectionMetapart();
            if v605 then
                v51 = v605.Size;
            end;
        end;
        if v52 then
            updatePart();
        end;
    end;
    freeDrag();
end;
local l_updateAdornmentPositions_0 = v16.updateAdornmentPositions;
Off = function()
    if l_Workspace_0 then
        l_Workspace_0 = false;
        l_plugin_0:Invoke("setActive", "false");
        if v3 then
            l_plugin_0:Deactivate();
        end;
        v78:disconnect();
        v79:disconnect();
        v81:disconnect();
        v82:disconnect();
        v83:disconnect();
        v84:disconnect();
        v85:disconnect();
        v16.destroyAdorns();
        analyticsSendSession();
        return ;
    else
        return ;
    end;
end;
local function _()
    if not l_RunService_0:IsRunning() or l_RunService_0:IsRunMode() then
        return "rbxasset://SystemCursors/Arrow";
    else
        return "rbxasset://textures/advCursor-default.png";
    end;
end;
On = function()
    if not l_Workspace_0 then
        if v7 then
            task.defer(function()
                if l_Workspace_0 then
                    l_plugin_0:GetMouse().Icon = (not l_RunService_0:IsRunning() or l_RunService_0:IsRunMode()) and "rbxasset://SystemCursors/Arrow" or "rbxasset://textures/advCursor-default.png";
                end;
            end);
        end;
        l_plugin_0:Activate(true);
        l_plugin_0:Invoke("setActive", "true");
        l_Workspace_0 = true;
        if v48 then
            v48:Destroy();
            v48 = nil;
        end;
        v16.initializeAdorns();
        v78 = game:GetService("ChangeHistoryService").OnUndo:connect(waypointChanged);
        v79 = game:GetService("ChangeHistoryService").OnRedo:connect(waypointChanged);
        v81 = v27.InputEnded:connect(keyPress);
        v82 = v27.InputChanged:connect(inputChanged);
        v83 = game:GetService("Selection").SelectionChanged:connect(selectionChanged);
        v84 = game:GetService("RunService").RenderStepped:connect(function()
            if not (not v11.getFilteredSelectionMetapart() or not v11.getFilteredSelectionMetapart().IsUpdateRequired) then
                spawn(function()
                    local v608 = v11.getFilteredSelectionMetapart();
                    if v608 then
                        v608.ClearCache();
                    end;
                    updateInvisiblePart();
                    v121();
                end);
            end;
            l_updateAdornmentPositions_0();
        end);
        v85 = l_plugin_0:GetMouse().DragEnter:connect(onDragEnter);
        v25 = true;
        recreateAdornment();
        if not v24 then
            selectDragPlane(true);
        end;
        v24 = true;
        selectionChanged();
        analyticsSessionBegin();
        return ;
    else
        return ;
    end;
end;
l_UserInputService_0 = true;
v80 = v27.InputBegan:connect(keyPress);
