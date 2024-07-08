if game:GetService("StudioService"):HasInternalPermission() then
    if plugin then
        require(script.Parent.defineLuaFlags);
        require(script.Parent.commonInit)();
        local l_Parent_0 = script.Parent.Parent;
        local v1 = require(l_Parent_0.Packages.TestLoader);
        v1.launch("BulkFaceImporter", l_Parent_0.Src);
        if not v1.isCli() and v1.hasInternalPermission() then
            if require(l_Parent_0.Src.Util.shouldPluginRun)() then
                local v2 = require(l_Parent_0.Packages.React);
                local v3 = require(l_Parent_0.Packages.ReactRoblox);
                local v4 = require(l_Parent_0.Packages.Framework);
                local v5 = require(l_Parent_0.Src.MainPlugin);
                local v6 = nil;
                local v7 = nil;
                if v1.hasInternalPermission() then
                    v7 = v4.DeveloperTools.forPlugin(l_Parent_0.Name, plugin);
                end;
                local function v9()
                    plugin.Name = l_Parent_0.Name;
                    local v8 = v2.createElement(v5, {
                        Plugin = plugin
                    });
                    v6 = v3.createRoot(Instance.new("Frame"));
                    v6:render(v8);
                    if v7 then
                        v7:addRoactTree("Roact tree", v6);
                    end;
                end;
                plugin.Unloading:Connect(function()
                    if v7 then
                        v7:destroy();
                    end;
                    if v6 then
                        v6:render(nil);
                    end;
                end);
                v9();
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
