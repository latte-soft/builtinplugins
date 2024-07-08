if plugin then
    require(script.Parent.defineLuaFlags);
    if not game:GetFastFlag("AudioDiscoveryLoader") then
        if not game:GetFastFlag("RetireAudioDiscoveryPlugin") then
            local l_Parent_0 = script.Parent.Parent;
            local v1 = require(l_Parent_0.Packages.Framework);
            local _, l_result_0 = pcall(function()
                return game:GetService("StudioService"):HasInternalPermission();
            end);
            if not require(l_Parent_0.Src.Util.DebugFlags).RunningUnderCLI() then
                if not game:GetFastFlag("RetireAudioDiscoveryPlugin") then
                    local l_status_1, l_result_1 = pcall(function()
                        return game:GetService("RunService"):IsEdit();
                    end);
                    if l_status_1 and l_result_1 then
                        require(script.Parent.commonInit)();
                        local v6 = require(l_Parent_0.Packages.Roact);
                        local l_Networking_0 = v1.Http.Networking;
                        local v8 = require(l_Parent_0.Src.MainPlugin);
                        local v9 = require(l_Parent_0.Src.Util.SoundAssetChecker);
                        local v10 = nil;
                        local v11 = nil;
                        local v12 = nil;
                        if l_result_0 then
                            v12 = v1.DeveloperTools.forPlugin(l_Parent_0.Name, plugin);
                        end;
                        local function v13()
                            plugin.Name = l_Parent_0.Name;
                            v11 = v9.new((l_Networking_0.new({
                                isInternal = true
                            })));
                            v11:start();
                            v10 = v6.mount((v6.createElement(v8, {
                                Plugin = plugin, 
                                SoundAssetChecker = v11
                            })));
                            if v12 then
                                v12:addRoactTree("Roact tree", v10);
                            end;
                        end;
                        plugin.Unloading:Connect(function()
                            if v11 then
                                v11:destroy();
                                v11 = nil;
                            end;
                            if v12 then
                                v12:destroy();
                            end;
                            if v10 then
                                v6.unmount(v10);
                                v10 = nil;
                            end;
                        end);
                        v13();
                        return ;
                    else
                        plugin:CreateToolbar("Audio Discovery"):CreateButton("ViewSounds", "View Sounds", "rbxlocaltheme://ViewSounds").Enabled = false;
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
    else
        return ;
    end;
else
    return ;
end;
