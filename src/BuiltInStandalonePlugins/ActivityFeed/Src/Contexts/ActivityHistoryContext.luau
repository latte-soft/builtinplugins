local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.React);
local _ = require(l_Parent_0.Src.Clients.ActivityHistoryClient);
local v3 = require(l_Parent_0.Src.Clients.MockActivityHistoryClient);
local v4 = {};
return (v1.createContext({
    activityHistoryClient = v3, 
    showSaveOrPublishPlaceToRobloxFn = function()
    end, 
    useCollaborators = function()
        return v4;
    end, 
    usePlaceAndUniverseId = function()
        return 0, 0;
    end, 
    useConnectToDataModelSessionEffect = function()
    end, 
    openBrowserLink = function()
    end, 
    contextType = "mock context (default)"
}));
