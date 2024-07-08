if plugin then
    local l_Parent_0 = script.Parent.Parent;
    local l_Common_0 = script.Parent.Parent.Common;
    require(l_Common_0.defineLuaFlags);
    if not require(l_Common_0.Parent.Src.Util.DebugFlags).RunningUnderCLI() then
        if game:FindService("DebuggerUIService") then
            require(l_Common_0.commonInit)();
            local v2 = game:GetService("StudioService"):HasInternalPermission();
            local v3 = require(l_Parent_0.Packages.Roact);
            local v4 = require(l_Parent_0.Packages.Framework);
            local v5 = require(l_Parent_0.Src.MainPlugin);
            local v6 = nil;
            local v7 = nil;
            local function v8()
                plugin.Name = l_Parent_0.Name;
                v6 = v3.mount((v3.createElement(v5, {
                    Plugin = plugin
                })));
                if v2 then
                    if v7 then
                        v7:destroy();
                        v7 = nil;
                    end;
                    v7 = v4.DeveloperTools.forStandalonePlugin(l_Parent_0.Name, plugin, {});
                end;
                if v7 then
                    v7:addRoactTree("Roact tree", v6);
                end;
            end;
            plugin.Unloading:Connect(function()
                if v7 then
                    v7:destroy();
                    v7 = nil;
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
