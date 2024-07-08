local v0 = require(script.AssigningGroup);
local v1 = require(script.ColorPicker);
local v2 = require(script.GroupData);
local v3 = require(script.GroupMenu);
local v4 = require(script.HoveredIcon);
local v5 = require(script.IconPicker);
local v6 = require(script.IconSearch);
local v7 = require(script.MinimizedSettingsPane);
local v8 = require(script.RenamingGroup);
local v9 = require(script.RenamingTag);
local v10 = require(script.Search);
local v11 = require(script.TagData);
local v12 = require(script.TagMenu);
local v13 = require(script.UIGroupCollapseState);
local v14 = require(script.UnknownTags);
local v15 = require(script.WorldView);
return function(v16, v17)
    v16 = v16 or {};
    return {
        AssigningGroup = v0(v16.AssigningGroup, v17), 
        ColorPicker = v1(v16.ColorPicker, v17), 
        GroupData = v2(v16.GroupData, v17), 
        GroupMenu = v3(v16.GroupMenu, v17), 
        HoveredIcon = v4(v16.HoveredIcon, v17), 
        IconPicker = v5(v16.IconPicker, v17), 
        IconSearch = v6(v16.IconSearch, v17), 
        MinimizedSettingsPane = v7(v16.MinimizedSettingsPane, v17), 
        RenamingGroup = v8(v16.RenamingGroup, v17), 
        RenamingTag = v9(v16.RenamingTag, v17), 
        Search = v10(v16.Search, v17), 
        TagData = v11(v16.TagData, v17), 
        TagMenu = v12(v16, v17), 
        UIGroupCollapseState = v13(v16.UIGroupCollapseState, v17), 
        UnknownTags = v14(v16.UnknownTags, v17), 
        WorldView = v15(v16.WorldView, v17)
    };
end;
