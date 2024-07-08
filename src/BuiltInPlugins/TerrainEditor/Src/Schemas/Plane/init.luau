local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
return require(l_script_FirstAncestor_0.Packages.Dash).join(require(l_script_FirstAncestor_0.Packages.DraggerSchemaTemplate.DraggerSchema), {
    dispatchWorldClick = require(script.dispatchWorldClick), 
    getMouseTarget = require(script.getMouseTarget), 
    getNextSelectables = require(script.getNextSelectables), 
    Selection = require(script.Selection), 
    SelectionInfo = require(script.SelectionInfo), 
    TransformHandlesImplementation = require(script.TransformHandlesImplementation)
});
