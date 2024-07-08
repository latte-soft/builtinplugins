return {
    getEnumAsList = function(v0)
        local v1 = {};
        for _, v3 in v0, nil, nil do
            table.insert(v1, v3);
        end;
        return v1;
    end, 
    Scope = {
        User = "User", 
        Group = "Group"
    }, 
    AssetType = {
        Model = "Model", 
        Mesh = "Mesh", 
        Image = "Image", 
        Decal = "Decal", 
        Audio = "Audio", 
        Video = "Video", 
        Animation = "Animation"
    }, 
    ModerationStatus = {
        Reviewing = "MODERATION_STATE_REVIEWING", 
        Rejected = "MODERATION_STATE_REJECTED", 
        Approved = "MODERATION_STATE_APPROVED"
    }, 
    AssetInfoField = {
        AssetId = "AssetId", 
        AssetType = "AssetType", 
        DisplayName = "DisplayName", 
        VersionNumber = "VersionNumber", 
        Created = "Created", 
        Modified = "Modified", 
        ModerationStatus = "ModerationStatus", 
        Owner = "Owner"
    }, 
    ViewType = require(script:FindFirstAncestor("AssetManager").Packages.Framework).Util.enumerate("ViewType", {
        List = 1, 
        Grid = 2, 
        Unsupported = 3
    })
};
