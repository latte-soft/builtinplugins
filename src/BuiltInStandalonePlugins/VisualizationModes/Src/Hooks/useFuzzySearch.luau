local l_script_FirstAncestor_0 = script:FindFirstAncestor("VisualizationModes");
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v2 = require(l_script_FirstAncestor_0.Src.Util.Fzy);
local v3 = require(l_script_FirstAncestor_0.Src.Hooks.usePluginSetting);
return function(v4)
    local v5 = v2.createConfig({
        caseSensitive = false
    });
    local v6 = v2.getScoreFloor(v5);
    local v7, v8 = v3(v4.SettingsKey, "");
    local function v12(v9)
        if v7 == "" then
            return true, nil;
        else
            local v10, v11 = v2.positions(v5, v7, v9);
            if v6 < v11 then
                return true, v10;
            else
                return false, nil;
            end;
        end;
    end;
    local v13 = 0;
    local v14 = 0;
    return table.freeze({
        searchText = v7, 
        setSearchText = v8, 
        includeEntry = v12, 
        getFilteredCount = function()
            return v13;
        end, 
        incrementFilteredCount = function()
            v13 = v13 + 1;
        end, 
        incrementEntryCount = function()
            v14 = v14 + 1;
        end, 
        getAreAllEntriesHidden = function()
            return v14 <= v13;
        end
    });
end;
