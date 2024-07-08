local _ = require(script:FindFirstAncestor("AssetImporter").Src.Types);
return {
    mock = function()
        return {
            groupId = 13370420, 
            name = "RobloxLovers"
        };
    end, 
    fromJsonData = function(v1)
        if type(v1.id) ~= "number" then
            return false, "Group.fromJsonData expects id to be a number";
        elseif type(v1.name) ~= "string" then
            return false, "Group.fromJsonData expects name to be a string";
        else
            return true, {
                name = v1.name, 
                groupId = v1.id
            };
        end;
    end
};
