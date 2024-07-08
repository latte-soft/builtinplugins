local l_Parent_0 = script.Parent.Parent;
local l_DraggerFramework_0 = l_Parent_0.Packages.DraggerFramework;
local v2 = require(l_DraggerFramework_0.Utility.isFTF);
local v3 = require(l_DraggerFramework_0.Utility.isCli);
local v4 = false;
if v2() then
    v4 = true;
end;
if v4 then
    local l_DraggerSchemaCore_0 = l_Parent_0.Packages.DraggerSchemaCore;
    local v6 = require(l_Parent_0.Packages.Dev.TestEZ);
    local l_TestBootstrap_0 = v6.TestBootstrap;
    local v8 = not not _G.TEAMCITY and v6.Reporters.TeamCityReporter or v6.Reporters.TextReporter;
    print("----- All DraggerFramework Tests ------");
    l_TestBootstrap_0:run({
        l_DraggerFramework_0
    }, v8);
    print("----------------------------------");
    print("----- All DraggerSchemaCore Tests ------");
    l_TestBootstrap_0:run({
        l_DraggerSchemaCore_0
    }, v8);
    print("----------------------------------");
end;
if v3() then
    game:GetService("ProcessService"):ExitAsync(0);
end;
