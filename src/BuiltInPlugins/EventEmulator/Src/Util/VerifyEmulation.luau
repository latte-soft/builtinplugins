local l_NotificationService_0 = game:GetService("NotificationService");
local l_MemStorageService_0 = game:GetService("MemStorageService");
local l_HttpService_0 = game:GetService("HttpService");
pcall(function()
    l_NotificationService_0.RobloxEventReceived:Connect(function(v3)
        print(("\t\t\t\tEvent Revieved:\n\t\t\t\t\\tNamespace: %s\n\t\t\t\t\\tDetail: %s\n\t\t\t\t\\tDetail Type: %s\n\t\t\t"):format(v3.Namespace, l_HttpService_0:JSONDecode(v3.Detail), v3.DetailType));
    end);
end);
pcall(function()
    l_MemStorageService_0:SetItem("Example", 0);
    l_MemStorageService_0:Bind("Example", function(v4)
        print("Callback for Example");
        print("Value is ", v4);
    end);
end);
