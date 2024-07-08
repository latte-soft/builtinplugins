local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.React);
local v2 = require(l_Parent_0.Src.Util.Constants);
local _ = require(l_Parent_0.Src.Types);
local v4 = require(l_Parent_0.Src.Util.DEPRECATED_AvatarScreenContext);
local v5 = require(l_Parent_0.Src.Components.AvatarScreenContext);
local v6 = require(l_Parent_0.Src.Components.DisambiguationMenu);
local v7 = require(l_Parent_0.Src.Util.EquipmentStateContext);
local v8 = require(l_Parent_0.Src.Util.UserCatalogContext);
local v9 = require(l_Parent_0.Src.Util.createUnimplemented);
local v10 = require(script.useAssignLoneMeshParts);
local v11 = require(l_Parent_0.Src.Flags.getFFlagAvatarPreviewerSkinToneAlphaDetection);
local v12 = v1.createContext({
    addAmbiguousAsset = v9("addAmbiguousAsset"), 
    addLoneMeshPart = v9("addLoneMeshPart")
});
return {
    Context = v12, 
    Provider = function(v13)
        local v14, v15 = v1.useState({});
        local v18 = v1.useCallback(function(v16)
            v15(function(v17)
                v17 = table.clone(v17);
                table.insert(v17, v16);
                return v17;
            end);
        end, {});
        local v19 = v1.useContext(if not v11() then v4 else v5.Context);
        local v20 = v1.useContext(v7);
        local v21 = v1.useContext(v8);
        local v25 = v1.useCallback(function(v22)
            assert(#v22 > 0, "assignAmbiguousAssets called with no ambiguous assets");
            for _, v24 in v22, nil, nil do
                v21.addNewItem(v24.createdInstance, v24.palette, v24.worldModel);
                v20.addEquippedItem({
                    palette = v24.palette, 
                    item = {
                        source = v2.SOURCE_INSTANCE, 
                        instance = v24.createdInstance
                    }
                });
            end;
            v19.openPalette(v22[#v22].palette.Key);
            v15({});
        end, {
            v19.openPalette, 
            v20.addEquippedItem, 
            v21.addNewItem
        });
        local v26 = v10();
        local v27, v28 = v1.useState({});
        local v31 = v1.useCallback(function(v29, v30)
            if #v29 > 0 then
                v25(v29);
            end;
            if #v30 > 0 then
                v26(v30);
                v28({});
            end;
        end, {
            v25, 
            v26
        });
        local v35 = {
            addAmbiguousAsset = v18, 
            addLoneMeshPart = v1.useCallback(function(v32)
                v28(function(v33)
                    local v34 = table.clone(v33);
                    table.insert(v34, v32);
                    return v34;
                end);
            end, {})
        };
        local l_createElement_0 = v1.createElement;
        local l_Provider_0 = v12.Provider;
        local v38 = {
            value = v35
        };
        local l_children_0 = v13.children;
        local v40;
        if #v14 <= 0 then
            v40 = false;
            if not (#v27 > 0) then
                goto label0;
            end;
        end;
        v40 = v1.createElement(v6, {
            assign = v31, 
            ambiguousAssets = v14, 
            loneMeshParts = v27, 
            close = function()
                v15({});
                v28({});
            end
        });
        ::label0::;
        return l_createElement_0(l_Provider_0, v38, l_children_0, v40);
    end
};
