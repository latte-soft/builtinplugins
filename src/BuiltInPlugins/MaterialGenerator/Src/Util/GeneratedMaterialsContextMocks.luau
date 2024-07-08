local l_script_FirstAncestor_0 = script:FindFirstAncestor("MaterialGenerator");
local v1 = require(l_script_FirstAncestor_0.Packages.Dash);
local v2 = require(l_script_FirstAncestor_0.Packages.React);
local v3 = require(l_script_FirstAncestor_0.Src.Util.GeneratedMaterialsContext);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v5 = {};
local function v18(v6)
    local v7, _ = v2.useState(v6.promptGroups);
    local v9, _ = v2.useState(v6.materialStates);
    local v11, v12 = v2.useState(nil);
    return v2.createElement(v3.Provider, {
        value = {
            promptGroups = v7, 
            materialStates = v9, 
            addMaterials = function()
            end, 
            removeMaterial = function()
            end, 
            removeAllMaterials = function()
            end, 
            hasBaseMaterial = function(_)
                return false;
            end, 
            markHasBaseMaterial = function(_)
            end, 
            getMaterialStatus = function(_)
                return "None";
            end, 
            setMaterialStatus = function(_, _)
            end, 
            previewMaterial = v11, 
            setPreviewMaterial = v12
        }
    }, v6.children);
end;
v5.BasicProvider = function(v19)
    return v2.createElement(v18, {
        promptGroups = v2.useMemo(function()
            return {
                {
                    materialVariants = v19.instances, 
                    promptText = "test prompt", 
                    filteredPromptText = "test prompt"
                }
            };
        end, {
            v19.instances
        }), 
        materialStates = v2.useMemo(function()
            return v1.collect(v19.instances, function(_, v21)
                return v21, {
                    generationId = "1", 
                    hasBaseMaterial = false; 
                    "None"
                };
            end);
        end, {
            v19.instances
        })
    }, v19.children);
end;
return v5;
