local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Cryo);
local v2 = require(l_Parent_0.Src.Actions.SetSelectionIndex);
local v3 = require(l_Parent_0.Src.Thunks.UpdateSelectedAssets);
return function(v4, v5)
    return function(v6)
        local v7 = nil;
        local v8 = nil;
        local v9 = false;
        local v10 = false;
        if v4 then
            v9 = v4:IsModifierKeyDown(Enum.ModifierKey.Ctrl);
            v10 = v4:IsModifierKeyDown(Enum.ModifierKey.Shift);
        end;
        local v11 = v6:getState();
        v7 = if v9 or v10 then v11.AssetManagerReducer.selectedAssets else {};
        if v10 then
            v8 = v11.AssetManagerReducer.selectionIndex;
        end;
        if not (v5.ClassName == "Folder") then
            local v12 = nil;
            v12 = not v7[v5.key] and true or (not v9 or false);
            if not v10 then
                v7 = v1.Dictionary.join(v7, {
                    [v5.key] = v12
                });
                v6:dispatch(v2(v5.key));
            elseif v5.key <= v8 then
                for v13 = v5.key, v8 do
                    v7 = v1.Dictionary.join(v7, {
                        [v13] = v12
                    });
                end;
            else
                for v14 = v8, v5.key do
                    v7 = v1.Dictionary.join(v7, {
                        [v14] = v12
                    });
                end;
            end;
        else
            local v15 = nil;
            v15 = not v7[v5.Screen.LayoutOrder] and true or (not v9 or false);
            if not v10 then
                v7 = v1.Dictionary.join(v7, {
                    [v5.Screen.LayoutOrder] = v15
                });
                v6:dispatch(v2(v5.Screen.LayoutOrder));
            elseif v5.Screen.LayoutOrder <= v8 then
                for v16 = v5.Screen.LayoutOrder, v8 do
                    v7 = v1.Dictionary.join(v7, {
                        [v16] = v15
                    });
                end;
            else
                for v17 = v8, v5.Screen.LayoutOrder do
                    v7 = v1.Dictionary.join(v7, {
                        [v17] = v15
                    });
                end;
            end;
        end;
        v6:dispatch(v3(v7));
    end;
end;
