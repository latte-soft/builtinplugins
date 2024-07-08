local l_CollectionService_0 = game:GetService("CollectionService");
local l_NonePublishTags_0 = require(script:FindFirstAncestor("R15Migrator").Src.Resources.Constants).NonePublishTags;
local v2 = {
    _tag = nil
};
v2.__index = v2;
v2.new = function(v3)
    return (setmetatable({
        _tag = v3
    }, v2));
end;
v2.addTag = function(v4, v5)
    l_CollectionService_0:AddTag(v5, v4._tag);
end;
v2.removeTag = function(v6, v7)
    l_CollectionService_0:RemoveTag(v7, v6._tag);
end;
v2.getTagged = function(v8)
    return l_CollectionService_0:GetTagged(v8._tag);
end;
local v9 = {};
v9.clearTags = function(v10)
    for _, v12 in {
        v9.CharactersConvertedToR15Tagging
    }, nil, nil do
        v12:removeTag(v10);
        for _, v14 in v10:GetDescendants() do
            v12:removeTag(v14);
        end;
    end;
end;
v9.CharactersConvertedToR15Tagging = v2.new(l_NonePublishTags_0.CharactersConvertedToR15Tag);
return v9;
