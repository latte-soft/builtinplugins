local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Src.Util.DebugFlags);
local v2 = nil;
require(script.Parent.defineLuaFlags);
if not (not v1.RunningUnderCLI() and not v1.RunTests()) then
    require(script.Parent.commonInit)();
    v2 = require(l_Parent_0.Packages.Framework);
    local v3 = require(l_Parent_0.Packages.Dev.TestEZ);
    local l_TestBootstrap_0 = v3.TestBootstrap;
    local v5 = not not _G.TEAMCITY and v3.Reporters.TeamCityReporter or v3.Reporters.TextReporter;
    local l_Src_0 = l_Parent_0.Src;
    print("----- All " .. l_Parent_0.Name .. " Tests ------");
    require(script.Parent.defineLuaFlags);
    l_TestBootstrap_0:run({
        l_Src_0
    }, v5);
    print("----------------------------------");
    if v1.RunDeveloperFrameworkTests() then
        print("");
        print("----- All DeveloperFramework Tests ------");
        v2.TestHelpers.runFrameworkTests(v3, v5);
        print("----------------------------------");
    end;
end;
if v1.RunningUnderCLI() then
    pcall(function()
        game:GetService("ProcessService"):ExitAsync(0);
    end);
end;
