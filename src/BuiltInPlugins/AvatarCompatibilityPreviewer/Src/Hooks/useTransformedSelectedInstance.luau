local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Src.Util.SelectionWrapper);
local v3 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local v4 = require(l_script_FirstAncestor_0.Src.Hooks.useEventConnection);
local v5 = require(l_script_FirstAncestor_0.Src.Hooks.useIncrementedState);
local v6 = require(l_script_FirstAncestor_0.Src.Hooks.useRememberLastValue);
local v7 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAvatarPreviewerHandleAvatarDeletion);
local v8 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAvatarPreviewerFixMeshSwitching);
local function v16(v9, v10, v11)
    local v12 = {};
    local function v13()
        v11(v10(v9) and v9);
    end;
    table.insert(v12, v9.DescendantAdded:Connect(v13));
    table.insert(v12, v9.DescendantRemoving:Connect(function()
        task.defer(v13);
    end));
    table.insert(v12, v9:GetPropertyChangedSignal("Name"):Connect(v13));
    if v9:IsA("Model") then
        table.insert(v12, v9:GetPropertyChangedSignal("PrimaryPart"):Connect(v13));
    end;
    table.insert(v12, v9.Destroying:Connect(v13));
    if v7() then
        table.insert(v12, v9.AncestryChanged:Connect(function()
            v11(v10(v9) and v9);
        end));
    end;
    v11(v10(v9) and v9);
    return function()
        for _, v15 in v12, nil, nil do
            v15:Disconnect();
        end;
    end;
end;
return function(v17)
    local v18 = v2:use():get();
    local v19, v20 = v1.useState(nil);
    local v21 = v5();
    local v22, v23 = v1.useState(false);
    local v24 = v1.useRef(nil);
    local v26 = v1.useCallback(function(v25)
        if v25 ~= nil then
            if v8() then
                v23(true);
            end;
            v20(v25);
            return ;
        else
            if v8() then
                v23(false);
            end;
            v21.increment();
            return ;
        end;
    end, {});
    local v28 = v1.useCallback(function()
        if v24.current ~= nil then
            v24.current();
            v24.current = nil;
        end;
        local v27 = v18:Get()[1];
        if v27 == nil then
            return ;
        else
            v24.current = v16(v27, v17, v26);
            return ;
        end;
    end, {
        v26
    });
    v4(v18.SelectionChanged, v28, {
        v26
    });
    v1.useEffect(v28, {});
    v1.useEffect(function()
        if v19 == nil then
            return nil;
        else
            assert(v19 ~= nil, v3.LUAU_ANALYZE_ERROR);
            return (v16(v19, v17, v26));
        end;
    end, {
        v19, 
        v26
    });
    local v29 = v6();
    return v1.useMemo(function()
        local v30 = v19 and v29(v17(v19));
        if not v8() then
            return v30, nil;
        else
            return v30, v22;
        end;
    end, {
        v19, 
        v21.amount, 
        if not v8() then nil else v22
    });
end;
