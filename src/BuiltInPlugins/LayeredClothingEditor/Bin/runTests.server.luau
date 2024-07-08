local l_ImprovePluginSpeed_LayeredClothingEditor_0 = game:GetFastFlag("ImprovePluginSpeed_LayeredClothingEditor");
local l_Parent_0 = script.Parent.Parent;
local v2 = nil;
local v3 = nil;
if not l_ImprovePluginSpeed_LayeredClothingEditor_0 then
    v2 = require(l_Parent_0.Packages.AvatarToolsShared);
    v3 = l_Parent_0.Packages.LuaMeshEditingModule;
end;
local v4 = require(l_Parent_0.Src.Util.DebugFlags);
local function _()
    local v5 = require(l_Parent_0.Packages.Dev.TestEZ);
    v2.Util.runAvatarToolsSharedTests(v5, not not _G.TEAMCITY and v5.Reporters.TeamCityReporter or v5.Reporters.TextReporter);
end;
local function _()
    local v7 = require(l_Parent_0.Packages.Dev.TestEZ);
    require(v3.Util.runLuaMeshEditingModuleTests)(v7, not not _G.TEAMCITY and v7.Reporters.TeamCityReporter or v7.Reporters.TextReporter);
end;
local function _()
    local v9 = require(l_Parent_0.Packages.Dev.TestEZ);
    v9.TestBootstrap:run({
        l_Parent_0.Src
    }, v9.Reporters.TextReporter);
end;
local function v12()
    local v11 = require(l_Parent_0.Packages.Dev.TestEZ);
    v11.TestBootstrap:run({
        l_Parent_0.RhodiumTests
    }, v11.Reporters.TextReporter, false, true);
end;
local v13 = v4.RunTests();
local v14 = v4.RunRhodiumTests();
if v13 then
    if l_ImprovePluginSpeed_LayeredClothingEditor_0 then
        v2 = require(l_Parent_0.Packages.AvatarToolsShared);
        v3 = l_Parent_0.Packages.LuaMeshEditingModule;
    end;
    print("----- All " .. script.Parent.Parent.Name .. " Tests ------");
    require(script.Parent.defineLuaFlags);
    local v15 = require(l_Parent_0.Packages.Dev.TestEZ);
    v15.TestBootstrap:run({
        l_Parent_0.Src
    }, v15.Reporters.TextReporter);
    print("----------------------------------");
    print("----- All AvatarToolsShared Tests ------");
    v15 = require(l_Parent_0.Packages.Dev.TestEZ);
    v2.Util.runAvatarToolsSharedTests(v15, not not _G.TEAMCITY and v15.Reporters.TeamCityReporter or v15.Reporters.TextReporter);
    print("----------------------------------");
    print("----- All LuaMeshEditingModule Tests ------");
    v15 = require(l_Parent_0.Packages.Dev.TestEZ);
    require(v3.Util.runLuaMeshEditingModuleTests)(v15, not not _G.TEAMCITY and v15.Reporters.TeamCityReporter or v15.Reporters.TextReporter);
    print("----------------------------------");
end;
if v14 then
    print("----- All " .. script.Parent.Parent.Name .. " Rhodium Tests ------");
    v12();
    print("----------------------------------");
end;
if not (not v13 and not v14) then
    game:GetService("ProcessService"):ExitAsync(0);
end;
