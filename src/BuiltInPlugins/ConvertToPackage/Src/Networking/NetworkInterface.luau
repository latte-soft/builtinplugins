local l_Parent_0 = script.Parent.Parent.Parent;
local l_Networking_0 = require(l_Parent_0.DEPRECATED_modules.Http).Networking;
local v2 = require(l_Parent_0.Src.Util.DebugFlags);
local v3 = require(l_Parent_0.Src.Util.Urls);
local v4 = {};
v4.__index = v4;
v4.new = function()
    local v5 = {
        _networkImp = l_Networking_0.new()
    };
    setmetatable(v5, v4);
    return v5;
end;
local function v10(v6, v7, v8, v9)
    if v2.shouldDebugUrls() then
        print(("NetworkInterface:%s()"):format(v6));
        print(("\t%s %s"):format(v7:upper() or "method=nil", v8 or "url=nil"));
        if v9 then
            print(("\t%s"):format((tostring(v9))));
        end;
    end;
end;
v4.jsonEncode = function(v11, v12)
    return v11._networkImp:jsonEncode(v12);
end;
v4.postUploadAsset = function(v13, v14, v15, v16, v17, v18, v19, v20, v21, v22)
    local v23 = v3.constructPostUploadAssetUrl(v14, v15, v16, v17, v18, v19, v20, v21);
    v10("uploadCatalogItem", "POST", v23, v22);
    return v13._networkImp:httpPost(v23, v22);
end;
v4.getMyGroups = function(v24, _)
    local v26 = v3.constructGetMyGroupUrl();
    v10("getMyGroups", "GET", v26);
    return v24._networkImp:httpGetJson(v26);
end;
return v4;
