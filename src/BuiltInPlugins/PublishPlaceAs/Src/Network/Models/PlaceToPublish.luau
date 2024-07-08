return {
    mock = function()
        return {
            placeId = 3262491642, 
            universeId = 1177385430, 
            name = "test place to publish", 
            description = "MOCK_DESCRIPTION"
        };
    end, 
    fromJsonData = function(v0)
        if v0 then
            if type(v0.id) ~= "number" then
                return false, "Place.fromJsonData expects id to be a number";
            elseif type(v0.universeId) ~= "number" then
                return false, "Place.fromJsonData expects universeId to be a number";
            elseif type(v0.name) ~= "string" then
                return false, "Place.fromJsonData expects name to be a string";
            elseif type(v0.description) ~= "string" then
                return false, "Place.fromJsonData expects description to be a string";
            else
                return true, {
                    name = v0.name, 
                    placeId = v0.id, 
                    universeId = v0.universeId, 
                    description = v0.description
                };
            end;
        else
            return false, "Invalid data to PlaceToPublish";
        end;
    end
};
