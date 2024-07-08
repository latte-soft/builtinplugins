local l_script_FirstAncestor_0 = script:FindFirstAncestor("VisualizationModes");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local v2 = require(l_script_FirstAncestor_0.Packages.React);
local v3 = require(l_script_FirstAncestor_0.Src.Model.VisualizationModeCombinerClient);
local v4 = require(l_script_FirstAncestor_0.Src.Model.Tracking.VisualizationModeServiceTracker);
local v5 = require(l_script_FirstAncestor_0.Src.Components.VisualizationModesMainView);
local v6 = require(l_script_FirstAncestor_0.Src.Hooks.useSizeCalculator);
local v7 = require(l_script_FirstAncestor_0.Src.Hooks.useVisualizationModeCombiner);
local l_Pane_0 = v1.UI.Pane;
return {
    name = "VisualizationModesMainView", 
    summary = "Renders the main visualization modes view with all sections and controls", 
    stories = {
        {
            name = "VisualizationModesMainView", 
            story = function(v9)
                local v10 = v1.Styling.registerPluginStyles(v9.plugin, l_script_FirstAncestor_0);
                local v11 = v7();
                local v12 = v2.useState(function()
                    return v4.new();
                end);
                local v13 = v2.useState(function()
                    return v3.new(v9.plugin, v12);
                end);
                v2.useEffect(function()
                    return function()
                        v12:destroy();
                        v13:destroy();
                    end;
                end, {});
                local v14 = v6({
                    Width = 325, 
                    HeaderHeight = 32, 
                    MaxHeight = 400, 
                    InnerPadding = 5, 
                    Padding = Vector2.zero
                });
                return v2.createElement(l_Pane_0, {
                    [v2.Tag] = "X-Fill X-Column X-Top", 
                    Size = UDim2.fromOffset(v14.size.X, v14.size.Y)
                }, {
                    StyleLink = v2.createElement("StyleLink", {
                        StyleSheet = v10
                    }), 
                    VisualizationModesMainView = v2.createElement(v5, {
                        OnVisualizationModeToggle = v11.onVisualizationModeToggle, 
                        OnVisualizationModeCategoryToggle = v11.onVisualizationModeCategoryToggle, 
                        SizeCalculator = v14, 
                        RecentVisualizationModes = v11.state.recentModes, 
                        VisualizationModeCategories = v11.state.categories
                    })
                });
            end
        }
    }
};
