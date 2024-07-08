local v0 = require(script.Parent.main);
local l_TestService_0 = game:GetService("TestService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local v3 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagFixTerrainEditorDETruncations);
local l_status_0, l_result_0 = pcall(function()
    return game:GetService("ProcessService");
end);
if not l_status_0 then
    if game:GetFastFlag("EnableTerrainEditor2") then
        local v12 = require(l_script_FirstAncestor_0.PluginLoader.PluginLoaderBuilder).build({
            plugin = plugin, 
            pluginName = "TerrainEditor", 
            translationResourceTable = l_script_FirstAncestor_0.Src.Resources.Localization.LocalizedStrings, 
            fallbackResourceTable = l_script_FirstAncestor_0.Src.Resources.Localization.SourceStrings, 
            overrideLocaleId = nil, 
            localizationNamespace = nil, 
            getToolbarName = function()
                return "TerrainEditorLuaToolbarName";
            end, 
            buttonInfo = {
                getName = function()
                    return "Editor";
                end, 
                getDescription = function(v6, v7, v8)
                    return v6(v7, v8, "Main", "PluginButtonEditorTooltip");
                end, 
                icon = "rbxlocaltheme://TerrainEditor", 
                text = nil, 
                clickableWhenViewportHidden = true
            }, 
            dockWidgetInfo = {
                id = "TerrainEditor", 
                dockWidgetPluginGuiInfo = if not v3() then DockWidgetPluginGuiInfo.new(Enum.InitialDockState.Left, true, false, 320, 600, 320, 200) else DockWidgetPluginGuiInfo.new(Enum.InitialDockState.Left, true, false, 350, 600, 350, 200), 
                getDockTitle = function(v9, v10, v11)
                    return v9(v10, v11, "Main", "Title");
                end, 
                zIndexBehavior = Enum.ZIndexBehavior.Sibling
            }
        });
        if v12.pluginLoader:waitForUserInteraction() then
            v0(plugin, v12);
            return ;
        else
            return ;
        end;
    else
        return ;
    end;
else
    local l_runCLI_0 = require(l_script_FirstAncestor_0.Packages.Dev.Jest).runCLI;
    _G.__ROACT_17_MOCK_SCHEDULER__ = true;
    _G.__ROACT_17_INLINE_ACT__ = true;
    local v14 = game:DefineFastString("DebugAvatarPreviewerTestPathPattern", "");
    local v15, v16 = l_runCLI_0(l_script_FirstAncestor_0.Src, {
        verbose = true, 
        ci = true, 
        testPathPattern = if v14 == "" then nil else v14
    }, {
        l_script_FirstAncestor_0.Src
    }):awaitStatus();
    if not (v15 == "Resolved" and v16.results.numFailedTestSuites <= 0) or v16.results.numFailedTests > 0 then
        if v15 == "Rejected" then
            print(v16);
        end;
        l_TestService_0:Error("Jest 3 test run failed");
        l_result_0:ExitAsync(1);
        return ;
    else
        l_result_0:ExitAsync(0);
        return ;
    end;
end;
