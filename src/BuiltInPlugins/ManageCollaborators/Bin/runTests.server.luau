local v0 = game:getFastFlag("ImprovePluginSpeed_ManageCollaborators");
local l_Parent_0 = script.Parent.Parent;
if not v0 then
    require(script.Parent.commonInit)();
end;
local v2 = require(l_Parent_0.Src.Util.DebugFlags);
local v3 = nil;
if not v0 then
    v3 = require(l_Parent_0.Packages.Framework);
end;
if not (not v2.RunningUnderCLI() and not v2.RunTests()) then
    if v0 then
        require(script.Parent.commonInit)();
        v3 = require(l_Parent_0.Packages.Framework);
    end;
    local v4 = require(l_Parent_0.Packages.Dev.TestEZ);
    local l_TestBootstrap_0 = v4.TestBootstrap;
    local v6 = not not _G.TEAMCITY and v4.Reporters.TeamCityReporter or v4.Reporters.TextReporter;
    local l_Src_0 = l_Parent_0.Src;
    local v8 = {
        showTimingInfo = false, 
        testNamePattern = nil, 
        extraEnvironment = {}
    };
    print("----- All " .. l_Parent_0.Name .. " Tests ------");
    l_TestBootstrap_0:run({
        l_Src_0
    }, v6, v8);
    print("----------------------------------");
    if v2.RunDeveloperFrameworkTests() then
        print("");
        print("----- All DeveloperFramework Tests ------");
        v3.TestHelpers.runFrameworkTests(v4, v6);
        print("----------------------------------");
    end;
end;
if v2.RunningUnderCLI() then
    pcall(function()
        game:GetService("ProcessService"):ExitAsync(0);
    end);
end;
