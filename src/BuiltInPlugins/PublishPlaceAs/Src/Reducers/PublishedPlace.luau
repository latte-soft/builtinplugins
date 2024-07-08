local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Rodux);
local v2 = require(l_Parent_0.Packages.Cryo);
return v1.createReducer({
    isPublishing = false, 
    publishInfo = {
        id = 0, 
        name = "", 
        parentGameName = "", 
        parentGameId = 0, 
        settings = {}, 
        message = ""
    }
}, {
    SetIsPublishing = function(v3, v4)
        return v2.Dictionary.join(v3, {
            isPublishing = v4.isPublishing
        });
    end, 
    SetPublishInfo = function(v5, v6)
        return v2.Dictionary.join(v5, {
            publishInfo = v2.Dictionary.join(v5.publishInfo, v6.publishInfo)
        });
    end, 
    ResetInfo = function(v7, v8)
        return v2.Dictionary.join(v7, {
            publishInfo = v2.Dictionary.join(v7.publishInfo, v8.publishInfo), 
            isPublishing = v8.isPublishing
        });
    end
});
