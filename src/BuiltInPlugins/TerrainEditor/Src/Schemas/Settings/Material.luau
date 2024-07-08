local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local v1 = require(l_script_FirstAncestor_0.Src.Types);
local v2 = require(l_script_FirstAncestor_0.Src.Util.getItems);
local v3 = require(l_script_FirstAncestor_0.Src.Util.ApplyById);
local l_Category_0 = v1.Category;
local l_EnumType_0 = v1.EnumType;
local l_FillMode_0 = v1.FillMode;
local l_MaterialMode_0 = v1.MaterialMode;
local l_MaterialSettings_0 = v1.MaterialSettings;
local l_Storage_0 = v1.Storage;
local l_Tool_0 = v1.Tool;
local l_MaterialSettings_1 = l_Category_0.MaterialSettings;
local v12 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagTerrainEditorAirSourceMaterial);
return {
    Storage = {
        [l_MaterialSettings_0.AutoMaterial] = l_Storage_0.LocalPersistent, 
        [l_MaterialSettings_0.FillMode] = l_Storage_0.LocalPersistent, 
        [l_MaterialSettings_0.MaterialMode] = l_Storage_0.LocalPersistent, 
        [l_MaterialSettings_0.SourceMaterial] = l_Storage_0.LocalPersistent, 
        [l_MaterialSettings_0.TargetMaterial] = l_Storage_0.LocalPersistent
    }, 
    Generator = function(v13, v14, v15, v16)
        local l_Localization_0 = v13.Localization;
        local l_v3_0 = v3;
        local l_v13_0 = v13;
        local v20 = {};
        local v21 = {
            Id = l_MaterialSettings_0.AutoMaterial, 
            Schema = {
                Type = "Checkbox"
            }
        };
        local v22 = {
            Id = l_MaterialSettings_0.MaterialMode, 
            Schema = {
                Type = "SingleSelectButton", 
                Items = v2(l_Localization_0, nil, l_EnumType_0.MaterialMode)
            }
        };
        local v23 = {
            Id = l_MaterialSettings_0.FillMode, 
            Schema = {
                Type = "SingleSelectButton", 
                Items = v2(l_Localization_0, nil, l_EnumType_0.FillMode)
            }
        };
        local v24 = {
            Hidden = v14[l_MaterialSettings_0.AutoMaterial], 
            Id = l_MaterialSettings_0.SourceMaterial, 
            Layout = Enum.FillDirection.Vertical, 
            Schema = {
                AllowAir = v12(), 
                Type = "Material"
            }
        };
        local v25 = {};
        local v26;
        if v14[l_MaterialSettings_0.MaterialMode] ~= nil then
            v26 = false;
            if not (v14[l_MaterialSettings_0.MaterialMode] == l_MaterialMode_0.Paint) then
                goto label0;
            end;
        end;
        v26 = true;
        if v14[l_MaterialSettings_0.FillMode] ~= nil then
            v26 = v14[l_MaterialSettings_0.FillMode] == l_FillMode_0.Fill;
        end;
        ::label0::;
        v25.Hidden = v26;
        v25.Id = l_MaterialSettings_0.TargetMaterial;
        v25.Layout = Enum.FillDirection.Vertical;
        v25.Schema = {
            AllowAir = true, 
            Type = "Material"
        };
        v26 = {
            Hidden = v15 ~= l_Tool_0.Paint, 
            Id = l_MaterialSettings_0.Apply, 
            Layout = Enum.FillDirection.Vertical, 
            Label = if v14[l_MaterialSettings_0.MaterialMode] or v14[l_MaterialSettings_0.FillMode] then l_Localization_0:getText(l_MaterialSettings_1, v14[l_MaterialSettings_0.MaterialMode] or v14[l_MaterialSettings_0.FillMode]) else nil, 
            Schema = {
                Label = if v14[l_MaterialSettings_0.MaterialMode] or v14[l_MaterialSettings_0.FillMode] then l_Localization_0:getText(l_MaterialSettings_1, v14[l_MaterialSettings_0.MaterialMode] or v14[l_MaterialSettings_0.FillMode]) else nil, 
                Type = "Button"
            }
        };
        setlist { ['R007[1 to 6]'] = 'R008 to R013' };
        return l_v3_0(l_v13_0, v20, {
            Category = l_MaterialSettings_1, 
            Data = v14, 
            Overrides = v16
        });
    end
};
