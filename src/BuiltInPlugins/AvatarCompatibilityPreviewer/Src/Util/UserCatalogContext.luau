local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local _ = require(l_script_FirstAncestor_0.Src.Types);
return (v1.createContext({
    equippableItems = {}, 
    addNewItem = function(_, _)
        error("Calling default addNewItem");
    end, 
    removeItem = function()
        error("Calling default removeItem");
    end
}));
