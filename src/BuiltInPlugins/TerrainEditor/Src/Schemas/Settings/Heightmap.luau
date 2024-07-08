local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local v1 = require(l_script_FirstAncestor_0.Src.Types);
local v2 = require(l_script_FirstAncestor_0.Src.Util.ApplyById);
local l_Category_0 = v1.Category;
local l_HeightmapSettings_0 = v1.HeightmapSettings;
local l_ImageType_0 = v1.ImageType;
local l_Storage_0 = v1.Storage;
local v7 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagTerrainEditorHeightmapFixes);
local l_HeightmapSettings_1 = l_Category_0.HeightmapSettings;
return {
    Storage = {
        [l_HeightmapSettings_0.Colormap] = l_Storage_0.LocalSession, 
        [l_HeightmapSettings_0.Heightmap] = l_Storage_0.LocalSession, 
        [l_HeightmapSettings_0.Import] = l_Storage_0.LocalSession, 
        [l_HeightmapSettings_0.DefaultMaterial] = l_Storage_0.LocalPersistent
    }, 
    Generator = function(v9, v10, _, v12)
        local l_Localization_0 = v9.Localization;
        return v2(v9, {
            {
                Id = l_HeightmapSettings_0.Heightmap, 
                Schema = {
                    ImageType = if not v7() then nil else l_ImageType_0.Heightmap, 
                    Type = "Image"
                }, 
                Validate = function(v14)
                    if v14.Error ~= "" then
                        return Enum.PropertyStatus.Error, l_Localization_0:getText("ImportWarning", "FailedImport", {
                            Error = v14.Error
                        });
                    else
                        if v14.Image then
                            if not v14.Image.ChannelInfo.DiscardedChannels then
                                if v14.Image.Preview.Error then
                                    return Enum.PropertyStatus.Warning, l_Localization_0:getText("ImportWarning", "FailedPreview", {
                                        Error = v14.Image.Preview.Error
                                    });
                                end;
                            else
                                return Enum.PropertyStatus.Warning, l_Localization_0:getText("ImportWarning", "DiscardedChannels");
                            end;
                        end;
                        return Enum.PropertyStatus.Ok, "";
                    end;
                end
            }, 
            {
                Id = l_HeightmapSettings_0.Colormap, 
                Schema = {
                    ImageType = if not v7() then nil else l_ImageType_0.Colormap, 
                    Type = "Image"
                }, 
                Validate = function(v15)
                    if v15.Error ~= "" then
                        return Enum.PropertyStatus.Error, l_Localization_0:getText("ImportWarning", "FailedImport", {
                            Error = v15.Error
                        });
                    elseif not v15.Image or not v15.Image.Preview.Error then
                        return Enum.PropertyStatus.Ok, "";
                    else
                        return Enum.PropertyStatus.Warning, l_Localization_0:getText("ImportWarning", "FailedPreview", {
                            Error = v15.Image.Preview.Error
                        });
                    end;
                end
            }, 
            {
                Id = l_HeightmapSettings_0.DefaultMaterial, 
                Layout = Enum.FillDirection.Vertical, 
                Schema = {
                    AllowAir = false, 
                    Type = "Material"
                }
            }, 
            {
                Disabled = not v10[l_HeightmapSettings_0.Heightmap] or not v10[l_HeightmapSettings_0.Heightmap].Image, 
                Id = l_HeightmapSettings_0.Import, 
                Layout = Enum.FillDirection.Vertical, 
                Schema = {
                    Label = l_Localization_0:getText(l_HeightmapSettings_1, l_HeightmapSettings_0.Import), 
                    Type = "Button"
                }
            }
        }, {
            Category = l_HeightmapSettings_1, 
            Data = v10, 
            Overrides = v12
        });
    end
};
