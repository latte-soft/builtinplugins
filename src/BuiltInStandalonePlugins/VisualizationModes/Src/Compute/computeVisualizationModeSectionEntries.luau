local l_script_FirstAncestor_0 = script:FindFirstAncestor("VisualizationModes");
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local v3 = require(l_script_FirstAncestor_0.Packages.React);
local v4 = require(l_script_FirstAncestor_0.Src.Components.VisualizationModeEntry);
local _ = require(l_script_FirstAncestor_0.Src.Hooks.useFuzzySearch);
local l_ContextServices_0 = v2.ContextServices;
local l_LayoutOrderIterator_0 = v2.Util.LayoutOrderIterator;
return function(v8)
    local v9 = l_ContextServices_0.Analytics:use();
    local v10 = l_LayoutOrderIterator_0.new();
    local v11 = {};
    local v12 = 0;
    local v13 = 0;
    local v14 = 0;
    local v15 = 0;
    local v16 = 0;
    return {
        addEntry = function(v17)
            v13 = v13 + 1;
            v8.FuzzySearch.incrementEntryCount();
            if v17.Visible ~= false then
                v12 = v12 + 1;
            end;
            table.insert(v11, v3.createElement(v4, v17));
        end, 
        addCustomEntry = function(v18)
            v13 = v13 + 1;
            v12 = v12 + 1;
            v8.FuzzySearch.incrementEntryCount();
            table.insert(v11, v18);
        end, 
        addVisualizationModeEntry = function(v19, v20)
            v14 = v14 + 1;
            local v21, v22 = v8.FuzzySearch.includeEntry(v20.title);
            if v8.ForceVisible then
                v21 = true;
            end;
            if v22 ~= nil then
                v15 = v15 + 1;
            end;
            if not v21 then
                v8.FuzzySearch.incrementFilteredCount();
            end;
            if v20.enabled then
                v16 = v16 + 1;
            end;
            local v23 = {
                key = v20.name, 
                Text = v20.title, 
                Visible = v21, 
                ToolTip = v20.toolTip, 
                Enabled = v20.enabled, 
                LayoutOrder = v10:getNextOrder(), 
                MatchIndexes = v22, 
                IsEditingEnabled = true, 
                OnToggle = function()
                    v9:report("visualizationModeToggled", {
                        actionSource = "button", 
                        visualizationModeCategory = v19.name, 
                        visualizationMode = v20.name, 
                        isEnabled = not v20.enabled
                    });
                    v8.OnVisualizationModeToggle(v19.name, v20.name, not v20.enabled, true);
                end
            };
            v13 = v13 + 1;
            v8.FuzzySearch.incrementEntryCount();
            if v23.Visible ~= false then
                v12 = v12 + 1;
            end;
            table.insert(v11, v3.createElement(v4, v23));
        end, 
        renderEntries = function()
            return v11;
        end, 
        hasVisibleEntries = function()
            return v12 > 0;
        end, 
        getEntryCount = function()
            return v13;
        end, 
        getVisualizationModeEntryCount = function()
            return v14;
        end, 
        getEntryMatchCount = function()
            return v15;
        end, 
        getEnabledCount = function()
            return v16;
        end
    };
end;
