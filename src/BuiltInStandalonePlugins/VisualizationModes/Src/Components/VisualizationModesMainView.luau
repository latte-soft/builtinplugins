local l_script_FirstAncestor_0 = script:FindFirstAncestor("VisualizationModes");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local v2 = require(l_script_FirstAncestor_0.Src.Components.HiddenCountLabel);
local v3 = require(l_script_FirstAncestor_0.Packages.React);
local v4 = require(l_script_FirstAncestor_0.Src.Components.Sections.RecentSection);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v6 = require(l_script_FirstAncestor_0.Src.Components.Sections.ViewSectionControls);
local v7 = require(l_script_FirstAncestor_0.Src.Components.VisualizationSearchBar);
local v8 = require(l_script_FirstAncestor_0.Src.Compute.computeDividedSections);
local v9 = require(l_script_FirstAncestor_0.Src.Compute.computeVisualizationModeSections);
local v10 = require(l_script_FirstAncestor_0.Src.Hooks.useFuzzySearch);
local _ = require(l_script_FirstAncestor_0.Src.Hooks.useSizeCalculator);
local l_UI_0 = v1.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_ScrollingFrame_0 = l_UI_0.ScrollingFrame;
return function(v15)
    local v16 = v8();
    local v17 = v10({
        SettingsKey = "VisualizationModesMainView_LastSearchSetting"
    });
    local v18 = v9({
        FuzzySearch = v17, 
        OnVisualizationModeCategoryToggle = v15.OnVisualizationModeCategoryToggle, 
        OnVisualizationModeToggle = v15.OnVisualizationModeToggle
    });
    v16.addSection({
        key = "RecentSection", 
        visible = v17.searchText == "", 
        renderContent = function(v19, v20)
            return v3.createElement(v4, {
                LayoutOrder = v19, 
                Visible = v20, 
                IsEditingEnabled = next(v15.RecentVisualizationModes) ~= nil, 
                OnVisualizationModeToggle = v15.OnVisualizationModeToggle, 
                RecentVisualizationModes = v15.RecentVisualizationModes
            });
        end
    });
    local v21 = {
        View = v3.createElement(v6)
    };
    for _, v23 in v15.VisualizationModeCategories, nil, nil do
        v16.addSection(v18.createSection(v23, v21[v23.name]));
    end;
    v16.addSection({
        key = "HiddenCount", 
        visible = v17.getFilteredCount() > 0, 
        renderContent = function(v24, v25)
            return v3.createElement(v2, {
                LayoutOrder = v24, 
                Visible = v25, 
                HiddenCount = v17.getFilteredCount(), 
                AllHidden = v17.getAreAllEntriesHidden()
            });
        end
    });
    return v3.createElement(l_Pane_0, {
        [v3.Tag] = "X-ColumnS X-Top", 
        Size = v15.Size
    }, {
        SearchBarContainer = v3.createElement(v7, {
            FuzzySearch = v17, 
            LayoutOrder = 1
        }), 
        ScrollingFrame = v3.createElement(l_ScrollingFrame_0, {
            [v3.Tag] = "ScrollingAutomaticSize VisualizationModes-MainScrollingFrame", 
            Size = v15.SizeCalculator.scrollingFrameSize, 
            LayoutOrder = 2
        }, {
            Content = v3.createElement(l_Pane_0, {
                [v3.Tag] = "X-Column X-Top X-FitY", 
                ref = v15.SizeCalculator.contentFrameRef
            }, {
                Sections = v16.getSections(), 
                UIPadding = v3.createElement("UIPadding", {
                    PaddingRight = UDim.new(0, 1)
                })
            })
        })
    });
end;
