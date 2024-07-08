local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local v1 = require(l_script_FirstAncestor_0.Src.Util.ApplyById);
local v2 = require(l_script_FirstAncestor_0.Src.Types);
local l_Category_0 = v2.Category;
local l_BuildSettings_0 = v2.BuildSettings;
local _ = v2.EnumType;
local l_Storage_0 = v2.Storage;
local l_TerrainType_0 = v2.TerrainType;
local v8 = require(l_script_FirstAncestor_0.Src.Resources.Constants);
local _ = require(l_script_FirstAncestor_0.Src.Util.getItems);
local l_BuildSettings_1 = l_Category_0.BuildSettings;
local v11 = {
    Storage = {
        [l_BuildSettings_0.AdvancedNoise] = l_Storage_0.LocalPersistent, 
        [l_BuildSettings_0.NoiseStrength] = l_Storage_0.LocalPersistent, 
        [l_BuildSettings_0.BankSize] = l_Storage_0.LocalPersistent, 
        [l_BuildSettings_0.BlendingEdge] = l_Storage_0.LocalPersistent, 
        [l_BuildSettings_0.CliffSlope] = l_Storage_0.LocalPersistent, 
        [l_BuildSettings_0.Confirm] = l_Storage_0.LocalSession, 
        [l_BuildSettings_0.CraterDepth] = l_Storage_0.LocalPersistent, 
        [l_BuildSettings_0.CraterRadius] = l_Storage_0.LocalPersistent, 
        [l_BuildSettings_0.FillBottom] = l_Storage_0.LocalPersistent, 
        [l_BuildSettings_0.NoiseScale] = l_Storage_0.LocalPersistent, 
        [l_BuildSettings_0.Material] = l_Storage_0.LocalSession, 
        [l_BuildSettings_0.Offset] = l_Storage_0.LocalPersistent, 
        [l_BuildSettings_0.PlacementMode] = l_Storage_0.LocalSession, 
        [l_BuildSettings_0.Position] = l_Storage_0.LocalPersistent, 
        [l_BuildSettings_0.RimHeight] = l_Storage_0.LocalPersistent, 
        [l_BuildSettings_0.Rotation] = l_Storage_0.LocalPersistent, 
        [l_BuildSettings_0.Seed] = l_Storage_0.LocalPersistent, 
        [l_BuildSettings_0.Size] = l_Storage_0.LocalPersistent, 
        [l_BuildSettings_0.SnapToVoxels] = l_Storage_0.LocalSession, 
        [l_BuildSettings_0.TerrainType] = l_Storage_0.Global, 
        [l_BuildSettings_0.TopRadius] = l_Storage_0.LocalPersistent, 
        [l_BuildSettings_0.Transform] = l_Storage_0.LocalPersistent, 
        [l_BuildSettings_0.WaterLevel] = l_Storage_0.LocalPersistent, 
        [l_BuildSettings_0.Material] = l_Storage_0.LocalSession, 
        [l_BuildSettings_0.MaterialLUT] = l_Storage_0.LocalSession
    }
};
local v12 = {
    Type = "DelayedSlider", 
    Min = 0, 
    Max = 1, 
    ShowInput = true, 
    SnapIncrement = 0.01
};
v11.Generator = function(v13, v14, _, v16)
    local l_Localization_0 = v13.Localization;
    return v1(v13, {
        {
            Id = l_BuildSettings_0.TerrainType, 
            Layout = Enum.FillDirection.Vertical, 
            Schema = {
                Type = "TerrainType"
            }
        }, 
        {
            DataId = l_BuildSettings_0.Transform, 
            Hidden = false, 
            Id = l_BuildSettings_0.Position, 
            Schema = {
                Type = "Vector", 
                Components = {
                    "X", 
                    "Y", 
                    "Z"
                }, 
                GetValue = function(v18)
                    return v14[l_BuildSettings_0.Transform].Rotation + Vector3.new(v18[1], v18[2], v18[3]);
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
            Value = v14[l_BuildSettings_0.Transform]
        }, 
        {
            Id = l_BuildSettings_0.Size, 
            Schema = {
                Type = "Vector", 
                Components = {
                    "X", 
                    "Y", 
                    "Z"
                }, 
                GetValue = function(v21)
                    return (Vector3.new(v21[1], v21[2], v21[3]));
                end, 
                GetComponents = function(v22)
                    return {
                        v22.X, 
                        v22.Y, 
                        v22.Z
                    };
                end
            }, 
            Validate = function(v23)
                if not (v23.X >= 4 and v23.Y >= 4) or v23.Z < 4 then
                    return Enum.PropertyStatus.Error, l_Localization_0:getText("SelectionWarning", "Size");
                elseif v8.MaxBuildRegion ^ 3 < (v23.X * v23.Y) * v23.Z then
                    return Enum.PropertyStatus.Error, l_Localization_0:getText("SelectionWarning", "SizeMax");
                else
                    return Enum.PropertyStatus.Ok, "";
                end;
            end
        }, 
        {
            Id = l_BuildSettings_0.CraterDepth, 
            Schema = v12
        }, 
        {
            Id = l_BuildSettings_0.CraterRadius, 
            Schema = v12
        }, 
        {
            Id = l_BuildSettings_0.TopRadius, 
            Schema = v12
        }, 
        {
            Id = l_BuildSettings_0.FillBottom, 
            Schema = v12
        }, 
        {
            Id = l_BuildSettings_0.WaterLevel, 
            Schema = v12
        }, 
        {
            Id = l_BuildSettings_0.BankSize, 
            Schema = v12
        }, 
        {
            Id = l_BuildSettings_0.RimHeight, 
            Schema = v12
        }, 
        {
            Id = l_BuildSettings_0.CliffSlope, 
            Schema = {
                Type = "DelayedSlider", 
                Min = 0, 
                Max = 90, 
                ShowInput = true, 
                SnapIncrement = 1
            }
        }, 
        {
            Id = l_BuildSettings_0.NoiseScale, 
            Schema = v12
        }, 
        {
            Id = l_BuildSettings_0.NoiseStrength, 
            Schema = v12
        }, 
        {
            Children = {
                {
                    Id = l_BuildSettings_0.Offset, 
                    Schema = {
                        Type = "Vector", 
                        Components = {
                            "X", 
                            "Y"
                        }, 
                        GetValue = function(v24)
                            return Vector2.new(v24[1], v24[2]);
                        end, 
                        GetComponents = function(v25)
                            return {
                                v25.X, 
                                v25.Y
                            };
                        end
                    }
                }, 
                {
                    Id = l_BuildSettings_0.Rotation, 
                    Schema = {
                        Type = "DelayedSlider", 
                        Min = 0, 
                        Max = 360, 
                        ShowInput = true, 
                        SnapIncrement = 1
                    }
                }, 
                {
                    Id = l_BuildSettings_0.Seed, 
                    Schema = {
                        Type = "Number"
                    }
                }
            }, 
            Id = l_BuildSettings_0.AdvancedNoise, 
            Schema = {
                Text = "", 
                Type = "Label"
            }, 
            Value = v14[l_BuildSettings_0.TerrainType] ~= l_TerrainType_0.None and true or nil
        }, 
        {
            Id = l_BuildSettings_0.Material, 
            Schema = {
                Height = not v14[l_BuildSettings_0.Size] and 1 or v14[l_BuildSettings_0.Size].Y, 
                Type = "MaterialRanges"
            }
        }, 
        {
            Id = l_BuildSettings_0.BlendingEdge, 
            Schema = v12
        }, 
        {
            Id = l_BuildSettings_0.Confirm, 
            Layout = Enum.FillDirection.Vertical, 
            Schema = {
                CanConfirm = false, 
                CanRegenerate = false, 
                Label = l_Localization_0:getText(l_BuildSettings_1, l_BuildSettings_0.Confirm), 
                Type = "ConfirmGeneration"
            }, 
            Value = true
        }
    }, {
        Category = l_BuildSettings_1, 
        Data = v14, 
        Overrides = v16
    });
end;
return v11;
