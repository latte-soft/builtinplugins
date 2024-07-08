local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Rodux);
local v2 = require(l_Parent_0.Packages.Cryo);
return v1.createReducer({
    creatorType = nil, 
    creatorId = nil, 
    creatorName = nil, 
    creatorFriends = nil, 
    groupOwnerId = nil, 
    groupOwnerName = nil
}, {
    ResetStore = function(_, _)
        return {};
    end, 
    SetCreatorType = function(v5, v6)
        return v2.Dictionary.join(v5, {
            creatorType = v6.creatorType
        });
    end, 
    SetCreatorId = function(v7, v8)
        return v2.Dictionary.join(v7, {
            creatorId = v8.creatorId
        });
    end, 
    SetCreatorName = function(v9, v10)
        return v2.Dictionary.join(v9, {
            creatorName = v10.creatorName
        });
    end, 
    SetCreatorFriends = function(v11, v12)
        assert(v11.creatorType == Enum.CreatorType.User, "Setting friends in non-user owned game");
        return v2.Dictionary.join(v11, {
            creatorFriends = v12.creatorFriends
        });
    end, 
    SetGroupOwnerId = function(v13, v14)
        assert(v13.creatorType == Enum.CreatorType.Group, "Setting group owner id in non-group owned game");
        return v2.Dictionary.join(v13, {
            groupOwnerId = v14.groupOwnerId
        });
    end
});
