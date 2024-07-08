local l_Parent_0 = script.Parent.Parent;
require(script.Parent.commonInit)();
local v1 = require(l_Parent_0.Src.Util.DebugFlags);
if not (not v1.RunningUnderCLI() and not v1.RunTests()) then
    _G.__DEV__ = true;
    _G.__ROACT_17_MOCK_SCHEDULER__ = true;
    _G.__ROACT_17_INLINE_ACT__ = true;
    local v2 = require(l_Parent_0.Packages.Dev.TestEZ);
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
end;
if v1.RunningUnderCLI() then
    pcall(function()
        game:GetService("ProcessService"):ExitAsync(0);
    end);
end;
