local l_HttpRbxApiService_0 = game:GetService("HttpRbxApiService");
local l_HttpService_0 = game:GetService("HttpService");
local l_ContentProvider_0 = game:GetService("ContentProvider");
local l_Promise_0 = require(script:FindFirstAncestor("AssetImporter").Packages.Framework).Util.Promise;
local l_BaseUrl_0 = l_ContentProvider_0.BaseUrl;
if l_BaseUrl_0:find("https://www.") == 1 then
    l_BaseUrl_0 = l_BaseUrl_0:sub(13);
elseif l_BaseUrl_0:find("http://www.") == 1 then
    l_BaseUrl_0 = l_BaseUrl_0:sub(12);
end;
local function v10(v5)
    local l_Params_0 = v5.Params;
    v5.Params = nil;
    if l_Params_0 then
        local v7 = {};
        for v8, v9 in l_Params_0, nil, nil do
            table.insert(v7, l_HttpService_0:UrlEncode(v8) .. "=" .. l_HttpService_0:UrlEncode(v9));
        end;
        v5.Url = v5.Url .. "?" .. table.concat(v7, "&");
    end;
end;
return {
    BuildRobloxUrl = function(v11, v12, ...)
        return "https://" .. v11 .. "." .. l_BaseUrl_0 .. (string.format(v12, ...) or "");
    end, 
    Request = function(v13)
        v10(v13);
        return l_Promise_0.new(function(v14, v15)
            spawn(function()
                local l_status_0, l_result_0 = pcall(l_HttpRbxApiService_0.RequestAsync, l_HttpRbxApiService_0, v13);
                if not l_status_0 then
                    v15(l_result_0);
                    return ;
                else
                    v14(l_result_0);
                    return ;
                end;
            end);
        end);
    end, 
    RequestInternal = function(v18)
        v10(v18);
        return l_Promise_0.new(function(v19, v20)
            spawn(function()
                l_HttpService_0:RequestInternal(v18):Start(function(v21, v22)
                    if not v21 then
                        v20("HTTP error: " .. tostring(v22.HttpError));
                        return ;
                    elseif v22.StatusCode >= 400 then
                        v20("HTTP error: " .. tostring(v22.StatusCode));
                        return ;
                    else
                        v19(v22.Body);
                        return ;
                    end;
                end);
            end);
        end);
    end
};
