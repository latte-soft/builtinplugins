local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Src.Util.DebugFlags);
if not (not v1.RunningUnderCLI() and not v1.RunTests()) then
    local v2 = require(l_Parent_0.Packages._Index.TestEZ.TestEZ);
    local l_TestBootstrap_0 = v2.TestBootstrap;
    local l_TeamCityReporter_0 = v2.Reporters.TeamCityReporter;
    local l_TextReporter_0 = v2.Reporters.TextReporter;
    if v1.LogTestsQuiet() then
        l_TextReporter_0 = v2.Reporters.TextReporterQuiet;
    end;
    l_TextReporter_0 = not not _G.TEAMCITY and l_TeamCityReporter_0 or l_TextReporter_0;
    print("----- All " .. script.Parent.Parent.Name .. " Tests ------");
    require(script.Parent.defineLuaFlags);
    l_TestBootstrap_0:run({
        l_Parent_0.Src
    }, l_TextReporter_0);
    print("----------------------------------");
    if v1.RunDeveloperFrameworkTests() then
        print("");
        print("----- All Developer Framework Tests ------");
        l_TestBootstrap_0:run({
            l_Parent_0.Packages._Index.DeveloperFramework.DeveloperFramework
        }, l_TextReporter_0);
        print("----------------------------------");
    end;
end;
if v1.RunningUnderCLI() then
    pcall(function()
        game:GetService("ProcessService"):ExitAsync(0);
    end);
end;
