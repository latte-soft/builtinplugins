local l_Promise_0 = require(script.Parent.Parent.Parent.Packages.Framework).Util.Promise;
local v1 = {};
v1.__index = v1;
v1.new = function()
    local v2 = {};
    setmetatable(v2, v1);
    return v2;
end;
v1.CreateAssetOrAssetVersionAndPollAssetWithTelemetryAsync_Impl = function(_, ...)
    return {
        AssetId = "123"
    };
end;
v1.CreateAssetOrAssetVersionAndPollAssetWithTelemetryAsync = function(v4, ...)
    local v5 = {
        ...
    };
    return l_Promise_0.new(function(v6, _)
        v6(v4:CreateAssetOrAssetVersionAndPollAssetWithTelemetryAsync_Impl(unpack(v5)));
    end);
end;
return v1;
