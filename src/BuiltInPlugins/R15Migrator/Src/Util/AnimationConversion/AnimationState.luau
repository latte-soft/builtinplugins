local l_AnimationStatus_0 = require(script:FindFirstAncestor("R15Migrator").Src.Util.AnimationConversion.constants).AnimationStatus;
local v1 = {};
v1.__index = v1;
v1.new = function(v2, v3, v4, v5, v6)
    assert((v2.id and v2.url) and v2._type, "invalid animation asset info");
    assert(type(v3) == "string", "invalid animation name");
    assert(type(v4) == "number", "invalid animation index");
    return (setmetatable({
        animationAssetInfo = v2, 
        refs = {}, 
        oldRefs = {}, 
        name = v3, 
        index = v4, 
        status = v5, 
        converted = v6
    }, v1));
end;
v1.complete = function(v7)
    v7.oldRefs = v7.refs;
    v7.refs = {};
    v7.status = l_AnimationStatus_0.Done;
end;
v1.removeRefs = function(v8, v9)
    for _, v11 in v9, nil, nil do
        assert(v8.refs[v11], "ref not found");
        v8.oldRefs[v11] = v8.refs[v11];
        v8.refs[v11] = nil;
    end;
    if not next(v8.refs) then
        v8.status = l_AnimationStatus_0.Done;
    end;
end;
v1.addRefs = function(v12, v13)
    for _, v15 in v13, nil, nil do
        assert(v12.oldRefs[v15], "ref not found");
        v12.refs[v15] = v12.oldRefs[v15];
        v12.oldRefs[v15] = nil;
    end;
    if not next(v12.oldRefs) then
        v12.status = nil;
    end;
end;
return v1;
