local l_Parent_0 = script.Parent.Parent;
local l_ImprovePluginSpeed_TagEditor_0 = game:GetFastFlag("ImprovePluginSpeed_TagEditor");
if l_ImprovePluginSpeed_TagEditor_0 then
    local l_status_0, l_result_0 = pcall(function()
        return game:GetService("StudioService"):HasInternalPermission();
    end);
    if not (not l_status_0 or l_result_0) then
        return ;
    end;
end;
local v4 = require(l_Parent_0.Src.Util.DebugFlags);
local v5 = nil;
if not l_ImprovePluginSpeed_TagEditor_0 then
    v5 = require(l_Parent_0.Packages.Framework);
end;
if not (not v4.RunningUnderCLI() and not v4.RunTests()) then
    if l_ImprovePluginSpeed_TagEditor_0 then
        require(script.Parent.commonInit)();
        v5 = require(l_Parent_0.Packages.Framework);
    end;
    local v6 = require(l_Parent_0.Packages.Dev.TestEZ);
    local l_TestBootstrap_0 = v6.TestBootstrap;
    local v8 = not not _G.TEAMCITY and v6.Reporters.TeamCityReporter or v6.Reporters.TextReporter;
    local l_Src_0 = l_Parent_0.Src;
    local v10 = {
        showTimingInfo = false, 
        testNamePattern = nil, 
        extraEnvironment = {}
    };
    print("----- All " .. l_Parent_0.Name .. " Tests ------");
    require(script.Parent.defineLuaFlags);
    l_TestBootstrap_0:run({
        l_Src_0
    }, v8, v10);
    print("----------------------------------");
    if v4.RunDeveloperFrameworkTests() then
        print("");
        print("----- All DeveloperFramework Tests ------");
        v5.TestHelpers.runFrameworkTests(v6, v8);
        print("----------------------------------");
    end;
end;
if v4.RunningUnderCLI() then
    pcall(function()
        game:GetService("ProcessService"):ExitAsync(0);
    end);
end;
