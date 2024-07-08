local l_RobloxPluginGuiService_0 = game:GetService("RobloxPluginGuiService");
local l_StudioAssetService_0 = game:GetService("StudioAssetService");
return function(v2)
    local l_Folder_0 = Instance.new("Folder");
    l_Folder_0.Name = "TemporaryInstances";
    l_Folder_0.Parent = l_RobloxPluginGuiService_0;
    for _, v5 in pairs(v2) do
        v5.Parent = l_Folder_0;
    end;
    local l_status_0, l_result_0 = pcall(function()
        return l_StudioAssetService_0:DEPRECATED_SerializeInstances(v2);
    end);
    for _, v9 in pairs(v2) do
        v9.Parent = nil;
    end;
    l_Folder_0:Destroy();
    if not l_status_0 then
        error("SerializeInstances failed: " .. tostring(l_result_0));
        return ;
    else
        return l_result_0;
    end;
end;
