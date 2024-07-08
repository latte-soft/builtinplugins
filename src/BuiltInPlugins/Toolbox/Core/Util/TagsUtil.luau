local v0 = require(script.Parent.Parent.Parent.Packages.Cryo);
return {
    getTagsFromItemTags = function(v1)
        local v2 = {};
        for v3 = 1, #v1 do
            v2[v3] = v1[v3].tag;
        end;
        return v2;
    end, 
    areSetsDifferent = function(v4, v5)
        local v6 = {};
        for _, v8 in pairs(v4) do
            v6[not not v8.id and v8.tag.tagId or v8.tagId] = true;
        end;
        for _, v10 in pairs(v5) do
            if v6[v10.tagId] then
                v6[v10.tagId] = nil;
            else
                return false;
            end;
        end;
        if not next(v6) then
            return true;
        else
            return false;
        end;
    end, 
    areTagsEnabled = function(v11, v12, v13)
        return v11 and v0.List.find(v12, v13.Name) ~= nil;
    end, 
    hasTag = function(v14, v15)
        for _, v17 in pairs(v14) do
            if v17.tagId == v15 then
                return true;
            end;
        end;
        return false;
    end
};
