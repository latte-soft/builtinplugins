local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Cryo);
local l_Http_0 = require(l_Parent_0.Packages.Framework).Http;
local l_Promise_0 = require(l_Parent_0.Packages.Framework).Util.Promise;
local l_Url_0 = require(l_Parent_0.Packages.Framework).RobloxAPI.Url;
local v5 = require(l_Parent_0.Src.Util.tablesDeepEqual);
local l_ContentProvider_0 = game:GetService("ContentProvider");
local l_HttpService_0 = game:GetService("HttpService");
local v8 = {
    "GET", 
    "POST", 
    "PUT", 
    "PATCH", 
    "DELETE"
};
local _, _, v18 = (function(v9)
    if v9:sub(#v9) ~= "/" then
        v9 = v9 .. "/";
    end;
    local _, v11 = v9:find("://");
    local v12, v13 = v9:find("%.", v11 + 1);
    local v14 = v9:sub(v11 + 1, v12 - 1);
    local v15 = v9:sub(v13 + 1);
    if v15[#v15] == "/" then
        v15 = v15:sub(1, #v15 - 1);
    end;
    return v9, v14, v15;
end)(l_ContentProvider_0.BaseUrl);
local function _(v19, v20, v21)
    assert(v20:sub(1, 1) == "/", "Path must begin with '/'");
    return (l_Url_0.composeUrl("https://" .. v19 .. "." .. v18, v20:sub(2, -1), v21));
end;
local function _(v23)
    local v24 = true;
    if v23 ~= "GET" then
        v24 = v23 == "PATCH";
    end;
    return v24;
end;
local function v26(v27, v28)
    local v29 = {};
    for v30, v31 in pairs(v28) do
        if typeof(v31) == "table" and typeof(v27[v30]) == "table" then
            v29[v30] = v26(v27[v30], v31);
        else
            v29[v30] = v31;
        end;
    end;
    return v1.Dictionary.join(v27, v29);
end;
local v32 = {};
v32.__index = v32;
v32.new = function(v33)
    v33 = v1.Dictionary.join({
        isInternal = true, 
        retryAmount = 3
    }, v33 or {});
    local v34 = {
        __retryAmount = v33.retryAmount, 
        __baseImpl = l_Http_0.Networking.new(v33), 
        __coalescedRequests = {}
    };
    for _, v36 in ipairs(v8) do
        v34.__coalescedRequests[v36] = {};
    end;
    return (setmetatable(v34, v32));
end;
v32.request = function(v37, v38, v39, v40)
    local l_Params_0 = v40.Params;
    assert(v39:sub(1, 1) == "/", "Path must begin with '/'");
    v40 = v1.Dictionary.join(v40, {
        Params = v1.None, 
        Url = l_Url_0.composeUrl("https://" .. v38 .. "." .. v18, v39:sub(2, -1), l_Params_0)
    });
    l_Params_0 = v40.Method;
    local v42 = true;
    if l_Params_0 ~= "GET" then
        v42 = l_Params_0 == "PATCH";
    end;
    if not v42 then
        return v37:__requestWithoutCoalesce(v40);
    else
        return v37:__requestWithCoalesce(v40);
    end;
end;
for _, v44 in pairs(v8) do
    v32[v44:lower()] = function(v45, v46, v47, v48)
        return v45:request(v46, v47, v1.Dictionary.join(v48 or {}, {
            Method = v44
        }));
    end;
end;
v32.__requestWithoutCoalesce = function(v49, v50)
    if v50.Body ~= nil then
        local _ = nil;
        local v52 = true;
        local l_Headers_0 = v50.Headers;
        if typeof(l_Headers_0) == "table" then
            local v54 = l_Headers_0["Content-Type"];
            if not (not v54 or not string.find(v54, "multipart/form")) then
                v52 = false;
            end;
        end;
        v50 = v1.Dictionary.join(v50, {
            Body = not not v52 and l_HttpService_0:JSONEncode(v50.Body) or v50.Body, 
            Headers = v1.Dictionary.join({
                ["Content-Type"] = "application/json"
            }, v50.Headers or {})
        });
    end;
    return v49.__baseImpl:parseJson(v49.__baseImpl:handleRetry(v49.__baseImpl:request(v50), v49.__retryAmount));
end;
v32.__requestWithCoalesce = function(v55, v56)
    local l_Method_0 = v56.Method;
    local l_Url_1 = v56.Url;
    local v59 = v55:__getExistingRequest(v56);
    if not v59 then
        local v60 = l_HttpService_0:GenerateGUID();
        local v61 = nil;
        local function v62()
            v55.__coalescedRequests[l_Method_0][l_Url_1][v60] = nil;
        end;
        if l_Method_0 == "GET" then
            v61 = v55:__requestWithoutCoalesce(v56);
            v61:andThen(v62, v62);
        elseif l_Method_0 == "PATCH" then
            v61 = l_Promise_0.new(function(v63, v64)
                spawn(function()
                    v55:__requestWithoutCoalesce(v1.Dictionary.join(v56, {
                        Body = v55.__coalescedRequests[l_Method_0][l_Url_1][v60].options.Body
                    })):andThen(v63, v64);
                    v55.__coalescedRequests[l_Method_0][l_Url_1][v60] = nil;
                end);
            end);
        else
            assert(false);
        end;
        v55.__coalescedRequests[l_Method_0][l_Url_1] = v55.__coalescedRequests[l_Method_0][l_Url_1] or {};
        v55.__coalescedRequests[l_Method_0][l_Url_1][v60] = {
            promise = v61, 
            options = v56
        };
        return v61;
    else
        if l_Method_0 == "PATCH" then
            v59.options = v26(v59.options, {
                Body = v56.Body
            });
        end;
        return v59.promise;
    end;
end;
v32.__getExistingRequest = function(v65, v66)
    local v67 = v65.__coalescedRequests[v66.Method][v66.Url];
    if v67 then
        local v68 = v1.Dictionary.join(v66, {
            Body = v1.None
        });
        local v69 = nil;
        for _, v71 in pairs(v67) do
            if v5(v68, (v1.Dictionary.join(v71.options, {
                Body = v1.None
            }))) then
                v69 = v71;
                break;
            end;
        end;
        if v69 then
            return v69;
        else
            return nil;
        end;
    else
        return nil;
    end;
end;
return v32;
