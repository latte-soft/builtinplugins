local l_script_FirstAncestor_0 = script:FindFirstAncestor("MaterialGenerator");
local v1 = require(l_script_FirstAncestor_0.Packages.Promise);
local v2 = require(l_script_FirstAncestor_0.Src.Enum.GenerationErrorType);
local _ = require(l_script_FirstAncestor_0.Src.Types);
return function(v4, v5)
    return v1.new(function(v6, v7)
        local v8 = nil;
        local l_status_0, l_result_0 = pcall(function()
            v8 = v5:UploadMaterialAsync(v4.ColorMap);
        end);
        if not l_status_0 or not v8 then
            v7({
                errorType = if not l_result_0 then v2.Unknown else v2.CustomMessage, 
                message = l_result_0
            });
            return ;
        else
            v6({
                colorMap = v8.ColorMap, 
                metalnessMap = v8.MetalnessMap, 
                normalMap = v8.NormalMap, 
                roughnessMap = v8.RoughnessMap
            });
            return ;
        end;
    end);
end;
