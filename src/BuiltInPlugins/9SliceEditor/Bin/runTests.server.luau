local l_Parent_0 = script.Parent.Parent;
require(script.Parent.defineFlags);
local l_9SliceEditorShorterLoadTime_0 = game:GetFastFlag("9SliceEditorShorterLoadTime");
local l_status_0, l_result_0 = pcall(function()
    return game:GetService("StudioService"):HasInternalPermission();
end);
if l_status_0 and l_result_0 then
    require(script.Parent.commonInit)();
    local v4 = require(l_Parent_0.Src.Util.DebugFlags);
    local v5 = if not l_9SliceEditorShorterLoadTime_0 then require(l_Parent_0.Packages.Framework) else nil;
    if not (not v4.RunningUnderCLI() and not v4.RunTests()) then
        local v6 = require(l_Parent_0.Packages.Dev.TestEZ);
        local l_TestBootstrap_0 = v6.TestBootstrap;
        local l_TeamCityReporter_0 = v6.Reporters.TeamCityReporter;
        local l_TextReporter_0 = v6.Reporters.TextReporter;
        if l_9SliceEditorShorterLoadTime_0 then
            v5 = require(l_Parent_0.Packages.Framework);
        end;
        local v10 = not not _G.TEAMCITY and l_TeamCityReporter_0 or l_TextReporter_0;
        local l_Src_0 = l_Parent_0.Src;
        print("----- All " .. l_Parent_0.Name .. " Tests ------");
        local v12 = tick();
        l_TestBootstrap_0:run({
            l_Src_0
        }, v10);
        print(string.format("Completed in %.3f s", tick() - v12));
        print("----------------------------------");
        if v4.RunDeveloperFrameworkTests() then
            print("");
            print("----- All DeveloperFramework Tests ------");
            v5.TestHelpers.runFrameworkTests(v6, v10);
            print("----------------------------------");
        end;
    end;
    if v4.RunningUnderCLI() then
        pcall(function()
            game:GetService("ProcessService"):ExitAsync(0);
        end);
    end;
    return ;
else
    return ;
end;
