local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Framework);
local v2 = require(l_Parent_0.Packages.Cryo);
local l_Style_0 = v1.Style;
local l_StyleKey_0 = l_Style_0.StyleKey;
local l_BaseTheme_0 = l_Style_0.Themes.BaseTheme;
local l_StudioTheme_0 = l_Style_0.Themes.StudioTheme;
local l_ComponentSymbols_0 = l_Style_0.ComponentSymbols;
local v8 = {
    SmallPadding = 10, 
    HistoryButtonMinor = 25, 
    ShortHeight = 30, 
    HorizontalPadding = 50, 
    NavHeight = 50, 
    ConfirmationButtonWidth = 50, 
    HistoryButtonMajor = 100, 
    InputPaneLength = 300, 
    HistoryPaneLength = 300, 
    DropdownWidth = 180, 
    TextBoxWidth = 180
};
local v9 = {
    [l_StyleKey_0.BlueText] = Color3.fromRGB(0, 162, 255), 
    Text = {
        BrightText = {
            Size = 20, 
            Color = l_StyleKey_0.BrightText
        }, 
        DimmedText = {
            Size = 16, 
            Color = l_StyleKey_0.DimmedText
        }, 
        Button = {
            Size = 18, 
            Color = l_StyleKey_0.MainText, 
            PrimaryColor = l_StyleKey_0.DialogMainButtonText
        }, 
        BlueText = {
            Size = 18, 
            Color = l_StyleKey_0.BlueText
        }
    }, 
    Scrollbar = {
        Thickness = 5, 
        Transparency = 0.5, 
        Color = l_StyleKey_0.ScrollBar, 
        TopImage = "rbxasset://textures/StudioToolbox/ScrollBarTop.png", 
        MidImage = "rbxasset://textures/StudioToolbox/ScrollBarMiddle.png", 
        BottomImage = "rbxasset://textures/StudioToolbox/ScrollBarBottom.png"
    }, 
    Sizes = v8, 
    Layout = {
        Vertical = {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            Padding = UDim.new(0, v8.SmallPadding)
        }, 
        Horizontal = {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Horizontal, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            Padding = UDim.new(0, v8.HorizontalPadding)
        }, 
        HistoryItem = {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Horizontal, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            Padding = UDim.new(0, v8.SmallPadding)
        }
    }, 
    [l_ComponentSymbols_0.Box] = v2.Dictionary.join(l_BaseTheme_0[l_ComponentSymbols_0.Box], {
        ["&__Item"] = {
            Color = l_StyleKey_0.CategoryItem
        }
    }), 
    [l_ComponentSymbols_0.RoundBox] = v2.Dictionary.join(l_BaseTheme_0[l_ComponentSymbols_0.RoundBox], {
        ["&__Item"] = {
            Color = l_StyleKey_0.CategoryItem, 
            BorderTransparency = 1
        }, 
        ["&__Example"] = {
            Color = l_StyleKey_0.Mid
        }
    }), 
    [l_ComponentSymbols_0.Button] = v2.Dictionary.join(l_BaseTheme_0[l_ComponentSymbols_0.Button], {
        ["&__Item"] = {
            Color = l_StyleKey_0.Button, 
            BorderSize = 1
        }
    })
};
return function(v10)
    local _ = nil;
    return (if not v10 then l_StudioTheme_0.new() else l_StudioTheme_0.mock()):extend(v9);
end;
