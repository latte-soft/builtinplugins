local l_Parent_0 = script.Parent.Parent;
require(script.Parent.commonInit)();
local v1 = require(l_Parent_0.Src.Util.DebugFlags);
if not (not v1.RunningUnderCLI() and not v1.RunTests()) then
    local v2 = require(l_Parent_0.Packages.Dev.TestEZ);
    local l_TestBootstrap_0 = v2.TestBootstrap;
    local v4 = not not _G.TEAMCITY and v2.Reporters.TeamCityReporter or v2.Reporters.TextReporter;
    local l_Src_0 = l_Parent_0.Src;
    print("----- All " .. l_Parent_0.Name .. " Tests ------");
    require(script.Parent.defineLuaFlags);
    l_TestBootstrap_0:run({
        l_Src_0
    }, v4);
    print("----------------------------------");
end;
if v1.RunningUnderCLI() then
    pcall(function()
        game:GetService("ProcessService"):ExitAsync(0);
    end);
end;
