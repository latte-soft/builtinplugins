local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Src.Util.wrapStrictTable);
local v2 = require(l_Parent_0.Src.Util.convertArrayToTable);
local v3 = require(l_Parent_0.Src.Util.getUserId);
local v4 = {
    FONT = Enum.Font.SourceSans, 
    FONT_BOLD = Enum.Font.SourceSansBold, 
    FONT_SIZE_SMALL = 14, 
    FONT_SIZE_MEDIUM = 16, 
    FONT_SIZE_LARGE = 18, 
    FONT_SIZE_TITLE = 22, 
    FOOTER_HEIGHT = 35, 
    MESSAGE_BOX_BUTTON_WIDTH = 100, 
    NAME_CHARACTER_LIMIT = 50, 
    DESCRIPTION_CHARACTER_LIMIT = 1000, 
    TITLE_GUTTER_WIDTH = 180, 
    Images = {
        ARROW_DOWN_ICON = "rbxasset://textures/StudioToolbox/ArrowDownIconWhite.png", 
        IMAGE_PLACEHOLDER = "rbxasset://textures/StudioConvertToPackagePlugin/placeholder.png", 
        TOGGLE_ON_DARK = "rbxasset://textures/RoactStudioWidgets/toggle_on_dark.png", 
        TOGGLE_ON_LIGHT = "rbxasset://textures/RoactStudioWidgets/toggle_on_light.png", 
        TOGGLE_OFF_DARK = "rbxasset://textures/RoactStudioWidgets/toggle_off_dark.png", 
        TOGGLE_OFF_LIGHT = "rbxasset://textures/RoactStudioWidgets/toggle_off_light.png", 
        TOGGLE_DISABLE_DARK = "rbxasset://textures/RoactStudioWidgets/toggle_disable_dark.png", 
        TOGGLE_DISABLE_LIGHT = "rbxasset://textures/RoactStudioWidgets/toggle_disable_light.png"
    }, 
    OWNER_TYPES = {
        User = 1, 
        Group = 2
    }
};
v4.CREATOR_ENUM_TO_OWNER_TYPE = {
    [Enum.CreatorType.User] = v4.OWNER_TYPES.User, 
    [Enum.CreatorType.Group] = v4.OWNER_TYPES.Group
};
v4.SCREENS = v2({
    "CONFIGURE_ASSET", 
    "UPLOADING_ASSET", 
    "UPLOAD_ASSET_RESULT"
});
v4.getOwnerDropDownContent = function(v5, v6)
    local v7 = {
        {
            creatorId = v3(), 
            creatorType = "User", 
            Key = 1, 
            name = v6:getText("General", "Me"), 
            Text = v6:getText("General", "Me")
        }
    };
    local v8 = 2;
    if game.CreatorType == Enum.CreatorType.Group and next(v5) == nil then
        table.insert(v7, {
            name = "", 
            Text = "", 
            creatorType = "Group", 
            creatorId = game.CreatorId, 
            Key = v8
        });
        return v7;
    else
        for _, v10 in pairs(v5) do
            table.insert(v7, {
                name = v10.name, 
                Text = v10.name, 
                creatorType = "Group", 
                creatorId = v10.id, 
                item = v10, 
                Key = v8
            });
            v8 = v8 + 1;
        end;
        return v7;
    end;
end;
return v1(v4, "Constants");
