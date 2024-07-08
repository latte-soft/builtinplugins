local v0 = {};
v0.__index = v0;
local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local v2 = require(l_script_FirstAncestor_0.Src.Types);
local v3 = require(l_script_FirstAncestor_0.Src.Resources.Constants);
local function v15(v4, v5, v6, v7, v8, v9, v10)
    local v11 = {};
    local v12 = #v5;
    local v13 = v4 + (v4 * v7) * (math.random() * 2 - 1);
    for v14 = 1, v12 do
        if v5[v14][v6][1] <= v13 and v13 <= v5[v14][v6][2] then
            table.insert(v11, v5[v14]);
        end;
    end;
    if not (#v11 == 0) or not v8 then
        return v11;
    elseif v13 < v9[v6][1] then
        return {
            v9
        };
    elseif v10[v6][2] < v13 then
        return {
            v10
        };
    else
        return nil;
    end;
end;
local function v18(v16, v17)
    return v16.priority < v17.priority;
end;
v0.new = function(v19)
    local v20 = v19.Unit == v2.MaterialUnit.Percentage;
    local l_MaterialList_0 = v19.MaterialList;
    local l_FillMaterial_0 = v19.FillMaterial;
    local l_FallbackMaterial_0 = v19.FallbackMaterial;
    local v24 = table.create(1050624, l_FallbackMaterial_0);
    local l_Min_0 = v19.Min;
    local l_Max_0 = v19.Max;
    local v27 = {};
    for _, v29 in ipairs(l_MaterialList_0) do
        local v30 = {};
        if not v20 then
            local v31 = false;
            if v29.MinHeight <= v29.MaxHeight then
                v31 = v29.MinHeight >= 0;
            end;
            assert(v31, "invalid minimum height input");
            v30.heightRange = {
                v29.MinHeight, 
                v29.MaxHeight
            };
            l_Min_0 = math.min(l_Min_0, v29.MinHeight);
            l_Max_0 = math.max(l_Max_0, v29.MaxHeight);
        else
            local v32 = false;
            if v29.MinHeight <= 1 then
                v32 = v29.MinHeight >= 0;
            end;
            assert(v32, "invalid minimum height input");
            v32 = false;
            if v29.MaxHeight <= 1 then
                v32 = v29.MaxHeight >= 0;
            end;
            assert(v32, "invalid maximum height input");
            v30.heightRange = {
                v29.MinHeight, 
                v29.MaxHeight
            };
        end;
        assert(v29.MinSlope <= v29.MaxSlope, "invalid slope input");
        local v33 = false;
        if v29.MinSlope <= 90 then
            v33 = v29.MinSlope >= 0;
        end;
        assert(v33, "invalid minimum slope input");
        v33 = false;
        if v29.MaxSlope <= 90 then
            v33 = v29.MaxSlope >= 0;
        end;
        assert(v33, "invalid maximum slope input");
        v30.slopeRange = {
            (v29.MinSlope / 180) * 3.141592653589793, 
            (v29.MaxSlope / 180) * 3.141592653589793
        };
        v30.value = v29.Material;
        v30.priority = v29.Priority;
        table.insert(v27, v30);
    end;
    table.sort(v27, v18);
    for v34 = 1, 1024 do
        local v35 = (v34 - 1) / 1023;
        local v36 = nil;
        v36 = if not v20 then v15(v35 * (l_Max_0 - l_Min_0) + l_Min_0, v27, "heightRange", 0, false) else v15(v35, v27, "heightRange", 0, false);
        for v37 = 1, 1024 do
            if not v36 or #v36 == 0 then
                v24[v34 * 1024 + v37] = l_FallbackMaterial_0;
            else
                local v38 = v15(((v37 - 1) / 1023) * 1.5707963267948966, v36, "slopeRange", 0, false);
                v24[v34 * 1024 + v37] = if not not v38 and #v38 > 0 then v38[1].value else l_FallbackMaterial_0;
            end;
        end;
    end;
    local v39 = setmetatable({}, v0);
    v39._lut = v24;
    v39._isPercentage = v20;
    v39._resolution = {
        1024, 
        1024
    };
    if not v39._isPercentage then
        v39.GetValue = v39._getValueStud;
    else
        v39.GetValue = v39._getValuePercentage;
    end;
    if not v39._isPercentage then
        v39.GetValueByIndex = v39._getValueStudSlopeIndex;
    else
        v39.GetValueByIndex = v39._getValuePercentageSlopeIndex;
    end;
    v39._maxHeight = l_Max_0;
    v39._minHeight = l_Min_0;
    v39._heightRange = l_Max_0 - l_Min_0;
    v39.fallbackMaterial = l_FallbackMaterial_0;
    v39.fillMaterial = l_FillMaterial_0;
    v39.GetSlopeIndex = v39._getSlopeIndex;
    return v39;
end;
v0._getSlopeIndex = function(_, v41)
    return (math.clamp(math.floor((v41 / 1.5707963267948966) * 1023 + 1), 1, 1024));
end;
v0._getValuePercentage = function(v42, v43, v44, v45)
    return v42._lut[math.clamp(math.floor((v43 / v44) * 1023 + 1), 0, 1025) * 1024 + math.clamp(math.floor((v45 / 1.5707963267948966) * 1023 + 1), 1, 1024)];
end;
v0._getValueStud = function(v46, v47, _, v49)
    return v46._lut[math.clamp(math.floor(((v47 * v3.VoxelResolution - v46._minHeight) / v46._heightRange) * 1023 + 1), 0, 1025) * 1024 + math.clamp(math.floor((v49 / 1.5707963267948966) * 1023 + 1), 1, 1024)];
end;
v0._getValuePercentageSlopeIndex = function(v50, v51, v52, v53)
    return v50._lut[math.clamp(math.floor((v51 / v52) * 1023 + 1), 0, 1025) * 1024 + v53];
end;
v0._getValueStudSlopeIndex = function(v54, v55, _, v57)
    return v54._lut[math.clamp(math.floor(((v55 * v3.VoxelResolution - v54._minHeight) / v54._heightRange) * 1023 + 1), 0, 1025) * 1024 + v57];
end;
return v0;
