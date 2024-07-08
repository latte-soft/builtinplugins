local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Dash);
local _ = require(l_Parent_0.Src.Types);
local l_Actions_0 = l_Parent_0.Src.Actions;
local v4 = require(l_Actions_0.MarkAsSaved);
local v5 = require(l_Actions_0.SetIsSavingMaterial);
local v6 = require(l_Parent_0.Src.Flags.getFFlagMaterialGeneratorNewUI);
local v7 = require(l_Parent_0.Src.Thunks.UpdateMaterial);
local v8 = require(l_Parent_0.Src.Util.createMaterialVariant);
local l_join_0 = v1.join;
return function(v10, v11)
    return function(v12)
        if v10.IsTemporary then
            local l_session_0 = v12:getState().MaterialsReducer.session;
            local l_Id_0 = v10.Id;
            v12:dispatch(v5(true));
            task.spawn(function()
                local v15 = l_session_0:UploadMaterialAsync(l_Id_0);
                local l_MaterialVariant_0 = v10.MaterialVariant;
                if not l_MaterialVariant_0 then
                    v10.MaterialVariant = v8(v10);
                else
                    l_MaterialVariant_0.ColorMap = v15.ColorMap;
                    if v15.NormalMap then
                        l_MaterialVariant_0.NormalMap = v15.NormalMap;
                    end;
                    if v15.MetalnessMap then
                        l_MaterialVariant_0.MetalnessMap = v15.MetalnessMap;
                    end;
                    if v15.RoughnessMap then
                        l_MaterialVariant_0.RoughnessMap = v15.RoughnessMap;
                    end;
                end;
                if not v6() then
                    v12:dispatch(v4(v10));
                else
                    v12:dispatch(v7(l_join_0(v10, {
                        IsTemporary = false
                    })));
                end;
                v12:dispatch(v5(false));
                v11:report("saveButtonClicked", v10.MaterialVariant, v10.GenerationId);
            end);
            return ;
        else
            return ;
        end;
    end;
end;
