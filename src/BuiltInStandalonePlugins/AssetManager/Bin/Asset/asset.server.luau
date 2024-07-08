if plugin then
    local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetManager");
    require(l_script_FirstAncestor_0.Bin.Common.defineLuaFlags);
    if not game:GetFastFlag("DebugAssetMgInAssetDm") then
        local v1 = require(l_script_FirstAncestor_0.Packages.TestLoader);
        v1.launch("AssetManager", l_script_FirstAncestor_0.Src);
        if not v1.isCli() then
            if game:GetFastFlag("EnableAssetManager") then
                local v2 = v1.getDebugFlags("AssetManager");
                local l_FocusedDataModelSession_0 = plugin.MultipleDocumentInterfaceInstance.FocusedDataModelSession;
                local function v11()
                    if plugin.HostDataModelTypeIsCurrent then
                        if v2.MountAssetReactTree then
                            local v4 = require(l_script_FirstAncestor_0.Packages.React);
                            local v5 = require(l_script_FirstAncestor_0.Packages.ReactRoblox);
                            local v6 = v4.createElement(require(l_script_FirstAncestor_0.Src.MainPlugin), {
                                Plugin = plugin
                            });
                            local l_ScreenGui_0 = Instance.new("ScreenGui");
                            local v8 = v5.createRoot(l_ScreenGui_0);
                            assert(v8);
                            v8:render(v6);
                            l_ScreenGui_0.Parent = game:GetService("StarterGui");
                            do
                                local l_v8_0 = v8;
                                local function v10()
                                    if l_v8_0 then
                                        l_v8_0:render(nil);
                                        l_v8_0 = nil;
                                    end;
                                end;
                                plugin.Unloading:Connect(v10);
                                l_FocusedDataModelSession_0.CurrentDataModelTypeAboutToChange:Connect(v10);
                            end;
                        end;
                        return ;
                    else
                        return ;
                    end;
                end;
                l_FocusedDataModelSession_0.CurrentDataModelTypeChanged:Connect(v11);
                v11();
                return ;
            else
                return ;
            end;
        else
            return ;
        end;
    else
        return ;
    end;
else
    return ;
end;
