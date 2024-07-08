local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v3 = require(l_script_FirstAncestor_0.Src.Util.createUnimplemented);
return v1.createContext({
    equippedItems = {}, 
    addEquippedItem = v3("addEquippedItem"), 
    removeEquippedItem = v3("removeEquippedItem"), 
    removeAllEquippedItems = v3("removeAllEquippedItems"), 
    moveEquippedItemsToIndex = v3("moveEquippedItemsToIndex"), 
    hideEquippedItem = v3("hideEquippedItem"), 
    showEquippedItem = v3("showEquippedItem"), 
    setHideAllEquippedItems = v3("setHideAllEquippedItems"), 
    startIgnoringChildren = function()
        return function()
        end;
    end, 
    isIgnoringChildren = false, 
    avatarAssets = {
        accessories = {}, 
        animation = nil, 
        clothing = {}, 
        emotion = nil, 
        patches = {}
    }
});
