local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Util_0 = l_Parent_0.Core.Util;
local v2 = require(l_Util_0.PreviewModelGetter);
local v3 = require(l_Util_0.DebugFlags);
local v4 = require(l_Parent_0.Core.Actions.SetPreviewModel);
local l_getFFlagModelPreviewThumbnailFallback_0 = require(l_Parent_0.Packages.Framework).SharedFlags.getFFlagModelPreviewThumbnailFallback;
return function(v6, v7)
    return function(v8)
        if not l_getFFlagModelPreviewThumbnailFallback_0() then
            return v2(v6, v7):andThen(function(v9)
                v8:dispatch(v4(v9));
            end);
        else
            return v2(v6, v7):andThen(function(v10)
                v8:dispatch(v4(v10));
            end, function(v11)
                if v3.shouldDebugWarnings() then
                    warn((tostring(v11)));
                end;
            end);
        end;
    end;
end;
