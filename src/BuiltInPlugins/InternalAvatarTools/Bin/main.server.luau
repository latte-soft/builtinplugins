if plugin then
    require(script.Parent.defineLuaFlags);
    if game:GetFastFlag("DebugAvatarInternalToolsPlugin") then
        local l_status_0, l_result_0 = pcall(function()
            return game:GetService("StudioService"):HasInternalPermission();
        end);
        if l_status_0 and l_result_0 then
            local l_Parent_0 = script.Parent.Parent;
            if not require(l_Parent_0.Src.Util.DebugFlags).RunTests() then
                require(script.Parent.commonInit)();
                local v3 = require(l_Parent_0.Packages.Roact);
                local v4 = require(l_Parent_0.Packages.Framework);
                local v5 = require(l_Parent_0.Src.MainPlugin);
                local v6 = nil;
                local v7 = nil;
                if l_result_0 then
                    v7 = v4.DeveloperTools.forPlugin(l_Parent_0.Name, plugin);
                end;
                local function v8()
                    plugin.Name = l_Parent_0.Name;
                    v6 = v3.mount((v3.createElement(v5, {
                        Plugin = plugin
                    })));
                    if v7 then
                        v7:addRoactTree("Roact tree", v6);
                    end;
                end;
                plugin.Unloading:Connect(function()
                    if v7 then
                        v7:destroy();
                    end;
                    if v6 then
                        v3.unmount(v6);
                        v6 = nil;
                    end;
                end);
                v8();
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
