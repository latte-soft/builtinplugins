local l_RobloxPluginGuiService_0 = game:GetService("RobloxPluginGuiService");
local l_Promise_0 = require(script.Parent.Parent.Parent.Packages.Framework).Util.Promise;
return function(v2, v3)
    return l_Promise_0.new(function(v4, v5)
        task.spawn(function()
            local l_Folder_0 = Instance.new("Folder");
            l_Folder_0.Name = "TemporaryInstances";
            l_Folder_0.Parent = l_RobloxPluginGuiService_0;
            for _, v8 in pairs(v2) do
                v8.Parent = l_Folder_0;
            end;
            local l_status_0, l_result_0 = pcall(function()
                return v3:DEPRECATED_SerializeInstances(v2);
            end);
            for _, v12 in pairs(v2) do
                v12.Parent = nil;
            end;
            l_Folder_0:Destroy();
            if not l_status_0 then
                v5("SerializeInstances failed: " .. tostring(l_result_0));
                return ;
            else
                v4(l_result_0);
                return ;
            end;
        end);
    end);
end;
