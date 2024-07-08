local l_script_FirstAncestor_0 = script:FindFirstAncestor("DynamicHeadExportTool");
return require(l_script_FirstAncestor_0.Packages.Rodux).combineReducers({
    PluginReducer = require(l_script_FirstAncestor_0.Src.Reducers.PluginReducer)
});
