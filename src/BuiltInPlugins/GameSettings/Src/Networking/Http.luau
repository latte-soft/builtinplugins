local l_HttpRbxApiService_0 = game:GetService("HttpRbxApiService");
local l_HttpService_0 = game:GetService("HttpService");
local l_ContentProvider_0 = game:GetService("ContentProvider");
local l_Parent_0 = script.Parent.Parent.Parent;
local l_Promise_0 = require(l_Parent_0.Packages.Framework).Util.Promise;
local v5 = require(l_Parent_0.Src.Util.DEPRECATED_Constants);
local l_BaseUrl_0 = l_ContentProvider_0.BaseUrl;
if not l_BaseUrl_0:find("https://www.") then
    if l_BaseUrl_0:find("http://www.") then
        l_BaseUrl_0 = l_BaseUrl_0:sub(12);
    end;
else
    l_BaseUrl_0 = l_BaseUrl_0:sub(13);
end;
local function v12(v7)
    local l_Params_0 = v7.Params;
    v7.Params = nil;
    if l_Params_0 then
        local v9 = {};
        for v10, v11 in pairs(l_Params_0) do
            table.insert(v9, l_HttpService_0:UrlEncode(v10) .. "=" .. l_HttpService_0:UrlEncode(v11));
        end;
        v7.Url = v7.Url .. "?" .. table.concat(v9, "&");
    end;
end;
return {
    BuildRobloxUrl = function(v13, v14, ...)
        return "https://" .. v13 .. "." .. l_BaseUrl_0 .. (string.format(v14, ...) or "");
    end, 
    Request = function(v15)
        v12(v15);
        return l_Promise_0.new(function(v16, v17)
            spawn(function()
                local l_status_0, l_result_0 = pcall(l_HttpRbxApiService_0.RequestAsync, l_HttpRbxApiService_0, v15);
                if not l_status_0 then
                    v17(l_result_0);
                    return ;
                else
                    v16(l_result_0);
                    return ;
                end;
            end);
        end);
    end, 
    RequestInternal = function(v20)
        v12(v20);
        return l_Promise_0.new(function(v21, v22)
            spawn(function()
                l_HttpService_0:RequestInternal(v20):Start(function(v23, v24)
                    if not v23 then
                        v22("HTTP error: " .. tostring(v24.HttpError));
                        return ;
                    elseif v5.BAD_REQUEST <= v24.StatusCode then
                        v22("HTTP error: " .. tostring(v24.StatusCode));
                        return ;
                    else
                        v21(v24.Body);
                        return ;
                    end;
                end);
            end);
        end);
    end
};
