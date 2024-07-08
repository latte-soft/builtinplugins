local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Dash);
local v2 = require(l_Parent_0.Packages.Rodux);
local _ = require(l_Parent_0.Src.Types);
local l_Actions_0 = l_Parent_0.Src.Actions;
local v5 = require(l_Actions_0.AddGeneratedMaterials);
local v6 = require(l_Actions_0.ClearSelectedMaterial);
local v7 = require(l_Actions_0.MarkAsSaved);
local v8 = require(l_Actions_0.RemoveAllMaterials);
local v9 = require(l_Actions_0.DEPRECATED_RemoveMaterial);
local v10 = require(l_Actions_0.SetBaseMaterial);
local v11 = require(l_Actions_0.SetMaterialGenerationSession);
local v12 = require(l_Actions_0.SetMaterials);
local v13 = require(l_Actions_0.SetSelectedMaterial);
local v14 = require(l_Actions_0.UpdateMaterialTextures);
local v15 = require(l_Actions_0.SetInitialImageId);
local v16 = require(l_Parent_0.Src.Flags.getFFlagMaterialGeneratorNewUI);
local _ = require(l_Parent_0.Src.Util.createGeneratedMaterial);
local l_append_0 = v1.append;
local l_collectArray_0 = v1.collectArray;
local l_join_0 = v1.join;
local _ = v1.map;
return (v2.createReducer({
    materials = {}, 
    initialImageId = nil, 
    selectedMaterial = nil, 
    session = nil
}, {
    [v5.name] = function(v22, v23)
        return l_join_0(v22, {
            materials = l_append_0({}, v23.materials, v22.materials)
        });
    end, 
    [v6.name] = not v16() and function(v24, _)
        return l_join_0(v24, {
            selectedMaterial = v1.None
        });
    end or nil, 
    [v15.name] = function(v26, v27)
        return l_join_0(v26, {
            initialImageId = v27.initialImageId or v1.None
        });
    end, 
    [v7.name] = not v16() and function(v28, v29)
        return l_join_0(v28, {
            materials = l_collectArray_0(v28.materials, function(_, v31)
                if v31.Id == v29.material.Id then
                    v31.IsTemporary = false;
                    if v31.MaterialVariant then
                        v31.MaterialVariant.Archivable = true;
                    end;
                end;
                return v31;
            end)
        });
    end or nil, 
    [v8.name] = function(v32, _)
        return l_join_0(v32, {
            materials = {}, 
            selectedMaterial = v1.None
        });
    end, 
    [v9.name] = not v16() and function(v34, v35)
        local v38 = l_collectArray_0(v34.materials, function(_, v37)
            if v37 == v35.material then
                return nil;
            else
                return v37;
            end;
        end);
        local v39 = nil;
        if v34.selectedMaterial == v35.material then
            v39 = v1.None;
        end;
        return l_join_0(v34, {
            materials = v38, 
            selectedMaterial = v39
        });
    end or nil, 
    [v10.name] = not v16() and function(v40, v41)
        return l_join_0(v40, {
            materials = l_collectArray_0(v40.materials, function(_, v43)
                if v43 == v40.selectedMaterial then
                    v43.BaseMaterial = v41.baseMaterial;
                    if v43.MaterialVariant then
                        v43.MaterialVariant.BaseMaterial = v41.baseMaterial;
                    end;
                end;
                return v43;
            end)
        });
    end or nil, 
    [v11.name] = function(v44, v45)
        return l_join_0(v44, {
            session = v45.session
        });
    end, 
    [v12.name] = if not v16() then nil else function(v46, v47)
        return l_join_0(v46, {
            materials = v47.materials
        });
    end, 
    [v13.name] = function(v48, v49)
        return l_join_0(v48, {
            selectedMaterial = v49.selectedMaterial or v1.None
        });
    end, 
    [v14.name] = not v16() and function(v50, v51)
        return l_join_0(v50, {
            materials = l_collectArray_0(v50.materials, function(_, v53)
                if v53 == v51.material then
                    v53.Textures = l_join_0(v53.Textures, v51.textures);
                    local l_Textures_0 = v53.Textures;
                    local l_MaterialVariant_0 = v53.MaterialVariant;
                    if l_Textures_0.ColorMap then
                        l_MaterialVariant_0.ColorMap = l_Textures_0.ColorMap;
                    end;
                    if l_Textures_0.MetalnessMap then
                        l_MaterialVariant_0.MetalnessMap = l_Textures_0.MetalnessMap;
                    end;
                    if l_Textures_0.NormalMap then
                        l_MaterialVariant_0.NormalMap = l_Textures_0.NormalMap;
                    end;
                    if l_Textures_0.RoughnessMap then
                        l_MaterialVariant_0.RoughnessMap = l_Textures_0.RoughnessMap;
                    end;
                end;
                return v53;
            end)
        });
    end or nil
}));
