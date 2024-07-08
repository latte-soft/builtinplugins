local l_HttpService_0 = game:GetService("HttpService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v2 = require(l_script_FirstAncestor_0.Packages.Dash);
local v3 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v5 = require(l_script_FirstAncestor_0.Src.Util.getPaletteFromKey);
return {
    createEquippedItemsSerializer = function(v6)
        return {
            serialize = function(v7)
                return l_HttpService_0:JSONEncode(v2.map(v7, function(v8)
                    local v9 = nil;
                    if v8.item.source == v3.SOURCE_BUILTIN then
                        v9 = {
                            source = v3.SOURCE_BUILTIN, 
                            builtinItem = if not v8.palette.Serializer then v8.item.builtinItem else v8.palette.Serializer.serialize(v8.item.builtinItem)
                        };
                    elseif v8.item.source == v3.SOURCE_INSTANCE then
                        v9 = {
                            source = v3.SOURCE_INSTANCE, 
                            key = v8.item.instance.Name
                        };
                    else
                        error((("Unknown item source in serialization: %*"):format(v8.item.source)));
                    end;
                    return {
                        palette = v8.palette.Key, 
                        item = v9, 
                        isHidden = v8.isHidden
                    };
                end));
            end, 
            deserialize = function(v10)
                return v2.collectArray(l_HttpService_0:JSONDecode(v10), function(_, v12)
                    local v13 = v5(v12.palette);
                    if v13 == nil then
                        return nil;
                    else
                        assert(v13 ~= nil, v3.LUAU_ANALYZE_ERROR);
                        local v14 = nil;
                        if v12.item.source == v3.SOURCE_BUILTIN then
                            v14 = {
                                source = v3.SOURCE_BUILTIN, 
                                builtinItem = if not v13.Serializer then v12.item.builtinItem else v13.Serializer.deserialize(v12.item.builtinItem)
                            };
                        elseif v12.item.source == v3.SOURCE_INSTANCE then
                            local l_v6_FirstChild_0 = v6:FindFirstChild(v12.item.key);
                            if l_v6_FirstChild_0 == nil then
                                return nil;
                            else
                                v14 = {
                                    source = v3.SOURCE_INSTANCE, 
                                    instance = l_v6_FirstChild_0
                                };
                            end;
                        else
                            error((("Unknown item source in deserialization: %*"):format(v12.item.source)));
                        end;
                        return {
                            palette = v13, 
                            item = v14, 
                            isHidden = v12.isHidden
                        };
                    end;
                end);
            end
        };
    end
};
