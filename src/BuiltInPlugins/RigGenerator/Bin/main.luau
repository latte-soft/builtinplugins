return function(v0, v1)
    if v0 then
        require(script.Parent.defineLuaFlags);
        require(script.Parent.commonInit)();
        local l_Parent_0 = script.Parent.Parent;
        local v3 = require(l_Parent_0.Packages.React);
        local v4 = require(l_Parent_0.Packages.ReactRoblox);
        local v5 = require(l_Parent_0.Packages.Framework);
        local v6 = require(l_Parent_0.Src.MainPlugin);
        local v7 = nil;
        local v8 = require(l_Parent_0.Src.Util.hasInternalPermission);
        local v9 = nil;
        if v8() then
            v9 = v5.DeveloperTools.forPlugin(l_Parent_0.Name, v0);
        end;
        local function v11()
            v0.Name = l_Parent_0.Name;
            local v10 = v3.createElement(v6, {
                Plugin = v0, 
                PluginLoaderContext = v1
            });
            v7 = v4.createRoot(Instance.new("Frame"));
            v7:render(v10);
            if v9 then
                v9:addRoactTree("Roact tree", v7);
            end;
        end;
        v0.Unloading:Connect(function()
            if v9 then
                v9:destroy();
            end;
            if v7 then
                v7:render(nil);
            end;
        end);
        v11();
        return ;
    else
        return ;
    end;
end;
