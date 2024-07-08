local v0 = {
    "MarkAllAsRead", 
    "Settings"
};
local l_SourceSans_0 = Enum.Font.SourceSans;
local v2 = #v0;
local v3 = v2 * 36;
local v4 = v3 - 2;
return {
    MENU_OPTIONS = v0, 
    BORDER_SIZE = 1, 
    HORIZONTAL_BUFFER = 4, 
    LEFT_RIGHT_BUTTON_PADDING = 8, 
    TEXT_FONT = l_SourceSans_0, 
    TEXT_SIZE = 18, 
    NUMBER_OF_OPTIONS = v2, 
    TOTAL_MENU_HEIGHT = v3, 
    TEXT_WIDTH_PADDING = 20, 
    INNER_MENU_HEIGHT = v4, 
    BUTTON_HEIGHT = v4 / v2
};
