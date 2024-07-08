local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Rodux);
local v2 = require(l_Parent_0.Packages.Cryo);
local l_Actions_0 = l_Parent_0.Src.Actions;
local v4 = require(l_Actions_0.SetSelectedTab);
local v5 = require(l_Actions_0.SetAllTabsData);
local function _()
    return {
        selectedTab = nil, 
        allTabsData = nil
    };
end;
return (v1.createReducer({
    selectedTab = nil, 
    allTabsData = nil
}, {
    [v4.name] = function(v7, v8)
        return v2.Dictionary.join(v7, {
            selectedTab = v8.selectedTab
        });
    end, 
    [v5.name] = function(v9, v10)
        return v2.Dictionary.join(v9, {
            allTabsData = v10.allTabsData
        });
    end
}));
