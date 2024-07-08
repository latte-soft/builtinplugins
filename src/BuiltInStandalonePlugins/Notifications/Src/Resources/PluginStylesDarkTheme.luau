local l_Parent_0 = script.Parent.Parent.Parent;
local l_createStyleSheet_0 = require(l_Parent_0.Packages.Framework).Styling.createStyleSheet;
local v2 = require(l_Parent_0.Src.Resources.NotificationLuaIcons);
local v3 = {
    NotificationScrollBarColor = Color3.fromHex("#939393"), 
    NotificationStatusDisabledIcon = "rbxasset://studio_svg_textures/Lua/Notifications/Dark/Standard/NotificationBadgeDisabled.png", 
    NotificationStatusUnreadIcon = "rbxasset://studio_svg_textures/Lua/Notifications/Dark/Standard/NotificationBadgeUnread.png", 
    NotificationEmptyTrayIcon = "rbxasset://studio_svg_textures/Lua/Notifications/Dark/SI-Standard/Celebration.png", 
    NotificationErrorIcon = "rbxasset://studio_svg_textures/Lua/Notifications/Dark/SI-Standard/Oof.png"
};
for _, v5 in ipairs(v2) do
    v3[("%*Icon"):format(v5)] = ("rbxasset://studio_svg_textures/Lua/Notifications/Dark/Large/%*.png"):format(v5);
end;
return l_createStyleSheet_0("NotificationsPluginDarkTheme", {}, v3);
