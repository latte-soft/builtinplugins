local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.React);
local _ = require(l_Parent_0.Src.Clients.ActivityHistoryClient);
local v3 = require(l_Parent_0.Src.Contexts.ActivityHistoryContext);
local v4 = {};
return function(v5)
    return v1.createElement(v3.Provider, {
        value = v1.useMemo(function()
            return {
                activityHistoryClient = v5.activityHistoryClient, 
                showSaveOrPublishPlaceToRobloxFn = v5.showSaveOrPublishPlaceToRobloxFn or function()
                end, 
                useCollaborators = v5.useCollaborators or function()
                    return v4;
                end, 
                usePlaceAndUniverseId = v5.usePlaceAndUniverseId or function()
                    return 0, 0;
                end, 
                useConnectToDataModelSessionEffect = v5.useConnectToDataModelSessionEffect or function()
                end, 
                openBrowserLink = v5.openBrowserLink or function()
                end, 
                contextType = v5.contextType
            };
        end, {
            v5.activityHistoryClient, 
            v5.showSaveOrPublishPlaceToRobloxFn, 
            v5.openBrowserLink, 
            v5.contextType, 
            v5.useCollaborators, 
            v5.usePlaceAndUniverseId, 
            v5.useConnectToDataModelSessionEffect
        })
    }, v5.children);
end;
