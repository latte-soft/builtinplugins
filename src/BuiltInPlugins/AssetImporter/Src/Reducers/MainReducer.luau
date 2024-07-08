local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetImporter");
local v1 = require(l_script_FirstAncestor_0.Packages.Rodux);
local l_Reducers_0 = l_script_FirstAncestor_0.Src.Reducers;
return (v1.combineReducers({
    Preview = require(l_Reducers_0.Preview), 
    Dialogs = require(l_Reducers_0.Dialogs), 
    Sessions = if not require(l_script_FirstAncestor_0.Src.Flags.getFFlagAssetImportEnableMultipleFiles)() then nil else require(l_Reducers_0.Sessions)
}));
