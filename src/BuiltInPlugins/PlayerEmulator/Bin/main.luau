return function(v0, v1)
    if v0 then
        local l_Parent_0 = script.Parent.Parent;
        local v3 = require(l_Parent_0.Packages.Roact);
        local v4 = require(l_Parent_0.Src.Components.PlayerEmulatorPlugin);
        (function()
            local v5 = nil;
            v5 = v3.mount((v3.createElement(v4, {
                plugin = v0, 
                onPluginWillDestroy = function()
                    if v5 then
                        v3.unmount(v5);
                    end;
                end, 
                pluginLoaderContext = v1
            })));
        end)();
        return ;
    else
        return ;
    end;
end;
