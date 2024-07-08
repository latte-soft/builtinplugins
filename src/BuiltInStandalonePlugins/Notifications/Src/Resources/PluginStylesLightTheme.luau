local l_Parent_0 = script.Parent.Parent.Parent;
local l_createStyleSheet_0 = require(l_Parent_0.Packages.Framework).Styling.createStyleSheet;
local v2 = require(l_Parent_0.Src.Resources.NotificationLuaIcons);
local v3 = {
    NotificationScrollBarColor = Color3.fromHex("#565656"), 
    NotificationStatusDisabledIcon = "rbxasset://studio_svg_textures/Lua/Notifications/Light/Standard/NotificationBadgeDisabled.png", 
    NotificationStatusUnreadIcon = "rbxasset://studio_svg_textures/Lua/Notifications/Light/Standard/NotificationBadgeUnread.png", 
    NotificationEmptyTrayIcon = "rbxasset://studio_svg_textures/Lua/Notifications/Light/SI-Standard/Celebration.png", 
    NotificationErrorIcon = "rbxasset://studio_svg_textures/Lua/Notifications/Light/SI-Standard/Oof.png"
};
for _, v5 in ipairs(v2) do
    v3[("%*Icon"):format(v5)] = ("rbxasset://studio_svg_textures/Lua/Notifications/Light/Large/%*.png"):format(v5);
end;
return l_createStyleSheet_0("NotificationsPluginLightTheme", {}, v3);
