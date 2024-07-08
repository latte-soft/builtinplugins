local l_Parent_0 = script.Parent.Parent;
require(script.Parent.defineLuaFlags);
require(script.Parent.commonInit)();
local v1 = require(l_Parent_0.Src.Util.DebugFlags);
local v2 = require(l_Parent_0.Packages.Framework);
if not (not v1.RunningUnderCLI() and not v1.RunTests() or game:GetFastFlag("RetireAudioDiscoveryPlugin")) then
    local v3 = require(l_Parent_0.Packages.Dev.TestEZ);
    local l_TestBootstrap_0 = v3.TestBootstrap;
    local v5 = not not _G.TEAMCITY and v3.Reporters.TeamCityReporter or v3.Reporters.TextReporter;
    local l_Src_0 = l_Parent_0.Src;
    local v7 = {
        showTimingInfo = false, 
        testNamePattern = nil, 
        extraEnvironment = {}
    };
    print("----- All " .. l_Parent_0.Name .. " Tests ------");
    l_TestBootstrap_0:run({
        l_Src_0
    }, v5, v7);
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
