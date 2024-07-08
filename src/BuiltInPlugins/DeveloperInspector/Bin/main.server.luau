if plugin then
    require(script.Parent.defineLuaFlags);
    if game:GetService("StudioService"):HasInternalPermission() then
        local l_Parent_0 = script.Parent.Parent;
        if not require(l_Parent_0.Src.Util.DebugFlags).RunningUnderCLI() then
            require(l_Parent_0.Src.Util.commonInit)();
            local v1 = require(l_Parent_0.Src.MainPlugin);
            local v2 = nil;
            local v3 = require(l_Parent_0.Packages.Roact);
            v3.setGlobalConfig({
                typeChecks = true, 
                propValidation = true, 
                elementTracing = true
            });
            local function _()
                plugin.Name = "DeveloperInspector";
                v2 = v3.mount((v3.createElement(v1, {
                    Plugin = plugin
                })));
            end;
            plugin.Unloading:Connect(function()
                if v2 then
                    v3.unmount(v2);
                    v2 = nil;
                end;
            end);
            plugin.Name = "DeveloperInspector";
            v2 = v3.mount((v3.createElement(v1, {
                Plugin = plugin
            })));
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
