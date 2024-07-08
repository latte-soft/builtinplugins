local l_HttpService_0 = game:GetService("HttpService");
return function(v1)
    if not (v1 ~= nil) or v1 == "" then
        return {};
    else
        local v2 = l_HttpService_0:JSONDecode(v1);
        local v3 = {};
        for v4, v5 in pairs(v2) do
            table.insert(v3, {
                assetId = v4, 
                enabled = v5.Enabled, 
                installedVersion = v5.AssetVersion, 
                isModerated = v5.Moderated, 
                autoUpdateEnabled = v5.AutoUpdate
            });
        end;
        return v3;
    end;
end;
