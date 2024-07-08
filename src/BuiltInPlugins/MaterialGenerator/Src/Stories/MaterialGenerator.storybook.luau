local l_Parent_0 = script.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v2 = require(l_Packages_0.MaterialFramework);
local v3 = require(l_Packages_0.Framework);
local v4 = require(l_Packages_0.React);
local v5 = require(l_Packages_0.Dev.RoactCompat);
local l_Resources_0 = l_Parent_0.Src.Resources;
local v7 = require(l_Resources_0.MakeTheme);
local l_ContextServices_0 = v3.ContextServices;
local l_DocParser_0 = v3.Util.Typecheck.DocParser;
local l_Focus_0 = l_ContextServices_0.Focus;
local l_Localization_0 = l_ContextServices_0.Localization;
local l_Mouse_0 = l_ContextServices_0.Mouse;
local l_Plugin_0 = l_ContextServices_0.Plugin;
local l_StudioServices_0 = v2.Context.StudioServices;
return {
    name = "Material Generator", 
    exclude = {
        "_Index"
    }, 
    storyRoots = {
        l_Parent_0.Src
    }, 
    roact = v5, 
    mapStory = function(v15)
        local v16 = l_Localization_0.new({
            stringResourceTable = l_Resources_0.Localization.SourceStrings, 
            translationResourceTable = l_Resources_0.Localization.LocalizedStrings, 
            pluginName = "MaterialGenerator", 
            libraries = {
                [v2.Resources.LOCALIZATION_PROJECT_NAME] = {
                    stringResourceTable = v2.Resources.SourceStrings, 
                    translationResourceTable = v2.Resources.LocalizedStrings
                }
            }
        });
        return function(v17)
            return l_ContextServices_0.provide({
                v16, 
                l_Focus_0.new(v17.focus), 
                l_Mouse_0.new(v17.plugin:GetMouse()), 
                l_Plugin_0.new(v17.plugin), 
                l_StudioServices_0.new(), 
                v7()
            }, {
                Child = v4.createElement(v15, v17)
            });
        end;
    end, 
    mapDefinition = function(v18)
        local l_FirstChild_0 = v18.source.Parent:FindFirstChild(v18.name);
        if l_FirstChild_0 then
            local v20 = l_DocParser_0.new(v18.name, l_FirstChild_0);
            local l_status_0, l_result_0 = pcall(function()
                return v20:parse();
            end);
            if l_status_0 then
                v18.docs = l_result_0;
                v18.summary = l_result_0.Summary;
            end;
        end;
        return v18;
    end
};
