local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Src.Utility.DebugFlags);
local v2 = require(l_Parent_0.Src.Flags.getFFlagAssetImportRefactorPluginInit);
if v2() then
    if plugin then
        local v3 = require(l_Parent_0.Packages.Roact);
        if v1.EnableRoactConfigs() then
            v3.setGlobalConfig({
                elementTracing = true, 
                propValidation = true, 
                typeChecks = true
            });
        end;
    else
        return ;
    end;
end;
if not (not v1.RunningUnderCLI() and not v1.RunTests()) then
    if not v2() then
        require(script.Parent.DEPRECATED_commonInit)();
    end;
    local v4 = require(l_Parent_0.Src.Testing.isFTF);
    if not v4() then
        game:DefineFastFlag("ChooseAnimationForRestPose", true);
        game:DefineFastFlag("HideAnimationSettingForGltf", true);
        game:DefineFastFlag("ImporterOpensAvatarPreviewerBetaCheck", true);
        game:DefineFastFlag("AssetImportUseUploadId", true);
        game:DefineFastFlag("KeepZeroInfluenceBones", true);
    end;
    local v5 = require(l_Parent_0.Packages.Dev.TestEZ);
    local l_TestBootstrap_0 = v5.TestBootstrap;
    local v7 = if not _G.TEAMCITY then if not v1.LogTestsQuiet() then v5.Reporters.TextReporter else v5.Reporters.TextReporterQuiet else v5.Reporters.TeamCityReporter;
    print((("----- All %* Tests ------"):format(l_Parent_0.Name)));
    l_TestBootstrap_0:run({
        l_Parent_0.Src
    }, v7);
    print("----------------------------------");
    if v4() then
        print("");
        print((("----- All %* Integration Tests ------"):format(l_Parent_0.Name)));
        l_TestBootstrap_0:run({
            l_Parent_0.IntegrationTests
        }, v7);
        print("----------------------------------");
    end;
    if v1.RunDeveloperFrameworkTests() then
        local v8 = require(l_Parent_0.Packages.Framework);
        print("");
        print("----- All DeveloperFramework Tests ------");
        v8.TestHelpers.runFrameworkTests(v5, v7);
        print("----------------------------------");
    end;
    if v1.RunningUnderCLI() then
        pcall(function()
            game:GetService("ProcessService"):ExitAsync(0);
        end);
        return ;
    end;
end;
local v9 = require(l_Parent_0.Packages.PluginLoader.PluginLoaderBuilder);
local l_SourceStrings_0 = l_Parent_0.Src.Resources.Localization.SourceStrings;
local l_LocalizedStrings_0 = l_Parent_0.Src.Resources.Localization.LocalizedStrings;
local l_FixAvatarTabPluginsNotLoadingOnNonEnglishBuilds_0 = game:GetFastFlag("FixAvatarTabPluginsNotLoadingOnNonEnglishBuilds");
local v25 = v9.build({
    plugin = plugin, 
    pluginName = "AssetImporter", 
    translationResourceTable = l_LocalizedStrings_0, 
    fallbackResourceTable = l_SourceStrings_0, 
    overrideLocaleId = nil, 
    localizationNamespace = nil, 
    getToolbarName = function(v13, v14, v15)
        if not l_FixAvatarTabPluginsNotLoadingOnNonEnglishBuilds_0 then
            return v13(v14, v15, "Plugin", "Toolbar");
        else
            return "Mesh Importer";
        end;
    end, 
    buttonInfo = {
        getName = function(v16, v17, v18)
            if not l_FixAvatarTabPluginsNotLoadingOnNonEnglishBuilds_0 then
                return v16(v17, v18, "Plugin", "Button");
            else
                return "Import";
            end;
        end, 
        getDescription = function(v19, v20, v21)
            return v19(v20, v21, "Plugin", "Description");
        end, 
        icon = "rbxlocaltheme://MeshImporter", 
        text = function(v22, v23, v24)
            return v22(v23, v24, "Plugin", "Button");
        end, 
        clickableWhenViewportHidden = true
    }, 
    dockWidgetInfo = nil
});
if v25.pluginLoader:waitForUserInteraction() then
    require(script.Parent.main)(plugin, v25);
    return ;
else
    return ;
end;
