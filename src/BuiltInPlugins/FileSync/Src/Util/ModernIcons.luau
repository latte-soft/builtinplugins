local v0 = {
    IconEnums = {
        Export = "Export", 
        Import = "Import", 
        Info = "Info", 
        Open = "Open", 
        Recent = "Recent", 
        ServerScriptService = "ServerScriptService", 
        UptoDate = "Success", 
        Warning = "Warning", 
        Notification = "NotificationBadgeUnread"
    }
};
v0.FileSyncIcons = {
    [v0.IconEnums.Export] = "rbxasset://studio_svg_textures/Lua/FileSync/%s/Large/" .. v0.IconEnums.Export .. ".png", 
    [v0.IconEnums.Info] = "rbxasset://studio_svg_textures/Lua/FileSync/%s/Standard/" .. v0.IconEnums.Info .. ".png", 
    [v0.IconEnums.Import] = "rbxasset://studio_svg_textures/Lua/FileSync/%s/Large/" .. v0.IconEnums.Import .. ".png", 
    [v0.IconEnums.Recent] = "rbxasset://studio_svg_textures/Shared/Utility/%s/Standard/" .. v0.IconEnums.Recent .. ".png", 
    [v0.IconEnums.Open] = "rbxasset://studio_svg_textures/Lua/FileSync/%s/Standard/" .. v0.IconEnums.Open .. ".png", 
    [v0.IconEnums.Info] = "rbxasset://studio_svg_textures/Lua/FileSync/%s/Standard/" .. v0.IconEnums.Info .. ".png", 
    [v0.IconEnums.ServerScriptService] = "rbxasset://studio_svg_textures/Lua/FileSync/%s/Standard/" .. v0.IconEnums.ServerScriptService .. ".png", 
    [v0.IconEnums.UptoDate] = "rbxasset://studio_svg_textures/Shared/Alerts/%s/Standard/" .. v0.IconEnums.UptoDate .. ".png", 
    [v0.IconEnums.Warning] = "rbxasset://studio_svg_textures/Lua/FileSync/%s/Large/" .. v0.IconEnums.Warning .. ".png", 
    [v0.IconEnums.Notification] = "rbxasset://studio_svg_textures/Lua/FileSync/%s/Standard/" .. v0.IconEnums.Notification .. ".png"
};
v0.getIconForCurrentTheme = function(v1)
    return string.format(v0.FileSyncIcons[v1], settings().Studio.Theme.Name);
end;
return v0;
