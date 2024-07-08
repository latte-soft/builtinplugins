local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.React);
local v2 = require(l_Parent_0.Src.Util.EquipmentStateContext);
local v3 = require(l_Parent_0.Src.Util.Serializers);
local _ = require(l_Parent_0.Src.Types);
local v5 = require(l_Parent_0.Src.Hooks.useAvatarAssets);
local v6 = require(l_Parent_0.Src.Hooks.useAddEquippedItem);
local v7 = require(l_Parent_0.Src.Hooks.useRemoveEquippedItem);
local v8 = require(l_Parent_0.Src.Hooks.useSerializedState);
local v9 = require(l_Parent_0.Src.Hooks.useSetEquippedItemIsHidden);
local v10 = require(l_Parent_0.Src.Hooks.useIncrementedState);
local v11 = require(l_Parent_0.Src.Hooks.useUserCatalogFolder);
local v12 = require(l_Parent_0.Src.Flags.getFFlagAvatarPreviewerEquippedHoverMenu)();
local v13 = require(l_Parent_0.Src.Flags.getFFlagAvatarPreviewerReplicateEditorStateOnWorldModel);
return function(v14)
    local v15 = v11();
    local v16, v17 = v8(v14.root, "equippedItems", {}, (v1.useMemo(function()
        return v3.createEquippedItemsSerializer(v15);
    end, {
        v15
    })));
    local v18 = if not v12 then nil else v9(v17, false);
    local v19 = if not v12 then nil else v9(v17, true);
    local v27 = if not v12 then nil else v1.useCallback(function(v20, v21)
        v17(function(v22)
            local v23 = table.clone(v22);
            for v24, v25 in v23, nil, nil do
                if not (v21 ~= nil) or table.find(v21, v25) == nil then
                    local v26 = table.clone(v25);
                    v26.isHidden = v20;
                    v23[v24] = v26;
                end;
            end;
            return v23;
        end);
    end, {
        v16
    });
    local v28 = v6(v17);
    local v29 = v7(v17);
    local v30 = v1.useCallback(function()
        v17({});
    end, {});
    local v36 = v1.useCallback(function(v31, v32)
        v17(function(v33)
            local v34 = false;
            if v31 > 0 then
                v34 = v31 <= #v33;
            end;
            assert(v34, "Starting index out of range");
            v34 = false;
            if v32 > 0 then
                v34 = v32 <= #v33;
            end;
            assert(v34, "New index out of range");
            v33 = table.clone(v33);
            local v35 = table.remove(v33, v31);
            assert(v35 ~= nil, "Removed item is invalid even though we checked bounds");
            table.insert(v33, v32, v35);
            return v33;
        end);
    end, {});
    local v37 = v5(v16);
    local v38 = v10();
    return v1.createElement(v2.Provider, {
        value = {
            equippedItems = v16, 
            addEquippedItem = v28, 
            removeEquippedItem = v29, 
            removeAllEquippedItems = v30, 
            moveEquippedItemsToIndex = v36, 
            hideEquippedItem = v19, 
            showEquippedItem = v18, 
            setHideAllEquippedItems = v27, 
            avatarAssets = v37, 
            startIgnoringChildren = if not v13() then nil else v1.useCallback(function()
                v38.increment();
                return function()
                    v38.decrement();
                end;
            end, {}), 
            isIgnoringChildren = v38.amount > 0
        }
    }, v14.children);
end;
