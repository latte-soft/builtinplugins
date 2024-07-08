local l_script_FirstAncestor_0 = script:FindFirstAncestor("MaterialGenerator");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local l_createUnimplemented_0 = require(l_script_FirstAncestor_0.Packages.ReactUtils).createUnimplemented;
local _ = require(l_script_FirstAncestor_0.Src.Types);
return (v1.createContext({
    session = nil, 
    isGenerating = false, 
    lastGeneratedPromptText = "", 
    promptText = "", 
    setPromptText = l_createUnimplemented_0("setPromptText"), 
    errorMessage = nil, 
    popError = l_createUnimplemented_0("popError"), 
    generateMaterialVariants = l_createUnimplemented_0("generateMaterialVariants"), 
    uploadMaterialVariant = l_createUnimplemented_0("uploadMaterialVariant")
}));
