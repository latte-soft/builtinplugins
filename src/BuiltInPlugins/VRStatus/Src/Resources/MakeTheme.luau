local l_Style_0 = require(script.Parent.Parent.Parent.Packages.Framework).Style;
local l_StudioTheme_0 = l_Style_0.Themes.StudioTheme;
local l_ComponentSymbols_0 = l_Style_0.ComponentSymbols;
l_ComponentSymbols_0:add("AlertDialog");
local v3 = {
    [l_ComponentSymbols_0.AlertDialog] = {
        PopupMessageSize = Vector2.new(400, 60), 
        TextSize = 18
    }
};
return function(v4)
    local _ = nil;
    return (if not v4 then l_StudioTheme_0.new() else l_StudioTheme_0.mock()):extend(v3);
end;
