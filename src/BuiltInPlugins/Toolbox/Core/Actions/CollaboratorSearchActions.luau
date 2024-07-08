local l_Action_0 = require(script.Parent.Parent.Parent.Packages.Framework).Util.Action;
return {
    LoadingLocalUserFriends = l_Action_0("LoadingLocalUserFriends", function()
        return {};
    end), 
    LoadingLocalUserGroups = l_Action_0("LoadingLocalUserGroups", function()
        return {};
    end), 
    LoadingWebResults = l_Action_0("LoadingWebResults", function(v1)
        return {
            searchTerm = v1
        };
    end), 
    LoadedLocalUserFriends = l_Action_0("LoadedLocalUserFriends", function(v2, v3)
        return {
            success = v2, 
            friends = v3
        };
    end), 
    LoadedLocalUserGroups = l_Action_0("LoadedLocalUserGroups", function(v4, v5)
        return {
            success = v4, 
            groups = v5
        };
    end), 
    LoadedWebResults = l_Action_0("LoadedWebResults", function(v6, v7, v8)
        return {
            success = v6, 
            key = v7, 
            results = v8
        };
    end), 
    SearchTextChanged = l_Action_0("SearchTextChanged", function(v9)
        return {
            text = v9
        };
    end), 
    CollaboratorAdded = l_Action_0("CollaboratorAdded", function(v10, v11, v12)
        return {
            collaboratorType = v10, 
            collaboratorId = v11, 
            action = v12
        };
    end)
};
