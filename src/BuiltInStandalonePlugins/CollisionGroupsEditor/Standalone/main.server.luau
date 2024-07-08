local l_Parent_0 = script.Parent.Parent;
require(l_Parent_0.Common.commonInit)();
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.Framework);
local v3 = game:GetService("StudioService"):HasInternalPermission();
MainPlugin = require(l_Parent_0.Plugin.MainPlugin);
local v4 = nil;
local v5 = nil;
local function v6()
    plugin.Name = l_Parent_0.Name;
    v4 = v1.mount((v1.createElement(MainPlugin, {
        Plugin = plugin
    })));
    if v3 then
        v5 = v2.DeveloperTools.forStandalonePlugin(l_Parent_0.Name, plugin, {
            rootInstance = v4
        });
    end;
    if v5 then
        v5:addRoactTree("Roact tree", v4);
    end;
end;
plugin.Unloading:connect(function()
    if v5 then
        v5:destroy();
    end;
    if v4 then
        v1.unmount(v4);
        v4 = nil;
    end;
end);
v6();
