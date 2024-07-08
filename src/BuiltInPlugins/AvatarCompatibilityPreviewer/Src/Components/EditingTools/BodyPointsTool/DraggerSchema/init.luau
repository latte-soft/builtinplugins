local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
return require(l_script_FirstAncestor_0.Packages.Dash).join(require(l_script_FirstAncestor_0.Packages.DraggerSchemaTemplate.DraggerSchema), {
    dispatchWorldClick = require(script.dispatchWorldClick), 
    getMouseTarget = require(script.getMouseTarget), 
    FreeformDragger = require(script.FreeformDragger), 
    SelectionInfo = require(script.SelectionInfo)
});
