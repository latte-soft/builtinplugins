local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v1 = require(l_script_FirstAncestor_0.Packages.AvatarToolsShared);
local v2 = require(l_script_FirstAncestor_0.Packages.Dash);
local v3 = require(l_script_FirstAncestor_0.Packages.React);
local v4 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v6 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAvatarPreviewerEditingTools);
local l_AccessoryUtil_0 = v1.Util.AccessoryAndBodyToolShared.AccessoryUtil;
local function v13(v8, v9, v10)
    local l_WrapLayer_0 = v10:FindFirstChildWhichIsA("WrapLayer");
    if l_WrapLayer_0 == nil then
        return nil;
    else
        assert(l_WrapLayer_0 ~= nil, v4.LUAU_ANALYZE_ERROR);
        local l_v8_FirstChildWhichIsA_0 = v8:FindFirstChildWhichIsA("WrapTarget", true);
        if l_v8_FirstChildWhichIsA_0 == nil then
            return nil;
        else
            return (((l_WrapLayer_0.CageOrigin * l_WrapLayer_0.ImportOrigin) * l_v8_FirstChildWhichIsA_0.ImportOriginWorld:Inverse()) * v8.CFrame) * v9;
        end;
    end;
end;
return function(v14)
    v3.useEffect(function()
        if v14 == nil then
            return nil;
        else
            assert(v14 ~= nil, v4.LUAU_ANALYZE_ERROR);
            local v15 = {};
            local function v20(v16, v17)
                local v18, v19 = l_AccessoryUtil_0:findMatchingAccessoryAndAvatarAttachments(v16, v14);
                if v19 == nil then
                    return nil;
                else
                    v17.Part0 = v16;
                    v17.C0 = v13(v19.Parent, v19.CFrame, v16) or v18.CFrame;
                    v17.C1 = v19.CFrame;
                    v17.Part1 = v19.Parent;
                    if v6() then
                        v17.Name = "AccessoryWeld";
                    end;
                    v17.Parent = v16;
                    return v19.Parent;
                end;
            end;
            local function v25(v21)
                local l_Handle_0 = v21:FindFirstChild("Handle");
                if l_Handle_0 ~= nil and l_Handle_0:IsA("BasePart") then
                    local v23 = false;
                    if l_Handle_0 ~= nil then
                        v23 = l_Handle_0:IsA("BasePart");
                    end;
                    assert(v23, v4.LUAU_ANALYZE_ERROR);
                    if l_Handle_0:FindFirstChildWhichIsA("Weld") ~= nil then
                        return ;
                    else
                        local l_Weld_0 = Instance.new("Weld");
                        table.insert(v15, {
                            accessoryHandle = l_Handle_0, 
                            limb = v20(l_Handle_0, l_Weld_0), 
                            weld = l_Weld_0
                        });
                        return ;
                    end;
                else
                    return ;
                end;
            end;
            local function v28()
                for _, v27 in v15, nil, nil do
                    if v27.limb == nil then
                        v27.limb = v20(v27.accessoryHandle, v27.weld);
                    end;
                end;
            end;
            local function v30(v29)
                if not v29:IsA("Accessory") then
                    if v29:IsA("BasePart") then
                        v28();
                    end;
                    return ;
                else
                    task.delay(0.1, v25, v29);
                    return ;
                end;
            end;
            local function v35(v31)
                if not v31:IsA("Accessory") then
                    if v31:IsA("BasePart") then
                        for _, v33 in v15, nil, nil do
                            if v33.limb == v31 then
                                v33.weld.Parent = nil;
                                v33.limb = nil;
                            end;
                        end;
                    end;
                    return ;
                else
                    v15 = v2.filter(v15, function(v34)
                        return v34.accessoryHandle.Parent ~= v31;
                    end);
                    return ;
                end;
            end;
            for _, v37 in v14:GetChildren() do
                if not v37:IsA("Accessory") then
                    if v37:IsA("BasePart") then
                        v28();
                    end;
                else
                    task.delay(0.1, v25, v37);
                end;
            end;
            local v38 = v14.ChildAdded:Connect(v30);
            local v39 = v14.ChildRemoved:Connect(v35);
            return function()
                v38:Disconnect();
                v39:Disconnect();
            end;
        end;
    end, {
        v14
    });
end;
