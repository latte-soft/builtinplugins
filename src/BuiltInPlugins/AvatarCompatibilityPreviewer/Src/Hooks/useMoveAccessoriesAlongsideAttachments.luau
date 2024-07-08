local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v4 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAvatarPreviewerCageEditingTools);
return function(v5)
    assert(v4(), "FFlagAvatarPreviewerEditingTools not enabled");
    v1.useEffect(function()
        if v5 == nil then
            return nil;
        else
            assert(v5 ~= nil, v2.LUAU_ANALYZE_ERROR);
            local function v14(v6)
                for _, v8 in v5:GetChildren() do
                    if v8:IsA("Accessory") then
                        local l_Handle_0 = v8:FindFirstChild("Handle");
                        if l_Handle_0 ~= nil then
                            assert(l_Handle_0 ~= nil, v2.LUAU_ANALYZE_ERROR);
                            local l_l_Handle_0_FirstChild_0 = l_Handle_0:FindFirstChild(v6.Name);
                            if not (not (l_l_Handle_0_FirstChild_0 ~= nil) or not l_l_Handle_0_FirstChild_0:IsA("Attachment")) then
                                local v11 = false;
                                if l_l_Handle_0_FirstChild_0 ~= nil then
                                    v11 = l_l_Handle_0_FirstChild_0:IsA("Attachment");
                                end;
                                assert(v11, v2.LUAU_ANALYZE_ERROR);
                                local l_AccessoryWeld_0 = l_Handle_0:FindFirstChild("AccessoryWeld");
                                if not (not (l_AccessoryWeld_0 ~= nil) or not l_AccessoryWeld_0:IsA("Weld")) then
                                    local v13 = false;
                                    if l_AccessoryWeld_0 ~= nil then
                                        v13 = l_AccessoryWeld_0:IsA("Weld");
                                    end;
                                    assert(v13, v2.LUAU_ANALYZE_ERROR);
                                    l_AccessoryWeld_0.C0 = l_l_Handle_0_FirstChild_0.CFrame;
                                    l_AccessoryWeld_0.C1 = v6.CFrame;
                                end;
                            end;
                        end;
                    end;
                end;
            end;
            local v15 = {};
            for _, v17 in v5:GetDescendants() do
                if v17:IsA("Attachment") then
                    assert(v17:IsA("Attachment"), v2.LUAU_ANALYZE_ERROR);
                    if v17:FindFirstAncestorWhichIsA("Accessory") == nil then
                        v14(v17);
                        table.insert(v15, v17:GetPropertyChangedSignal("CFrame"):Connect(function()
                            v14(v17);
                        end));
                    end;
                end;
            end;
            return function()
                for _, v19 in v15, nil, nil do
                    v19:Disconnect();
                end;
            end;
        end;
    end, {
        v5
    });
end;
