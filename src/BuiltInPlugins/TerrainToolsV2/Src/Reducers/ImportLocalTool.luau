local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Rodux);
local v2 = require(l_Parent_0.Packages.Cryo);
return (v1.createReducer({
    position = {
        X = 0, 
        Y = 0, 
        Z = 0
    }, 
    size = {
        X = 1024, 
        Y = 512, 
        Z = 1024
    }, 
    heightmap = {}, 
    colormap = {}, 
    colormapWarningId = nil, 
    defaultMaterial = Enum.Material.Asphalt, 
    materialMode = require(l_Parent_0.Src.Util.TerrainEnums).ImportMaterialMode.DefaultMaterial, 
    sizeChangedByUser = false
}, {
    ChangePosition = function(v3, v4)
        return v2.Dictionary.join(v3, {
            position = v4.position
        });
    end, 
    ChangeSize = function(v5, v6)
        return v2.Dictionary.join(v5, {
            size = v6.size
        });
    end, 
    SetImportMaterialMode = function(v7, v8)
        return v2.Dictionary.join(v7, {
            materialMode = v8.materialMode
        });
    end, 
    SelectHeightmap = function(v9, v10)
        return v2.Dictionary.join(v9, {
            heightmap = v10.heightmap or {}
        });
    end, 
    SelectColormap = function(v11, v12)
        return v2.Dictionary.join(v11, {
            colormap = v12.colormap or {}
        });
    end, 
    SetColormapWarningId = function(v13, v14)
        return v2.Dictionary.join(v13, {
            colormapWarningId = v14.colormapWarningId or v2.None
        });
    end, 
    SetDefaultMaterial = function(v15, v16)
        return v2.Dictionary.join(v15, {
            defaultMaterial = v16.defaultMaterial
        });
    end, 
    SetSizeChangedByUser = function(v17, v18)
        return v2.Dictionary.join(v17, {
            sizeChangedByUser = v18.sizeChangedByUser
        });
    end
}));
