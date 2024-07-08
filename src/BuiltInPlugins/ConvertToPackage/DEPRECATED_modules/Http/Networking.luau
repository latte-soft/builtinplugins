local v0 = require(script.Parent.Promise);
local v1 = require(script.Parent.HttpResponse);
local v2 = require(script.Parent.StatusCodes);
local l_HttpService_0 = game:GetService("HttpService");
local l_HttpRbxApiService_0 = game:GetService("HttpRbxApiService");
local function v8(v5)
    for _, v7 in pairs(v2) do
        if not (not (v7 >= 100) or not v5:find((tostring(v7)))) then
            return v7;
        end;
    end;
    if not v5:find("2%d%d") then
        if not v5:find("curl_easy_perform") or not v5:find("SSL") then
            return v2.UNKNOWN_ERROR;
        else
            return v2.BAD_TLS;
        end;
    else
        return v2.OK;
    end;
end;
local function v17(v9, v10, v11)
    local v12 = tick();
    local l_status_0, l_result_0 = pcall(v11);
    local v15 = (tick() - v12) * 1000;
    local l_OK_0 = v2.OK;
    if not l_status_0 then
        l_OK_0 = v8(l_result_0);
    end;
    return v1.new(l_result_0, v15, l_OK_0, v9, v10);
end;
local function v20(v18, v19)
    return v17("GET", v19, function()
        return v18:GetAsyncFullUrl(v19);
    end);
end;
local function v25(v21, v22, v23, v24)
    if not v24 then
        v24 = Enum.HttpContentType.ApplicationJson;
    end;
    return v17("POST", v22, function()
        return v21:PostAsyncFullUrl(v22, v23, Enum.ThrottlingPriority.Default, v24);
    end);
end;
local function v28(v26, v27)
    return v17("DELETE", v27, function()
        return v26:RequestAsync(v27);
    end);
end;
local function v31(v29, v30)
    return v17("PATCH", v30, function()
        return v29:RequestAsync(v30);
    end);
end;
local function v37(v32, ...)
    local v33 = {
        ...
    };
    return (v0.new(function(v34, v35)
        spawn(function()
            local v36 = v32(unpack(v33));
            if v36.responseCode == v2.OK then
                v34(v36);
                return ;
            else
                v35(v36);
                return ;
            end;
        end);
    end));
end;
local v38 = {};
v38.__index = v38;
v38.new = function()
    local v39 = {
        _httpImpl = l_HttpRbxApiService_0
    };
    setmetatable(v39, v38);
    return v39;
end;
v38.jsonEncode = function(_, v41)
    return l_HttpService_0:JSONEncode(v41);
end;
v38.jsonDecode = function(_, v43)
    return l_HttpService_0:JSONDecode(v43);
end;
v38.httpGetJson = function(v44, v45)
    return v37(v20, v44._httpImpl, v45):andThen(function(v46)
        v46.responseBody = v44:jsonDecode(v46.responseBody);
        return v46;
    end, function(v47)
        return v47;
    end);
end;
v38.httpPostJson = function(v48, v49, v50)
    return v37(v25, v48._httpImpl, v49, v50):andThen(function(v51)
        v51.responseBody = v48:jsonDecode(v51.responseBody);
        return v51;
    end, function(v52)
        return v52;
    end);
end;
v38.httpPost = function(v53, v54, v55)
    return v37(v25, v53._httpImpl, v54, v55);
end;
v38.httpGet = function(v56, v57)
    return v37(v20, v56._httpImpl, v57);
end;
v38.httpDelete = function(v58, v59)
    return v37(v28, v58._httpImpl, {
        Url = v59, 
        Method = "DELETE"
    });
end;
v38.httpPatch = function(v60, v61, v62)
    return v37(v31, v60._httpImpl, {
        Url = v61, 
        Method = "PATCH", 
        Body = v62, 
        Headers = {
            ["Content-Type"] = "application/json"
        }
    });
end;
v38.requestInternal = function(_, v64)
    return v0.new(function(v65, v66)
        spawn(function()
            l_HttpService_0:RequestInternal(v64):Start(function(v67, v68)
                if not v67 then
                    v66("HTTP error: " .. tostring(v68.HttpError));
                    return ;
                elseif v2.BAD_REQUEST <= v68.StatusCode then
                    v66("HTTP error: " .. tostring(v68.StatusCode));
                    return ;
                else
                    v65(v68.Body);
                    return ;
                end;
            end);
        end);
    end);
end;
return v38;
