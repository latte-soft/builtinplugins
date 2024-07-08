local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local v1 = require(l_script_FirstAncestor_0.Src.Util.ApplyById);
local v2 = require(l_script_FirstAncestor_0.Src.Types);
local l_Category_0 = v2.Category;
local l_SeaLevelSettings_0 = v2.SeaLevelSettings;
local l_Storage_0 = v2.Storage;
local v6 = require(l_script_FirstAncestor_0.Src.Resources.Constants);
local l_SeaLevelSettings_1 = l_Category_0.SeaLevelSettings;
local v8 = require(l_script_FirstAncestor_0.Src.Util.getWithinTerrainBounds);
local v9 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagTerrainEditorErrorHandling);
return {
    Storage = {
        [l_SeaLevelSettings_0.Evaporate] = l_Storage_0.LocalSession, 
        [l_SeaLevelSettings_0.Create] = l_Storage_0.LocalSession, 
        [l_SeaLevelSettings_0.Size] = l_Storage_0.LocalPersistent, 
        [l_SeaLevelSettings_0.SnapToVoxels] = l_Storage_0.LocalPersistent, 
        [l_SeaLevelSettings_0.Transform] = l_Storage_0.LocalPersistent
    }, 
    Generator = function(v10, v11, _, v13)
        local l_Localization_0 = v10.Localization;
        return v1(v10, {
            {
                Id = l_SeaLevelSettings_0.Size, 
                Schema = {
                    Type = "Vector", 
                    Components = {
                        "X", 
                        "Y", 
                        "Z"
                    }, 
                    GetValue = function(v15)
                        return (Vector3.new(v15[1], v15[2], v15[3]));
                    end, 
                    GetComponents = function(v16)
                        return {
                            v16.X, 
                            v16.Y, 
                            v16.Z
                        };
                    end
                }, 
                Validate = function(v17)
                    if not (v17.X >= 4 and v17.Y >= 4) or v17.Z < 4 then
                        return Enum.PropertyStatus.Error, l_Localization_0:getText("SelectionWarning", "Size");
                    elseif not (v6.MaxRegion >= v17.X and v6.MaxRegion >= v17.Y) or v6.MaxRegion < v17.Z then
                        return Enum.PropertyStatus.Error, l_Localization_0:getText("SelectionWarning", "SizeMax");
                    else
                        return Enum.PropertyStatus.Ok, "";
                    end;
                end, 
                Value = v11[l_SeaLevelSettings_0.Size]
            }, 
            {
                DataId = l_SeaLevelSettings_0.Transform, 
                Hidden = false, 
                Id = l_SeaLevelSettings_0.Position, 
                Schema = {
                    Type = "Vector", 
                    Components = {
                        "X", 
                        "Y", 
                        "Z"
                    }, 
                    GetValue = function(v18)
                        return v11[l_SeaLevelSettings_0.Transform].Rotation + Vector3.new(v18[1], v18[2], v18[3]);
                    end, 
                    GetComponents = function(v19)
                        local l_Position_0 = v19.Position;
                        return {
                            l_Position_0.X, 
                            l_Position_0.Y, 
                            l_Position_0.Z
                        };
                    end
                }, 
                Validate = if not v9() then nil else function(v21)
                    if v8(v21, v10.Tool:getPayload()[l_SeaLevelSettings_1][l_SeaLevelSettings_0.Size]) then
                        return Enum.PropertyStatus.Ok, "";
                    else
                        return Enum.PropertyStatus.Error, l_Localization_0:getText("SelectionWarning", "OutOfBounds");
                    end;
                end, 
                Value = v11[l_SeaLevelSettings_0.Transform]
            }, 
            {
                Id = l_SeaLevelSettings_0.SnapToVoxels, 
                Schema = {
                    Type = "Checkbox"
                }
            }, 
            {
                Id = l_SeaLevelSettings_0.Evaporate, 
                Layout = Enum.FillDirection.Vertical, 
                Schema = {
                    Label = l_Localization_0:getText(l_SeaLevelSettings_1, l_SeaLevelSettings_0.Evaporate), 
                    Type = "Button"
                }
            }, 
            {
                Id = l_SeaLevelSettings_0.Create, 
                Layout = Enum.FillDirection.Vertical, 
                Schema = {
                    Label = l_Localization_0:getText(l_SeaLevelSettings_1, l_SeaLevelSettings_0.Create), 
                    Type = "Button"
                }
            }
        }, {
            Category = l_SeaLevelSettings_1, 
            Data = v11, 
            Overrides = v13
        });
    end
};
