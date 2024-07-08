local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Core.Util.DebugFlags);
local v2 = require(l_Parent_0.Core.Types.Category);
local v3 = require(l_Parent_0.Core.Types.Sort);
local v4 = require(l_Parent_0.Core.Types.LayoutMode);
local v5 = {};
v5.__index = v5;
local l_disableMarketplaceAndRecents_0 = require(l_Parent_0.Core.Util.ToolboxUtilities).disableMarketplaceAndRecents;
local l_showRobloxCreatedAssets_0 = require(l_Parent_0.Core.Util.ToolboxUtilities).showRobloxCreatedAssets;
local v8 = require(l_Parent_0.Core.Util.SharedFlags.getFFlagToolboxEnableAssetRows);
local v9 = "Toolbox_" .. "SelectedCategoryName";
local v10 = "Toolbox_" .. "SelectedSearchTerm";
local v11 = "Toolbox_" .. "SelectedSortIndex";
local v12 = "Toolbox_" .. "ShowScriptWarning";
local v13 = "Toolbox_" .. "LastAnnouncementViewedKey";
local v14 = "Toolbox_" .. "LayoutModeKey";
v5.new = function(v15)
    local v16 = {
        _plugin = v15
    };
    setmetatable(v16, v5);
    return v16;
end;
v5._getSetting = function(v17, v18, v19)
    if v17._plugin then
        local l_Setting_0 = v17._plugin:GetSetting(v18);
        if v1.shouldLogSettings() then
            print(("Settings:_getSetting(setting=\"%s\", default=%s) got value = %s"):format(tostring(v18), type(v19) == "string" and "\"" .. tostring(v19) .. "\"" or tostring(v19), type(l_Setting_0) == "string" and "\"" .. tostring(l_Setting_0) .. "\"" or tostring(l_Setting_0)));
        end;
        if not l_Setting_0 then
            l_Setting_0 = v19;
        end;
        return l_Setting_0;
    else
        return v19;
    end;
end;
v5._setSetting = function(v21, v22, v23)
    if v21._plugin then
        if v1.shouldLogSettings() then
            print(("Settings:_setSetting(setting=\"%s\", value=%s)"):format(tostring(v22), type(v23) == "string" and "\"" .. tostring(v23) .. "\"" or tostring(v23)));
        end;
        v21._plugin:SetSetting(v22, v23);
        return ;
    else
        return ;
    end;
end;
v5.getSelectedCategoryName = function(v24)
    return v24:_getSetting(v9, v2.DEFAULT.name);
end;
v5.setSelectedCategoryName = function(v25, v26)
    return v25:_setSetting(v9, v26);
end;
v5.getSelectedSearchTerm = function(v27)
    return v27:_getSetting(v10, "");
end;
v5.setSelectedSearchTerm = function(v28, v29)
    return v28:_setSetting(v10, v29);
end;
v5.getSelectedSortIndex = function(v30)
    return v30:_getSetting(v11, 1);
end;
v5.setSelectedSortIndex = function(v31, v32)
    return v31:_setSetting(v11, v32);
end;
v5.getShowScriptWarning = function(v33)
    return v33:_getSetting(v12, "true") == "true";
end;
v5.setShowScriptWarning = function(v34, v35)
    return v34:_setSetting(v12, (tostring(v35)));
end;
v5.getLastAnnouncementViewedKey = function(v36)
    return v36:_getSetting(v13, "");
end;
v5.setLastAnnouncementViewedKey = function(v37, v38)
    return v37:_setSetting(v13, (tostring(v38)));
end;
if v8() then
    v5.getLayoutMode = function(v39)
        return v39:_getSetting(v14, v4.Grid);
    end;
    v5.setLayoutMode = function(v40, v41)
        return v40:_setSetting(v14, (tostring(v41)));
    end;
end;
v5.updateFromPageInfo = function(v42, v43)
    if v1.shouldLogSettings() then
        print("Settings:updateFromPageInfo()");
    end;
    v42:setSelectedCategoryName(v43.categoryName);
    v42:setSelectedSearchTerm(v43.searchTerm);
    v42:setSelectedSortIndex(v43.sortIndex);
end;
v5.loadInitialSettings = function(v44)
    if v1.shouldLogSettings() then
        print("Settings:loadInitialSettings()");
    end;
    local v45 = {};
    if not l_disableMarketplaceAndRecents_0() then
        v45.categoryName = v44:getSelectedCategoryName();
        if not v2.getCategoryByName(v45.categoryName) then
            v45.categoryName = v2.DEFAULT.name;
        end;
    else
        v45.categoryName = v2.DEFAULT.name;
    end;
    if l_showRobloxCreatedAssets_0() then
        v45.tab = v2.MARKETPLACE_KEY;
        v45.categoryName = v2.DEFAULT.name;
        v45.creator = v2.CREATOR_ROBLOX;
    end;
    v45.searchTerm = v44:getSelectedSearchTerm();
    v45.sortIndex = v44:getSelectedSortIndex();
    if not v3.canSort(v45.searchTerm, v45.categoryName) then
        v45.sortIndex = v3.getDefaultSortForCategory(v45.categoryName);
    end;
    return v45;
end;
return v5;
