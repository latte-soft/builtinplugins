local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v1 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAvatarPreviewerEquippedHoverMenu);
local v2 = require(l_script_FirstAncestor_0.Packages.React);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v4 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local v5 = require(l_script_FirstAncestor_0.Src.Util.EquipmentStateContext);
return function(v6)
    local v7 = v2.useContext(v5);
    local v8 = v2.useRef({});
    local v9 = v2.useRef({});
    assert(v8.current ~= nil, v4.LUAU_ANALYZE_ERROR);
    assert(v9.current ~= nil, v4.LUAU_ANALYZE_ERROR);
    v2.useEffect(function()
        if v6 == nil then
            return ;
        else
            assert(v6 ~= nil, v4.LUAU_ANALYZE_ERROR);
            local l_current_0 = v8.current;
            local v11 = {};
            for v12, v13 in v7.equippedItems, nil, nil do
                if v13.item.source == v4.SOURCE_INSTANCE then
                    assert(v13.item.source == v4.SOURCE_INSTANCE, v4.LUAU_ANALYZE_ERROR);
                    if v8.current[v13] ~= nil then
                        if not (v1() and v13.isHidden) then
                            v11[v13] = l_current_0[v13];
                            if v13.palette.UpdateInstances ~= nil then
                                v13.palette.UpdateInstances(l_current_0[v13], v12);
                            end;
                        end;
                    elseif not v1() then
                        v11[v13] = v13.palette.WearInstance(v13.item.instance, v6, v12);
                    elseif not v13.isHidden then
                        v11[v13] = v13.palette.WearInstance(v13.item.instance, v6, v12);
                    end;
                end;
            end;
            for _, v15 in v9.current, nil, nil do
                if v11[v15] == nil and v8.current[v15] ~= nil then
                    for _, v17 in v8.current[v15], nil, nil do
                        if v17 ~= nil then
                            v17:Destroy();
                        end;
                    end;
                end;
            end;
            v9.current = v7.equippedItems;
            v8.current = v11;
            return ;
        end;
    end, {
        v6, 
        v7.equippedItems
    });
    v2.useEffect(function()
        return function()
            for _, v19 in v8.current, nil, nil do
                for _, v21 in v19, nil, nil do
                    v21:Destroy();
                end;
            end;
            table.clear(v8.current);
        end;
    end, {
        v6
    });
end;
