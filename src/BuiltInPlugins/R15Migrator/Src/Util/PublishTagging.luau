local l_CollectionService_0 = game:GetService("CollectionService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("R15Migrator");
local v2 = require(l_script_FirstAncestor_0.Src.Util.DebugFlags);
local v3 = require(l_script_FirstAncestor_0.Src.Resources.Constants);
local l_PublishTags_0 = v3.PublishTags;
local v5 = v3.AttributePrefix .. "Blocked";
local v6 = {
    _name = nil, 
    mask = 0
};
v6.__index = v6;
v6.new = function(v7)
    return (setmetatable({
        _name = not not v7 and v7.Name or nil, 
        _mask = not not v7 and v7.Mask or 0
    }, v6));
end;
v6.addTag = function(v8, v9)
    l_CollectionService_0:AddTag(v9, v8._name);
    v8:setPublishBlocked();
end;
v6.removeTag = function(v10, v11)
    l_CollectionService_0:RemoveTag(v11, v10._name);
    v10:checkPublishTags();
end;
v6.isBlocking = function(v12)
    if v2.RunTests() then
        return nil;
    else
        return (bit32.btest(game:GetService("StudioPublishService"):GetAttribute(v5) or 0, v12._mask));
    end;
end;
v6.removeAllTags = function(v13)
    for _, v15 in pairs(v13:getTagged()) do
        l_CollectionService_0:RemoveTag(v15, v13._name);
    end;
    v13:checkPublishTags();
end;
v6.getTagged = function(v16)
    return (l_CollectionService_0:GetTagged(v16._name));
end;
v6.hasTagged = function(v17, v18)
    return l_CollectionService_0:HasTag(v18, v17._name);
end;
for v19, v20 in l_PublishTags_0, nil, nil do
    v6[v19] = v6.new(v20);
end;
v6.clearPublishTags = function(_, v22)
    for v23 in l_PublishTags_0, nil, nil do
        local v24 = v6[v23];
        v24:removeTag(v22);
        for _, v26 in v22:GetDescendants() do
            v24:removeTag(v26);
        end;
    end;
end;
v6.checkPublishTags = function(v27)
    if not v2.RunTests() then
        local l_StudioPublishService_0 = game:GetService("StudioPublishService");
        l_StudioPublishService_0.PublishLocked = true;
        local v29 = nil;
        if not v27._name or not v27._mask then
            v29 = 0;
            for _, v31 in l_PublishTags_0, nil, nil do
                if #l_CollectionService_0:GetTagged(v31.Name) > 0 then
                    v29 = bit32.bor(v29, v31.Mask);
                end;
            end;
        else
            v29 = l_StudioPublishService_0:GetAttribute(v5) or 0;
            if not (#l_CollectionService_0:GetTagged(v27._name) > 0) then
                v29 = bit32.band(v29, (bit32.bnot(v27._mask)));
            end;
        end;
        l_StudioPublishService_0:SetAttribute(v5, v29);
    end;
end;
v6.setPublishBlocked = function(v32)
    if not v2.RunTests() then
        local l_StudioPublishService_1 = game:GetService("StudioPublishService");
        l_StudioPublishService_1.PublishLocked = true;
        l_StudioPublishService_1:SetAttribute(v5, (bit32.bor(l_StudioPublishService_1:GetAttribute(v5) or 0, v32._mask)));
    end;
end;
v6.publishingIsBlocked = function(_)
    if v2.RunTests() then
        return nil;
    else
        return game:GetService("StudioPublishService"):GetAttribute(v5);
    end;
end;
v6.prepareToPublish = function(_)
    if not v2.RunTests() then
        game:GetService("StudioPublishService").PublishLocked = false;
    end;
end;
return v6;
