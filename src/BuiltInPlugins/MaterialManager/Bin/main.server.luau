if plugin then
    local l_Parent_0 = script.Parent.Parent;
    require(script.Parent.defineLuaFlags);
    local l_status_0, l_result_0 = pcall(function()
        return game:GetService("StudioService"):HasInternalPermission();
    end);
    require(script.Parent.commonInit)();
    local v3 = require(l_Parent_0.Packages.TestLoader);
    v3.launch(l_Parent_0.Name, l_Parent_0.Src);
    if not v3.isCli() then
        local v4 = require(l_Parent_0.Packages.Roact);
        local v5 = require(l_Parent_0.Packages.Framework);
        local v6 = require(l_Parent_0.Src.MainPlugin);
        local v7 = nil;
        local v8 = nil;
        if not (not l_status_0 or not l_result_0) then
            v8 = v5.DeveloperTools.forPlugin(l_Parent_0.Name, plugin);
        end;
        local function v9()
            plugin.Name = l_Parent_0.Name;
            v7 = v4.mount((v4.createElement(v6, {
                Plugin = plugin
            })));
            if v8 then
                v8:addRoactTree("Roact tree", v7);
            end;
        end;
        plugin.Unloading:Connect(function()
            if v8 then
                v8:destroy();
            end;
            if v7 then
                v4.unmount(v7);
                v7 = nil;
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
