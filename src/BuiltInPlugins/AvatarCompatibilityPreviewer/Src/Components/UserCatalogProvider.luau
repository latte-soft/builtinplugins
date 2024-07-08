local l_HttpService_0 = game:GetService("HttpService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v2 = require(l_script_FirstAncestor_0.Packages.Cryo);
local v3 = require(l_script_FirstAncestor_0.Packages.Dash);
local v4 = require(l_script_FirstAncestor_0.Packages.React);
local v5 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local v6 = require(l_script_FirstAncestor_0.Src.Util.EquipmentStateContext);
local v7 = require(l_script_FirstAncestor_0.Src.Util.UserCatalogContext);
local v8 = require(l_script_FirstAncestor_0.Src.Util.getPaletteFromKey);
local v9 = require(l_script_FirstAncestor_0.Src.Hooks.useUserCatalogFolder);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local function v14(v11)
    local l_v11_Attribute_0 = v11:GetAttribute("RBX_Palette");
    if l_v11_Attribute_0 then
        local v13 = v8(l_v11_Attribute_0);
        if v13 == nil then
            warn((("%* has an invalid palette \"%*\". This is a bug in the plugin, please report it."):format(v11, l_v11_Attribute_0)));
            return nil;
        else
            assert(v13 ~= nil, v5.LUAU_ANALYZE_ERROR);
            return {
                palette = v13, 
                item = {
                    source = v5.SOURCE_INSTANCE, 
                    instance = v11
                }
            };
        end;
    else
        warn((("%* did not have a palette set. This is a bug in the plugin, please report it."):format(v11)));
        return nil;
    end;
end;
return function(v15)
    local v16 = v9();
    local v17 = v4.useContext(v6);
    local v21, v22 = v4.useState(v3.collectArray(v16:GetChildren(), function(_, v19)
        local v20 = v14(v19);
        if v20 == nil then
            v19:Destroy();
        end;
        return v20;
    end));
    local v30 = v4.useCallback(function(v23, v24, v25)
        for _, v27 in v16:GetChildren() do
            local l_v27_FirstChild_0 = v27:FindFirstChild(v5.REFERENCE_VALUE_NAME);
            if not (not (l_v27_FirstChild_0 ~= nil) or not l_v27_FirstChild_0:IsA("ObjectValue")) then
                assert(l_v27_FirstChild_0:IsA("ObjectValue"), v5.LUAU_ANALYZE_ERROR);
                if l_v27_FirstChild_0.Value == v25 and v27:GetAttribute("RBX_Palette") == v24.Key then
                    v17.removeEquippedItem({
                        palette = v24, 
                        item = {
                            source = v5.SOURCE_INSTANCE, 
                            instance = v27
                        }
                    });
                    v27:Destroy();
                    break;
                end;
            end;
        end;
        local l_ObjectValue_0 = Instance.new("ObjectValue");
        l_ObjectValue_0.Name = v5.REFERENCE_VALUE_NAME;
        l_ObjectValue_0.Value = v25;
        l_ObjectValue_0.Parent = v23;
        v23:SetAttribute("RBX_Palette", v24.Key);
        v23.Name = l_HttpService_0:GenerateGUID();
        v23.Parent = v16;
    end, {
        v17.removeEquippedItem, 
        v16
    });
    local v33 = v4.useCallback(function(v31, v32)
        v17.removeEquippedItem({
            palette = v31, 
            item = {
                source = v5.SOURCE_INSTANCE, 
                instance = v32
            }
        });
        v32:Destroy();
    end, {
        v17.removeEquippedItem
    });
    v4.useEffect(function()
        local v38 = v16.ChildAdded:Connect(function(v34)
            v22(function(v35)
                local v36 = table.clone(v35);
                local v37 = v14(v34);
                assert(v37 ~= nil, "Newly added child to the catalog couldn't be turned into a catalog item");
                table.insert(v36, v37);
                return v36;
            end);
        end);
        local v44 = v16.ChildRemoved:Connect(function(v39)
            v22(function(v40)
                local v43 = v3.findIndex(v40, function(v41)
                    local v42 = false;
                    if v41.item.source == v5.SOURCE_INSTANCE then
                        v42 = v41.item.instance == v39;
                    end;
                    return v42;
                end);
                if v43 == nil then
                    return v40;
                else
                    return (v2.List.removeIndex(v40, v43));
                end;
            end);
        end);
        v22(v3.map(v16:GetChildren(), function(v45)
            local v46 = v14(v45);
            assert(v46 ~= nil, "Newly added child to the catalog couldn't be turned into a catalog item");
            return v46;
        end));
        return function()
            v38:Disconnect();
            v44:Disconnect();
        end;
    end, {});
    return v4.createElement(v7.Provider, {
        value = {
            equippableItems = v21, 
            addNewItem = v30, 
            removeItem = v33
        }
    }, v15.children);
end;
