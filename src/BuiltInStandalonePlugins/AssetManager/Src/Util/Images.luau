local v0 = require(script:FindFirstAncestor("AssetManager").Packages.Framework).Style.ThemeSwitcher.getThemeName();
return {
    CLEAR_ICON = ("rbxasset://studio_svg_textures/Shared/InsertableObjects/%*/Standard/Cleanup.png"):format(v0), 
    ICON_USER_DEFAULT = ("rbxasset://studio_svg_textures/Shared/Utility/%*/Standard/User.png"):format(v0), 
    ICON_GROUP_DEFAULT = ("rbxasset://studio_svg_textures/Shared/Utility/%*/Standard/Users.png"):format(v0), 
    ICON_USER_LARGE_DEFAULT = ("rbxasset://studio_svg_textures/Shared/Utility/%*/Large/User.png"):format(v0), 
    ICON_GROUP_LARGE_DEFAULT = ("rbxasset://studio_svg_textures/Shared/Utility/%*/Large/Users.png"):format(v0), 
    PLACEHOLDER_ASSET = ("rbxasset://studio_svg_textures/Shared/Placeholder/%*/Standard/Placeholder.png"):format(v0), 
    PLACEHOLDER = ("rbxasset://studio_svg_textures/Shared/Placeholder/%*/Standard/Placeholder.png"):format(v0)
};
