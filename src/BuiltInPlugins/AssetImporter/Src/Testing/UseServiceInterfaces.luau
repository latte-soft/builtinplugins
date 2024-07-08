local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetImporter");
local v1 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAssetImportUseServiceInterfaces2);
local v2 = require(l_script_FirstAncestor_0.Src.Utility.DebugFlags);
local v3 = v2.RunningUnderCLI() or v2.RunTests();
return function()
    return v1() or v3;
end;
