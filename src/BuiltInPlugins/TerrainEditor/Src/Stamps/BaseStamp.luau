local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local l_VoxelResolution_0 = require(l_script_FirstAncestor_0.Src.Resources.Constants).VoxelResolution;
local v2 = require(l_script_FirstAncestor_0.Src.Types);
local l_BuildSettings_0 = v2.BuildSettings;
local l_Category_0 = v2.Category;
local l_Generation_0 = l_script_FirstAncestor_0.Src.Util.Generation;
local v6 = require(l_Generation_0.GetBlendingFactorMap);
local v7 = require(l_Generation_0.GetMaterial);
local v8 = require(l_Generation_0.RotatePointInRectangle);
local v9 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagTerrainEditorDebugMode);
local _ = Enum.Material.Ground;
local v11 = {};
local l_StarterGui_0 = game:GetService("StarterGui");
v11.__index = v11;
v11.new = function(v13, v14)
    local v15 = {
        _terrainType = v14
    };
    setmetatable(v15, v13);
    v13.__index = v13;
    return v15;
end;
v11.init = function(v16, v17, v18)
    v16._services = v18;
    v16._payload = v17;
    v16:setupRegion();
    return v16;
end;
v11.update = function(v19, v20, v21)
    local v22 = if not v21 then nil else v21[l_Category_0.BuildSettings];
    if ((v22 and v22[l_BuildSettings_0.OperationSource] == "Gizmo") and v22[l_BuildSettings_0.Transform] == v19._payload[l_Category_0.BuildSettings][l_BuildSettings_0.Transform]) and v22[l_BuildSettings_0.Size] == v19._payload[l_Category_0.BuildSettings][l_BuildSettings_0.Size] then
        return ;
    else
        v19._payload = v20;
        local v23 = true;
        local v24 = false;
        local v25 = false;
        local v26 = v19._payload[l_Category_0.BuildSettings][l_BuildSettings_0.AdvancedNoise].Children[l_BuildSettings_0.Rotation];
        if v22 then
            if not (not v22[l_BuildSettings_0.Transform] and not v22[l_BuildSettings_0.Size]) then
                local l_Size_0 = v19._region.Size;
                v19:revertRegion(v19._region);
                v19:setupRegion();
                if l_Size_0 ~= v19._region.Size then
                    v24 = true;
                end;
            end;
            local v28 = v22[l_BuildSettings_0.BlendingEdge];
            if v28 then
                v19:updateBlendingFactorMap(v28);
            end;
            v25 = not not v22[l_BuildSettings_0.AdvancedNoise] and if (v22[l_BuildSettings_0.AdvancedNoise].Children and v22[l_BuildSettings_0.AdvancedNoise].Children[l_BuildSettings_0.Rotation]) and v19._addRotationY then v19._rotationY ~= v26 else false;
            if not (not ((((v25 or v22[l_BuildSettings_0.Transform] and not v24) or v22[l_BuildSettings_0.BlendingEdge]) or v22[l_BuildSettings_0.Material]) or v22[l_BuildSettings_0.MaterialLUT]) and not v22[l_BuildSettings_0.WaterLevel]) then
                v23 = false;
            end;
        end;
        v19._addBlending = v19._payload[l_Category_0.BuildSettings][l_BuildSettings_0.BlendingEdge] > 0;
        v19._rotationY = v26;
        if (not (v19._addRotationY or not v26) and v26 > 0) and v26 < 360 then
            v19._addRotationY = true;
        end;
        v19._rotatedXOffset = not v19._addRotationY and 0 or math.floor((v19._rotatedSlice - v19._sliceX) / 2);
        v19._rotatedZOffset = not v19._addRotationY and 0 or math.floor((v19._rotatedSlice - v19._sliceZ) / 2);
        v19._rotatedSliceX = if not v19._addRotationY then v19._sliceX else v19._rotatedSlice;
        v19._rotatedSliceZ = if not v19._addRotationY then v19._sliceZ else v19._rotatedSlice;
        v19:generateStamp(v23, v25);
        return ;
    end;
end;
v11.getTerrainType = function(v29)
    return v29._terrainType;
end;
v11.setupRegion = function(v30)
    local l_Position_0 = v30._payload[l_Category_0.BuildSettings][l_BuildSettings_0.Transform].Position;
    local v32 = v30._payload[l_Category_0.BuildSettings][l_BuildSettings_0.Size] / 2;
    v30._region = Region3.new(l_Position_0 - v32, l_Position_0 + v32);
    v30._region = v30._region:ExpandToGrid(l_VoxelResolution_0);
    v30._sliceX = v30._region.Size.X / l_VoxelResolution_0;
    v30._sliceY = v30._region.Size.Y / l_VoxelResolution_0;
    v30._sliceZ = v30._region.Size.Z / l_VoxelResolution_0;
    v30._rotatedSlice = math.ceil((math.sqrt(v30._sliceX ^ 2 + v30._sliceZ ^ 2)));
    v30:cacheRegion(v30._region);
    v30:updateBlendingFactorMap(v30._payload[l_Category_0.BuildSettings][l_BuildSettings_0.BlendingEdge]);
end;
v11.getIndex = function(v33, v34, v35)
    return v33._sliceZ * (v34 - 1) + v35;
end;
v11.getRotatedIndex = function(v36, v37, v38)
    return v36._rotatedSlice * (v37 - 1) + v38;
end;
v11.getSliceIndex = function(v39, v40, v41)
    if not v39._addRotationY then
        return v39:getIndex(v40, v41);
    else
        return v39:getRotatedIndex(v40, v41);
    end;
end;
v11.getRotatedIndexWithOffset = function(v42, v43, v44)
    return v42:getSliceIndex(v43 + v42._rotatedXOffset, v44 + v42._rotatedZOffset);
end;
v11.generateStamp = function(v45, v46, v47)
    if not v45._region or v45._region.Size == Vector3.zero then
        return ;
    else
        if v46 then
            debug.profilebegin("TG_GenerateNoise");
            v45:generateNoiseMap();
            debug.profileend();
            debug.profilebegin("TG_GenerateHeight");
            v45:generateHeightMap();
            debug.profileend();
        end;
        if not (not v45._addRotationY or not v46 and not v47) then
            debug.profilebegin("TG_RotateHeight");
            v45:generateRotatedHeightMap();
            debug.profileend();
        end;
        debug.profilebegin("TG_BlendHeight");
        v45:blendHeightMap();
        debug.profileend();
        debug.profilebegin("TG_GenerateOccupancyMap");
        v45:generateOccupancyMap();
        debug.profileend();
        debug.profilebegin("TG_GenerateSlopeMap");
        v45:generateSlopeMap();
        debug.profileend();
        debug.profilebegin("TG_GenerateMaterial");
        v45:generateMaterialMap();
        debug.profileend();
        debug.profilebegin("TG_BlendMaterialMap");
        v45:blendMaterialMap();
        debug.profileend();
        debug.profilebegin("TG_PostProcessing");
        v45:postProcessing();
        debug.profileend();
        if v9() then
            v45:debugDraw();
        end;
        v45._services.Terrain:WriteVoxels(v45._region, l_VoxelResolution_0, v45._materialMap, v45._occupancyMap);
        return ;
    end;
end;
v11.generateNoiseMap = function(v48)
    v48._noiseMap = table.create(v48._rotatedSliceX * v48._rotatedSliceZ, 0);
end;
v11.getHeightFromNoise = function(v49, v50, v51, v52)
    return (math.clamp(v52 + (v49._sliceY * v51) * v50, 0, v49._sliceY));
end;
v11.createHeightMapWithNoise = function(v53, ...)
    local v54 = v53._sliceX * v53._sliceZ;
    if not v53._heightMap or #v53._heightMap ~= v54 then
        v53._heightMap = table.create(v54, 0);
    end;
    if not v53._addRotationY then
        if v9() and v54 ~= #v53._noiseMap then
            warn("NoiseMap has wrong size");
        end;
        for v55 = 1, v54 do
            v53._heightMap[v55] = v53:getHeightFromNoise(v53._noiseMap[v55], ...);
        end;
        return ;
    else
        local v56 = v53._rotatedSlice * v53._rotatedSlice;
        if not v53._outterHeightMap or #v53._outterHeightMap ~= v56 then
            v53._outterHeightMap = table.create(v56, 0);
        end;
        if v9() and v56 ~= #v53._noiseMap then
            warn("NoiseMap has wrong size");
        end;
        for v57 = 1, v56 do
            v53._outterHeightMap[v57] = v53:getHeightFromNoise(v53._noiseMap[v57], ...);
        end;
        return ;
    end;
end;
v11.generateHeightMap = function(v58)
    local v59 = v58._payload[l_Category_0.BuildSettings][l_BuildSettings_0.NoiseStrength] / 2;
    v58:createHeightMapWithNoise(v59, v58._sliceY * (1 - v59));
end;
v11.generateRotatedHeightMap = function(v60)
    local v61 = v8(v60._sliceX, v60._sliceZ, (math.rad(v60._rotationY)));
    for v62 = 1, v60._sliceX do
        for v63 = 1, v60._sliceZ do
            local v64, v65 = v61(v62 - 0.5, v63 - 0.5);
            v60._heightMap[v60:getIndex(v62, v63)] = v60._outterHeightMap[v60:getRotatedIndex(math.clamp(math.floor(v64 + v60._rotatedXOffset), 1, v60._rotatedSlice), (math.clamp(math.floor(v65 + v60._rotatedZOffset), 1, v60._rotatedSlice)))];
        end;
    end;
end;
v11.generateSlopeMap = function(v66)
    v66._slopeMap = table.create(v66._sliceX * v66._sliceZ, 0);
    v66._minNeighborHeight = table.create(v66._sliceX * v66._sliceZ, 0);
    local v67 = {
        {
            -1, 
            0
        }, 
        {
            1, 
            0
        }, 
        {
            0, 
            -1
        }, 
        {
            0, 
            1
        }, 
        {
            -1, 
            -1
        }, 
        {
            -1, 
            1
        }, 
        {
            1, 
            -1
        }, 
        {
            1, 
            1
        }
    };
    for v68 = 1, v66._sliceX do
        for v69 = 1, v66._sliceZ do
            local v70 = v66:getIndex(v68, v69);
            local v71 = v66._heightMap[v70];
            local v72 = math.floor(v71);
            local v73 = 0;
            local v74 = 0;
            local v75 = 0;
            local v76 = 0;
            local v77 = 0;
            local v78 = 0;
            v66._minNeighborHeight[v70] = v72;
            for _, v80 in v67, nil, nil do
                local v81 = v68 + v80[1];
                local v82 = v69 + v80[2];
                local v83 = false;
                if v81 > 0 then
                    v83 = false;
                    if v81 <= v66._sliceX then
                        v83 = false;
                        if v82 > 0 then
                            v83 = v82 <= v66._sliceZ;
                        end;
                    end;
                end;
                local v84 = not v83 and 0 or v66._heightMap[v66:getIndex(v81, v82)];
                v66._minNeighborHeight[v70] = math.min(v66._minNeighborHeight[v70], (math.floor(v84)));
                if v83 then
                    if v80[1] == 0 then
                        v73 = v73 + math.abs(v84 - v71);
                        v74 = v74 + 1;
                    elseif v80[2] == 0 then
                        v75 = v75 + math.abs(v84 - v71);
                        v76 = v76 + 1;
                    else
                        v77 = v77 + math.abs(v84 - v71);
                        v78 = v78 + 1;
                    end;
                end;
            end;
            v73 = v74 == 0 and 0 or v73 / v74;
            v75 = v76 == 0 and 0 or v75 / v76;
            v77 = v78 == 0 and 0 or v77 / v78;
            v66._slopeMap[v70] = math.atan((math.sqrt(((v73 * v73 + v75 * v75) + v77 * v77) / 4)));
        end;
    end;
end;
v11.generateOccupancyMap = function(v85)
    if v9() and v85._sliceX * v85._sliceZ ~= #v85._heightMap then
        warn("HeightMap has wrong size Can't generate OccupancyMap.");
    end;
    v85._occupancyMap = table.create(v85._sliceX);
    for v86 = 1, v85._sliceX do
        v85._occupancyMap[v86] = table.create(v85._sliceY);
        for v87 = 1, v85._sliceY do
            v85._occupancyMap[v86][v87] = table.create(v85._sliceZ, 0);
        end;
    end;
    for v88 = 1, v85._sliceX do
        local v89 = v85._occupancyMap[v88];
        for v90 = 1, v85._sliceZ do
            local v91 = v85._heightMap[v85:getIndex(v88, v90)];
            local v92 = math.floor(v91);
            for v93 = 1, v92 do
                v89[v93][v90] = 1;
            end;
            if v91 - v92 > 0 then
                v89[math.min(v92 + 1, v85._sliceY)][v90] = v91 - v92;
            end;
        end;
    end;
end;
v11.generateMaterialMap = function(v94)
    local v95 = v94._payload[l_Category_0.BuildSettings][l_BuildSettings_0.MaterialLUT];
    v94._materialMap = table.create(v94._sliceX);
    for v96 = 1, v94._sliceX do
        v94._materialMap[v96] = table.create(v94._sliceY);
        for v97 = 1, v94._sliceY do
            v94._materialMap[v96][v97] = table.create(v94._sliceZ, v95.fallbackMaterial);
        end;
    end;
    for v98 = 1, v94._sliceX do
        local v99 = v94._materialMap[v98];
        for v100 = 1, v94._sliceZ do
            local v101 = v94:getIndex(v98, v100);
            local v102 = math.max(1, v94._minNeighborHeight[v101] - 1);
            local v103 = math.min(math.ceil(v94._heightMap[v101]), v94._sliceY);
            local l_v95_SlopeIndex_0 = v95:GetSlopeIndex(v94._slopeMap[v101]);
            if not v94._fillBottomPositions or not v94._fillBottomPositions[v101] then
                for v105 = v102, v103 do
                    v99[v105][v100] = v95:GetValueByIndex(v105, v94._sliceY, l_v95_SlopeIndex_0);
                end;
            else
                for v106 = 1, v94._sliceY do
                    v99[v106][v100] = v95.fillMaterial;
                end;
            end;
        end;
    end;
end;
v11.fillInternalMaterial = function(v107)
    local v108 = v107._payload[l_Category_0.BuildSettings][l_BuildSettings_0.MaterialLUT];
    for v109 = 1, v107._sliceX do
        local v110 = v107._materialMap[v109];
        for v111 = 1, v107._sliceZ do
            local v112 = v107:getIndex(v109, v111);
            local v113 = v107._minNeighborHeight[v112] - 2;
            if v113 >= 1 then
                local l_v108_SlopeIndex_0 = v108:GetSlopeIndex(v107._slopeMap[v112]);
                if not (v107._fillBottomPositions and v107._fillBottomPositions[v112]) then
                    for v115 = 1, v113 do
                        v110[v115][v111] = v108:GetValueByIndex(v115, v107._sliceY, l_v108_SlopeIndex_0);
                    end;
                end;
            end;
        end;
    end;
    v107._services.Terrain:WriteVoxels(v107._region, l_VoxelResolution_0, v107._materialMap, v107._occupancyMap);
end;
v11.updateBlendingFactorMap = function(v116, v117)
    v116._blendingFactorMap = table.create(v116._sliceX * v116._sliceZ, 0);
    if v117 > 0 then
        v116._blendingFactorMap = v6(Vector2.new(v116._sliceX, v116._sliceZ), {
            CurveWidth = 1, 
            Distance = (1 - v117) * 0.9, 
            PreserveDistance = 0.7 - v117 / 5, 
            PreserveRatio = 0, 
            RoundCorner = 1
        });
    end;
end;
v11.blendHeightMap = function(v118)
    if v9() and #v118._heightmapCache ~= #v118._heightMap then
        warn("HeightMap has wrong size Can't blend height maps.");
    end;
    for v119 = 1, #v118._heightMap do
        local v120 = v118._heightMap[v119];
        local v121 = v118._heightmapCache[v119];
        if not (not v121 or not v120) and v120 < v121 then
            v120 = v121;
            v118._heightMap[v119] = v121;
            v118._blendingFactorMap[v119] = 1;
        elseif v118._addBlending then
            local v122 = v118._blendingFactorMap[v119];
            v118._heightMap[v119] = (1 - v122) * v120 + v122 * v121;
        end;
        v118._heightMap[v119] = math.clamp(v118._heightMap[v119], 0, v118._sliceY);
    end;
end;
v11.blendMaterialMap = function(v123)
    local v124 = {
        BlendingFactor = 0, 
        EdgePosition = 0.8, 
        Width = 0.2
    };
    for v125 = 1, v123._sliceX do
        for v126 = 1, v123._sliceZ do
            local v127 = v123:getIndex(v125, v126);
            local v128 = math.max(1, v123._minNeighborHeight[v127] - 1);
            local v129 = math.min(math.ceil(v123._heightMap[v127]), v123._sliceY);
            v124.BlendingFactor = v123._blendingFactorMap[v127];
            for v130 = v128, v129 do
                local v131 = v123._materialMap[v125][v130][v126];
                local v132 = v123._materialCache[v125][v130][v126];
                if v132 ~= Enum.Material.Air then
                    v123._materialMap[v125][v130][v126] = v7.Blend(v131, v132, v124);
                end;
            end;
        end;
    end;
end;
v11.postProcessing = function(_)
end;
v11.commit = function(v134)
    v134:fillInternalMaterial();
    v134:clearRegionCache();
end;
v11.destroy = function(v135)
    v135:revertRegion(v135._region);
    v135:clearRegionCache();
end;
v11.cacheRegion = function(v136, v137)
    local v138, v139 = v136._services.Terrain:ReadVoxels(v137, l_VoxelResolution_0);
    v136._materialCache = v138;
    v136._occupancyCache = v139;
    v136._heightmapCache = table.create(v136._sliceX * v136._sliceZ, 0);
    for v140 = 1, v136._sliceX do
        for v141 = 1, v136._sliceZ do
            local v142 = v136:getIndex(v140, v141);
            for v143 = v136._sliceY, 1, -1 do
                if v136._occupancyCache[v140][v143][v141] ~= 0 and v136._materialCache[v140][v143][v141] ~= Enum.Material.Air then
                    v136._heightmapCache[v142] = (v143 - 1) + v136._occupancyCache[v140][v143][v141];
                    break;
                end;
            end;
        end;
    end;
end;
v11.revertRegion = function(v144, v145)
    if not ((not v145 or not v144._materialCache) or not v144._occupancyCache) then
        v144._services.Terrain:WriteVoxels(v145, l_VoxelResolution_0, v144._materialCache, v144._occupancyCache);
    end;
end;
v11.clearRegionCache = function(v146)
    local v147 = nil;
    local v148 = nil;
    v146._materialCache = v147;
    v146._occupancyCache = v148;
    v146._heightmapCache = nil;
end;
v11.debugDrawArray = function(v149, v150, v151, v152)
    local l_TG_DEBUG_DRAW_UI_0 = l_StarterGui_0:FindFirstChild("TG_DEBUG_DRAW_UI");
    local l_l_TG_DEBUG_DRAW_UI_0_FirstChild_0 = l_TG_DEBUG_DRAW_UI_0:FindFirstChild(v150 .. "Frame");
    if not l_l_TG_DEBUG_DRAW_UI_0_FirstChild_0 then
        l_l_TG_DEBUG_DRAW_UI_0_FirstChild_0 = Instance.new("Frame");
        l_l_TG_DEBUG_DRAW_UI_0_FirstChild_0.Name = v150 .. "Frame";
        l_l_TG_DEBUG_DRAW_UI_0_FirstChild_0.Parent = l_TG_DEBUG_DRAW_UI_0;
        l_l_TG_DEBUG_DRAW_UI_0_FirstChild_0.AutomaticSize = Enum.AutomaticSize.XY;
        local l_UIListLayout_0 = Instance.new("UIListLayout");
        l_UIListLayout_0.Parent = l_l_TG_DEBUG_DRAW_UI_0_FirstChild_0;
        l_UIListLayout_0.FillDirection = Enum.FillDirection.Horizontal;
    end;
    if not l_l_TG_DEBUG_DRAW_UI_0_FirstChild_0:FindFirstChild(v150 .. "Text") then
        local l_TextLabel_0 = Instance.new("TextLabel");
        l_TextLabel_0.Name = v150 .. "Text";
        l_TextLabel_0.Parent = l_l_TG_DEBUG_DRAW_UI_0_FirstChild_0;
        l_TextLabel_0.Text = v150;
        l_TextLabel_0.Size = UDim2.new(0, 150, 0, 20);
    end;
    local v157 = v150 .. "Label";
    local l_l_l_TG_DEBUG_DRAW_UI_0_FirstChild_0_FirstChild_0 = l_l_TG_DEBUG_DRAW_UI_0_FirstChild_0:FindFirstChild(v157);
    if not l_l_l_TG_DEBUG_DRAW_UI_0_FirstChild_0_FirstChild_0 then
        l_l_l_TG_DEBUG_DRAW_UI_0_FirstChild_0_FirstChild_0 = Instance.new("ImageLabel");
        l_l_l_TG_DEBUG_DRAW_UI_0_FirstChild_0_FirstChild_0.Name = v157;
        l_l_l_TG_DEBUG_DRAW_UI_0_FirstChild_0_FirstChild_0.Position = UDim2.new(0, 0, 0, 0);
        l_l_l_TG_DEBUG_DRAW_UI_0_FirstChild_0_FirstChild_0.BackgroundTransparency = 1;
        l_l_l_TG_DEBUG_DRAW_UI_0_FirstChild_0_FirstChild_0.Parent = l_l_TG_DEBUG_DRAW_UI_0_FirstChild_0;
    end;
    local l_l_l_l_TG_DEBUG_DRAW_UI_0_FirstChild_0_FirstChild_0_FirstChild_0 = l_l_l_TG_DEBUG_DRAW_UI_0_FirstChild_0_FirstChild_0:FindFirstChild(v150);
    if not l_l_l_l_TG_DEBUG_DRAW_UI_0_FirstChild_0_FirstChild_0_FirstChild_0 then
        l_l_l_l_TG_DEBUG_DRAW_UI_0_FirstChild_0_FirstChild_0_FirstChild_0 = Instance.new("EditableImage");
        l_l_l_l_TG_DEBUG_DRAW_UI_0_FirstChild_0_FirstChild_0_FirstChild_0.Name = v150;
    end;
    l_l_l_l_TG_DEBUG_DRAW_UI_0_FirstChild_0_FirstChild_0_FirstChild_0:Resize(Vector2.new(v149._sliceX, v149._sliceZ));
    l_l_l_TG_DEBUG_DRAW_UI_0_FirstChild_0_FirstChild_0.Size = UDim2.new(0, v149._sliceX, 0, v149._sliceZ);
    local v160 = table.create((v149._sliceX * v149._sliceZ) * 4, 1);
    for v161 = 1, l_l_l_l_TG_DEBUG_DRAW_UI_0_FirstChild_0_FirstChild_0_FirstChild_0.Size.X do
        for v162 = 1, l_l_l_l_TG_DEBUG_DRAW_UI_0_FirstChild_0_FirstChild_0_FirstChild_0.Size.Y do
            local v163 = v149:getIndex(v161, v162);
            local v164 = 1 + (((v162 - 1) * l_l_l_l_TG_DEBUG_DRAW_UI_0_FirstChild_0_FirstChild_0_FirstChild_0.Size.X + v161) - 1) * 4;
            local v165 = v151[v163] / v152;
            v160[v164] = v165;
            v160[v164 + 1] = v165;
            v160[v164 + 2] = v165;
        end;
    end;
    l_l_l_l_TG_DEBUG_DRAW_UI_0_FirstChild_0_FirstChild_0_FirstChild_0:WritePixels(Vector2.zero, l_l_l_l_TG_DEBUG_DRAW_UI_0_FirstChild_0_FirstChild_0_FirstChild_0.Size, v160);
    l_l_l_l_TG_DEBUG_DRAW_UI_0_FirstChild_0_FirstChild_0_FirstChild_0.Parent = l_l_l_TG_DEBUG_DRAW_UI_0_FirstChild_0_FirstChild_0;
    l_l_l_TG_DEBUG_DRAW_UI_0_FirstChild_0_FirstChild_0.Size = UDim2.new(0, 200, 0, 200);
end;
v11.debugDraw = function(v166)
    if not l_StarterGui_0:FindFirstChild("TG_DEBUG_DRAW_UI") then
        local l_ScreenGui_0 = Instance.new("ScreenGui");
        l_ScreenGui_0.Name = "TG_DEBUG_DRAW_UI";
        l_ScreenGui_0.Parent = l_StarterGui_0;
        Instance.new("UIListLayout").Parent = l_ScreenGui_0;
    end;
    v166:debugDrawArray("Noisemap", v166._noiseMap, 1, 0);
    v166:debugDrawArray("Heightmap", v166._heightMap, v166._sliceY);
    v166:debugDrawArray("NeighborHeightMap", v166._minNeighborHeight, v166._sliceY);
    v166:debugDrawArray("SlopeMap", v166._slopeMap, 1.5707963267948966);
    v166:debugDrawArray("Blending", v166._blendingFactorMap, 1);
end;
return v11;
