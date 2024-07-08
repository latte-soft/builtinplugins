local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v3 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagTerrainEditorGenerationFeature);
local v4 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagTerrainEditorErrorHandling);
local v5 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagTerrainEditorCompactMode);
local l_deepJoin_0 = v1.Util.deepJoin;
local v7 = require(l_script_FirstAncestor_0.Packages.Dash);
local function v8(v9, v10, v11)
    local l_Localization_0 = v9.Localization;
    local v13 = {};
    for v14, v15 in v10, nil, nil do
        local l_Id_0 = v15.Id;
        if (not v3() or not v15.Children) or not v11.Data[l_Id_0] then
            v13[v14] = v7.join({
                Hidden = v11.Data[l_Id_0] == nil, 
                Label = l_Localization_0:getText(v11.Category, l_Id_0), 
                Layout = if (((not not v5() and v15.Schema.Type ~= "Checkbox") and v15.Schema.Type ~= "Number") and v15.Schema.Type ~= "Button") and v9.Tool:getShouldBeCompact() then Enum.FillDirection.Vertical else nil, 
                Value = v11.Data[l_Id_0]
            }, v15);
        else
            v13[v14] = v7.join({
                Hidden = v11.Data[l_Id_0] == nil, 
                Label = l_Localization_0:getText(v11.Category, l_Id_0), 
                Layout = if (((not not v5() and v15.Schema.Type ~= "Checkbox") and v15.Schema.Type ~= "Number") and v15.Schema.Type ~= "Button") and v9.Tool:getShouldBeCompact() then Enum.FillDirection.Vertical else nil, 
                Value = v11.Data[l_Id_0].Value
            }, v15);
            v13[v14].Children = v8(v9, v15.Children, {
                Category = v11.Category, 
                Data = v11.Data[l_Id_0].Children, 
                Overrides = if not v11.Overrides[l_Id_0] then {} else v11.Overrides[l_Id_0].Children
            });
        end;
        if v11.Overrides[l_Id_0] then
            v13[v14] = l_deepJoin_0(v13[v14], v11.Overrides[l_Id_0]);
            if v11.Overrides[l_Id_0].Schema then
                v13[v14].Schema = v7.join(v13[v14].Schema, v11.Overrides[l_Id_0].Schema);
            end;
        end;
        if not (not v4() or not v13[v14].Validate) then
            local v17 = v9.Tool:getValidateFunction(v11.Category, l_Id_0);
            if not v17 then
                local l_Validate_0 = v13[v14].Validate;
                local function v22(v19)
                    local v20, v21 = l_Validate_0(v19);
                    if v20 == Enum.PropertyStatus.Error then
                        v9.Tool:reportError(v11.Category, l_Id_0, v19);
                        return v20, v21;
                    else
                        v9.Tool:clearError(v11.Category, l_Id_0);
                        return v20, v21;
                    end;
                end;
                v9.Tool:setValidateFunction(v11.Category, l_Id_0, v22);
                v13[v14].Validate = v22;
            else
                v13[v14].Validate = v17;
            end;
        end;
    end;
    return v13;
end;
return v8;
