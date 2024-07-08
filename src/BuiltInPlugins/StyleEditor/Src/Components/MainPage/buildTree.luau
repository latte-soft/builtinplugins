local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v2 = require(l_Parent_0.Src.Util.DesignHelpers);
local v3 = require(l_Parent_0.Src.Util.MenuHelpers);
local v4 = require(l_Parent_0.Src.Util.StyleSchema);
local v5 = require(l_Parent_0.Src.Resources.ModernIcons);
local v6 = require(l_Parent_0.Src.Util.TreeTableHelpers);
local v7 = require(l_Parent_0.Packages.Dash);
local l_collectArray_0 = v7.collectArray;
local l_forEach_0 = v7.forEach;
local l_join_0 = v7.join;
local l_map_0 = v7.map;
local l_startsWith_0 = v7.startsWith;
local l_insert_0 = table.insert;
local l_Attribute_0 = require(l_Parent_0.Src.Resources.PluginStyles):GetAttribute("Icon16");
local function v15(v16)
    if v16 then
        return l_collectArray_0(v16:GetChildren(), function(_, v18)
            if v18:IsA("StyleRule") then
                local l_SelectorSchema_0 = v4.SelectorSchema;
                if v18.Selector == "" then
                    l_SelectorSchema_0 = l_join_0(v4.SelectorSchema, {
                        Editing = true
                    });
                end;
                return {
                    Name = {
                        Actions = v3.MoreAction, 
                        ErrorMessage = not v18 and "" or v18.SelectorError, 
                        Schema = l_SelectorSchema_0, 
                        Value = v18.Selector
                    }, 
                    Id = v6.createItemId(v18), 
                    Instance = v18, 
                    Children = v15(v18)
                };
            else
                return nil;
            end;
        end);
    else
        return {};
    end;
end;
local function v30(v20)
    if v20 == nil then
        return {};
    else
        local v21 = {
            ["UI Elements"] = {}, 
            Tags = {}, 
            Components = {}
        };
        local v22 = {
            "UI Elements", 
            "Tags", 
            "Components"
        };
        l_forEach_0(v20:GetStyleRules(), function(v23)
            if v23:IsA("StyleRule") then
                local v24 = v23:GetAttribute("StyleCategory") or v2.getSelectorCategory(v23.Selector);
                if not v21[v24] then
                    v21[v24] = {};
                    l_insert_0(v22, v24);
                end;
                l_insert_0(v21[v24], v23);
            end;
        end);
        return (l_collectArray_0(v22, function(_, v26)
            local v27 = v21[v26];
            if #v27 == 0 then
                return nil;
            else
                return {
                    Id = v6.createItemId(v20, v26), 
                    Name = {
                        Actions = v3.MoreAction, 
                        LeftIcon = {
                            Image = if v26 == "UI Elements" then v5.Selectors.Class() else if v26 == "Tags" then v5.Selectors.Tag() else v5.folder(), 
                            Size = l_Attribute_0
                        }, 
                        Value = v26
                    }, 
                    Children = l_map_0(v27, function(v28)
                        local l_SelectorSchema_1 = v4.SelectorSchema;
                        if v28.Selector == "" then
                            l_SelectorSchema_1 = l_join_0(v4.SelectorSchema, {
                                Editing = true
                            });
                        end;
                        return {
                            Name = {
                                Actions = v3.MoreAction, 
                                ErrorMessage = not v28 and "" or v28.SelectorError, 
                                Schema = l_SelectorSchema_1, 
                                Value = v28.Selector
                            }, 
                            Id = v6.createItemId(v28), 
                            Instance = v28, 
                            Children = v15(v28)
                        };
                    end)
                };
            end;
        end));
    end;
end;
local _ = function(v31)
    return (l_collectArray_0(v31, function(v32, v33)
        return {
            Name = {
                Actions = v3.MoreAction, 
                Schema = v4.FolderSchema, 
                Value = v32.Name or v32
            }, 
            Id = v6.createItemId(v32), 
            Instance = if typeof(v32) == "Instance" then v32 else nil, 
            Children = l_collectArray_0(v33, function(_, v35)
                return {
                    Name = {
                        Actions = v3.MoreAction, 
                        Schema = v4.StyleSheetSchema, 
                        Value = v35.Name
                    }, 
                    Id = v6.createItemId(v35), 
                    Children = v30(v35), 
                    Instance = v35
                };
            end)
        };
    end));
end;
return function(v37, v38)
    if v38 and v38.Parent then
        if not v37 then
            v37 = {
                l_ReplicatedStorage_0
            };
        end;
        local v39 = {
            Tokens = {}, 
            Designs = {}
        };
        local v40 = {};
        local v41 = {
            "Designs", 
            "Tokens", 
            "Themes"
        };
        l_forEach_0(v37, function(v42)
            l_forEach_0(v42:GetDescendants(), function(v43)
                local l_v43_Attribute_0 = v43:GetAttribute("StyleCategory");
                if not v43:IsA("Folder") or not l_v43_Attribute_0 then
                    if v43:IsA("StyleSheet") then
                        local l_Parent_1 = v43.Parent;
                        if not l_v43_Attribute_0 then
                            l_v43_Attribute_0 = not v2.isTheme(v43) and "Other" or "Themes";
                        end;
                        if v38 == v43 then
                            l_v43_Attribute_0 = "Designs";
                        end;
                        if l_v43_Attribute_0 == "Themes" then
                            local v46 = not l_Parent_1:IsA("Folder") and "Other" or l_Parent_1;
                            if not v40[v46] then
                                v40[v46] = {};
                            end;
                            l_insert_0(v40[v46], v43);
                            return ;
                        else
                            if not v39[l_v43_Attribute_0] then
                                v39[l_v43_Attribute_0] = {};
                                l_insert_0(v41, l_v43_Attribute_0);
                            end;
                            l_insert_0(v39[l_v43_Attribute_0], v43);
                        end;
                    end;
                elseif not (not l_startsWith_0(l_v43_Attribute_0, "Themes") or v40[v43]) then
                    v40[v43] = {};
                    return ;
                end;
            end);
        end);
        return (l_collectArray_0(v41, function(_, v48)
            local v49 = v39[v48];
            if v48 == "Designs" and #v49 > 0 then
                local v50 = v49[1];
                local l_Name_0 = v50.Name;
                if not l_Name_0:match("StyleSheet") then
                    l_Name_0 = l_Name_0 .. " StyleSheet";
                end;
                if not v50 then
                    return nil;
                else
                    return {
                        Name = {
                            Actions = v3.FullSpanMoreAction, 
                            ExpandByDefault = true, 
                            FullSpan = true, 
                            Schema = l_join_0(v4.StyleSheetSchema, {
                                GetImageProps = v7.None
                            }), 
                            Value = l_Name_0, 
                            LeftIcon = {
                                Image = v5.Standard.DesignSheet(), 
                                Size = l_Attribute_0
                            }
                        }, 
                        Id = v6.createItemId(v50), 
                        Children = v30(v50), 
                        Instance = v50
                    };
                end;
            else
                local v52 = nil;
                local v53 = nil;
                if not l_startsWith_0(v48, "Themes") then
                    v53 = v5.Standard.TokenSheet();
                    v52 = l_map_0(v49, function(v54)
                        local l_StyleSheetSchema_0 = v4.StyleSheetSchema;
                        if v54.Name == "" then
                            l_StyleSheetSchema_0 = l_join_0(l_StyleSheetSchema_0, {
                                Editing = true
                            });
                        end;
                        return {
                            Name = {
                                Actions = v3.MoreAction, 
                                Schema = l_StyleSheetSchema_0, 
                                Value = v54.Name
                            }, 
                            Id = v6.createItemId(v54), 
                            Children = v30(v54), 
                            Instance = v54
                        };
                    end);
                else
                    v52 = l_collectArray_0(v40, function(v56, v57)
                        return {
                            Name = {
                                Actions = v3.MoreAction, 
                                Schema = v4.FolderSchema, 
                                Value = v56.Name or v56
                            }, 
                            Id = v6.createItemId(v56), 
                            Instance = if typeof(v56) == "Instance" then v56 else nil, 
                            Children = l_collectArray_0(v57, function(_, v59)
                                return {
                                    Name = {
                                        Actions = v3.MoreAction, 
                                        Schema = v4.StyleSheetSchema, 
                                        Value = v59.Name
                                    }, 
                                    Id = v6.createItemId(v59), 
                                    Children = v30(v59), 
                                    Instance = v59
                                };
                            end)
                        };
                    end);
                    v53 = v5.Standard.ThemeSheet();
                end;
                return {
                    Name = {
                        Actions = v3.FullSpanMoreAction, 
                        ExpandByDefault = true, 
                        FullSpan = true, 
                        Value = v48, 
                        LeftIcon = {
                            Image = v53, 
                            Size = l_Attribute_0
                        }
                    }, 
                    Id = v6.createItemId(v48), 
                    Children = v52
                };
            end;
        end));
    else
        return {
            {
                Id = v6.createItemId("Design"), 
                Name = {
                    Actions = v3.FullSpanMoreAction, 
                    FullSpan = true, 
                    Value = "Design"
                }
            }
        };
    end;
end;
