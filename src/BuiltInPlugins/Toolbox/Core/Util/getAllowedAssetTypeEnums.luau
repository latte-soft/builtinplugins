local v0 = require(script.Parent.Parent.Parent.Core.Util.AssetConfigConstants);
return function(v1)
    local v2 = {};
    if v1 then
        for _, v4 in ipairs(v0.ASSET_TYPE_INFO) do
            if not (not v4.isCatalog or not v4.isUploadable) and v1[v4.type.Name] ~= nil then
                v2[#v2 + 1] = v4.type;
            end;
        end;
    end;
    return v2;
end;
