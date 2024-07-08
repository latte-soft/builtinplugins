if plugin then
    local l_script_FirstAncestor_0 = script:FindFirstAncestor("Ribbon");
    require(l_script_FirstAncestor_0.Bin.Common.defineLuaFlags);
    local v1 = require(l_script_FirstAncestor_0.Packages.TestLoader);
    v1.launch("Ribbon", l_script_FirstAncestor_0.Src);
    if not v1.isCli() then
        if game:GetFastFlag("EnableRibbonPlugin") then
            local v2 = v1.getDebugFlags("Ribbon");
            local l_MultipleDocumentInterfaceInstance_0 = plugin.MultipleDocumentInterfaceInstance;
            local v4 = nil;
            local v5 = nil;
            local function v10()
                if plugin.HostDataModelTypeIsCurrent then
                    if v2.MountAssetReactTree then
                        local v6 = require(l_script_FirstAncestor_0.Packages.React);
                        local v7 = require(l_script_FirstAncestor_0.Packages.ReactRoblox);
                        local v8 = v6.createElement(require(l_script_FirstAncestor_0.Src.MainPlugin), {
                            Plugin = plugin
                        });
                        local l_ScreenGui_0 = Instance.new("ScreenGui");
                        v5 = v7.createRoot(l_ScreenGui_0);
                        v5:render(v8);
                        l_ScreenGui_0.Parent = game:GetService("StarterGui");
                    end;
                    return ;
                else
                    return ;
                end;
            end;
            local function v11()
                if v4 then
                    v4:destroy();
                    v4 = nil;
                end;
                if v5 then
                    v5:render(nil);
                    v5 = nil;
                end;
            end;
            plugin.Unloading:Connect(v11);
            local l_FocusedDataModelSession_0 = l_MultipleDocumentInterfaceInstance_0.FocusedDataModelSession;
            l_FocusedDataModelSession_0.CurrentDataModelTypeAboutToChange:Connect(v11);
            l_FocusedDataModelSession_0.CurrentDataModelTypeChanged:Connect(v10);
            v10();
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
