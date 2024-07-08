local v0 = require(script.Parent.Parent.Parent.Core.Util.PagedRequestCursor);
return function(_, _)
    return {
        idToAssetMap = {}, 
        idsToRender = {}, 
        isLoading = true, 
        currentCursor = v0.createDefaultCursor(), 
        totalAssets = 0, 
        assetsReceived = 0, 
        hasReachedBottom = false, 
        manageableAssets = {}
    };
end;
