local l_script_FirstAncestor_0 = script:FindFirstAncestor("FileSync");
local v1 = require(l_script_FirstAncestor_0.Packages.Cryo);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_StyleKey_0 = v2.Style.StyleKey;
local l_StudioTheme_0 = v2.Style.Themes.StudioTheme;
local l_ComponentSymbols_0 = v2.Style.ComponentSymbols;
local l_UIData_0 = v2.UIData;
local _ = require(l_UIData_0.Separator.style);
local v8 = {
    BackgroundColor = l_StyleKey_0.MainBackground, 
    [l_ComponentSymbols_0.TextLabel] = v1.Dictionary.join(require(l_UIData_0.TextLabel.style), {
        ["&Basic"] = {
            TextSize = 18
        }
    }), 
    RegularFont = Enum.Font.SourceSans, 
    BoldFont = Enum.Font.SourceSansSemibold, 
    FontColor = l_StyleKey_0.SubText, 
    DirectoryBackgroundColor = l_StyleKey_0.InputFieldBackground, 
    DirectoryBorderSize = 1, 
    ErrorDialogSize = Vector2.new(343, 65)
};
local v9 = {};
local v10 = {};
return function(v11)
    return ((if not v11 then l_StudioTheme_0.new(v9, v10) else l_StudioTheme_0.mock(v9, v10)):extend(v8));
end;
