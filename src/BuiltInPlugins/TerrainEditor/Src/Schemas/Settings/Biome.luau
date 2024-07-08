local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local v1 = require(l_script_FirstAncestor_0.Src.Util.ApplyById);
local v2 = require(l_script_FirstAncestor_0.Src.Types);
local l_Category_0 = v2.Category;
local l_Biome_0 = v2.Biome;
local l_BiomeSettings_0 = v2.BiomeSettings;
local l_Storage_0 = v2.Storage;
local l_BiomeSettings_1 = l_Category_0.BiomeSettings;
local v8 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagTerrainEditorErrorHandling);
return {
    Storage = {
        [l_BiomeSettings_0.Biomes] = l_Storage_0.LocalPersistent, 
        [l_BiomeSettings_0.BiomeBlending] = l_Storage_0.LocalPersistent, 
        [l_BiomeSettings_0.BiomeSize] = l_Storage_0.LocalPersistent, 
        [l_BiomeSettings_0.Caves] = l_Storage_0.LocalPersistent, 
        [l_BiomeSettings_0.Seed] = l_Storage_0.LocalPersistent, 
        [l_BiomeSettings_0.Generate] = l_Storage_0.LocalPersistent
    }, 
    Generator = function(v9, v10, _, v12)
        local l_Localization_0 = v9.Localization;
        local v14 = {};
        for v15, _ in l_Biome_0, nil, nil do
            v14[v15] = l_Localization_0:getText("Biomes", v15);
        end;
        return v1(v9, {
            {
                Id = l_BiomeSettings_0.Biomes, 
                Schema = {
                    Items = l_Biome_0, 
                    Labels = v14, 
                    Type = "MultiSelection"
                }, 
                Validate = if not v8() then nil else function(v17)
                    local v18 = false;
                    for _, v20 in v17, nil, nil do
                        v18 = v18 or v20;
                    end;
                    if v18 then
                        return Enum.PropertyStatus.Ok, "";
                    else
                        return Enum.PropertyStatus.Error, l_Localization_0:getText("BiomeWarning", "NoBiomesSelected");
                    end;
                end
            }, 
            {
                Id = l_BiomeSettings_0.BiomeBlending, 
                Schema = {
                    Type = "Slider", 
                    Min = 0, 
                    Max = 1, 
                    ShowInput = true, 
                    SnapIncrement = 0.001
                }
            }, 
            {
                Id = l_BiomeSettings_0.Caves, 
                Schema = {
                    Type = "Checkbox"
                }
            }, 
            {
                Id = l_BiomeSettings_0.BiomeSize, 
                Schema = {
                    Type = "Number"
                }, 
                Validate = if not v8() then nil else function(v21)
                    if tonumber(v21) then
                        return Enum.PropertyStatus.Ok, "";
                    else
                        return Enum.PropertyStatus.Error, l_Localization_0:getText("NumberWarning", "InvalidNumber");
                    end;
                end
            }, 
            {
                Id = l_BiomeSettings_0.Seed, 
                Schema = {
                    Type = "Number"
                }, 
                Validate = if not v8() then nil else function(v22)
                    if tonumber(v22) then
                        return Enum.PropertyStatus.Ok, "";
                    else
                        return Enum.PropertyStatus.Error, l_Localization_0:getText("NumberWarning", "InvalidNumber");
                    end;
                end
            }, 
            {
                Id = l_BiomeSettings_0.Generate, 
                Layout = Enum.FillDirection.Vertical, 
                Schema = {
                    Label = l_Localization_0:getText(l_BiomeSettings_1, l_BiomeSettings_0.Generate), 
                    Type = "Button"
                }
            }
        }, {
            Category = l_BiomeSettings_1, 
            Data = v10, 
            Overrides = v12
        });
    end
};
