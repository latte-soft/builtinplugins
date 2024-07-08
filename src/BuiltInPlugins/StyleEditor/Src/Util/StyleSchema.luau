local l_ReflectionService_0 = game:GetService("ReflectionService");
local l_Parent_0 = script.Parent.Parent.Parent;
local l_Breadcrumb_0 = require(l_Parent_0.Packages.Framework).UI.Breadcrumb;
local v3 = require(l_Parent_0.Packages.Dash);
local l_append_0 = v3.append;
local l_collectArray_0 = v3.collectArray;
local l_collectSet_0 = v3.collectSet;
local l_forEach_0 = v3.forEach;
local l_includes_0 = v3.includes;
local l_keys_0 = v3.keys;
local l_splitOn_0 = v3.splitOn;
local l_startsWith_0 = v3.startsWith;
local l_trim_0 = v3.trim;
local v13 = require(l_Parent_0.Src.Util.MenuHelpers);
local v14 = require(l_Parent_0.Src.Resources.ModernIcons);
local v15 = require(l_Parent_0.Src.Util.roundDecimal);
local v16 = require(l_Parent_0.Src.Util.sortByLabel);
local l_Attribute_0 = require(l_Parent_0.Src.Resources.PluginStyles):GetAttribute("Icon16");
local v18 = {
    allProperties = {}, 
    possiblePropertyTypes = {}
};
v18.CreateSelectSchema = function(v19)
    if not (v19 ~= nil) or v19.EnumType == nil then
        return v18.TextSchema;
    else
        return {
            Type = "Select", 
            Items = v18.GetEnumItems(v19.EnumType), 
            PlaceholderText = "Add a " .. tostring(v19.EnumType) .. "...", 
            Validate = function(v20)
                return l_includes_0(v19.EnumType:GetEnumItems(), v20);
            end, 
            GetDefaultValue = function()
                return v19;
            end
        };
    end;
end;
v18.GetEnumItems = function(v21)
    local l_v21_EnumItems_0 = v21:GetEnumItems();
    table.sort(l_v21_EnumItems_0, function(v23, v24)
        return tostring(v23) < tostring(v24);
    end);
    return (l_collectArray_0(l_v21_EnumItems_0, function(_, v26)
        return {
            Id = v26, 
            Label = l_splitOn_0(tostring(v26), "%.")[3]
        };
    end));
end;
v18.CreateChildSchema = function(v27, v28, v29, v30, v31)
    return {
        Id = ("%*/%*"):format(v28, v27), 
        Name = {
            Schema = v18.ChildComponentSchema, 
            Value = v27
        }, 
        Value = {
            Schema = v29, 
            Value = v30
        }, 
        SetParentValue = v31
    };
end;
v18.GetComponentsValues = function(v32)
    return l_collectArray_0(v32:split(","), function(_, v34)
        return (tonumber(v34));
    end);
end;
v18.GetComponentsString = function(v35)
    local v36 = "";
    for v37, v38 in v35, nil, nil do
        if v37 ~= 1 then
            v36 = v36 .. " , ";
        end;
        v36 = v36 .. v15(tonumber(v38), 2);
    end;
    return {
        v36
    };
end;
v18.BrickColorSchema = {
    Type = "BrickColor", 
    Validate = function(v39)
        return typeof(v39) == "BrickColor";
    end, 
    GetDefaultValue = function()
        return BrickColor.new(1);
    end
};
local function _(v40)
    if v40 == 0 then
        return 0;
    else
        return (math.deg(v40));
    end;
end;
v18.NumberSchema = {
    Type = "Number", 
    PlaceholderText = "Add a Number...", 
    Validate = function(v42)
        return typeof(v42) == "number";
    end, 
    GetDefaultValue = function()
        return 0;
    end
};
v18.CFrameSchema = {
    Type = "Vector", 
    Components = {
        ""
    }, 
    GetValue = function(v43)
        local v44 = v18.GetComponentsValues(v43[1]);
        local v45 = Vector3.new(v44[1], v44[2], v44[3]);
        local v46 = v44[4];
        local v47 = v46 == 0 and 0 or math.deg(v46);
        v46 = v44[5];
        local v48 = v46 == 0 and 0 or math.deg(v46);
        v46 = v44[6];
        return CFrame.new(v45) * CFrame.Angles(v47, v48, v46 == 0 and 0 or math.deg(v46));
    end, 
    GetChildren = function(v49, v50)
        local l_NumberSchema_0 = v18.NumberSchema;
        local l_Position_0 = v49.Position;
        local l_X_0 = l_Position_0.X;
        local l_Y_0 = l_Position_0.Y;
        local l_Z_0 = l_Position_0.Z;
        local v56, v57, v58 = v49:ToOrientation();
        local v59 = CFrame.Angles(v56, v57, v58);
        return {
            v18.CreateChildSchema("Position-X", v50, l_NumberSchema_0, l_X_0, function(v60)
                l_Position_0 = Vector3.new(v60, l_Y_0, l_Z_0);
                return CFrame.new(l_Position_0) * v59;
            end), 
            v18.CreateChildSchema("Position-Y", v50, l_NumberSchema_0, l_Y_0, function(v61)
                l_Position_0 = Vector3.new(l_X_0, v61, l_Z_0);
                return CFrame.new(l_Position_0) * v59;
            end), 
            v18.CreateChildSchema("Position-Z", v50, l_NumberSchema_0, l_Z_0, function(v62)
                l_Position_0 = Vector3.new(l_X_0, l_Y_0, v62);
                return CFrame.new(l_Position_0) * v59;
            end), 
            v18.CreateChildSchema("Orientation-X", v50, l_NumberSchema_0, v56 == 0 and 0 or math.deg(v56), function(v63)
                v59 = CFrame.Angles(math.rad(v63), v57, v58);
                return CFrame.new(l_Position_0) * v59;
            end), 
            v18.CreateChildSchema("Orientation-Y", v50, l_NumberSchema_0, v57 == 0 and 0 or math.deg(v57), function(v64)
                v59 = CFrame.Angles(v56, math.rad(v64), v58);
                return CFrame.new(l_Position_0) * v59;
            end), 
            v18.CreateChildSchema("Orientation-Z", v50, l_NumberSchema_0, v58 == 0 and 0 or math.deg(v58), function(v65)
                v59 = CFrame.Angles(v56, v57, (math.rad(v65)));
                return CFrame.new(l_Position_0) * v59;
            end)
        };
    end, 
    GetComponents = function(v66)
        local l_Position_1 = v66.Position;
        local v68, v69, v70 = v66:ToOrientation();
        return v18.GetComponentsString({
            l_Position_1.X, 
            l_Position_1.Y, 
            l_Position_1.Z, 
            v68 == 0 and 0 or math.deg(v68), 
            v69 == 0 and 0 or math.deg(v69), 
            v70 == 0 and 0 or math.deg(v70)
        });
    end, 
    Validate = function(v71)
        return typeof(v71) == "CFrame";
    end, 
    GetDefaultValue = function()
        return CFrame.new();
    end
};
v18.CheckboxSchema = {
    Type = "Checkbox", 
    Validate = function(v72)
        return typeof(v72) == "boolean";
    end, 
    GetDefaultValue = function()
        return false;
    end
};
v18.ChildComponentSchema = {
    Type = "StaticText", 
    Name = "Child", 
    Validate = function(v73)
        return typeof(v73) == "string";
    end, 
    GetDefaultValue = function()
        return "";
    end
};
v18.ColorSchema = {
    Type = "Color", 
    PlaceholderText = "Add a Color...", 
    Validate = function(v74)
        return typeof(v74) == "Color3";
    end, 
    GetDefaultValue = function()
        return Color3.new(1, 1, 1);
    end
};
v18.ColorSequenceSchema = {
    Type = "ColorSequence", 
    Validate = function(v75)
        return typeof(v75) == "ColorSequence";
    end, 
    GetDefaultValue = function()
        return ColorSequence.new(Color3.new());
    end
};
v18.EmptySchema = {
    Type = "Empty", 
    Validate = function()
        return true;
    end, 
    GetDefaultValue = function()
        return nil;
    end
};
v18.FontStyleSchema = {
    Type = "FontStyle", 
    Validate = function(v76)
        return typeof(v76) == "Font";
    end, 
    GetDefaultValue = function()
        return Font.new("rbxasset://fonts/families/SourceSansPro.json");
    end
};
v18.FontWeightSchema = {
    Type = "FontWeight", 
    Validate = function(v77)
        return typeof(v77) == "Font";
    end, 
    GetDefaultValue = function()
        return Font.new("rbxasset://fonts/families/SourceSansPro.json");
    end
};
v18.FontSchema = {
    Type = "FontFamily", 
    PlaceholderText = "Add a Font...", 
    GetChildren = function(v78)
        return {
            {
                Name = {
                    Schema = v18.ChildComponentSchema, 
                    Value = "Style"
                }, 
                Value = {
                    Schema = v18.FontStyleSchema, 
                    Value = v78
                }
            }, 
            {
                Name = {
                    Schema = v18.ChildComponentSchema, 
                    Value = "Weight"
                }, 
                Value = {
                    Schema = v18.FontWeightSchema, 
                    Value = v78
                }
            }
        };
    end, 
    Validate = function(v79)
        return typeof(v79) == "Font";
    end, 
    GetDefaultValue = function()
        return Font.new("rbxasset://fonts/families/SourceSansPro.json");
    end
};
v18.NumberRangeSchema = {
    Type = "Vector", 
    Components = {
        ""
    }, 
    GetValue = function(v80)
        local v81 = v18.GetComponentsValues(v80[1]);
        local v82 = v81[1];
        local v83 = v81[2];
        if v82 <= v83 then
            return NumberRange.new(v82, v83);
        else
            return NumberRange.new(v83, v82);
        end;
    end, 
    GetChildren = function(v84, v85)
        local l_NumberSchema_1 = v18.NumberSchema;
        local l_Min_0 = v84.Min;
        local l_Max_0 = v84.Max;
        return {
            v18.CreateChildSchema("Min", v85, l_NumberSchema_1, l_Min_0, function(v89)
                if v89 <= l_Max_0 then
                    return NumberRange.new(v89, l_Max_0);
                else
                    return NumberRange.new(l_Max_0, v89);
                end;
            end), 
            v18.CreateChildSchema("Max", v85, l_NumberSchema_1, l_Max_0, function(v90)
                if l_Min_0 <= v90 then
                    return NumberRange.new(l_Min_0, v90);
                else
                    return NumberRange.new(v90, l_Min_0);
                end;
            end)
        };
    end, 
    GetComponents = function(v91)
        return v18.GetComponentsString({
            v91.Min, 
            v91.Max
        });
    end, 
    Validate = function(v92)
        return typeof(v92) == "NumberRange";
    end, 
    GetDefaultValue = function()
        return NumberRange.new(0);
    end
};
v18.PropertyNameSchema = {
    Type = "PropertyName", 
    ErrorStyle = "PropertyCellError", 
    Validate = function(v93)
        return typeof(v93) == "string";
    end, 
    GetDefaultValue = function()
        return "";
    end
};
v18.RectSchema = {
    Type = "Vector", 
    Components = {
        ""
    }, 
    GetValue = function(v94)
        local v95 = v18.GetComponentsValues(v94[1]);
        return Rect.new(v95[1], v95[2], v95[3], v95[4]);
    end, 
    GetChildren = function(v96, v97)
        local l_NumberSchema_2 = v18.NumberSchema;
        local l_X_1 = v96.Min.X;
        local l_X_2 = v96.Max.X;
        local l_Y_1 = v96.Min.Y;
        local l_Y_2 = v96.Max.Y;
        return {
            v18.CreateChildSchema("X0", v97, l_NumberSchema_2, l_X_1, function(v103)
                return Rect.new(v103, l_Y_1, l_X_2, l_Y_2);
            end), 
            v18.CreateChildSchema("Y0", v97, l_NumberSchema_2, l_Y_1, function(v104)
                return Rect.new(l_X_1, v104, l_X_2, l_Y_2);
            end), 
            v18.CreateChildSchema("X1", v97, l_NumberSchema_2, l_X_2, function(v105)
                return Rect.new(l_X_1, l_Y_1, v105, l_Y_2);
            end), 
            v18.CreateChildSchema("Y1", v97, l_NumberSchema_2, l_Y_2, function(v106)
                return Rect.new(l_X_1, l_Y_1, l_X_2, v106);
            end)
        };
    end, 
    GetComponents = function(v107)
        return v18.GetComponentsString({
            v107.Min.X, 
            v107.Min.Y, 
            v107.Max.X, 
            v107.Max.Y
        });
    end, 
    Validate = function(v108)
        return typeof(v108) == "Rect";
    end, 
    GetDefaultValue = function()
        return Rect.new(Vector2.zero, Vector2.zero);
    end
};
v18.SelectorSchema = {
    Type = "Breadcrumb", 
    Delimiters = {
        ">>", 
        ">", 
        "::", 
        ":", 
        "%.", 
        " ", 
        "#", 
        ","
    }, 
    ErrorStyle = "PropertyCellError", 
    GetImageProps = l_Breadcrumb_0.GetSelectorIcon, 
    Name = "Selector", 
    Validate = function(v109)
        return typeof(v109) == "string";
    end, 
    GetDefaultValue = function()
        return "";
    end
};
v18.DeriveSchema = {
    Type = "Derive", 
    Validate = function(v110)
        local v111 = false;
        if typeof(v110) == "Instance" then
            v111 = v110:IsA("StyleSheet");
        end;
        return v111;
    end, 
    GetDefaultValue = function()
        return Instance.new("StyleSheet");
    end
};
v18.FolderSchema = {
    Type = "Breadcrumb", 
    GetImageProps = function(v112)
        return {
            Image = if not v14[v112:lower()] then v13.getClassIcon("Folder") else v14[v112:lower()](), 
            Size = l_Attribute_0
        };
    end, 
    Name = "Folder", 
    Validate = function(v113)
        return typeof(v113) == "string";
    end, 
    GetDefaultValue = function()
        return "";
    end
};
v18.StyleSheetSchema = {
    Type = "Breadcrumb", 
    GetImageProps = function(v114)
        return {
            Image = if not v14[v114:lower()] then v13.getClassIcon("StyleSheet") else v14[v114:lower()](), 
            Size = l_Attribute_0
        };
    end, 
    Name = "StyleSheet", 
    Validate = function(v115)
        return typeof(v115) == "string";
    end, 
    GetDefaultValue = function()
        return "";
    end
};
v18.ThemeSchema = {
    Type = "Theme", 
    Validate = function(v116)
        return typeof(v116) == "string";
    end, 
    GetDefaultValue = function()
        return "";
    end
};
v18.TextSchema = {
    Type = "Text", 
    Validate = function(v117)
        return typeof(v117) == "string";
    end, 
    GetDefaultValue = function()
        return "";
    end
};
v18.TransparencySchema = {
    Type = "Slider", 
    Min = 0, 
    Max = 1, 
    ShowInput = true, 
    InputPrecision = 3, 
    SnapIncrement = 0.05, 
    Validate = function(v118)
        return typeof(v118) == "number";
    end, 
    GetDefaultValue = function()
        return 0;
    end
};
v18.NumberSequenceSchema = {
    Type = "NumberSequence", 
    Validate = function(v119)
        return typeof(v119) == "NumberSequence";
    end, 
    GetDefaultValue = function()
        return NumberSequence.new(0);
    end
};
v18.UDimSchema = {
    Type = "Vector", 
    Components = {
        ""
    }, 
    GetValue = function(v120)
        local v121 = v18.GetComponentsValues(v120[1]);
        return UDim.new(v121[1], v121[2]);
    end, 
    GetChildren = function(v122, v123)
        local l_NumberSchema_3 = v18.NumberSchema;
        local l_Scale_0 = v122.Scale;
        local l_Offset_0 = v122.Offset;
        return {
            v18.CreateChildSchema("Scale", v123, l_NumberSchema_3, l_Scale_0, function(v127)
                return UDim.new(v127, l_Offset_0);
            end), 
            v18.CreateChildSchema("Offset", v123, l_NumberSchema_3, l_Offset_0, function(v128)
                return UDim.new(l_Scale_0, v128);
            end)
        };
    end, 
    GetComponents = function(v129)
        return v18.GetComponentsString({
            v129.Scale, 
            v129.Offset
        });
    end, 
    Validate = function(v130)
        return typeof(v130) == "UDim";
    end, 
    GetDefaultValue = function()
        return UDim.new();
    end
};
v18.UDim2Schema = {
    Type = "Vector", 
    Components = {
        ""
    }, 
    GetValue = function(v131)
        local v132 = v18.GetComponentsValues(v131[1]);
        return UDim2.new(v132[1], v132[2], v132[3], v132[4]);
    end, 
    GetChildren = function(v133, v134)
        local l_NumberSchema_4 = v18.NumberSchema;
        local l_Scale_1 = v133.X.Scale;
        local l_Offset_1 = v133.X.Offset;
        local l_Scale_2 = v133.Y.Scale;
        local l_Offset_2 = v133.Y.Offset;
        return {
            v18.CreateChildSchema("X-Scale", v134, l_NumberSchema_4, l_Scale_1, function(v140)
                return UDim2.new(v140, l_Offset_1, l_Scale_2, l_Offset_2);
            end), 
            v18.CreateChildSchema("X-Offset", v134, l_NumberSchema_4, l_Offset_1, function(v141)
                return UDim2.new(l_Scale_1, v141, l_Scale_2, l_Offset_2);
            end), 
            v18.CreateChildSchema("Y-Scale", v134, l_NumberSchema_4, l_Scale_2, function(v142)
                return UDim2.new(l_Scale_1, l_Offset_1, v142, l_Offset_2);
            end), 
            v18.CreateChildSchema("Y-Offset", v134, l_NumberSchema_4, l_Offset_2, function(v143)
                return UDim2.new(l_Scale_1, l_Offset_1, l_Scale_2, v143);
            end)
        };
    end, 
    GetComponents = function(v144)
        return v18.GetComponentsString({
            v144.X.Scale, 
            v144.X.Offset, 
            v144.Y.Scale, 
            v144.Y.Offset
        });
    end, 
    Validate = function(v145)
        return typeof(v145) == "UDim2";
    end, 
    GetDefaultValue = function()
        return UDim2.new();
    end
};
v18.Vector2Schema = {
    Type = "Vector", 
    Components = {
        ""
    }, 
    GetValue = function(v146)
        local v147 = v18.GetComponentsValues(v146[1]);
        return Vector2.new(v147[1], v147[2]);
    end, 
    GetChildren = function(v148, v149)
        local l_NumberSchema_5 = v18.NumberSchema;
        local l_X_3 = v148.X;
        local l_Y_3 = v148.Y;
        return {
            v18.CreateChildSchema("X", v149, l_NumberSchema_5, l_X_3, function(v153)
                return Vector2.new(v153, l_Y_3);
            end), 
            v18.CreateChildSchema("Y", v149, l_NumberSchema_5, l_Y_3, function(v154)
                return Vector2.new(l_X_3, v154);
            end)
        };
    end, 
    GetComponents = function(v155)
        return v18.GetComponentsString({
            v155.X, 
            v155.Y
        });
    end, 
    Validate = function(v156)
        return typeof(v156) == "Vector2";
    end, 
    GetDefaultValue = function()
        return Vector2.new();
    end
};
v18.Vector3Schema = {
    Type = "Vector", 
    Components = {
        ""
    }, 
    GetValue = function(v157)
        local v158 = v18.GetComponentsValues(v157[1]);
        return (Vector3.new(v158[1], v158[2], v158[3]));
    end, 
    GetChildren = function(v159, v160)
        local l_NumberSchema_6 = v18.NumberSchema;
        local l_X_4 = v159.X;
        local l_Y_4 = v159.Y;
        local l_Z_1 = v159.Z;
        return {
            v18.CreateChildSchema("X", v160, l_NumberSchema_6, l_X_4, function(v165)
                return (Vector3.new(v165, l_Y_4, l_Z_1));
            end), 
            v18.CreateChildSchema("Y", v160, l_NumberSchema_6, l_Y_4, function(v166)
                return (Vector3.new(l_X_4, v166, l_Z_1));
            end), 
            v18.CreateChildSchema("Z", v160, l_NumberSchema_6, l_Z_1, function(v167)
                return (Vector3.new(l_X_4, l_Y_4, v167));
            end)
        };
    end, 
    GetComponents = function(v168)
        return v18.GetComponentsString({
            v168.X, 
            v168.Y, 
            v168.Z
        });
    end, 
    Validate = function(v169)
        return typeof(v169) == "Vector3";
    end, 
    GetDefaultValue = function()
        return (Vector3.new());
    end
};
v18.TokenReferenceSchema = {
    Type = "TokenReference", 
    ErrorStyle = "PropertyCellError", 
    HideSelfTokens = false, 
    Validate = function(v170)
        return typeof(v170) == "string";
    end, 
    GetDefaultValue = function()
        return "$";
    end
};
v18.createClassProperties = function(v171)
    if not v18.allProperties[v171] then
        local l_status_0, l_result_0 = pcall(function()
            return Instance.new(v171);
        end);
        if not (l_status_0 and l_result_0) then
            local l_status_1, l_result_1 = pcall(function()
                return game:GetService(v171);
            end);
            l_status_0 = l_status_1;
            l_result_0 = l_result_1;
        end;
        if l_status_0 and l_result_0 then
            local function _(v176, v177)
                if typeof(v18.possiblePropertyTypes[v176]) ~= "table" then
                    v18.possiblePropertyTypes[v176] = {};
                end;
                v18.possiblePropertyTypes[v176][v177] = true;
            end;
            local v179 = {};
            l_forEach_0(l_ReflectionService_0:GetPropertyNames(v171), function(v180)
                if v180:sub(1, 1) == v180:sub(1, 1):lower() then
                    return ;
                else
                    local v181 = nil;
                    local l_status_2, l_result_2 = pcall(function()
                        return l_result_0[v180];
                    end);
                    l_status_0 = l_status_2;
                    v181 = l_result_2;
                    if not l_status_0 or v181 == nil then
                        return ;
                    else
                        l_status_2 = typeof(v181);
                        if typeof(v18.possiblePropertyTypes[v180]) ~= "table" then
                            v18.possiblePropertyTypes[v180] = {};
                        end;
                        v18.possiblePropertyTypes[v180][l_status_2] = true;
                        for _, v185 in v18.OverridenSchemas, nil, nil do
                            if v185.Property == v180 and typeof(v181) == v185.Type then
                                v179[v180] = v185.Schema;
                                return ;
                            end;
                        end;
                        if typeof(v181) == "EnumItem" then
                            v179[v180] = v18.CreateSelectSchema(v181);
                            return ;
                        else
                            v179[v180] = v18.getAttributeSchema(v181);
                            return ;
                        end;
                    end;
                end;
            end);
            v18.allProperties[v171] = v179;
            pcall(function()
                l_result_0:Remove();
            end);
            return ;
        else
            return ;
        end;
    else
        return ;
    end;
end;
v18.getPropertySchema = function(v186, v187)
    if not (v187 ~= nil) or v187 == "" then
        for _, v189 in v18.allProperties, nil, nil do
            if v189[v186] then
                return v189[v186];
            end;
        end;
    else
        v18.createClassProperties(v187);
        local v190 = v18.allProperties[v187];
        if v190 then
            return v190[v186];
        end;
    end;
    return nil;
end;
v18.getPropertyNames = function(v191)
    local v192 = {};
    if not v191 or v191 == "" then
        for v193, _ in pairs(v18.allProperties) do
            v192 = l_append_0(v192, l_keys_0(v18.allProperties[v193]));
        end;
        return (l_keys_0(l_collectSet_0(v192)));
    else
        if l_startsWith_0(v191, "::") then
            v191 = l_trim_0(v191:sub(3));
        end;
        v18.createClassProperties(v191);
        if v18.allProperties[v191] then
            v192 = l_keys_0(v18.allProperties[v191]);
        end;
        return v192;
    end;
end;
v18.getPossiblePropertyTypes = function(v195)
    return l_keys_0(v18.possiblePropertyTypes[v195] or {});
end;
v18.getAttributeSchema = function(v196)
    if typeof(v196) == "string" then
        if v196:sub(1, 1) == "$" then
            return v18.TokenReferenceSchema;
        else
            return v18.TextSchema;
        end;
    elseif typeof(v196) == "EnumItem" then
        return v18.CreateSelectSchema(v196);
    elseif not v18.PropertySchemas[typeof(v196)] then
        return v18.SelectTokenSchema;
    else
        return v18.PropertySchemas[typeof(v196)];
    end;
end;
v18.OverridenSchemas = {
    {
        Property = "Transparency", 
        Type = "number", 
        Schema = v18.TransparencySchema
    }, 
    {
        Property = "BackgroundTransparency", 
        Type = "number", 
        Schema = v18.TransparencySchema
    }
};
v18.PropertySchemas = {
    Token = v18.TokenReferenceSchema, 
    boolean = v18.CheckboxSchema, 
    BrickColor = v18.BrickColorSchema, 
    CFrame = v18.CFrameSchema, 
    Color3 = v18.ColorSchema, 
    ColorSequence = v18.ColorSequenceSchema, 
    NumberRange = v18.NumberRangeSchema, 
    NumberSequence = v18.NumberSequenceSchema, 
    Font = v18.FontSchema, 
    number = v18.NumberSchema, 
    string = v18.TextSchema, 
    Rect = v18.RectSchema, 
    UDim = v18.UDimSchema, 
    UDim2 = v18.UDim2Schema, 
    Vector2 = v18.Vector2Schema, 
    Vector3 = v18.Vector3Schema
};
v18.SelectTokenSchema = {
    Type = "Select", 
    Items = v16(l_collectArray_0(v18.PropertySchemas, function(v197, v198)
        return {
            Id = v198, 
            Label = v197
        };
    end)), 
    PlaceholderText = "Select Type...", 
    Validate = function(_)
        return true;
    end, 
    GetDefaultValue = function()
        return nil;
    end
};
l_forEach_0({
    "Frame", 
    "ImageButton", 
    "ImageLabel", 
    "Part", 
    "ScrollingFrame", 
    "TextBox", 
    "TextButton", 
    "TextLabel"
}, function(v200)
    v18.createClassProperties(v200);
end);
return v18;
