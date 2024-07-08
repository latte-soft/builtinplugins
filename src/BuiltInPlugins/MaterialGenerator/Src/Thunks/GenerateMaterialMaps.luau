local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Dash);
local _ = require(l_Parent_0.Src.Types);
local l_Actions_0 = l_Parent_0.Src.Actions;
local v4 = require(l_Actions_0.SetGenerationError);
local v5 = require(l_Actions_0.UpdateMaterialTextures);
local v6 = require(l_Parent_0.Src.Enum.GenerationErrorType);
local v7 = require(l_Parent_0.Src.Flags.getFFlagMaterialGeneratorNewUI);
local v8 = require(l_Parent_0.Src.Thunks.UpdateMaterial);
local l_joinDeep_0 = v1.joinDeep;
local function _(v10)
    local l_Textures_0 = v10.Textures;
    local v12 = false;
    if l_Textures_0.MetalnessMap ~= nil then
        v12 = false;
        if l_Textures_0.NormalMap ~= nil then
            v12 = l_Textures_0.RoughnessMap ~= nil;
        end;
    end;
    return v12;
end;
return function()
    return function(v14)
        local v15 = v14:getState();
        local l_selectedMaterial_0 = v15.MaterialsReducer.selectedMaterial;
        if l_selectedMaterial_0 then
            if v7() then
                local l_Textures_1 = l_selectedMaterial_0.Textures;
                local v18 = false;
                if l_Textures_1.MetalnessMap ~= nil then
                    v18 = false;
                    if l_Textures_1.NormalMap ~= nil then
                        v18 = l_Textures_1.RoughnessMap ~= nil;
                    end;
                end;
                if v18 then
                    return ;
                end;
            end;
            local l_session_0 = v15.MaterialsReducer.session;
            if l_session_0 then
                task.spawn(function()
                    local v20 = nil;
                    local l_status_0, l_result_0 = pcall(function()
                        v20 = l_session_0:GenerateMaterialMapsAsync(l_selectedMaterial_0.Id);
                    end);
                    if v14:getState().MaterialsReducer.selectedMaterial ~= l_selectedMaterial_0 then
                        return ;
                    elseif l_status_0 then
                        if v20 then
                            local v23 = {
                                ColorMap = v20.ColorMap, 
                                MetalnessMap = v20.MetalnessMap, 
                                NormalMap = v20.NormalMap, 
                                RoughnessMap = v20.RoughnessMap
                            };
                            if not v7() then
                                v14:dispatch(v5(l_selectedMaterial_0, v23));
                            else
                                v14:dispatch(v8((l_joinDeep_0(l_selectedMaterial_0, {
                                    Textures = v23
                                }))));
                            end;
                            return ;
                        else
                            v14:dispatch(v4(v6.FailedToGenerate, nil));
                            return ;
                        end;
                    else
                        if not l_result_0 then
                            v14:dispatch(v4(v6.Unknown, nil));
                        else
                            v14:dispatch(v4(v6.CustomMessage, l_result_0));
                        end;
                        return ;
                    end;
                end);
                return ;
            else
                v14:dispatch(v4(v6.NoSession, nil));
                return ;
            end;
        else
            v14:dispatch(v4(v6.NoSelectedMaterial, nil));
            return ;
        end;
    end;
end;
