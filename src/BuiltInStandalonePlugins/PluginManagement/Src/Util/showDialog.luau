local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local l_ContextServices_0 = require(l_Parent_0.Packages.Framework).ContextServices;
local v3 = require(l_Parent_0.Src.Components.InstallationDialog);
local v4 = require(l_Parent_0.Src.Components.MainView);
local v5 = require(l_Parent_0.Src.Util.getPluginGlobals);
return function(v6)
    local v7 = nil;
    local function v8()
        if v7 then
            v1.unmount(v7);
        end;
    end;
    local v9 = {
        Dialog = v1.createElement(v3, {
            pluginId = v6, 
            OnButtonClicked = v8, 
            OnClose = v8
        }, {
            Main = v1.createElement(v4, {
                pluginId = v6
            })
        })
    };
    local v10 = v5();
    v7 = v1.mount((l_ContextServices_0.provide({
        l_ContextServices_0.Plugin.new(v10.plugin), 
        l_ContextServices_0.Store.new(v10.store), 
        v10.localization, 
        v10.theme
    }, v9)));
end;
