local l_Style_0 = require(script.Parent.Parent.Parent.Packages.Framework).Style;
local l_StudioTheme_0 = l_Style_0.Themes.StudioTheme;
local l_StyleKey_0 = l_Style_0.StyleKey;
local v3 = {
    backgroundColor = l_StyleKey_0.MainBackground, 
    icons = {
        DraftState = {
            Committed = "rbxasset://textures/StudioSharedUI/statusSuccess.png", 
            Outdated = "rbxasset://textures/DraftsWidget/newSource.png", 
            Deleted = "rbxasset://textures/DraftsWidget/deletedSource.png"
        }
    }, 
    labels = {
        MainFont = Enum.Font.SourceSans, 
        MainText = l_StyleKey_0.TextPrimary
    }, 
    dialogUILibrary = {
        HeaderFont = Enum.Font.SourceSans, 
        HeaderTextColor = l_StyleKey_0.TextPrimary
    }
};
return function(v4)
    local _ = nil;
    return ((if not v4 then l_StudioTheme_0.new() else l_StudioTheme_0.mock()):extend(v3));
end;
