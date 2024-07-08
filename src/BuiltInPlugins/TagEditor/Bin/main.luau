return function(v0, v1)
    if v0 then
        local l_ImprovePluginSpeed_TagEditor_0 = game:GetFastFlag("ImprovePluginSpeed_TagEditor");
        if not l_ImprovePluginSpeed_TagEditor_0 then
            require(script.Parent.defineLuaFlags);
        end;
        require(script.Parent.commonInit)();
        local l_Parent_0 = script.Parent.Parent;
        if l_ImprovePluginSpeed_TagEditor_0 or require(l_Parent_0.Src.Util.shouldPluginRun)() then
            local v4 = require(l_Parent_0.Packages.Roact);
            local v5 = require(l_Parent_0.Packages.Framework);
            local v6 = require(l_Parent_0.Src.MainPlugin);
            local v7 = require(l_Parent_0.Src.Util.hasInternalPermission)();
            local v8 = nil;
            local v9 = nil;
            if v7 then
                v9 = v5.DeveloperTools.forPlugin(l_Parent_0.Name, v0);
            end;
            local function v10()
                v0.Name = l_Parent_0.Name;
                v8 = v4.mount((v4.createElement(v6, {
                    Plugin = v0, 
                    pluginLoaderContext = if not l_ImprovePluginSpeed_TagEditor_0 then nil else v1
                })));
                if v9 then
                    v9:addRoactTree("Roact tree", v8);
                end;
            end;
            v0.Unloading:Connect(function()
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
end;
