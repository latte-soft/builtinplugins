local l_script_FirstAncestor_0 = script:FindFirstAncestor("TextureGenerator");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local v2 = require(l_script_FirstAncestor_0.Packages.React);
local l_Localization_0 = v1.ContextServices.Localization;
local l_Form_0 = v1.UI.Form;
local v5 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local v6 = require(l_script_FirstAncestor_0.Src.Util.OptionsContext);
local function _(v7)
    local v8 = false;
    if v7 >= -360 then
        v8 = v7 <= 360;
    end;
    return v8;
end;
local function v16(v10, v11)
    local l_Children_0 = v10[1].Children;
    l_Children_0[1].Value = v11.randomizeSeed;
    l_Children_0[2].Disabled = v11.randomizeSeed;
    l_Children_0[2].Value = v11.seed;
    local v13, v14, v15 = v11.rotation:ToEulerAnglesYXZ();
    l_Children_0[3].Value = Vector3.new(math.deg(v13), math.deg(v14), (math.deg(v15)));
    l_Children_0[4].Value = v11.smartUVUnwrap;
    l_Children_0[5].Value = v11.promptMasking;
end;
local function v22(v17, v18, v19)
    local l_Children_1 = v18[1].Children;
    v17.setRandomizeSeed(l_Children_1[1].Value);
    v17.setSeed(l_Children_1[2].Value);
    if not l_Children_1[1].Value then
        l_Children_1[2].Validate(v19);
    else
        v17.setValidSeed(true);
    end;
    local l_Value_0 = l_Children_1[3].Value;
    v17.setRotation((CFrame.fromEulerAnglesYXZ(math.rad((l_Value_0.X + 180) % 360 - 180), math.rad((l_Value_0.Y + 180) % 360 - 180), (math.rad((l_Value_0.Z + 180) % 360 - 180)))));
    v17.setSmartUVUnwrap(l_Children_1[4].Value);
    v17.setPromptMasking(l_Children_1[5].Value);
end;
local function v34(v23, v24, v25)
    return {
        {
            Id = "Advanced Options", 
            Label = v23:getText("Options", "AdvancedOptions"), 
            Children = {
                {
                    Id = "RandomizeSeed", 
                    Label = v23:getText("Options", "RandomizeSeed"), 
                    Tooltip = v23:getText("Options", "RandomizeSeedTooltip"), 
                    Schema = {
                        Type = "Checkbox"
                    }
                }, 
                {
                    Id = "Seed", 
                    Disabled = true, 
                    Label = v23:getText("Options", "Seed"), 
                    Validate = function(v26)
                        if type(v26) ~= "number" then
                            v25(v26);
                            v24.setValidSeed(false);
                            return Enum.PropertyStatus.Error, v23:getText("Options", "SeedNotANumber");
                        elseif not (v26 >= 0) or v5.MAX_SEED_VALUE < v26 then
                            v25(v26);
                            v24.setValidSeed(false);
                            return Enum.PropertyStatus.Error, v23:getText("Options", "SeedOutOfRange");
                        else
                            v25(v26);
                            v24.setValidSeed(true);
                            return Enum.PropertyStatus.Ok, "";
                        end;
                    end, 
                    Schema = {
                        Type = "Number"
                    }
                }, 
                {
                    Id = "Rotation", 
                    Label = v23:getText("Options", "Rotation"), 
                    Validate = function(v27)
                        if not (type(v27.X) == "number" and type(v27.Y) == "number") or type(v27.Z) ~= "number" then
                            v24.setValidRotation(false);
                            return Enum.PropertyStatus.Error, v23:getText("Options", "RotationAnglesNotNumbers");
                        else
                            local l_X_0 = v27.X;
                            local v29 = false;
                            if l_X_0 >= -360 then
                                v29 = l_X_0 <= 360;
                            end;
                            if v29 then
                                l_X_0 = v27.Y;
                                v29 = false;
                                if l_X_0 >= -360 then
                                    v29 = l_X_0 <= 360;
                                end;
                                if v29 then
                                    l_X_0 = v27.Z;
                                    v29 = false;
                                    if l_X_0 >= -360 then
                                        v29 = l_X_0 <= 360;
                                    end;
                                    if v29 then
                                        v24.setValidRotation(true);
                                        return Enum.PropertyStatus.Ok, "";
                                    end;
                                end;
                            end;
                            v24.setValidRotation(false);
                            return Enum.PropertyStatus.Error, v23:getText("Options", "RotationAnglesOutOfRange");
                        end;
                    end, 
                    Schema = {
                        Type = "Vector", 
                        Components = {
                            "X", 
                            "Y", 
                            "Z"
                        }, 
                        GetValue = function(v30)
                            if (type(v30[1]) == "number" and type(v30[2]) == "number") and type(v30[3]) == "number" then
                                local v31 = v30[1];
                                local v32 = false;
                                if v31 >= -360 then
                                    v32 = v31 <= 360;
                                end;
                                if v32 then
                                    v31 = v30[2];
                                    v32 = false;
                                    if v31 >= -360 then
                                        v32 = v31 <= 360;
                                    end;
                                    if v32 then
                                        v31 = v30[3];
                                        v32 = false;
                                        if v31 >= -360 then
                                            v32 = v31 <= 360;
                                        end;
                                        if v32 then
                                            return (Vector3.new(v30[1], v30[2], v30[3]));
                                        end;
                                    end;
                                end;
                            end;
                            return {
                                X = v30[1], 
                                Y = v30[2], 
                                Z = v30[3]
                            };
                        end, 
                        GetComponents = function(v33)
                            return {
                                v33.X, 
                                v33.Y, 
                                v33.Z
                            };
                        end
                    }
                }, 
                {
                    Id = "SmartUVUnwrap", 
                    Label = v23:getText("Options", "SmartUVUnwrap"), 
                    Tooltip = v23:getText("Options", "SmartUVUnwrapTooltip"), 
                    Schema = {
                        Type = "Checkbox"
                    }
                }, 
                {
                    Id = "PromptMasking", 
                    Label = v23:getText("Options", "PromptMasking"), 
                    Tooltip = v23:getText("Options", "PromptMaskingTooltip"), 
                    Schema = {
                        Type = "Checkbox"
                    }
                }
            }
        }
    };
end;
return function(v35)
    local v36 = v2.useContext(v6);
    local v37 = l_Localization_0:use();
    local v38, v39 = v2.useState({});
    local v40, v41 = v2.useState(0);
    local v43 = v2.useMemo(function()
        local v42 = v34(v37, v36, v41);
        v16(v42, v36);
        return v42;
    end, {
        v36
    });
    local v45 = v2.useCallback(function(v44)
        v22(v36, v44, v40);
    end, {
        v36, 
        v40
    });
    v2.useEffect(function()
        v36.setValidRotation(true);
        v36.setValidSeed(true);
    end, {
        v38
    });
    return v2.createElement(l_Form_0, {
        AutomaticSize = Enum.AutomaticSize.Y, 
        Expansion = v38, 
        ExpandByDefault = false, 
        Items = v43, 
        LabelHeight = 24, 
        LabelWidth = UDim.new(0, 140), 
        LayoutOrder = v35.LayoutOrder, 
        OnChange = v45, 
        OnExpansionChange = v39, 
        Size = UDim2.fromScale(1, 0), 
        UseScrollingFrame = false
    });
end;
