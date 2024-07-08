local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v4 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAvatarPreviewerCageEditingTools);
local v5 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAvatarPreviewerCageEditingTools);
local v6 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAvatarPreviewerReplicateEditorStateOnWorldModel);
local function v15(v7, v8, v9)
    local v10 = {};
    local l_v8_0 = v8;
    while true do
        assert(l_v8_0 ~= nil, "Iterating reference is nil");
        table.insert(v10, l_v8_0.Name);
        l_v8_0 = l_v8_0.Parent;
        if not v6() then
            assert(l_v8_0 ~= nil, "Reference child wasn't a part of reference");
        elseif l_v8_0 == nil then
            error((("Reference child wasn't a part of reference. Was looking for %*"):format((v8:GetFullName()))));
        end;
        if not (l_v8_0 ~= v7) then
            break;
        end;
    end;
    local l_v9_0 = v9;
    for v13 = #v10, 1, -1 do
        local l_l_v9_0_FirstChild_0 = l_v9_0:FindFirstChild(v10[v13]);
        if l_l_v9_0_FirstChild_0 == nil then
            return nil;
        else
            assert(l_l_v9_0_FirstChild_0 ~= nil, v2.LUAU_ANALYZE_ERROR);
            l_v9_0 = l_l_v9_0_FirstChild_0;
        end;
    end;
    if l_v9_0.ClassName ~= v8.ClassName then
        return nil;
    else
        return l_v9_0;
    end;
end;
return function(v16, v17, v18)
    v1.useEffect(function()
        if v17 == nil then
            return nil;
        else
            assert(v17 ~= nil, v2.LUAU_ANALYZE_ERROR);
            if v4() and v16 == nil then
                return nil;
            else
                assert(v16 ~= nil, v2.LUAU_ANALYZE_ERROR);
                local v19 = {};
                local function _(v20, v21)
                    local v22 = v15(v16, v20, v17);
                    if v22 == nil then
                        return ;
                    else
                        assert(v22 ~= nil, v2.LUAU_ANALYZE_ERROR);
                        v22[v21] = v20[v21];
                        return ;
                    end;
                end;
                local function v38(v24)
                    if not v24:IsA("Attachment") then
                        if not v24:IsA("ValueBase") then
                            if not (not v4() or not v24:IsA("BaseWrap")) then
                                v19[v24] = {
                                    v24.VerticesModified:Connect(function()
                                        local v25 = v15(v16, v24, v17);
                                        if v25 == nil then
                                            return ;
                                        else
                                            local v26 = false;
                                            if v25 ~= nil then
                                                v26 = v25:IsA("BaseWrap");
                                            end;
                                            assert(v26, v2.LUAU_ANALYZE_ERROR);
                                            v25:ModifyVertices(Enum.CageType.Outer, v24:GetVertices(Enum.CageType.Outer));
                                            return ;
                                        end;
                                    end)
                                };
                            end;
                            return ;
                        else
                            v19[v24] = {
                                v24:GetPropertyChangedSignal("Value"):Connect(function()
                                    local l_v24_0 = v24;
                                    local v28 = v15(v16, l_v24_0, v17);
                                    if not (v28 == nil) then
                                        assert(v28 ~= nil, v2.LUAU_ANALYZE_ERROR);
                                        v28.Value = l_v24_0.Value;
                                    end;
                                    if v18 ~= nil and (not v5() or v24.Name ~= v2.ORIGINAL_POSITION_VALUE) then
                                        v18();
                                    end;
                                end)
                            };
                            return ;
                        end;
                    else
                        v19[v24] = {};
                        table.insert(v19[v24], v24:GetPropertyChangedSignal("CFrame"):Connect(function()
                            if not v6() or v24:IsDescendantOf(game) then
                                local l_v24_1 = v24;
                                local v30 = v15(v16, l_v24_1, v17);
                                if not (v30 == nil) then
                                    assert(v30 ~= nil, v2.LUAU_ANALYZE_ERROR);
                                    v30.CFrame = l_v24_1.CFrame;
                                end;
                                if not v5() then
                                    for _, v32 in v17:GetChildren() do
                                        if v32:IsA("Accessory") then
                                            local l_Handle_0 = v32:FindFirstChild("Handle");
                                            if l_Handle_0 ~= nil then
                                                assert(l_Handle_0 ~= nil, v2.LUAU_ANALYZE_ERROR);
                                                local l_l_Handle_0_FirstChild_0 = l_Handle_0:FindFirstChild(v24.Name);
                                                if not (not (l_l_Handle_0_FirstChild_0 ~= nil) or not l_l_Handle_0_FirstChild_0:IsA("Attachment")) then
                                                    local v35 = false;
                                                    if l_l_Handle_0_FirstChild_0 ~= nil then
                                                        v35 = l_l_Handle_0_FirstChild_0:IsA("Attachment");
                                                    end;
                                                    assert(v35, v2.LUAU_ANALYZE_ERROR);
                                                    local l_AccessoryWeld_0 = l_Handle_0:FindFirstChild("AccessoryWeld");
                                                    if not (not (l_AccessoryWeld_0 ~= nil) or not l_AccessoryWeld_0:IsA("Weld")) then
                                                        local v37 = false;
                                                        if l_AccessoryWeld_0 ~= nil then
                                                            v37 = l_AccessoryWeld_0:IsA("Weld");
                                                        end;
                                                        assert(v37, v2.LUAU_ANALYZE_ERROR);
                                                        l_AccessoryWeld_0.C0 = l_l_Handle_0_FirstChild_0.CFrame;
                                                        l_AccessoryWeld_0.C1 = v24.CFrame;
                                                    end;
                                                end;
                                            end;
                                        end;
                                    end;
                                end;
                                return ;
                            else
                                return ;
                            end;
                        end));
                        return ;
                    end;
                end;
                for _, v40 in v16:GetDescendants() do
                    v38(v40);
                end;
                local v41 = v16.DescendantAdded:Connect(v38);
                local v46 = v16.DescendantRemoving:Connect(function(v42)
                    local v43 = v19[v42];
                    if v43 == nil then
                        return ;
                    else
                        for _, v45 in v43, nil, nil do
                            v45:Disconnect();
                        end;
                        return ;
                    end;
                end);
                return function()
                    v41:Disconnect();
                    v46:Disconnect();
                    for _, v48 in v19, nil, nil do
                        for _, v50 in v48, nil, nil do
                            v50:Disconnect();
                        end;
                    end;
                end;
            end;
        end;
    end, {
        v16, 
        v17
    });
end;
