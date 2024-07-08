local l_script_FirstAncestor_0 = script:FindFirstAncestor("VisualizationModes");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local v3 = require(l_script_FirstAncestor_0.Packages.Roact);
local v4 = require(l_script_FirstAncestor_0.Src.Resources.Localization.createLocalization);
local l_DocParser_0 = v2.Util.Typecheck.DocParser;
local l_ContextServices_0 = v2.ContextServices;
local l_StudioTheme_0 = v2.Style.Themes.StudioTheme;
local l_registerPluginStyles_0 = v2.Styling.registerPluginStyles;
local l_Pane_0 = v2.UI.Pane;
return {
    name = "Visualization Modes", 
    exclude = {
        "_Index"
    }, 
    storyRoots = {
        l_script_FirstAncestor_0.Src.Stories, 
        l_script_FirstAncestor_0.Src.Components
    }, 
    roact = v3, 
    mapStory = function(v10)
        return function(v11)
            return l_ContextServices_0.provide({
                v4(), 
                l_ContextServices_0.Mouse.new(v11.plugin:GetMouse()), 
                l_ContextServices_0.Plugin.new(v11.plugin), 
                l_StudioTheme_0.new()
            }, {
                Wrapper = v1.createElement(l_Pane_0, {
                    AutomaticSize = Enum.AutomaticSize.XY
                }, {
                    Child = v1.createElement(v10, v11), 
                    StyleLink = v1.createElement("StyleLink", {
                        StyleSheet = l_registerPluginStyles_0(v11.plugin, l_script_FirstAncestor_0)
                    })
                })
            });
        end;
    end, 
    mapDefinition = function(v12)
        local l_FirstChild_0 = v12.source.Parent:FindFirstChild(v12.name);
        if l_FirstChild_0 then
            local v14 = l_DocParser_0.new(v12.name, l_FirstChild_0);
            local l_status_0, l_result_0 = pcall(function()
                return v14:parse();
            end);
            if l_status_0 then
                v12.docs = l_result_0;
                v12.summary = l_result_0.Summary;
            end;
        end;
        return v12;
    end
};
