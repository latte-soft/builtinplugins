require(script.Parent.defineLuaFlags);
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Src.Util.DebugFlags);
local function _()
    local v2 = require(l_script_FirstAncestor_0.Packages.Dev.TestEZ);
    return not not _G.TEAMCITY and v2.Reporters.TeamCityReporter or v2.Reporters.TextReporter;
end;
local function v8()
    local v4 = require(l_script_FirstAncestor_0.Packages.Dev.TestEZ);
    local l_Src_0 = l_script_FirstAncestor_0.Src;
    local l_TestBootstrap_0 = v4.TestBootstrap;
    local v7 = require(l_script_FirstAncestor_0.Packages.Dev.TestEZ);
    l_TestBootstrap_0:run({
        l_Src_0
    }, not not _G.TEAMCITY and v7.Reporters.TeamCityReporter or v7.Reporters.TextReporter);
end;
local function v18()
    local v9 = require(l_script_FirstAncestor_0.Packages.Dev.TestEZ);
    local v10 = require(l_script_FirstAncestor_0.RhodiumTests.TestHelpers);
    local l_RhodiumTests_0 = l_script_FirstAncestor_0.RhodiumTests;
    local l_TestBootstrap_1 = v9.TestBootstrap;
    local v13 = require(l_script_FirstAncestor_0.Src.test.RigCreator);
    local l_Dummy_0 = workspace:FindFirstChild("Dummy");
    while l_Dummy_0 ~= nil do
        l_Dummy_0:Destroy();
        l_Dummy_0 = workspace:FindFirstChild("Dummy");
    end;
    local v15 = v13.BuildAnthroRig("AnthroNormal");
    v15.Name = "Dummy";
    v15.HumanoidRootPart.Anchored = true;
    local v16 = require(l_script_FirstAncestor_0.Packages.Dev.TestEZ);
    local v17 = not not _G.TEAMCITY and v16.Reporters.TeamCityReporter or v16.Reporters.TextReporter;
    v10.init(plugin);
    l_TestBootstrap_1:run({
        l_RhodiumTests_0
    }, v17, false, true);
    v15:Destroy();
end;
local v19 = v1.RunTests();
local v20 = v1.RunRhodiumTests();
if v19 then
    print("----- All " .. script.Parent.Parent.Name .. " Tests ------");
    v8();
    print("----------------------------------");
end;
if v20 then
    print("----- All " .. script.Parent.Parent.Name .. " Rhodium Tests ------");
    v18();
    print("----------------------------------");
    if v1.RunningUnderCLI() then
        game:GetService("ProcessService"):ExitAsync(0);
    end;
end;
