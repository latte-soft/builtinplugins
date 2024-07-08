local l_Parent_0 = script.Parent.Parent.Parent;
local _ = require(l_Parent_0.Src.Types);
local v2 = require(l_Parent_0.Packages.Dash);
local _ = require(l_Parent_0.Packages.Promise);
local l_Actions_0 = l_Parent_0.Src.Actions;
local v5 = require(l_Actions_0.AddGeneratedMaterials);
local v6 = require(l_Actions_0.SetGenerationError);
local v7 = require(l_Actions_0.UpdateMaterialTextures);
local v8 = require(l_Parent_0.Src.Flags.getFFlagMaterialGeneratorNewUI);
local v9 = require(l_Parent_0.Src.Thunks.UpdateMaterial);
local l_Util_0 = l_Parent_0.Src.Util;
local v11 = require(l_Util_0.createGeneratedMaterial);
local v12 = require(l_Util_0.generateMaterialMaps);
local l_collectArray_0 = v2.collectArray;
local l_joinDeep_0 = v2.joinDeep;
local l_map_0 = v2.map;
return function(v16, v17, v18, v19)
    return function(v20)
        local v23 = l_collectArray_0(v19:getServiceInstance("MaterialService"):GetDescendants(), function(_, v22)
            if not v22:IsA("MaterialVariant") then
                return nil;
            else
                return v22.Name;
            end;
        end);
        local v26 = l_map_0(v17, function(v24)
            local v25 = v11(v16, v24, v23);
            v25.GenerationId = v18;
            table.insert(v23, v25.Name);
            return v25;
        end);
        v20:dispatch(v5(v26));
        local l_session_0 = v20:getState().MaterialsReducer.session;
        for _, v29 in v26, nil, nil do
            v12(l_session_0, v29):andThen(function(v30)
                if not v8() then
                    v20:dispatch(v7(v29, v30));
                    return ;
                else
                    v20:dispatch(v9((l_joinDeep_0(v29, {
                        Textures = v30
                    }))));
                    return ;
                end;
            end, function(v31)
                v20:dispatch(v6(v31.ErrorType, v31.ErrorMessage));
            end);
        end;
    end;
end;
