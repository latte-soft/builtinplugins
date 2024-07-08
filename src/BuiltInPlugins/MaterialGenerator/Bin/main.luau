return function(v0, v1)
    if v0 then
        require(script.Parent.defineLuaFlags);
        require(script.Parent.commonInit)();
        local l_Parent_0 = script.Parent.Parent;
        local l_MemStorageService_0 = game:GetService("MemStorageService");
        local v4 = require(l_Parent_0.Packages.TestLoader);
        local v5 = require(l_Parent_0.SharedPluginConstants);
        local v6 = require(l_Parent_0.Src.Flags.getFFlagShowMaterialGeneratorFromElsewhere);
        if game:GetFastFlag("EnableMaterialGenerator") then
            local v7 = require(l_Parent_0.Packages.React);
            local v8 = require(l_Parent_0.Packages.ReactRoblox);
            local v9 = require(l_Parent_0.Src.MainPlugin);
            local v10 = nil;
            local v11 = nil;
            if v4.hasInternalPermission() then
                v11 = require(l_Parent_0.Packages.Dev.DeveloperTools).forPlugin(l_Parent_0.Name, v0);
            end;
            local function v13()
                v0.Name = l_Parent_0.Name;
                local v12 = v7.createElement(v9, {
                    Plugin = v0, 
                    pluginLoaderContext = v1
                });
                v10 = v8.createRoot(Instance.new("Frame"));
                v10:render(v12);
                if v11 then
                    v11:addRoactTree("Roact tree", v10);
                end;
            end;
            v0.Unloading:Connect(function()
                if v11 then
                    v11:destroy();
                end;
                if v10 then
                    v10:render(nil);
                end;
            end);
            if v6() then
                v1.signals["MemStorageService." .. v5.LOAD_MATERIAL_GENERATOR]:Connect(function()
                    task.defer(function()
                        l_MemStorageService_0:Fire(v5.MATERIAL_GENERATOR_READY);
                    end);
                end);
            end;
            v13();
            return ;
        else
            return ;
        end;
    else
        return ;
    end;
end;
