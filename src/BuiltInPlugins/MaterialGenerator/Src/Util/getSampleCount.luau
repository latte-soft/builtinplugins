local l_script_FirstAncestor_0 = script:FindFirstAncestor("MaterialGenerator");
local v1 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local v2 = require(l_script_FirstAncestor_0.Src.Flags.getFIntMaterialGeneratorSampleCount);
return function()
    local v3 = v2();
    if v3 > 0 then
        return v3;
    else
        return v1.GENERATION_SAMPLES;
    end;
end;
