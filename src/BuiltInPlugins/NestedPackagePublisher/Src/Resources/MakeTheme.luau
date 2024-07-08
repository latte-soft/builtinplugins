local l_Style_0 = require(script.Parent.Parent.Parent.Packages.Framework).Style;
local l_StudioTheme_0 = l_Style_0.Themes.StudioTheme;
local l_StyleKey_0 = l_Style_0.StyleKey;
local v3 = {
    mainWindow = {
        backgroundColor = l_StyleKey_0.MainBackground
    }
};
local v4 = {
    mainWindow = {
        backgroundColor = l_StyleKey_0.MainBackground
    }
};
local v5 = {};
return function(v6)
    local _ = nil;
    return (if not v6 then l_StudioTheme_0.new(v3, v4) else l_StudioTheme_0.mock(v3, v4)):extend(v5);
end;
