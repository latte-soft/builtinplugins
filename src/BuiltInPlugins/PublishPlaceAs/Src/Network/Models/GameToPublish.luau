return {
    mock = function()
        return {
            creatorTargetId = 22915773, 
            rootPlaceId = 10395446, 
            name = "yeet game", 
            universeId = 149757, 
            privateType = "Public"
        };
    end, 
    fromJsonData = function(v0)
        local v1 = not v0.creatorTargetId;
        local v2 = not v0.rootPlaceId;
        if not (not v0.id or v1) and not v2 then
            if type(v0.id) ~= "number" then
                return false, "Game.fromJsonData expects id to be a number";
            elseif type(v0.creatorTargetId) ~= "number" then
                return false, "Game.fromJsonData expects creatorId to be a number";
            elseif type(v0.rootPlaceId) ~= "number" then
                return false, "Game.fromJsonData expects rootPlaceId to be a number";
            elseif type(v0.name) ~= "string" then
                return false, "Game.fromJsonData expects name to be a string";
            elseif type(v0.privacyType) ~= "string" then
                return false, "Game.fromJsonData expects privacyType to be a string";
            else
                return true, {
                    creatorId = v0.creatorTargetId, 
                    rootPlaceId = v0.rootPlaceId, 
                    name = v0.name, 
                    universeId = v0.id, 
                    privacyType = v0.privacyType
                };
            end;
        else
            return false, "Game.fromJsonData received JSON without required fields";
        end;
    end
};
