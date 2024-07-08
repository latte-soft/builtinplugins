local l_ContentProvider_0 = game:GetService("ContentProvider");
local l_HttpService_0 = game:GetService("HttpService");
local l_Util_0 = script.Parent.Parent.Parent.Core.Util;
local _ = require(l_Util_0.AssetConfigConstants);
local v4 = require(l_Util_0.EnumConvert);
return function(v5, v6)
    local l_BaseUrl_0 = l_ContentProvider_0.BaseUrl;
    local _ = v4.convertAssetTypeValueToEnum(v6);
    return string.format("%s/abusereport/asset?id=%s", l_BaseUrl_0, l_HttpService_0:urlEncode(v5));
end;
