local l_Promise_0 = require(script.Parent.Parent.Parent.Packages.Framework).Util.Promise;
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
local function v34(v32, v33)
    return v17("PUT", v33, function()
        return v32:RequestAsync(v33);
    end);
end;
local function v40(v35, ...)
    local v36 = {
        ...
    };
    return (l_Promise_0.new(function(v37, v38)
        spawn(function()
            local v39 = v35(unpack(v36));
            if v39.responseCode == v2.OK then
                v37(v39);
                return ;
            else
                v38(v39);
                return ;
            end;
        end);
    end));
end;
local v41 = {};
v41.__index = v41;
v41.new = function()
    local v42 = {
        _httpImpl = l_HttpRbxApiService_0
    };
    setmetatable(v42, v41);
    return v42;
end;
v41.jsonEncode = function(_, v44)
    return l_HttpService_0:JSONEncode(v44);
end;
v41.jsonDecode = function(_, v46)
    return l_HttpService_0:JSONDecode(v46);
end;
v41.httpGetJson = function(v47, v48)
    return v40(v20, v47._httpImpl, v48):andThen(function(v49)
        v49.responseBody = v47:jsonDecode(v49.responseBody);
        return v49;
    end);
end;
v41.httpPostJson = function(v50, v51, v52)
    return v40(v25, v50._httpImpl, v51, v52):andThen(function(v53)
        v53.responseBody = v50:jsonDecode(v53.responseBody);
        return v53;
    end);
end;
v41.httpPost = function(v54, v55, v56)
    return v40(v25, v54._httpImpl, v55, v56);
end;
v41.httpGet = function(v57, v58)
    return v40(v20, v57._httpImpl, v58);
end;
v41.httpDelete = function(v59, v60)
    return v40(v28, v59._httpImpl, {
        Url = v60, 
        Method = "DELETE"
    });
end;
v41.httpDeleteWithPayload = function(v61, v62, v63)
    return v40(v28, v61._httpImpl, {
        Url = v62, 
        Method = "DELETE", 
        Body = v63, 
        Headers = {
            ["Content-Type"] = "application/json"
        }
    });
end;
v41.httpPatch = function(v64, v65, v66)
    return v40(v31, v64._httpImpl, {
        Url = v65, 
        Method = "PATCH", 
        Body = v66, 
        Headers = {
            ["Content-Type"] = "application/json"
        }
    });
end;
v41.httpPut = function(v67, v68, v69)
    return v40(v34, v67._httpImpl, {
        Url = v68, 
        Method = "PUT", 
        Body = v69, 
        Headers = {
            ["Content-Type"] = "application/json"
        }
    });
end;
v41.requestInternal = function(_, v71)
    return l_Promise_0.new(function(v72, v73)
        spawn(function()
            l_HttpService_0:RequestInternal(v71):Start(function(v74, v75)
                if not v74 then
                    v73("HTTP error: " .. tostring(v75.HttpError));
                    return ;
                elseif v2.BAD_REQUEST <= v75.StatusCode then
                    v73("HTTP error: " .. tostring(v75.StatusCode));
                    return ;
                else
                    v72(v75.Body);
                    return ;
                end;
            end);
        end);
    end);
end;
v41.requestInternalRaw = function(_, v77)
    return l_Promise_0.new(function(v78, v79)
        spawn(function()
            l_HttpService_0:RequestInternal(v77):Start(function(v80, v81)
                if v80 and v81.StatusCode < v2.BAD_REQUEST then
                    v78(v81);
                    return ;
                else
                    v79(v81);
                    return ;
                end;
            end);
        end);
    end);
end;
return v41;
