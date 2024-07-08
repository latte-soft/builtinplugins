local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Core.Actions.SetTagsMetadata);
local v2 = require(l_Parent_0.Core.Util.DebugFlags);
return function(v3)
    return function(v4)
        return v3:getTagsMetadata():andThen(function(v5)
            v4:dispatch(v1(v5.responseBody and v5.responseBody.isItemTagsFeatureEnabled == true, not not v5.responseBody and v5.responseBody.enabledAssetTypes or {}, not not v5.responseBody and v5.responseBody.maximumItemTagsPerItem or 0));
        end, function(_)
            if v2.shouldDebugWarnings() then
                warn("Lua toolbox: Could not get tags metadata");
            end;
        end);
    end;
end;
