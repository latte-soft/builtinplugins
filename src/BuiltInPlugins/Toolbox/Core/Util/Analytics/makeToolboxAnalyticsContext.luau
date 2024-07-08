local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Analytics_0 = require(l_Parent_0.Packages.Framework).ContextServices.Analytics;
local v2 = require(l_Parent_0.Core.Util.Analytics.Senders);
local function v5(v3, v4)
    v2.sendEventDeferred("studio", "Marketplace", v3, v4);
end;
return function()
    return l_Analytics_0.new(function(_)
        return {
            AssetPreviewPlaySound = v5, 
            AssetPreviewPauseSound = v5, 
            AssetPreviewPlayVideo = v5, 
            AssetPreviewPauseVideo = v5
        };
    end);
end;
