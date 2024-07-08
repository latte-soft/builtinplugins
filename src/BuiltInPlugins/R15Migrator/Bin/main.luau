return function(v0, v1)
    if v0 then
        require(script.Parent.defineLuaFlags);
        require(script.Parent.commonInit)();
        local l_Parent_0 = script.Parent.Parent;
        local v3 = require(l_Parent_0.Packages.Roact);
        local v4 = require(l_Parent_0.Src.MainPlugin);
        local v5 = require(l_Parent_0.Src.Util.hasInternalPermission)();
        local v6 = nil;
        local v7 = nil;
        if v5 then
            v7 = require(l_Parent_0.Packages.Dev.DeveloperTools).forPlugin(l_Parent_0.Name, v0);
        end;
        local function v8()
            v0.Name = l_Parent_0.Name;
            v6 = v3.mount((v3.createElement(v4, {
                Plugin = v0, 
                PluginLoaderContext = v1
            })));
            if v7 then
                v7:addRoactTree("R15 Migrator", v6);
            end;
        end;
        v0.Unloading:Connect(function()
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
end;
