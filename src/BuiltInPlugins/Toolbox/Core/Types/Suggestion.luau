local v0 = require(script.Parent.Parent.Parent.Core.Types.Category);
return {
    SUGGESTIONS = {
        {
            name = "NPC", 
            search = "NPC"
        }, 
        {
            name = "Vehicle", 
            search = "Vehicle"
        }, 
        {
            name = "Weapon", 
            search = "Weapon"
        }, 
        {
            name = "Building", 
            search = "Building"
        }, 
        {
            name = "Light", 
            search = "Light"
        }
    }, 
    canHaveSuggestions = function(v1, v2)
        local v3 = false;
        if v1 == "" then
            v3 = v0.categoryIsFreeAsset(v2);
        end;
        return v3;
    end
};
