local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetAccess");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_ContextServices_0 = v2.ContextServices;
local l_Analytics_0 = l_ContextServices_0.Analytics;
local l_Design_0 = l_ContextServices_0.Design;
local l_Localization_0 = l_ContextServices_0.Localization;
local l_Mouse_0 = l_ContextServices_0.Mouse;
local l_Plugin_0 = l_ContextServices_0.Plugin;
local l_StudioTheme_0 = v2.Style.Themes.StudioTheme;
local l_registerPluginStyles_0 = v2.Styling.registerPluginStyles;
local l_SourceStrings_0 = l_script_FirstAncestor_0.Src.Resources.Localization.SourceStrings;
local l_LocalizedStrings_0 = l_script_FirstAncestor_0.Src.Resources.Localization.LocalizedStrings;
local v13 = require(l_script_FirstAncestor_0.Src.Components.ShareDialogView);
local function _(v14)
    return v1.useMemo(function()
        return l_registerPluginStyles_0(v14);
    end, {
        v14
    });
end;
local function v18(v16, v17)
    return {
        Analytics = v1.useMemo(function()
            return l_Analytics_0.new(function()
                return {};
            end, {});
        end, {}), 
        Design = v1.useMemo(function()
            return l_Design_0.new(v17);
        end, {
            v17
        }), 
        Localization = v1.useMemo(function()
            return l_Localization_0.new({
                stringResourceTable = l_SourceStrings_0, 
                translationResourceTable = l_LocalizedStrings_0, 
                pluginName = "AssetAccess"
            });
        end, {}), 
        Mouse = v1.useMemo(function()
            l_Mouse_0.new(v16:GetMouse()):__pushCursor("Arrow", 0);
        end, {
            v16:GetMouse()
        }), 
        Plugin = v1.useMemo(function()
            return l_Plugin_0.new(v16);
        end, {
            v16
        }), 
        Stylizer = v1.useMemo(function()
            return l_StudioTheme_0.new();
        end, {})
    };
end;
return function(v19)
    local l_Plugin_1 = v19.Plugin;
    return l_ContextServices_0.provide(v18(l_Plugin_1, (v1.useMemo(function()
        return l_registerPluginStyles_0(l_Plugin_1);
    end, {
        l_Plugin_1
    }))), {
        v1.createElement(v13)
    });
end;
