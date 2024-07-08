local l_HttpService_0 = game:GetService("HttpService");
local l_ContentProvider_0 = game:GetService("ContentProvider");
local l_HttpRbxApiService_0 = game:GetService("HttpRbxApiService");
local v3 = game:DefineFastFlag("GameSettingsFixPreviewAvatar", false);
local v4 = {};
local l_BaseUrl_0 = l_ContentProvider_0.BaseUrl;
for _, v7 in pairs({
    "/", 
    "www.", 
    "https:", 
    "http:"
}) do
    l_BaseUrl_0 = string.gsub(l_BaseUrl_0, v7, "");
end;
local v8 = "https://avatar." .. l_BaseUrl_0;
v4.Status = {
    PENDING = 0, 
    UNKNOWN_ERROR = -1, 
    NO_CONNECTIVITY = -2, 
    INVALID_JSON = -3, 
    BAD_TLS = -4, 
    MODERATED = -5, 
    OK = 200, 
    BAD_REQUEST = 400, 
    UNAUTHORIZED = 401, 
    FORBIDDEN = 403, 
    NOT_FOUND = 404, 
    REQUEST_TIMEOUT = 408, 
    INTERNAL_SERVER_ERROR = 500, 
    NOT_IMPLEMENTED = 501, 
    BAD_GATEWAY = 502, 
    SERVICE_UNAVAILABLE = 503, 
    GATEWAY_TIMEOUT = 504
};
local v9 = nil;
local v10 = nil;
local v11 = nil;
local v12 = nil;
local v13 = nil;
local function v15(v14)
    return l_HttpRbxApiService_0:GetAsyncFullUrl(v14);
end;
v4.GetAvatarData = function()
    local v16, v17 = v13("/v1/avatar");
    return v16, v17;
end;
v13 = function(v18)
    local v19, v20 = v12(v8 .. v18);
    return v20, v19;
end;
v9 = function(v21)
    return l_HttpService_0:JSONDecode(v21);
end;
v10 = function(v22)
    return game:HttpGetAsync(v22);
end;
v11 = function(v23)
    for _, v25 in pairs(v4.Status) do
        if not (not (v25 >= 100) or not v23:find((tostring(v25)))) then
            return v25;
        end;
    end;
    if not v23:find("2%d%d") then
        if not v23:find("curl_easy_perform") or not v23:find("SSL") then
            return v4.Status.UNKNOWN_ERROR;
        else
            return v4.Status.BAD_TLS;
        end;
    else
        return v4.Status.OK;
    end;
end;
v12 = function(v26)
    local v27 = nil;
    local v28 = nil;
    if not v3 then
        local l_status_0, l_result_0 = pcall(v10, v26);
        v27 = l_status_0;
        v28 = l_result_0;
    else
        local l_status_1, l_result_1 = pcall(v15, v26);
        v27 = l_status_1;
        v28 = l_result_1;
    end;
    local v33 = not not v27 and v4.Status.OK or v11(v28);
    if v27 then
        local l_status_2, l_result_2 = pcall(v9, v28);
        v27 = l_status_2;
        v28 = l_result_2;
        v33 = not not v27 and v33 or v4.Status.INVALID_JSON;
    end;
    return v28, v33;
end;
return v4;
