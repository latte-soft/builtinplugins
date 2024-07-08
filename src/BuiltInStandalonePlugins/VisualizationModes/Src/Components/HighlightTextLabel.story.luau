local l_script_FirstAncestor_0 = script:FindFirstAncestor("VisualizationModes");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local v2 = require(l_script_FirstAncestor_0.Src.Components.HighlightTextLabel);
local v3 = require(l_script_FirstAncestor_0.Packages.React);
local l_Pane_0 = v1.UI.Pane;
return {
    name = "HighlightTextLabel", 
    summary = "This text label allows for highlighting specific parts of the text based upon a fuzzy search match.", 
    stories = {
        {
            name = "HighlightTextLabel", 
            story = function(v5)
                return v3.createElement(l_Pane_0, {
                    [v3.Tag] = "X-Fill X-Column X-Top", 
                    Size = UDim2.fromOffset(325, 300)
                }, {
                    StyleLink = v3.createElement("StyleLink", {
                        StyleSheet = v1.Styling.registerPluginStyles(v5.plugin, l_script_FirstAncestor_0)
                    }), 
                    HighlightTextLabel = v3.createElement(v2, {
                        Text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus laoreet", 
                        MatchIndexes = {
                            1, 
                            3, 
                            4
                        }
                    })
                });
            end
        }
    }
};
