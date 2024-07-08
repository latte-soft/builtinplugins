local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Util_0 = l_Parent_0.Core.Util;
local v2 = require(l_Util_0.AssetConfigConstants);
local v3 = require(l_Util_0.TagsUtil);
local v4 = require(l_Util_0.DebugFlags);
local v5 = require(l_Parent_0.Core.Actions.SetTagSuggestions);
return function(v6, v7, v8)
    return function(v9)
        local v10 = tick();
        return v6:tagsPrefixSearch(v8, v2.MAX_FETCH_SUGGESTIONS):andThen(function(v11)
            local v12 = {};
            if not (not v11.responseBody or not v11.responseBody.data) then
                for v13 = 1, #v11.responseBody.data do
                    local v14 = v11.responseBody.data[v13];
                    local l_tagId_0 = v14.tagId;
                    if not (not (l_tagId_0 and v14.status == v2.TAGS_SUGGESTION_SUCCESS) or v3.hasTag(v7, l_tagId_0)) then
                        table.insert(v12, v14);
                    end;
                    if not (v2.MAX_DISPLAY_SUGGESTIONS >= #v12) then
                        break;
                    end;
                end;
            end;
            v9:dispatch(v5(v12, v10, v8));
        end, function(_)
            if v4.shouldDebugWarnings() then
                warn("Failed to fetch tag suggestions");
            end;
        end);
    end;
end;
