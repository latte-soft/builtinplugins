local l_HttpService_0 = game:GetService("HttpService");
local l_Parent_0 = script.Parent.Parent.Parent;
local v2 = require(l_Parent_0.Src.Util.DebugFlags);
local l_MaterialGeneratorErrorAnalytics_0 = game:GetFastFlag("MaterialGeneratorErrorAnalytics");
local v4 = require(l_Parent_0.Src.Enum.GenerationErrorType);
local _ = require(l_Parent_0.Src.Types);
local l_join_0 = require(l_Parent_0.Packages.Dash).join;
return function(v7)
    local function v11(v8, v9)
        local v10 = l_join_0({
            studioSid = v7:GetSessionId(), 
            clientId = v7:GetClientId(), 
            placeId = game.PlaceId
        }, v9 or {});
        if v2.LogAnalytics() then
            print(("%s SendEvent eventName=%s args=%s"):format("MaterialGenerator", v8, l_HttpService_0:JSONEncode(v10)));
        end;
        v7:SendEventDeferred("studio", "MaterialGenerator", v8, v10);
    end;
    return {
        generateButtonClicked = function(_, v13, v14, v15, v16)
            v11("GenerateButtonClicked", {
                generationId = v13, 
                samples = v14, 
                textPrompt = v15, 
                filteredTextPrompt = v16
            });
        end, 
        generateMaterials = function(_, v18, v19, v20, v21, v22)
            if l_MaterialGeneratorErrorAnalytics_0 then
                v11("GenerateMaterials", {
                    generationId = v18, 
                    inputType = v19, 
                    samples = v20, 
                    promptText = v21, 
                    filteredPromptText = v22
                });
                return ;
            else
                return ;
            end;
        end, 
        generateMaterialsError = function(_, v24, v25, v26, v27)
            if l_MaterialGeneratorErrorAnalytics_0 then
                assert(v4.isEnumValue(v26), "Expected errorType to be a GenerationErrorType");
                local _ = nil;
                v11("GenerateMaterialsError", {
                    promptText = v24, 
                    initialImageId = v25, 
                    errorMessage = if not not v27 and v27 ~= "" then ("%*: '%*'"):format(v26, v27) else tostring(v26)
                });
                return ;
            else
                return ;
            end;
        end, 
        saveButtonClicked = function(_, v30, v31)
            local v32 = nil;
            if v30.BaseMaterial then
                v32 = v30.BaseMaterial.Name;
            end;
            local v33 = nil;
            if v30.MaterialPattern then
                v33 = v30.MaterialPattern.Name;
            end;
            v11(not l_MaterialGeneratorErrorAnalytics_0 and "SaveButtonClicked" or "SaveGeneratedMaterial", {
                colorMap = v30.ColorMap, 
                metalnessMap = v30.MetalnessMap, 
                normalMap = v30.NormalMap, 
                roughnessMap = v30.RoughnessMap, 
                name = v30.Name, 
                baseMaterial = v32, 
                materialPattern = v33, 
                studsPerTile = v30.StudsPerTile, 
                generationId = v31
            });
        end
    };
end;
