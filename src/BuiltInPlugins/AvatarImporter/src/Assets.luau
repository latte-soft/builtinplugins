local v0 = {
    BUTTON_AVATAR_TYPE = "button_avatarType.png", 
    BUTTON_AVATAR_TYPE_BORDER = "button_avatarType_border.png", 
    PLUGIN_ICON = "icon_AvatarImporter.png", 
    ERROR_ICON = "icon_error.png", 
    BACKGROUND_IMAGE = "img_window_BG.png", 
    HEADER_IMAGE = "img_window_header.png", 
    DEPRECATED_BUTTON_ICON = "icon_AvatarImporter.png", 
    BUTTON_CLOSE = "button_close.png", 
    RTHRO = {
        Light = "img_light_Rthro.png", 
        Dark = "img_dark_Rthro.png"
    }, 
    RTHRO_NARROW = {
        Light = "img_light_RthroNarrow.png", 
        Dark = "img_dark_RthroNarrow.png"
    }, 
    R15 = {
        Light = "img_light_R15.png", 
        Dark = "img_dark_R15.png"
    }, 
    CUSTOM = {
        Light = "img_light_custom.png", 
        Dark = "img_dark_custom.png"
    }
};
local function v1(v2, v3)
    for v4, v5 in pairs(v2) do
        if typeof(v5) == "table" then
            v1(v5, v3);
        else
            v2[v4] = v3(v5);
        end;
    end;
end;
v1(v0, function(v6)
    return "rbxasset://textures/AvatarImporter/" .. v6;
end);
return v0;
