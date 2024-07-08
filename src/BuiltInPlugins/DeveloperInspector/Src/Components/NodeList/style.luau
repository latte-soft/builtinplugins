local v0 = require(script.Parent.Parent.Parent.Parent.Packages.Framework);
local l_StyleKey_0 = v0.Style.StyleKey;
local l_deepCopy_0 = v0.Util.deepCopy;
local l_UIData_0 = v0.UIData;
local v4 = require(l_UIData_0.ScrollingFrame.style);
local v5 = require(l_UIData_0.RoundBox.style);
return {
    Background = v5, 
    BackgroundStyle = v5, 
    ScrollingFrame = v4, 
    BackgroundColor = l_StyleKey_0.MainBackground, 
    Padding = 1, 
    RowHeight = 24, 
    IconPadding = 5, 
    HoverColor = l_StyleKey_0.ButtonHover, 
    SelectedColor = l_StyleKey_0.DialogMainButton, 
    SelectedTextColor = l_StyleKey_0.DialogMainButtonText, 
    Link = l_deepCopy_0((require(l_UIData_0.LinkText.style)))
};
