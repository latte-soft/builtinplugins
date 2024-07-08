local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Src.Util.Constants);
local l_BrushShape_0 = require(l_Parent_0.Src.Util.TerrainEnums).BrushShape;
local l_Air_0 = Enum.Material.Air;
local l_Water_0 = Enum.Material.Water;
local v5 = {
    xOffset = {
        1, 
        -1, 
        0, 
        0, 
        0, 
        0
    }, 
    yOffset = {
        0, 
        0, 
        1, 
        -1, 
        0, 
        0
    }, 
    zOffset = {
        0, 
        0, 
        0, 
        0, 
        1, 
        -1
    }, 
    one256th = 0.00390625, 
    one16th = 0.0625
};
local _ = require(l_Parent_0.Src.Flags.getFFlagTerrainEditorUseTerrainChannels)();
v5.clampDownToVoxel = function(v7)
    return math.floor(v7 / v1.VOXEL_RESOLUTION) * v1.VOXEL_RESOLUTION;
end;
v5.clampUpToVoxel = function(v8)
    return math.ceil(v8 / v1.VOXEL_RESOLUTION) * v1.VOXEL_RESOLUTION;
end;
v5.getDesiredOccupancy = function(v9, _, _, _, v13)
    local v14 = (v9.y - v13) / v1.VOXEL_RESOLUTION + 0.5;
    local v15 = math.floor(v14);
    return v15, v14 - v15;
end;
v5.getWaterHeightAndAirFillerMaterial = function(v16)
    local l_l_Air_0_0 = l_Air_0;
    local v18 = 0;
    for _, v20 in ipairs(v16) do
        for v21, v22 in ipairs(v20) do
            for _, v24 in ipairs(v22) do
                if v24 == l_Water_0 then
                    l_l_Air_0_0 = l_Water_0;
                    if v18 < v21 then
                        v18 = v21;
                    end;
                end;
            end;
        end;
    end;
    return v18, l_l_Air_0_0;
end;
v5.calculateBrushPowerForCell = function(v25, v26, v27, v28, v29, v30, v31)
    local v32 = 1;
    local v33 = 1;
    if v28 > 2 then
        if v29 == l_BrushShape_0.Sphere then
            local v34 = math.sqrt((v25 * v25 + v26 * v26) + v27 * v27);
            v33 = math.cos((math.min(1, v34 / v30) * 3.141592653589793) * 0.5);
            v32 = math.max(0, (math.min(1, (v30 - v34) / v1.VOXEL_RESOLUTION)));
        elseif v29 == l_BrushShape_0.Cylinder then
            local v35 = math.sqrt(v25 * v25 + v27 * v27);
            v33 = math.cos((math.min(1, v35 / v30) * 3.141592653589793) * 0.5);
            v32 = math.max(0, (math.min(1, (v30 - v35) / v1.VOXEL_RESOLUTION)));
        end;
    end;
    if v31 and v28 > 20 then
        v33 = v33 * ((v28 - 20) / 5);
    end;
    return v32, v33;
end;
v5.getMaterialForAutoMaterial = function(v36, v37, v38, v39, v40, v41, v42, v43, v44)
    local v45 = {};
    for v46 = -1, 1 do
        for v47 = -1, 1 do
            for v48 = -1, 1 do
                local v49 = v38 + v46;
                local v50 = v39 + v47;
                local v51 = v40 + v48;
                if ((((v49 > 0 and v49 <= v41) and v50 > 0) and v50 <= v42) and v51 > 0) and v51 <= v43 then
                    local v52 = v36[v49][v50][v51];
                    local v53 = v37[v49][v50][v51];
                    if v52 ~= l_Air_0 then
                        v45[v52] = (v45[v52] or 0) + 1;
                    elseif v52 == l_Air_0 and v53 > 0 then
                        v45[l_Water_0] = (v45[l_Water_0] or 0) + 1;
                    end;
                end;
            end;
        end;
    end;
    local l_l_Air_0_1 = l_Air_0;
    local v55 = 0;
    for v56, v57 in pairs(v45) do
        if v55 < v57 then
            v55 = v57;
            l_l_Air_0_1 = v56;
        end;
    end;
    if l_l_Air_0_1 == l_Air_0 then
        return v44, false;
    else
        return l_l_Air_0_1, true;
    end;
end;
v5.DEPRECATED_getMaterialForAutoMaterial = function(v58, v59, v60, v61, v62, v63, v64, v65)
    local v66 = {};
    for v67 = -1, 1 do
        for v68 = -1, 1 do
            for v69 = -1, 1 do
                local v70 = v59 + v67;
                local v71 = v60 + v68;
                local v72 = v61 + v69;
                if ((((v70 > 0 and v70 <= v62) and v71 > 0) and v71 <= v63) and v72 > 0) and v72 <= v64 then
                    local v73 = v58[v70][v71][v72];
                    if v73 ~= l_Air_0 then
                        v66[v73] = (v66[v73] or 0) + 1;
                    end;
                end;
            end;
        end;
    end;
    local l_v65_0 = v65;
    local v75 = 0;
    for v76, v77 in pairs(v66) do
        if v75 < v77 then
            v75 = v77;
            l_v65_0 = v76;
        end;
    end;
    if l_v65_0 ~= l_Air_0 then
        return l_v65_0;
    else
        return v65;
    end;
end;
return v5;
