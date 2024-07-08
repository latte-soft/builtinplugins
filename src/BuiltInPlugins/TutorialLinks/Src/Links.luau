local l_GuiService_0 = game:GetService("GuiService");
local _ = game:GetService("HttpRbxApiService");
local l_insert_0 = table.insert;
local v3 = {
    connections = {}
};
v3.addLinks = function(v4)
    for _, v6 in ipairs((v4:GetChildren())) do
        if not (not v6:IsA("BillboardGui") and not v6:IsA("SurfaceGui")) then
            v3.addGui(v6);
        end;
    end;
end;
v3.removeLinks = function()
    for _, v8 in ipairs(v3.connections) do
        v8:Disconnect();
    end;
    v3.connections = {};
end;
v3.addGui = function(v9)
    for _, v11 in ipairs((v9:GetChildren())) do
        if v11:IsA("TextButton") then
            v3.addLink(v11);
        end;
    end;
end;
v3.addLink = function(v12)
    if v12:GetAttribute("TutorialLink") then
        l_insert_0(v3.connections, (v12.Activated:Connect(function()
            l_GuiService_0:OpenBrowserWindow("https://create.roblox.com/" .. v12:GetAttribute("TutorialLink"));
        end)));
    end;
end;
return v3;
