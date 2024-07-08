local v0 = require(script.Parent.Parent.Parent.Core.Util.wrapStrictTable);
local function _(v1)
    local v2 = newproxy(true);
    local v3 = ("Symbol(%s)"):format((tostring(v1)));
    getmetatable(v2).__tostring = function()
        return v3;
    end;
    return v2;
end;
local v5 = {};
local v6 = newproxy(true);
local v7 = ("Symbol(%s)"):format((tostring("Localization")));
local l_v7_0 = v7 --[[ copy: 6 -> 7 ]];
getmetatable(v6).__tostring = function()
    return l_v7_0;
end;
v5.localization = v6;
v6 = newproxy(true);
v7 = ("Symbol(%s)"):format((tostring("NetworkInterface")));
local l_v7_1 = v7 --[[ copy: 6 -> 8 ]];
getmetatable(v6).__tostring = function()
    return l_v7_1;
end;
v5.networkInterface = v6;
v6 = newproxy(true);
v7 = ("Symbol(%s)"):format((tostring("PluginGui")));
local l_v7_2 = v7 --[[ copy: 6 -> 9 ]];
getmetatable(v6).__tostring = function()
    return l_v7_2;
end;
v5.pluginGui = v6;
v6 = newproxy(true);
v7 = ("Symbol(%s)"):format((tostring("Plugin")));
local l_v7_3 = v7 --[[ copy: 6 -> 10 ]];
getmetatable(v6).__tostring = function()
    return l_v7_3;
end;
v5.plugin = v6;
v6 = newproxy(true);
v7 = ("Symbol(%s)"):format((tostring("Settings")));
local l_v7_4 = v7 --[[ copy: 6 -> 11 ]];
getmetatable(v6).__tostring = function()
    return l_v7_4;
end;
v5.settings = v6;
v6 = newproxy(true);
v7 = ("Symbol(%s)"):format((tostring("Theme")));
local l_v7_5 = v7 --[[ copy: 6 -> 12 ]];
getmetatable(v6).__tostring = function()
    return l_v7_5;
end;
v5.theme = v6;
v6 = newproxy(true);
v7 = ("Symbol(%s)"):format((tostring("MarketplaceCamera")));
local l_v7_6 = v7 --[[ copy: 6 -> 13 ]];
getmetatable(v6).__tostring = function()
    return l_v7_6;
end;
v5.camera = v6;
v6 = newproxy(true);
v7 = ("Symbol(%s)"):format((tostring("LoadingInProgress")));
getmetatable(v6).__tostring = function()
    return v7;
end;
v5.LoadingInProgress = v6;
return v0(v5, "Keys");
