local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local _ = require(l_script_FirstAncestor_0.Src.Resources.AnalyticsHandlers);
local v2 = require(l_script_FirstAncestor_0.Src.Resources.Constants);
local v3 = require(l_script_FirstAncestor_0.Src.Types);
local l_BrushSettings_0 = v3.BrushSettings;
local l_Category_0 = v3.Category;
local l_FillMode_0 = v3.FillMode;
local l_MaterialMode_0 = v3.MaterialMode;
local l_MaterialSettings_0 = v3.MaterialSettings;
local l_SeaLevelSettings_0 = v3.SeaLevelSettings;
local l_SelectionSettings_0 = v3.SelectionSettings;
local l_Tool_0 = v3.Tool;
local l_TransformSettings_0 = v3.TransformSettings;
return {
    getBrushPayload = function(v13, v14, v15)
        return {
            averageTime = v14, 
            height = v13[l_Category_0.BrushSettings][l_BrushSettings_0.BrushSize].Height, 
            locked = not not v13[l_Category_0.BrushSettings][l_BrushSettings_0.BrushSize].Locked or false, 
            shape = v13[l_Category_0.BrushSettings][l_BrushSettings_0.BrushShape], 
            size = v13[l_Category_0.BrushSettings][l_BrushSettings_0.BrushSize].Size, 
            strength = v13[l_Category_0.BrushSettings][l_BrushSettings_0.Strength], 
            tool = v15
        };
    end, 
    getMaterialPayload = function(v16, v17)
        local v18 = v16[l_Category_0.MaterialSettings][l_MaterialSettings_0.AutoMaterial];
        local v19 = true;
        if v16[l_Category_0.MaterialSettings][l_MaterialSettings_0.FillMode] ~= l_FillMode_0.Replace then
            v19 = v16[l_Category_0.MaterialSettings][l_MaterialSettings_0.MaterialMode] == l_MaterialMode_0.Replace;
        end;
        local v20 = v16[l_Category_0.MaterialSettings][l_MaterialSettings_0.SourceMaterial];
        return {
            autoMaterial = v18, 
            replace = v19, 
            material = if v18 then nil else if not v19 then v20 else v16[l_Category_0.MaterialSettings][l_MaterialSettings_0.TargetMaterial], 
            secondaryMaterial = if v18 then nil else if not v19 then nil else v20, 
            tool = v17
        };
    end, 
    getRegionPayload = function(v21, v22, v23)
        local v24 = if v23 == l_Tool_0.SeaLevel then v21[l_Category_0.SeaLevelSettings][l_SeaLevelSettings_0.Size] else if v23 == l_Tool_0.Transform then v21[l_Category_0.TransformSettings][l_TransformSettings_0.Size] else v21[l_Category_0.SelectionSettings][l_SelectionSettings_0.Size];
        local v25 = if v23 == l_Tool_0.SeaLevel then v21[l_Category_0.SeaLevelSettings][l_SeaLevelSettings_0.Transform] else if v23 == l_Tool_0.Transform then v21[l_Category_0.TransformSettings][l_TransformSettings_0.Transform] else v21[l_Category_0.SelectionSettings][l_SelectionSettings_0.Transform];
        return {
            averageTime = v22, 
            position = v25.Position, 
            rotation = v25.Rotation, 
            size = v24, 
            tool = v23
        };
    end, 
    NormalizeBrushTimer = function(v26, v27, v28)
        local v29 = os.clock() - v26;
        local v30 = (v27 * v27) * v28;
        local v31 = (v29 * (v2.BrushNormalization ^ 3 / v30)) * 1000;
        if v30 < v2.BrushNormalizationMinVolume then
            return nil;
        elseif v2.SpikeThreshold < v31 then
            return v2.SpikeThreshold;
        else
            return v31;
        end;
    end, 
    NormalizeDepthFirstSearch = function(v32, v33)
        return ((os.clock() - v32) * (v2.BrushNormalization ^ 2 / v33)) * 1000;
    end, 
    NormalizeRegionTimer = function(v34, v35)
        local v36 = os.clock() - v34;
        local v37 = (v35.X * v35.Y) * v35.Z;
        local v38 = (v36 * (v2.RegionNormalization ^ 3 / v37)) * 1000;
        if v37 < v2.BrushNormalizationMinVolume then
            return nil;
        elseif v2.SpikeThreshold < v38 then
            return v2.SpikeThreshold;
        else
            return v38;
        end;
    end
};
