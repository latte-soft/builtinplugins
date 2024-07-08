local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local l_deepCopy_0 = require(l_script_FirstAncestor_0.Packages.Framework).Util.deepCopy;
local v2 = require(l_script_FirstAncestor_0.Src.Util.getItems);
local v3 = require(l_script_FirstAncestor_0.Src.Types);
local l_AdditionalSettings_0 = v3.AdditionalSettings;
local l_Category_0 = v3.Category;
local l_EnumType_0 = v3.EnumType;
local l_ElevationSettings_0 = v3.ElevationSettings;
local l_MaterialUnit_0 = v3.MaterialUnit;
return {
    Get = function(v9, v10)
        return {
            {
                Id = l_Category_0.ElevationSettings, 
                Label = v10:getText("Category", l_Category_0.ElevationSettings), 
                Children = {
                    {
                        Id = l_ElevationSettings_0.Unit, 
                        Label = v10:getText(l_Category_0.ElevationSettings, l_ElevationSettings_0.Unit), 
                        Schema = {
                            Items = v2(v10, nil, l_EnumType_0.MaterialUnit), 
                            Type = "Select"
                        }, 
                        Value = v9.Unit
                    }, 
                    {
                        Id = l_ElevationSettings_0.Elevation, 
                        Label = "", 
                        Layout = Enum.FillDirection.Vertical, 
                        Schema = {
                            Type = l_ElevationSettings_0.Elevation
                        }, 
                        Value = v9
                    }, 
                    if not not v9.MaterialIndex and v9.MaterialIndex <= #v9.MaterialList then {
                        Id = l_ElevationSettings_0.Material, 
                        Label = v10:getText(l_Category_0.ElevationSettings, l_ElevationSettings_0.Material), 
                        Schema = {
                            AllowWater = false, 
                            Dropdown = true, 
                            Type = "Material"
                        }, 
                        Value = v9.MaterialList[v9.MaterialIndex].Material
                    } else nil, 
                    if not not v9.MaterialIndex and v9.MaterialIndex <= #v9.MaterialList then {
                        Id = l_ElevationSettings_0.Slope, 
                        Label = v10:getText(l_Category_0.ElevationSettings, l_ElevationSettings_0.Slope), 
                        Schema = {
                            Type = "Slope"
                        }, 
                        Value = {
                            Min = v9.MaterialList[v9.MaterialIndex].MinSlope, 
                            Max = v9.MaterialList[v9.MaterialIndex].MaxSlope
                        }
                    } else nil, 
                    if not v9.FillMaterial then nil else {
                        Id = l_ElevationSettings_0.FillMaterial, 
                        Label = v10:getText(l_Category_0.ElevationSettings, l_ElevationSettings_0.FillMaterial), 
                        Schema = {
                            Dropdown = true, 
                            Type = "Material"
                        }, 
                        Value = v9.FillMaterial
                    }
                }, 
                Expandable = false, 
                Separator = true
            }, 
            {
                Id = l_Category_0.AdditionalSettings, 
                Label = v10:getText("Category", l_Category_0.AdditionalSettings), 
                Children = {
                    {
                        Id = l_AdditionalSettings_0.FallbackMaterial, 
                        Label = v10:getText(l_Category_0.AdditionalSettings, l_AdditionalSettings_0.FallbackMaterial), 
                        Schema = {
                            AllowWater = false, 
                            Dropdown = true, 
                            Type = "Material"
                        }, 
                        Value = v9.FallbackMaterial
                    }
                }, 
                Expandable = false, 
                Separator = true
            }
        };
    end, 
    Set = function(v11, v12, v13)
        assert(((v11[1] and v11[1].Children) and v11[2]) and v11[2].Children, "Cannot update from nothing.");
        local v14 = {};
        for _, v16 in v11[1].Children, nil, nil do
            v14[v16.Id] = v16.Value;
        end;
        for _, v18 in v11[2].Children, nil, nil do
            v14[v18.Id] = v18.Value;
        end;
        local v19 = l_deepCopy_0(v14[l_ElevationSettings_0.Elevation]);
        local v20 = v14[l_ElevationSettings_0.Unit];
        if v19.Unit ~= v20 then
            if v20 == l_MaterialUnit_0.Stud then
                for _, v22 in v19.MaterialList, nil, nil do
                    v22.MinHeight = v13 * v22.MinHeight;
                    v22.MaxHeight = v13 * v22.MaxHeight;
                end;
                v19.Min = 0;
                v19.Max = v13;
            elseif v20 == l_MaterialUnit_0.Percentage then
                for _, v24 in v19.MaterialList, nil, nil do
                    v24.MinHeight = math.clamp(v24.MinHeight, 0, v13) / v13;
                    v24.MaxHeight = math.clamp(v24.MaxHeight, 0, v13) / v13;
                end;
                v19.Min = 0;
                v19.Max = 1;
            end;
        end;
        if v12.MaterialIndex <= #v19.MaterialList and #v12.MaterialList == #v19.MaterialList then
            v19.Unit = v20;
            v19.FallbackMaterial = v14[l_AdditionalSettings_0.FallbackMaterial];
            v19.FillMaterial = v14[l_ElevationSettings_0.FillMaterial];
            local v25 = v14[l_ElevationSettings_0.Material];
            if v25 then
                v19.MaterialList[v12.MaterialIndex].Material = v25;
            end;
            local v26 = v14[l_ElevationSettings_0.Slope];
            if v26 then
                v19.MaterialList[v12.MaterialIndex].MinSlope = v26.Min;
                v19.MaterialList[v12.MaterialIndex].MaxSlope = v26.Max;
            end;
        end;
        return v19;
    end
};
