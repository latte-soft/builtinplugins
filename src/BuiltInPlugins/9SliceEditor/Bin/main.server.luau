if plugin then
    require(script.Parent.defineFlags);
    local l_9SliceEditorShorterLoadTime_0 = game:GetFastFlag("9SliceEditorShorterLoadTime");
    local l_status_0, l_result_0 = pcall(function()
        return game:GetService("StudioService"):HasInternalPermission();
    end);
    if not l_status_0 then
        l_result_0 = false;
    end;
    local l_Parent_0 = script.Parent.Parent;
    local v4 = require(l_Parent_0.Src.Util.DebugFlags);
    if not v4.RunningUnderCLI() then
        require(script.Parent.commonInit)();
        local v5 = nil;
        local v6 = nil;
        local function v11()
            local v7 = require(l_Parent_0.Packages.Roact);
            local v8 = require(l_Parent_0.Packages.Framework);
            local v9 = require(l_Parent_0.Src.MainPlugin);
            if l_result_0 then
                v5 = v8.DeveloperTools.forPlugin(l_Parent_0.Name, plugin);
            end;
            local function v10()
                plugin.Name = l_Parent_0.Name;
                v6 = v7.mount((v7.createElement(v9, {
                    Plugin = plugin
                })));
                if v5 then
                    v5:addRoactTree("Roact tree", v6);
                end;
            end;
            plugin.Unloading:Connect(function()
                if v5 then
                    v5:destroy();
                end;
                if v6 then
                    v7.unmount(v6);
                    v6 = nil;
                end;
            end);
            v10();
        end;
        if not l_9SliceEditorShorterLoadTime_0 then
            v11();
        elseif plugin.HostDataModelType ~= Enum.StudioDataModelType.Edit then
            return ;
        else
            if not (not l_result_0 or not v4.EnableDeveloperTools()) then
                v5 = require(l_Parent_0.Packages.Framework).DeveloperTools.forPlugin(l_Parent_0.Name, plugin);
            end;
            local v12 = nil;
            do
                local l_v12_0 = v12;
                l_v12_0 = game:GetService("GuiService").Open9SliceEditor:Connect(function(v14)
                    if l_v12_0 then
                        l_v12_0:Disconnect();
                        l_v12_0 = nil;
                    end;
                    local v15 = require(l_Parent_0.Packages.Roact);
                    local v16 = require(l_Parent_0.Src.MainPlugin);
                    plugin.Name = l_Parent_0.Name;
                    v6 = v15.mount((v15.createElement(v16, {
                        Plugin = plugin, 
                        InitialEditorInstanceRequest = v14
                    })));
                    if v5 then
                        v5:addRoactTree("Roact tree", v6);
                    end;
                    plugin.Unloading:Connect(function()
                        if v5 then
                            v5:destroy();
                        end;
                        if v6 then
                            v15.unmount(v6);
                            v6 = nil;
                        end;
                    end);
                end);
            end;
        end;
        return ;
    else
        return ;
    end;
else
    return ;
end;
