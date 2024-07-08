local l_StudioTheme_0 = require(script.Parent.Parent.Parent.Packages.Framework).Style.Themes.StudioTheme;
local v1 = {};
return function(v2)
    local _ = nil;
    return (if not v2 then l_StudioTheme_0.new() else l_StudioTheme_0.mock()):extend(v1);
end;
