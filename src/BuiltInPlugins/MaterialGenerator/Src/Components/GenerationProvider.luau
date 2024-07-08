local l_HttpService_0 = game:GetService("HttpService");
local l_MaterialService_0 = game:GetService("MaterialService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("MaterialGenerator");
local v3 = require(l_script_FirstAncestor_0.Packages.Dash);
local v4 = require(l_script_FirstAncestor_0.Packages.Framework);
local v5 = require(l_script_FirstAncestor_0.Packages.MaterialFramework);
local v6 = require(l_script_FirstAncestor_0.Packages.Promise);
local v7 = require(l_script_FirstAncestor_0.Packages.React);
local v8 = require(l_script_FirstAncestor_0.Packages.ReactUtils);
local l_Localization_0 = v4.ContextServices.Localization;
local l_useStackState_0 = v8.useStackState;
local l_useToggleState_0 = v8.useToggleState;
local l_StudioServices_0 = v5.Context.StudioServices;
local v13 = require(l_script_FirstAncestor_0.Src.Enum.GenerationErrorType);
local v14 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagMaterialGeneratorNewServiceAsyncApi);
local l_Util_0 = l_script_FirstAncestor_0.Src.Util;
local v16 = require(l_Util_0.GeneratedMaterialsContext);
local v17 = require(l_Util_0.GenerationContext);
local v18 = require(l_Util_0.generateMaterialVariants);
local v19 = require(l_Util_0.getNewMaterialName);
local v20 = require(l_Util_0.getSampleCount);
local v21 = require(l_Util_0.parseGenerationError);
local v22 = require(l_Util_0.uploadMaterialVariant);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v24 = nil;
if not v14() then
    v24 = function()
        return l_HttpService_0:GenerateGUID(false);
    end;
end;
local _ = function()
    return v3.collectArray(l_MaterialService_0:GetDescendants(), function(_, v26)
        if not v26:IsA("MaterialVariant") then
            return nil;
        else
            return v26.Name;
        end;
    end);
end;
local function v31(v28, v29, v30)
    if v29 == v13.CustomMessage then
        return v30 or v28:getText("Errors", "UnknownGenerationError");
    elseif v29 == v13.NoSession then
        return v28:getText("Errors", "NoSession");
    elseif v29 == v13.ServerError500 then
        return v28:getText("Errors", "ServerError500");
    elseif v29 == v13.ServerError504 then
        return v28:getText("Errors", "ServerError504");
    elseif v29 == v13.TextFullyFiltered then
        return v28:getText("Errors", "TextFullyFiltered");
    elseif v29 == v13.NoSelectedMaterial then
        return v28:getText("Errors", "NoSelectedMaterial");
    elseif v29 == v13.FailedToGenerateMaps then
        return v28:getText("Errors", "FailedToGenerateMaps");
    elseif v29 == v13.TooManyRequests then
        return v28:getText("Errors", "TooManyRequests");
    elseif v29 == v13.AccountingFailedDecrement then
        return v28:getText("Errors", "AccountingFailedDecrement");
    elseif v29 == v13.FailedToSetImage then
        return v28:getText("Errors", "FailedToSetImage");
    elseif v29 == v13.Unknown then
        return v28:getText("Errors", "UnknownGenerationError");
    else
        error("Unknown errorType");
        return v28:getText("Errors", "UnknownGenerationError");
    end;
end;
local function v57(v32)
    local v33 = v7.useContext(v16);
    local l_addMaterials_0 = v33.addMaterials;
    local l_setMaterialStatus_0 = v33.setMaterialStatus;
    local v36 = l_useToggleState_0(false);
    local v37, v38 = v7.useState("");
    local v39, v40 = v7.useState("");
    local v41 = l_useStackState_0({});
    local v42 = l_Localization_0:use();
    local v43 = l_StudioServices_0.use():getService("MaterialGenerationService");
    local v44 = v7.useState(function()
        return v43:StartSession();
    end);
    return v7.createElement(v17.Provider, {
        value = {
            session = v44, 
            isGenerating = v36.enabled, 
            lastGeneratedPromptText = v37, 
            promptText = v39, 
            setPromptText = v40, 
            errorMessage = v41.getTop(), 
            popError = v41.pop, 
            generateMaterialVariants = v7.useCallback(function()
                assert(v44, "No active session");
                if v44 then
                    if not v36.enabled then
                        v38(v39);
                        v36.enable();
                        v18(v39, v44):andThen(function(v45)
                            local l_materialVariants_0 = v45.materialVariants;
                            if #l_materialVariants_0 > 0 then
                                local v49 = v3.collectArray(l_MaterialService_0:GetDescendants(), function(_, v48)
                                    if not v48:IsA("MaterialVariant") then
                                        return nil;
                                    else
                                        return v48.Name;
                                    end;
                                end);
                                for _, v51 in pairs(l_materialVariants_0) do
                                    local v52 = v19(v39, v49);
                                    v51.Name = v52;
                                    table.insert(v49, v52);
                                end;
                                l_addMaterials_0(l_materialVariants_0, v39, v45.filteredPromptText, v24());
                            end;
                        end):catch(function(v53)
                            v41.push((v31(v42, v53.errorType, v53.message)));
                        end):finally(function()
                            v36.disable();
                        end);
                        return ;
                    else
                        warn("Generation already in progress");
                        return ;
                    end;
                else
                    return ;
                end;
            end, {
                v36.enabled, 
                v39, 
                l_addMaterials_0, 
                v41, 
                v44
            }), 
            uploadMaterialVariant = v7.useCallback(function(v54)
                assert(v44, "No active session");
                if v44 then
                    l_setMaterialStatus_0(v54, "Uploading");
                    v22(v54, v44):andThen(function(v55)
                        v54.ColorMap = v55.colorMap;
                        v54.MetalnessMap = v55.metalnessMap;
                        v54.NormalMap = v55.normalMap;
                        v54.RoughnessMap = v55.roughnessMap;
                        l_setMaterialStatus_0(v54, "Uploaded");
                    end):catch(function(_)
                        l_setMaterialStatus_0(v54, "None");
                    end);
                    return ;
                else
                    return ;
                end;
            end, {
                l_setMaterialStatus_0, 
                v44
            })
        }
    }, v32.children);
end;
local function v83(v58)
    local v59 = v7.useContext(v16);
    local l_addMaterials_1 = v59.addMaterials;
    local l_setMaterialStatus_1 = v59.setMaterialStatus;
    local v62 = l_useToggleState_0(false);
    local v63, v64 = v7.useState("");
    local v65, v66 = v7.useState("");
    local v67 = l_useStackState_0({});
    local v68 = l_Localization_0:use();
    local v69 = l_StudioServices_0.use():getService("MaterialGenerationService");
    return v7.createElement(v17.Provider, {
        value = {
            isGenerating = v62.enabled, 
            lastGeneratedPromptText = v63, 
            promptText = v65, 
            setPromptText = v66, 
            errorMessage = v67.getTop(), 
            popError = v67.pop, 
            generateMaterialVariants = v7.useCallback(function()
                if not v62.enabled then
                    v64(v65);
                    v62.enable();
                    v6.try(function()
                        local v70 = v69:GenerateMaterialVariantsAsync(v65, (v20()));
                        if (not v70 or not v70.materialVariants) or #v70.materialVariants == 0 then
                            error("Returned no MaterialVariants");
                        end;
                        local l_materialVariants_1 = v70.materialVariants;
                        local v74 = v3.collectArray(l_MaterialService_0:GetDescendants(), function(_, v73)
                            if not v73:IsA("MaterialVariant") then
                                return nil;
                            else
                                return v73.Name;
                            end;
                        end);
                        for _, v76 in l_materialVariants_1, nil, nil do
                            local v77 = v19(v65, v74);
                            v76.Name = v77;
                            table.insert(v74, v77);
                        end;
                        l_addMaterials_1(l_materialVariants_1, v65, v70.filteredText, v70.generationId);
                    end):catch(function(v78)
                        local v79, v80 = v21(v78);
                        v67.push((v31(v68, v79, v80)));
                    end):finally(function()
                        v62.disable();
                    end);
                    return ;
                else
                    error("Generation already in progress");
                    return ;
                end;
            end, {
                v62.enabled, 
                v65, 
                l_addMaterials_1, 
                v67
            }), 
            uploadMaterialVariant = v7.useCallback(function(v81)
                l_setMaterialStatus_1(v81, "Uploading");
                v6.try(function()
                    v69:UploadMaterialVariantsAsync({
                        v81
                    });
                    l_setMaterialStatus_1(v81, "Uploaded");
                end):catch(function(v82)
                    l_setMaterialStatus_1(v81, "None");
                    v67.push((v31(v68, if not v82 then v13.Unknown else v13.CustomMessage, v82)));
                end);
            end, {
                l_setMaterialStatus_1
            })
        }
    }, v58.children);
end;
if not v14() then
    return v57;
else
    return v83;
end;
