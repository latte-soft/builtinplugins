if plugin then
    local l_Common_0 = script.Parent.Parent.Common;
    require(l_Common_0.defineLuaFlags);
    local l_status_0, l_result_0 = pcall(function()
        return game:GetService("StudioService"):HasInternalPermission();
    end);
    if l_status_0 and l_result_0 then
        require(l_Common_0.commonInit)();
        local l_Parent_0 = script.Parent.Parent;
        local v4 = require(l_Parent_0.Packages.Roact);
        local v5 = require(l_Parent_0.Packages.Framework);
        local v6 = require(l_Parent_0.Src.MainPlugin);
        local v7 = require(l_Parent_0.Src.Util.DMBridge);
        local v8 = nil;
        local v9 = nil;
        local function v10()
            plugin.Name = l_Parent_0.Name;
            v7.setPluginObject(plugin);
            v8 = v4.mount((v4.createElement(v6, {
                Plugin = plugin
            })));
            if l_result_0 then
                v9 = v5.DeveloperTools.forStandalonePlugin(l_Parent_0.Name, plugin, {
                    rootInstance = v8, 
                    rootPrefix = {
                        "UserInputPlaybackGui"
                    }
                });
            end;
            if v9 then
                v9:addRoactTree("Roact tree", v8);
            end;
        end;
        plugin.Unloading:Connect(function()
            if v9 then
                v9:destroy();
            end;
            if v8 then
                v4.unmount(v8);
                v8 = nil;
            end;
        end);
        v10();
        return ;
    else
        return ;
    end;
else
    return ;
end;
