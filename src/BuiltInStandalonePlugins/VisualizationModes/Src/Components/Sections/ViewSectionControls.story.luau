local l_script_FirstAncestor_0 = script:FindFirstAncestor("VisualizationModes");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Src.Components.Sections.ViewSectionControls);
local v3 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_Pane_0 = v3.UI.Pane;
local l_registerPluginStyles_0 = v3.Styling.registerPluginStyles;
return {
    name = "ViewSectionControls", 
    summary = "Renders the custom controls for the 'View' section of the visualization modes plugin", 
    stories = {
        {
            name = "ViewSectionControls", 
            story = function(v6)
                return v1.createElement(l_Pane_0, {
                    [v1.Tag] = "X-Fill X-Column X-Top", 
                    Size = UDim2.fromOffset(325, 300)
                }, {
                    StyleLink = v1.createElement("StyleLink", {
                        StyleSheet = l_registerPluginStyles_0(v6.plugin, l_script_FirstAncestor_0)
                    }), 
                    ViewSectionControls = v1.createElement(v2)
                });
            end
        }
    }
};
