local l_Parent_0 = script.Parent.Parent.Parent;
local _ = require(l_Parent_0.Src.Types);
local v2 = require(l_Parent_0.Src.Util.getStudioTheme);
local function _(v3, v4, v5)
    return function()
        return (("rbxasset://studio_svg_textures/Lua/%*/%*/%*/%*.png"):format(v3, v2(), v4, v5));
    end;
end;
local function _(v7, v8, v9)
    return function()
        return (("rbxasset://studio_svg_textures/Shared/%*/%*/%*/%*.png"):format(v7, v2(), v8, v9));
    end;
end;
local function _(v11)
    return function()
        return (("rbxasset://textures/StyleEditor/%*.png"):format(v11));
    end;
end;
local v13 = {};
local v14 = {};
local v15 = "StyleEditor";
local v16 = "Standard";
local v17 = "StyleSheetDesign";
local l_v15_0 = v15 --[[ copy: 9 -> 12 ]];
local l_v16_0 = v16 --[[ copy: 10 -> 13 ]];
local l_v17_0 = v17 --[[ copy: 11 -> 14 ]];
v14.DesignSheet = function()
    return (("rbxasset://studio_svg_textures/Lua/%*/%*/%*/%*.png"):format(l_v15_0, v2(), l_v16_0, l_v17_0));
end;
v15 = "StyleEditor";
v16 = "Standard";
v17 = "StyleSheetToken";
local l_v15_1 = v15 --[[ copy: 9 -> 15 ]];
local l_v16_1 = v16 --[[ copy: 10 -> 16 ]];
local l_v17_1 = v17 --[[ copy: 11 -> 17 ]];
v14.TokenSheet = function()
    return (("rbxasset://studio_svg_textures/Lua/%*/%*/%*/%*.png"):format(l_v15_1, v2(), l_v16_1, l_v17_1));
end;
v15 = "StyleEditor";
v16 = "Standard";
v17 = "StyleSheetTheme";
local l_v15_2 = v15 --[[ copy: 9 -> 18 ]];
local l_v16_2 = v16 --[[ copy: 10 -> 19 ]];
local l_v17_2 = v17 --[[ copy: 11 -> 20 ]];
v14.ThemeSheet = function()
    return (("rbxasset://studio_svg_textures/Lua/%*/%*/%*/%*.png"):format(l_v15_2, v2(), l_v16_2, l_v17_2));
end;
v13.Standard = v14;
v14 = {};
v15 = "WidgetIcons";
v16 = "Large";
v17 = "StyleEditor";
local l_v15_3 = v15 --[[ copy: 9 -> 21 ]];
local l_v16_3 = v16 --[[ copy: 10 -> 22 ]];
local l_v17_3 = v17 --[[ copy: 11 -> 23 ]];
v14.StyleEditor = function()
    return (("rbxasset://studio_svg_textures/Shared/%*/%*/%*/%*.png"):format(l_v15_3, v2(), l_v16_3, l_v17_3));
end;
v13.Large = v14;
v14 = {};
v15 = "StyleEditor";
v16 = "Standard";
v17 = "UI";
local l_v15_4 = v15 --[[ copy: 9 -> 24 ]];
local l_v16_4 = v16 --[[ copy: 10 -> 25 ]];
local l_v17_4 = v17 --[[ copy: 11 -> 26 ]];
v14.Class = function()
    return (("rbxasset://studio_svg_textures/Lua/%*/%*/%*/%*.png"):format(l_v15_4, v2(), l_v16_4, l_v17_4));
end;
v15 = "StyleEditor";
v16 = "Standard";
v17 = "StyleSheetChild";
local l_v15_5 = v15 --[[ copy: 9 -> 27 ]];
local l_v16_5 = v16 --[[ copy: 10 -> 28 ]];
local l_v17_5 = v17 --[[ copy: 11 -> 29 ]];
v14.Child = function()
    return (("rbxasset://studio_svg_textures/Lua/%*/%*/%*/%*.png"):format(l_v15_5, v2(), l_v16_5, l_v17_5));
end;
v15 = "StyleEditor";
v16 = "Standard";
v17 = "StyleSheetDescendant";
local l_v15_6 = v15 --[[ copy: 9 -> 30 ]];
local l_v16_6 = v16 --[[ copy: 10 -> 31 ]];
local l_v17_6 = v17 --[[ copy: 11 -> 32 ]];
v14.Descendant = function()
    return (("rbxasset://studio_svg_textures/Lua/%*/%*/%*/%*.png"):format(l_v15_6, v2(), l_v16_6, l_v17_6));
end;
v15 = "StyleEditor";
v16 = "Standard";
v17 = "StyleSheetEnumerator";
local l_v15_7 = v15 --[[ copy: 9 -> 33 ]];
local l_v16_7 = v16 --[[ copy: 10 -> 34 ]];
local l_v17_7 = v17 --[[ copy: 11 -> 35 ]];
v14.Enumerator = function()
    return (("rbxasset://studio_svg_textures/Lua/%*/%*/%*/%*.png"):format(l_v15_7, v2(), l_v16_7, l_v17_7));
end;
v15 = "StyleEditor";
v16 = "Standard";
v17 = "StyleSheetGuiState";
local l_v15_8 = v15 --[[ copy: 9 -> 36 ]];
local l_v16_8 = v16 --[[ copy: 10 -> 37 ]];
local l_v17_8 = v17 --[[ copy: 11 -> 38 ]];
v14.GuiState = function()
    return (("rbxasset://studio_svg_textures/Lua/%*/%*/%*/%*.png"):format(l_v15_8, v2(), l_v16_8, l_v17_8));
end;
v15 = "StyleEditor";
v16 = "Standard";
v17 = "StyleSheetName";
local l_v15_9 = v15 --[[ copy: 9 -> 39 ]];
local l_v16_9 = v16 --[[ copy: 10 -> 40 ]];
local l_v17_9 = v17 --[[ copy: 11 -> 41 ]];
v14.Name = function()
    return (("rbxasset://studio_svg_textures/Lua/%*/%*/%*/%*.png"):format(l_v15_9, v2(), l_v16_9, l_v17_9));
end;
v15 = "StyleEditor";
v16 = "Standard";
v17 = "StyleSheetPseudoInstance";
local l_v15_10 = v15 --[[ copy: 9 -> 42 ]];
local l_v16_10 = v16 --[[ copy: 10 -> 43 ]];
local l_v17_10 = v17 --[[ copy: 11 -> 44 ]];
v14.PseudoInstance = function()
    return (("rbxasset://studio_svg_textures/Lua/%*/%*/%*/%*.png"):format(l_v15_10, v2(), l_v16_10, l_v17_10));
end;
v15 = "TagEditor";
v16 = "Standard";
v17 = "Tag";
local l_v15_11 = v15 --[[ copy: 9 -> 45 ]];
local l_v16_11 = v16 --[[ copy: 10 -> 46 ]];
v14.Tag = function()
    return (("rbxasset://studio_svg_textures/Lua/%*/%*/%*/%*.png"):format(l_v15_11, v2(), l_v16_11, v17));
end;
v13.Selectors = v14;
local v53 = "Navigation";
v15 = "Standard";
v16 = "CloseWidget";
local l_v53_0 = v53 --[[ copy: 8 -> 47 ]];
local l_v15_12 = v15 --[[ copy: 9 -> 48 ]];
local l_v16_12 = v16 --[[ copy: 10 -> 49 ]];
v13.close = function()
    return (("rbxasset://studio_svg_textures/Shared/%*/%*/%*/%*.png"):format(l_v53_0, v2(), l_v15_12, l_v16_12));
end;
v53 = "StyleEditor";
v15 = "Large";
v16 = "Color";
local l_v53_1 = v53 --[[ copy: 8 -> 50 ]];
local l_v15_13 = v15 --[[ copy: 9 -> 51 ]];
local l_v16_13 = v16 --[[ copy: 10 -> 52 ]];
v13.colors = function()
    return (("rbxasset://studio_svg_textures/Lua/%*/%*/%*/%*.png"):format(l_v53_1, v2(), l_v15_13, l_v16_13));
end;
v53 = "Clipboard";
v15 = "Standard";
v16 = "Copy";
local l_v53_2 = v53 --[[ copy: 8 -> 53 ]];
local l_v15_14 = v15 --[[ copy: 9 -> 54 ]];
local l_v16_14 = v16 --[[ copy: 10 -> 55 ]];
v13.copy = function()
    return (("rbxasset://studio_svg_textures/Shared/%*/%*/%*/%*.png"):format(l_v53_2, v2(), l_v15_14, l_v16_14));
end;
v53 = "TagEditor";
v15 = "Standard";
v16 = "Tag_Delete";
local l_v53_3 = v53 --[[ copy: 8 -> 56 ]];
local l_v15_15 = v15 --[[ copy: 9 -> 57 ]];
local l_v16_15 = v16 --[[ copy: 10 -> 58 ]];
v13.delete = function()
    return (("rbxasset://studio_svg_textures/Lua/%*/%*/%*/%*.png"):format(l_v53_3, v2(), l_v15_15, l_v16_15));
end;
v53 = "StyleEditor";
v15 = "Standard";
v16 = "Size";
local l_v53_4 = v53 --[[ copy: 8 -> 59 ]];
local l_v15_16 = v15 --[[ copy: 9 -> 60 ]];
local l_v16_16 = v16 --[[ copy: 10 -> 61 ]];
v13.dimensions = function()
    return (("rbxasset://studio_svg_textures/Lua/%*/%*/%*/%*.png"):format(l_v53_4, v2(), l_v15_16, l_v16_16));
end;
v53 = "Clipboard";
v15 = "Standard";
v16 = "Duplicate";
local l_v53_5 = v53 --[[ copy: 8 -> 62 ]];
local l_v15_17 = v15 --[[ copy: 9 -> 63 ]];
local l_v16_17 = v16 --[[ copy: 10 -> 64 ]];
v13.duplicate = function()
    return (("rbxasset://studio_svg_textures/Shared/%*/%*/%*/%*.png"):format(l_v53_5, v2(), l_v15_17, l_v16_17));
end;
v53 = "TagEditor";
v15 = "Standard";
v16 = "Tag_Edit";
local l_v53_6 = v53 --[[ copy: 8 -> 65 ]];
local l_v15_18 = v15 --[[ copy: 9 -> 66 ]];
local l_v16_18 = v16 --[[ copy: 10 -> 67 ]];
v13.edit = function()
    return (("rbxasset://studio_svg_textures/Lua/%*/%*/%*/%*.png"):format(l_v53_6, v2(), l_v15_18, l_v16_18));
end;
v53 = "StyleEditor";
v15 = "Standard";
v16 = "Folder";
local l_v53_7 = v53 --[[ copy: 8 -> 68 ]];
local l_v15_19 = v15 --[[ copy: 9 -> 69 ]];
local l_v16_19 = v16 --[[ copy: 10 -> 70 ]];
v13.folder = function()
    return (("rbxasset://studio_svg_textures/Lua/%*/%*/%*/%*.png"):format(l_v53_7, v2(), l_v15_19, l_v16_19));
end;
v53 = "StyleEditor";
v15 = "Standard";
v16 = "Typography";
local l_v53_8 = v53 --[[ copy: 8 -> 71 ]];
local l_v15_20 = v15 --[[ copy: 9 -> 72 ]];
local l_v16_20 = v16 --[[ copy: 10 -> 73 ]];
v13.fonts = function()
    return (("rbxasset://studio_svg_textures/Lua/%*/%*/%*/%*.png"):format(l_v53_8, v2(), l_v15_20, l_v16_20));
end;
v53 = "StyleEditor";
v15 = "Standard";
v16 = "GridPattern";
local l_v53_9 = v53 --[[ copy: 8 -> 74 ]];
local l_v15_21 = v15 --[[ copy: 9 -> 75 ]];
local l_v16_21 = v16 --[[ copy: 10 -> 76 ]];
v13.gridpattern = function()
    return (("rbxasset://studio_svg_textures/Lua/%*/%*/%*/%*.png"):format(l_v53_9, v2(), l_v15_21, l_v16_21));
end;
v53 = "StyleEditor";
v15 = "Large";
v16 = "Color";
local l_v53_10 = v53 --[[ copy: 8 -> 77 ]];
local l_v15_22 = v15 --[[ copy: 9 -> 78 ]];
local l_v16_22 = v16 --[[ copy: 10 -> 79 ]];
v13.palette = function()
    return (("rbxasset://studio_svg_textures/Lua/%*/%*/%*/%*.png"):format(l_v53_10, v2(), l_v15_22, l_v16_22));
end;
v53 = "StyleEditor";
v15 = "Standard";
v16 = "More";
local l_v53_11 = v53 --[[ copy: 8 -> 80 ]];
local l_v15_23 = v15 --[[ copy: 9 -> 81 ]];
local l_v16_23 = v16 --[[ copy: 10 -> 82 ]];
v13.more = function()
    return (("rbxasset://studio_svg_textures/Lua/%*/%*/%*/%*.png"):format(l_v53_11, v2(), l_v15_23, l_v16_23));
end;
v53 = "StyleEditor";
v15 = "Standard";
v16 = "InsertS";
local l_v53_12 = v53 --[[ copy: 8 -> 83 ]];
local l_v15_24 = v15 --[[ copy: 9 -> 84 ]];
local l_v16_24 = v16 --[[ copy: 10 -> 85 ]];
v13.new = function()
    return (("rbxasset://studio_svg_textures/Lua/%*/%*/%*/%*.png"):format(l_v53_12, v2(), l_v15_24, l_v16_24));
end;
v53 = "StyleEditor";
v15 = "Standard";
v16 = "QuickOpen";
local l_v53_13 = v53 --[[ copy: 8 -> 86 ]];
local l_v15_25 = v15 --[[ copy: 9 -> 87 ]];
local l_v16_25 = v16 --[[ copy: 10 -> 88 ]];
v13.open = function()
    return (("rbxasset://studio_svg_textures/Lua/%*/%*/%*/%*.png"):format(l_v53_13, v2(), l_v15_25, l_v16_25));
end;
v53 = "Clipboard";
v15 = "Standard";
v16 = "Paste";
local l_v53_14 = v53 --[[ copy: 8 -> 89 ]];
local l_v15_26 = v15 --[[ copy: 9 -> 90 ]];
local l_v16_26 = v16 --[[ copy: 10 -> 91 ]];
v13.paste = function()
    return (("rbxasset://studio_svg_textures/Shared/%*/%*/%*/%*.png"):format(l_v53_14, v2(), l_v15_26, l_v16_26));
end;
v53 = "TagEditor";
v15 = "Standard";
v16 = "Tag_Remove";
local l_v53_15 = v53 --[[ copy: 8 -> 92 ]];
local l_v15_27 = v15 --[[ copy: 9 -> 93 ]];
local l_v16_27 = v16 --[[ copy: 10 -> 94 ]];
v13.remove = function()
    return (("rbxasset://studio_svg_textures/Lua/%*/%*/%*/%*.png"):format(l_v53_15, v2(), l_v15_27, l_v16_27));
end;
v53 = "StyleEditor";
v15 = "Standard";
v16 = "Size";
local l_v53_16 = v53 --[[ copy: 8 -> 95 ]];
local l_v15_28 = v15 --[[ copy: 9 -> 96 ]];
local l_v16_28 = v16 --[[ copy: 10 -> 97 ]];
v13.sizes = function()
    return (("rbxasset://studio_svg_textures/Lua/%*/%*/%*/%*.png"):format(l_v53_16, v2(), l_v15_28, l_v16_28));
end;
v53 = "TagEditor";
v15 = "Standard";
v16 = "Tag_Add";
local l_v53_17 = v53 --[[ copy: 8 -> 98 ]];
local l_v15_29 = v15 --[[ copy: 9 -> 99 ]];
local l_v16_29 = v16 --[[ copy: 10 -> 100 ]];
v13.set = function()
    return (("rbxasset://studio_svg_textures/Lua/%*/%*/%*/%*.png"):format(l_v53_17, v2(), l_v15_29, l_v16_29));
end;
v53 = "StyleEditor";
v15 = "Standard";
v16 = "Typography";
local l_v53_18 = v53 --[[ copy: 8 -> 101 ]];
v13.typography = function()
    return (("rbxasset://studio_svg_textures/Lua/%*/%*/%*/%*.png"):format(l_v53_18, v2(), v15, v16));
end;
v53 = "onboarding";
v13.onboarding = function()
    return (("rbxasset://textures/StyleEditor/%*.png"):format(v53));
end;
return v13;
