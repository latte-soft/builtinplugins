return function(v0, v1)
    local l_Parent_0 = script.Parent.Parent;
    if not require(l_Parent_0.Src.Flags.getFFlagAssetImportRefactorPluginInit)() then
        if v0 then
            if require(l_Parent_0.Src.Utility.DEPRECATED_shouldPluginRun)() then
                require(script.Parent.DEPRECATED_commonInit)();
            else
                return ;
            end;
        else
            return ;
        end;
    end;
    local v3 = require(l_Parent_0.Packages.Framework);
    local v4 = require(l_Parent_0.Packages.Roact);
    local v5 = require(l_Parent_0.Packages.Rodux);
    local v6 = require(l_Parent_0.Src.Reducers.MainReducer);
    local v7 = require(script.Parent.createContextItems);
    local v8 = require(l_Parent_0.Src.MainPlugin);
    local v9 = nil;
    local v10 = if not require(l_Parent_0.Src.Flags.getFFlagDebugAssetImporterPackageMigration)() then nil else v3.DeveloperTools.forPlugin(l_Parent_0.Name, v0);
    local function v11()
        v0.Name = l_Parent_0.Name;
        v9 = v4.mount((v4.createElement(v8, (v7(v0, v5.Store.new(v6, nil, {
            v5.thunkMiddleware
        }), v1)))));
    end;
    v0.Unloading:Connect(function()
        if v10 then
            v10:destroy();
        end;
        if v9 then
            v4.unmount(v9);
            v9 = nil;
        end;
    end);
    v11();
end;
