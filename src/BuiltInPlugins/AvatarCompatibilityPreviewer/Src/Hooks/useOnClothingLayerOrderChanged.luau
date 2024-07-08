local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Src.Resources.CatalogItems);
local v3 = require(l_script_FirstAncestor_0.Src.Util.EquipmentStateContext);
local v4 = require(l_script_FirstAncestor_0.Src.Util.getItemAccessoryType);
local v5 = require(l_script_FirstAncestor_0.Src.Util.DEPRECATED_isLayeredClothing);
local v6 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAvatarPreviewerClothingTypeIcons);
return function()
    local v7 = v1.useContext(v3);
    return v1.useCallback(function(v8, v9)
        local v10 = nil;
        local v11 = nil;
        local v12 = 0;
        for v13, v14 in v7.equippedItems, nil, nil do
            if not v6() then
                if not v5(v14) then
                    continue;
                end;
            elseif not (v4(v14) == "layered") then
                continue;
            end;
            v12 = v12 + 1;
            if v12 == v8 then
                v10 = v13;
            elseif v12 == v9 then
                v11 = v13;
            end;
            if not (not (v10 ~= nil) or v11 == nil) then
                break;
            end;
        end;
        if not (v10 ~= nil) or v11 == nil then
            local v15 = {
                "Couldn't resolve true indices of layered clothing", 
                ("Swapping %* with %*"):format(v8, v9), 
                ("trueLayeredClothingIndex = %*"):format(v10), 
                (("#equipmentState.equippedItems = %*"):format(#v7.equippedItems))
            };
            for v16, v17 in v7.equippedItems, nil, nil do
                table.insert(v15, (("\t%*. %* (Layered clothing = %*)"):format(v16, v17.palette.Key, table.find(v2.clothing, v17.palette) ~= nil)));
            end;
            error(table.concat(v15, "\n"));
        end;
        v7.moveEquippedItemsToIndex(v10, v11);
    end, {
        v7.equippedItems
    });
end;
