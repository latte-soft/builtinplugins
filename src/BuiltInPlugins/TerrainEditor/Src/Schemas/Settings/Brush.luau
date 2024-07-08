local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local v1 = require(l_script_FirstAncestor_0.Src.Types);
local v2 = require(l_script_FirstAncestor_0.Src.Util.getItems);
local v3 = require(l_script_FirstAncestor_0.Src.Util.ApplyById);
local l_BrushSettings_0 = v1.BrushSettings;
local l_BrushMode_0 = v1.BrushMode;
local l_Category_0 = v1.Category;
local l_EnumType_0 = v1.EnumType;
local l_FlattenPlane_0 = v1.FlattenPlane;
local l_PlaneLock_0 = v1.PlaneLock;
local l_Storage_0 = v1.Storage;
local l_BrushSettings_1 = l_Category_0.BrushSettings;
local v12 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagTerrainEditorWaterAutofill);
return {
    Storage = {
        [l_BrushSettings_0.BrushMode] = l_Storage_0.LocalPersistent, 
        [l_BrushSettings_0.BrushShape] = l_Storage_0.LocalPersistent, 
        [l_BrushSettings_0.BrushSize] = l_Storage_0.LocalPersistent, 
        [l_BrushSettings_0.Strength] = l_Storage_0.LocalPersistent, 
        [l_BrushSettings_0.FixedYPlane] = l_Storage_0.LocalPersistent, 
        [l_BrushSettings_0.FlattenPlane] = l_Storage_0.LocalPersistent, 
        [l_BrushSettings_0.FlattenMode] = l_Storage_0.LocalPersistent, 
        [l_BrushSettings_0.PivotPosition] = l_Storage_0.LocalPersistent, 
        [l_BrushSettings_0.PlaneLock] = l_Storage_0.Global, 
        [l_BrushSettings_0.ManualPlaneLock] = l_Storage_0.Global, 
        [l_BrushSettings_0.PlaneTransform] = l_Storage_0.Global, 
        [l_BrushSettings_0.Snapping] = l_Storage_0.LocalPersistent, 
        [l_BrushSettings_0.State] = l_Storage_0.LocalSession, 
        [l_BrushSettings_0.IgnoreWater] = l_Storage_0.LocalPersistent, 
        [l_BrushSettings_0.IgnoreParts] = l_Storage_0.LocalPersistent, 
        [l_BrushSettings_0.PullTerrain] = l_Storage_0.LocalPersistent, 
        [l_BrushSettings_0.TemporarySmooth] = l_Storage_0.LocalSession, 
        [l_BrushSettings_0.WaterAutofill] = l_Storage_0.LocalPersistent
    }, 
    Generator = function(v13, v14, _, v16)
        local l_Localization_0 = v13.Localization;
        local l_Stylizer_0 = v13.Stylizer;
        local l_v3_0 = v3;
        local l_v13_0 = v13;
        local v21 = {};
        local v22 = {
            Id = l_BrushSettings_0.BrushMode, 
            Schema = {
                Type = "SingleSelectButton", 
                Items = v2(l_Localization_0, nil, l_EnumType_0.BrushMode)
            }
        };
        local v23 = {
            Height = 52, 
            Id = l_BrushSettings_0.BrushShape, 
            Schema = {
                Type = "SingleSelectButton", 
                Items = v2(nil, l_Stylizer_0, l_EnumType_0.BrushShape)
            }
        };
        local v24 = {
            Height = 52, 
            Id = l_BrushSettings_0.FlattenMode, 
            Schema = {
                Type = "SingleSelectButton", 
                Items = v2(nil, l_Stylizer_0, l_EnumType_0.FlattenMode)
            }
        };
        local v25 = {
            Id = l_BrushSettings_0.BrushSize, 
            Schema = {
                Shape = v14[l_BrushSettings_0.BrushShape], 
                Type = "BrushSize"
            }
        };
        local v26 = {
            Id = l_BrushSettings_0.Strength, 
            Schema = {
                Type = "Slider", 
                Min = 0, 
                Max = 1, 
                ShowInput = true, 
                SnapIncrement = 0.01
            }
        };
        local v27 = {
            Id = l_BrushSettings_0.PivotPosition, 
            Schema = {
                Type = "SingleSelectButton", 
                Items = v2(l_Localization_0, nil, l_EnumType_0.PivotPosition)
            }
        };
        local v28 = {
            Id = l_BrushSettings_0.Snapping, 
            Schema = {
                Type = "SingleSelectButton", 
                Items = v2(l_Localization_0, nil, l_EnumType_0.Snapping)
            }
        };
        local v29 = {
            Id = l_BrushSettings_0.FlattenPlane, 
            Schema = {
                Type = "SingleSelectButton", 
                Items = v2(l_Localization_0, nil, l_EnumType_0.FlattenPlane)
            }
        };
        local v30 = {
            Hidden = v14[l_BrushSettings_0.FlattenPlane] == l_FlattenPlane_0.Auto, 
            Id = l_BrushSettings_0.FixedYPlane, 
            Schema = {
                Type = "Number"
            }
        };
        local v31 = {
            Id = l_BrushSettings_0.PlaneLock, 
            Schema = {
                Type = "SingleSelectButton", 
                Items = v2(l_Localization_0, nil, l_EnumType_0.PlaneLock)
            }
        };
        local v32 = {
            Hidden = v14[l_BrushSettings_0.PlaneLock] ~= l_PlaneLock_0.Manual, 
            Id = l_BrushSettings_0.ManualPlaneLock, 
            Schema = {
                ApplyLabel = l_Localization_0:getText(l_Category_0.BrushSettings, "Apply"), 
                EditLabel = l_Localization_0:getText(l_Category_0.BrushSettings, "Edit"), 
                OnReset = function()
                end, 
                Type = "PlaneLock"
            }
        };
        local v33 = {
            DataId = l_BrushSettings_0.PlaneTransform, 
            Id = l_BrushSettings_0.PlanePosition
        };
        local v34 = true;
        if v14[l_BrushSettings_0.PlaneLock] == l_PlaneLock_0.Manual then
            v34 = not v14[l_BrushSettings_0.ManualPlaneLock];
        end;
        v33.Hidden = v34;
        v33.Schema = {
            Type = "Vector", 
            Components = {
                "X", 
                "Y", 
                "Z"
            }, 
            GetValue = function(v35)
                return v14[l_BrushSettings_0.PlaneTransform].Rotation + Vector3.new(v35[1], v35[2], v35[3]);
            end, 
            GetComponents = function(v36)
                local l_Position_0 = v36.Position;
                return {
                    l_Position_0.X, 
                    l_Position_0.Y, 
                    l_Position_0.Z
                };
            end
        };
        v33.Value = v14[l_BrushSettings_0.PlaneTransform];
        v34 = {
            DataId = l_BrushSettings_0.PlaneTransform, 
            Id = l_BrushSettings_0.PlaneRotation
        };
        local v38 = true;
        if v14[l_BrushSettings_0.PlaneLock] == l_PlaneLock_0.Manual then
            v38 = not v14[l_BrushSettings_0.ManualPlaneLock];
        end;
        v34.Hidden = v38;
        v34.Schema = {
            Type = "Vector", 
            Components = {
                "X", 
                "Y", 
                "Z"
            }, 
            GetValue = function(v39)
                return CFrame.fromEulerAnglesXYZ(math.rad(v39[1]), math.rad(v39[2]), (math.rad(v39[3]))) + v14[l_BrushSettings_0.PlaneTransform].Position;
            end, 
            GetComponents = function(v40)
                local v41, v42, v43 = v40:ToEulerAnglesXYZ();
                return {
                    math.deg(v41), 
                    math.deg(v42), 
                    (math.deg(v43))
                };
            end
        };
        v34.Value = v14[l_BrushSettings_0.PlaneTransform];
        v38 = {
            Id = l_BrushSettings_0.IgnoreWater, 
            Schema = {
                Type = "Checkbox"
            }
        };
        local v44 = {
            Id = l_BrushSettings_0.IgnoreParts, 
            Schema = {
                Type = "Checkbox"
            }
        };
        local v45 = {
            Hidden = not v12() or v14[l_BrushSettings_0.BrushMode] == l_BrushMode_0.Add, 
            Id = l_BrushSettings_0.WaterAutofill, 
            Schema = {
                Type = "Checkbox"
            }
        };
        setlist { ['R008[1 to 16]'] = 'R009 to R024' };
        return l_v3_0(l_v13_0, v21, {
            Category = l_BrushSettings_1, 
            Data = v14, 
            Overrides = v16
        });
    end
};
