local l_Parent_0 = script.Parent.Parent;
require(script.Parent.defineLuaFlags);
if game:GetFastFlag("UserInputPlaybackPluginDeferPackageLoading") then
    local l_status_0, l_result_0 = pcall(function()
        return game:GetService("StudioService"):HasInternalPermission();
    end);
    if not (not l_status_0 or l_result_0) then
        return ;
    end;
end;
local v3 = require(l_Parent_0.Src.Util.DebugFlags);
local v4 = nil;
if not (not v3.RunningUnderCLI() and not v3.RunTests()) then
    require(script.Parent.commonInit)();
    v4 = require(l_Parent_0.Packages.Framework);
    local v5 = require(l_Parent_0.Packages.Dev.TestEZ);
    local l_TestBootstrap_0 = v5.TestBootstrap;
    local v7 = not not _G.TEAMCITY and v5.Reporters.TeamCityReporter or v5.Reporters.TextReporter;
    local l_Src_0 = l_Parent_0.Src;
    local v9 = {
        showTimingInfo = false, 
        testNamePattern = nil, 
        extraEnvironment = {}
    };
    print("----- All " .. l_Parent_0.Name .. " Tests ------");
    require(script.Parent.defineLuaFlags);
    l_TestBootstrap_0:run({
        l_Src_0
    }, v7, v9);
    print("----------------------------------");
    if v3.RunDeveloperFrameworkTests() then
        print("");
        print("----- All DeveloperFramework Tests ------");
        v4.TestHelpers.runFrameworkTests(v5, v7);
        print("----------------------------------");
    end;
end;
if v3.RunningUnderCLI() then
    pcall(function()
        game:GetService("ProcessService"):ExitAsync(0);
    end);
end;
