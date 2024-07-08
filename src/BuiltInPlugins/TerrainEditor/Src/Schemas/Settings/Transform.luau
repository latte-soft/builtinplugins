local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local v1 = require(l_script_FirstAncestor_0.Src.Util.ApplyById);
local v2 = require(l_script_FirstAncestor_0.Src.Types);
local l_Category_0 = v2.Category;
local l_TransformSettings_0 = v2.TransformSettings;
local l_Storage_0 = v2.Storage;
local v6 = require(l_script_FirstAncestor_0.Src.Resources.Constants);
local l_TransformSettings_1 = l_Category_0.TransformSettings;
local v8 = require(l_script_FirstAncestor_0.Src.Util.getWithinTerrainBounds);
local v9 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagTerrainEditorErrorHandling);
return {
    Storage = {
        [l_TransformSettings_0.Apply] = l_Storage_0.LocalSession, 
        [l_TransformSettings_0.ForcePreview] = l_Storage_0.LocalSession, 
        [l_TransformSettings_0.LiveEdit] = l_Storage_0.LocalPersistent, 
        [l_TransformSettings_0.MergeEmpty] = l_Storage_0.LocalPersistent, 
        [l_TransformSettings_0.OperationSource] = l_Storage_0.LocalPersistent, 
        [l_TransformSettings_0.Position] = l_Storage_0.Global, 
        [l_TransformSettings_0.Size] = l_Storage_0.Global, 
        [l_TransformSettings_0.SnapToVoxels] = l_Storage_0.Global, 
        [l_TransformSettings_0.TerrainRegion] = l_Storage_0.Global, 
        [l_TransformSettings_0.TerrainRegionBuffer] = l_Storage_0.Global, 
        [l_TransformSettings_0.TerrainRegionBufferSize] = l_Storage_0.Global, 
        [l_TransformSettings_0.TerrainRegionBufferTransform] = l_Storage_0.Global, 
        [l_TransformSettings_0.TerrainRegionSize] = l_Storage_0.Global, 
        [l_TransformSettings_0.TerrainRegionTransform] = l_Storage_0.Global, 
        [l_TransformSettings_0.Transform] = l_Storage_0.Global, 
        [l_TransformSettings_0.TransformMode] = l_Storage_0.Global
    }, 
    Generator = function(v10, v11, _, v13)
        local l_Localization_0 = v10.Localization;
        return v1(v10, {
            {
                Id = l_TransformSettings_0.Size, 
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
                end
            }, 
            {
                DataId = l_TransformSettings_0.Transform, 
                Id = l_TransformSettings_0.Position, 
                Hidden = false, 
                Schema = {
                    Type = "Vector", 
                    Components = {
                        "X", 
                        "Y", 
                        "Z"
                    }, 
                    GetValue = function(v18)
                        return v11[l_TransformSettings_0.Transform].Rotation + Vector3.new(v18[1], v18[2], v18[3]);
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
                Value = v11[l_TransformSettings_0.Transform]
            }, 
            {
                DataId = l_TransformSettings_0.Transform, 
                Id = l_TransformSettings_0.Rotation, 
                Schema = {
                    Type = "Vector", 
                    Components = {
                        "X", 
                        "Y", 
                        "Z"
                    }, 
                    GetValue = function(v21)
                        return CFrame.fromEulerAnglesXYZ(math.rad(v21[1]), math.rad(v21[2]), (math.rad(v21[3]))) + v11[l_TransformSettings_0.Transform].Position;
                    end, 
                    GetComponents = function(v22)
                        local v23, v24, v25 = v22:ToEulerAnglesXYZ();
                        return {
                            math.deg(v23), 
                            math.deg(v24), 
                            (math.deg(v25))
                        };
                    end
                }, 
                Validate = if not v9() then nil else function(v26)
                    if v8(v26, v10.Tool:getPayload()[l_TransformSettings_1][l_TransformSettings_0.Size]) then
                        return Enum.PropertyStatus.Ok, "";
                    else
                        return Enum.PropertyStatus.Error, l_Localization_0:getText("SelectionWarning", "OutOfBounds");
                    end;
                end, 
                Value = v11[l_TransformSettings_0.Transform]
            }, 
            {
                Id = l_TransformSettings_0.MergeEmpty, 
                Schema = {
                    Type = "Checkbox"
                }
            }, 
            {
                Id = l_TransformSettings_0.LiveEdit, 
                Schema = {
                    Type = "Checkbox"
                }
            }, 
            {
                Id = l_TransformSettings_0.SnapToVoxels, 
                Schema = {
                    Type = "Checkbox"
                }
            }, 
            {
                Id = l_TransformSettings_0.Apply, 
                Layout = Enum.FillDirection.Vertical, 
                Schema = {
                    Label = l_Localization_0:getText(l_TransformSettings_1, l_TransformSettings_0.Apply), 
                    Type = "Button"
                }
            }
        }, {
            Category = l_TransformSettings_1, 
            Data = v11, 
            Overrides = v13
        });
    end
};
