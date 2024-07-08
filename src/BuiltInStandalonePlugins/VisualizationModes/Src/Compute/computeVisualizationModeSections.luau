local l_script_FirstAncestor_0 = script:FindFirstAncestor("VisualizationModes");
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v2 = require(l_script_FirstAncestor_0.Packages.React);
local v3 = require(l_script_FirstAncestor_0.Src.Components.VisualizationModeSection);
local v4 = require(l_script_FirstAncestor_0.Src.Compute.computeVisualizationModeSectionEntries);
local _ = require(l_script_FirstAncestor_0.Src.Hooks.useFuzzySearch);
return function(v6)
    return table.freeze({
        createSection = function(v7, v8)
            local v9, v10 = v6.FuzzySearch.includeEntry(v7.title);
            local v11 = v4({
                OnVisualizationModeToggle = v6.OnVisualizationModeToggle, 
                ForceVisible = v10 ~= nil, 
                FuzzySearch = v6.FuzzySearch
            });
            if v8 then
                v6.FuzzySearch.incrementEntryCount();
                if not v9 then
                    v6.FuzzySearch.incrementFilteredCount();
                else
                    v11.addCustomEntry(v8);
                end;
            end;
            for _, v13 in v7.visualizationModeList, nil, nil do
                v11.addVisualizationModeEntry(v7, v13);
            end;
            return {
                key = "User_" .. v7.name, 
                visible = v11.hasVisibleEntries(), 
                renderContent = function(v14, v15)
                    local l_createElement_0 = v2.createElement;
                    local l_v3_0 = v3;
                    local v18 = {
                        Text = v7.title, 
                        Visible = v15, 
                        LayoutOrder = v14, 
                        DefaultIsExpanded = true, 
                        SettingKey = v7.name, 
                        Enabled = v7.enabled, 
                        SectionEntries = v11.renderEntries(), 
                        MatchIndexes = v10, 
                        CanExpand = true, 
                        CanToggle = false, 
                        EntryCount = v11.getEntryCount(), 
                        EnabledEntryCount = v11.getEnabledCount()
                    };
                    local v19 = true;
                    if v11.getEntryMatchCount() <= 0 then
                        v19 = v10 ~= nil;
                    end;
                    v18.ForceExpansion = v19;
                    v18.OnToggle = function()
                        v6.OnVisualizationModeCategoryToggle(v7.name, not v7.enabled);
                    end;
                    return l_createElement_0(l_v3_0, v18);
                end
            };
        end
    });
end;
