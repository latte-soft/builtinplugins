local l_Parent_0 = script.Parent.Parent.Parent;
local l_Actions_0 = l_Parent_0.Src.Actions;
local v2 = require(l_Actions_0.ClearSelectedMaterial);
local v3 = require(l_Actions_0.DoneGeneratingImages);
local v4 = require(l_Actions_0.MergeFilteredTextPrompt);
local v5 = require(l_Actions_0.SetGeneratingImages);
local v6 = require(l_Actions_0.SetGenerationError);
local v7 = require(l_Actions_0.SetMaterialGenerationSession);
local _ = require(l_Actions_0.SetSelectedMaterial);
local v9 = require(l_Parent_0.Src.Thunks.CreateGeneratedMaterials);
local v10 = require(l_Parent_0.Src.Enum.GenerationErrorType);
local v11 = require(l_Parent_0.Src.Util.DebugFlags);
local v12 = require(l_Parent_0.Src.Util.parseGenerationError);
local v13 = require(l_Parent_0.Src.Flags.getFFlagMaterialGeneratorNewUI);
local v14 = require(l_Parent_0.Src.Flags.getFFlagMaterialGeneratorSupportVariations2);
local l_MaterialGeneratorErrorAnalytics_0 = game:GetFastFlag("MaterialGeneratorErrorAnalytics");
local _ = require(l_Parent_0.Src.Types);
return function(v17, v18, v19)
    return function(v20)
        local v21 = v20:getState();
        local v22 = v17:getService("MaterialGenerationService");
        local l_session_0 = v21.MaterialsReducer.session;
        if not l_session_0 then
            l_session_0 = v22:StartSession();
            if not l_session_0 then
                v20:dispatch(v6(v10.NoSession));
                return ;
            else
                v20:dispatch(v7(l_session_0));
            end;
        end;
        local l_textPrompt_0 = v21.AppStateReducer.textPrompt;
        if not l_textPrompt_0 or l_textPrompt_0 == "" then
            return ;
        else
            local v25 = nil;
            if v14() then
                v25 = v21.MaterialsReducer.initialImageId;
            end;
            local v26 = {
                InitialImage = v25, 
                Samples = 4
            };
            if not v13() then
                v20:dispatch(v2());
            end;
            v20:dispatch(v5(v26.Samples));
            v20:dispatch(v6(v10.None, nil));
            task.spawn(function()
                local v27 = nil;
                local v28 = nil;
                local v29 = nil;
                if not l_MaterialGeneratorErrorAnalytics_0 then
                    local l_status_0, l_result_0 = pcall(function()
                        local v30, v31, v32 = l_session_0:GenerateImagesAsync(l_textPrompt_0, v26);
                        v27 = v30;
                        v28 = v31;
                        v29 = v32;
                    end);
                    v20:dispatch(v3());
                    if not l_status_0 then
                        if type(l_result_0) == "string" then
                            if not string.find(l_result_0, "got network error status: 429") then
                                if not string.find(l_result_0, "got network error status: 500") then
                                    if not string.find(l_result_0, "got network error status: 504") then
                                        if not string.find(l_result_0, "TextFullyFiltered") then
                                            if not string.find(l_result_0, "AccountingFailed") or not string.find(l_result_0, "Decrementing account failed") then
                                                v20:dispatch(v6(v10.CustomMessage, l_result_0));
                                            else
                                                v20:dispatch(v6(v10.AccountingFailedDecrement, nil));
                                            end;
                                        else
                                            v20:dispatch(v4(l_textPrompt_0, string.gsub(l_textPrompt_0, "[^ \n]", "#")));
                                            v20:dispatch(v6(v10.TextFullyFiltered, nil));
                                        end;
                                    else
                                        v20:dispatch(v6(v10.ServerError504, nil));
                                    end;
                                else
                                    v20:dispatch(v6(v10.ServerError500, nil));
                                end;
                            else
                                v20:dispatch(v6(v10.TooManyRequests, nil));
                            end;
                        else
                            v20:dispatch(v6(v10.Unknown, nil));
                        end;
                        return ;
                    end;
                else
                    local v35 = nil;
                    local v36 = nil;
                    if not v11.ForceGenerationError() then
                        local l_status_1, l_result_1 = pcall(function()
                            local v37, v38, v39 = l_session_0:GenerateImagesAsync(l_textPrompt_0, v26);
                            v27 = v37;
                            v28 = v38;
                            v29 = v39;
                        end);
                        v35 = l_status_1;
                        v36 = l_result_1;
                    else
                        v35 = false;
                        v36 = nil;
                    end;
                    v20:dispatch(v3());
                    if not v35 then
                        local v42, v43 = v12(v36);
                        if v42 == v10.TextFullyFiltered then
                            v20:dispatch(v4(l_textPrompt_0, string.gsub(l_textPrompt_0, "[^ \n]", "#")));
                        end;
                        v20:dispatch(v6(v42, v43));
                        if v18 then
                            v18:report("generateMaterialsError", l_textPrompt_0, v25, v42, v43);
                        end;
                        return ;
                    end;
                end;
                local l_l_textPrompt_0_0 = l_textPrompt_0;
                if type(v28) == "string" and #v28 > 0 then
                    l_l_textPrompt_0_0 = v28;
                    v20:dispatch(v4(l_textPrompt_0, v28));
                end;
                local v45 = v17:getService("HttpService"):GenerateGUID(false);
                v20:dispatch(v9(l_l_textPrompt_0_0, v27, v45, v17));
                if v18 then
                    if not l_MaterialGeneratorErrorAnalytics_0 then
                        v18:report("generateButtonClicked", v45, #v27, l_textPrompt_0, v28);
                    else
                        v18:report("generateMaterials", v45, v19, #v27, l_textPrompt_0, v28);
                    end;
                end;
            end);
            return ;
        end;
    end;
end;
