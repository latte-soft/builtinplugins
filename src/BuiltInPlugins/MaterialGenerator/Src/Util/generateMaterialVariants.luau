local l_script_FirstAncestor_0 = script:FindFirstAncestor("MaterialGenerator");
local v1 = require(l_script_FirstAncestor_0.Packages.Dash);
local v2 = require(l_script_FirstAncestor_0.Packages.Promise);
local l_Util_0 = l_script_FirstAncestor_0.Src.Util;
local v4 = require(l_Util_0.Constants);
local v5 = require(l_Util_0.parseGenerationError);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local function _(v7, v8)
    return v2.new(function(v9, v10)
        local v11 = nil;
        local v12 = nil;
        local l_status_0, l_result_0 = pcall(function()
            local v13, v14 = v8:GenerateImagesAsync(v7, {
                Samples = v4.GENERATION_SAMPLES
            });
            v11 = v13;
            v12 = v14;
        end);
        if not l_status_0 then
            local v17, v18 = v5(l_result_0);
            v10({
                errorType = v17, 
                message = v18
            });
        else
            v9({
                imageIds = v11, 
                filteredPromptText = v12
            });
        end;
    end);
end;
local function v29(v20, v21)
    return v2.new(function(v22, v23)
        task.spawn(function()
            local v24 = nil;
            local l_status_1, l_result_1 = pcall(function()
                v24 = v21:GenerateMaterialMapsAsync(v20);
            end);
            if not l_status_1 or not v24 then
                local v27, v28 = v5(l_result_1);
                v23({
                    errorType = v27, 
                    message = v28
                });
            else
                v22({
                    colorMap = v20, 
                    metalnessMap = v24.MetalnessMap, 
                    normalMap = v24.NormalMap, 
                    roughnessMap = v24.RoughnessMap
                });
            end;
        end);
    end);
end;
return function(v30, v31)
    local v32 = nil;
    return v2.new(function(v33, v34)
        local v35 = nil;
        local v36 = nil;
        local l_status_2, l_result_2 = pcall(function()
            local v37, v38 = v31:GenerateImagesAsync(v30, {
                Samples = v4.GENERATION_SAMPLES
            });
            v35 = v37;
            v36 = v38;
        end);
        if not l_status_2 then
            local v41, v42 = v5(l_result_2);
            v34({
                errorType = v41, 
                message = v42
            });
        else
            v33({
                imageIds = v35, 
                filteredPromptText = v36
            });
        end;
    end):andThen(function(v43)
        v32 = v43.filteredPromptText;
        return v2.all(v1.map(v43.imageIds, function(v44)
            return v29(v44, v31);
        end));
    end):andThen(function(v45)
        return v2.resolve({
            materialVariants = v1.map(v45, function(v46)
                local l_MaterialVariant_0 = Instance.new("MaterialVariant");
                l_MaterialVariant_0.Archivable = false;
                l_MaterialVariant_0.ColorMap = v46.colorMap;
                l_MaterialVariant_0.MetalnessMap = v46.metalnessMap;
                l_MaterialVariant_0.NormalMap = v46.normalMap;
                l_MaterialVariant_0.RoughnessMap = v46.roughnessMap;
                return l_MaterialVariant_0;
            end), 
            filteredPromptText = v32
        });
    end);
end;
