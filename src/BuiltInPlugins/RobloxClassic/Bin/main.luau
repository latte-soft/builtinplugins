return function(v0, v1)
    if v0 then
        require(script.Parent.defineLuaFlags);
        require(script.Parent.commonInit)();
        local l_Parent_0 = script.Parent.Parent;
        local v3 = require(l_Parent_0.Packages.Roact);
        local v4 = require(l_Parent_0.Packages.Framework);
        local v5 = require(l_Parent_0.Src.MainPlugin);
        local v6 = require(l_Parent_0.Src.Util.hasInternalPermission)();
        local v7 = nil;
        local v8 = nil;
        if v6 then
            v8 = v4.DeveloperTools.forPlugin(l_Parent_0.Name, v0);
        end;
        local function v9()
            v0.Name = l_Parent_0.Name;
            v7 = v3.mount((v3.createElement(v5, {
                Plugin = v0, 
                PluginLoaderContext = v1
            })));
            if v8 then
                v8:addRoactTree("RobloxClassic", v7);
            end;
        end;
        v0.Unloading:Connect(function()
            if v8 then
                v8:destroy();
            end;
            if v7 then
                v3.unmount(v7);
                v7 = nil;
            end;
        end);
        v9();
        return ;
    else
        return ;
    end;
end;
