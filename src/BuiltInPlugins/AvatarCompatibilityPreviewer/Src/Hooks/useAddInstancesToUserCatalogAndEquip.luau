local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v3 = require(l_script_FirstAncestor_0.Src.Resources.CatalogItems);
local v4 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local v5 = require(l_script_FirstAncestor_0.Src.Components.DisambiguationMenuContext);
local v6 = require(l_script_FirstAncestor_0.Src.Util.EquipmentStateContext);
local v7 = require(l_script_FirstAncestor_0.Src.Util.UserCatalogContext);
local v8 = require(l_script_FirstAncestor_0.Src.Util.filterDescendants);
local v9 = require(l_script_FirstAncestor_0.Src.Util.isAvatar);
return function()
    local v10 = v1.useContext(v5.Context);
    local v11 = v1.useContext(v6);
    local v12 = v1.useContext(v7);
    return v1.useCallback(function(v13)
        local v14 = nil;
        local v15 = {};
        local v16 = {};
        local v17 = {};
        local v18 = 0;
        for _, v20 in v13, nil, nil do
            if v20:IsA("MeshPart") and table.find(v4.LIMBS, v20.Name) == nil then
                if not (not (v20.Parent ~= nil) or not v9(v20.Parent)) then
                    v10.addLoneMeshPart(v20);
                end;
            else
                local v21 = {};
                local v22 = 0;
                for _, v24 in v3, nil, nil do
                    for _, v26 in v24, nil, nil do
                        local v27 = v26.CreateCustomInstanceFromSelection(v20);
                        if v27 ~= nil then
                            assert(v27 ~= nil, v4.LUAU_ANALYZE_ERROR);
                            if typeof(v27) == "string" then
                                v17[v20] = v27;
                            else
                                assert(v27 ~= v20, "CreateCustomInstanceFromSelection should always give a new instance");
                                assert(v27.Parent == nil, "CreateCustomInstanceFromSelection should give an isolated instance");
                                v8(v27, {
                                    "Handle"
                                });
                                v22 = v22 + 1;
                                v21[v26] = v27;
                            end;
                        end;
                    end;
                end;
                if v22 == 0 then
                    table.insert(v15, v20);
                elseif v22 > 1 then
                    local v28 = v20:Clone();
                    v8(v28, {
                        "Handle"
                    });
                    v10.addAmbiguousAsset({
                        worldModel = v28, 
                        instances = v21
                    });
                else
                    local v29, v30 = next(v21);
                    local v31 = false;
                    if v29 ~= nil then
                        v31 = v30 ~= nil;
                    end;
                    assert(v31, v4.LUAU_ANALYZE_ERROR);
                    if v29.Key == "Shoes" then
                        v16[v20] = v29;
                        v18 = v18 + 1;
                    else
                        v12.addNewItem(v30, v29, v20);
                        v11.addEquippedItem({
                            palette = v29, 
                            item = {
                                source = v4.SOURCE_INSTANCE, 
                                instance = v30
                            }
                        });
                        v14 = v29;
                    end;
                end;
            end;
        end;
        if v18 == 2 then
            local l_Folder_0 = Instance.new("Folder");
            local v33 = nil;
            local v34 = nil;
            for v35, v36 in v16, nil, nil do
                if v34 == nil then
                    v34 = v36;
                elseif v36 ~= v34 then
                    warn("Shoes palette mismatch found");
                end;
                local v37 = nil;
                if not v35:IsA("Folder") then
                    v37 = v35;
                elseif #v35:GetChildren() <= 1 then
                    v37 = v35:GetChildren()[1];
                else
                    break;
                end;
                local v38 = v37:Clone();
                local l_Handle_0 = v38:FindFirstChild("Handle");
                if v38:IsA("Accessory") and l_Handle_0 ~= nil then
                    v38.Parent = l_Folder_0;
                    if l_Handle_0:FindFirstChild("LeftFootAttachment") then
                        v33 = v37;
                    end;
                end;
            end;
            local v40 = v34.CreateCustomInstanceFromSelection(l_Folder_0);
            if not (not (v40 ~= nil and typeof(v40) ~= "string") or not v40:IsA("Instance")) and v33 ~= nil then
                v12.addNewItem(v40, v34, v33);
                v11.addEquippedItem({
                    palette = v34, 
                    item = {
                        source = v4.SOURCE_INSTANCE, 
                        instance = v40
                    }
                });
                v14 = v34;
            else
                if typeof(v40) == "string" then
                    local v41, _ = next(v16);
                    if v41 ~= nil then
                        v17[v41] = v40;
                    end;
                end;
                for v43, _ in v16, nil, nil do
                    table.insert(v15, v43);
                end;
            end;
        elseif v18 == 1 then
            local v45, v46 = next(v16);
            local v47 = v46.CreateCustomInstanceFromSelection(v45);
            if v45 ~= nil then
                if v47 and typeof(v47) == "string" then
                    table.insert(v15, v45);
                elseif not (not v47 or not v47:IsA("Instance")) then
                    if not v45:IsA("Folder") then
                        v12.addNewItem(v47, v46, v45);
                    else
                        v12.addNewItem(v47, v46, v45:GetChildren()[1] or v45);
                    end;
                    v11.addEquippedItem({
                        palette = v46, 
                        item = {
                            source = v4.SOURCE_INSTANCE, 
                            instance = v47
                        }
                    });
                    if v47:IsA("Accessory") then
                        v17[v45] = "OnlyOneShoe";
                        table.insert(v15, v45);
                    end;
                    v14 = v46;
                end;
            end;
        elseif v18 > 2 then
            local v48, _ = next(v16);
            if v48 ~= nil then
                v17[v48] = "NeedTwoShoes";
            end;
            for v50, _ in v16, nil, nil do
                table.insert(v15, v50);
            end;
        end;
        return {
            activePalette = v14, 
            invalidInstances = v15, 
            extraErrors = v17
        };
    end, {
        v10.addAmbiguousAsset, 
        v10.addLoneMeshPart, 
        v11.addEquippedItem, 
        v12.addNewItem
    });
end;
