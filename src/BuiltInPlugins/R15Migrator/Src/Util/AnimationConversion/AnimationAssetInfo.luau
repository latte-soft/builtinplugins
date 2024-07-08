local l_AssetType_0 = require(script.Parent.constants).AssetType;
local v1 = {};
v1.__index = v1;
v1.new = function(v2, v3, v4, v5)
    return (setmetatable({
        id = v2, 
        url = v3, 
        _type = v4, 
        instance = v5
    }, v1));
end;
v1.IsA = function(v6, v7)
    if v7 == l_AssetType_0.RobloxAsset then
        local v8 = true;
        if v6._type ~= l_AssetType_0.RobloxAsset then
            v8 = true;
            if v6._type ~= l_AssetType_0.AnimationInstance then
                v8 = v6._type == l_AssetType_0.AssetIdString;
            end;
        end;
        return v8;
    else
        return v6._type == v7;
    end;
end;
return v1;
