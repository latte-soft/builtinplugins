local l_script_FirstAncestor_0 = script:FindFirstAncestor("MaterialGenerator");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local l_createUnimplemented_0 = require(l_script_FirstAncestor_0.Packages.ReactUtils).createUnimplemented;
local _ = require(l_script_FirstAncestor_0.Src.Types);
return (v1.createContext({
    promptGroups = {}, 
    materialStates = {}, 
    addMaterials = l_createUnimplemented_0("addMaterials"), 
    removeMaterial = l_createUnimplemented_0("removeMaterial"), 
    removeAllMaterials = l_createUnimplemented_0("removeAllMaterials"), 
    hasBaseMaterial = l_createUnimplemented_0("hasBaseMaterial"), 
    markHasBaseMaterial = l_createUnimplemented_0("markHasBaseMaterial"), 
    getMaterialStatus = l_createUnimplemented_0("getMaterialStatus"), 
    setMaterialStatus = l_createUnimplemented_0("setMaterialStatus")
}));
