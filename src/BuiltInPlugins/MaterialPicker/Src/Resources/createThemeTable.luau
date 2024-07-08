local l_script_FirstAncestor_0 = script:FindFirstAncestor("MaterialPicker");
local v1 = require(l_script_FirstAncestor_0.Packages.MaterialFramework);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local _ = require(l_script_FirstAncestor_0.Packages._Index.DeveloperFramework.DeveloperFramework.Types);
local l_Theme_0 = v1.Resources.Theme;
local l_StyleKey_0 = v2.Style.StyleKey;
local l_ContextServices_0 = v2.ContextServices;
local l_SourceStrings_0 = l_script_FirstAncestor_0.Src.Resources.Localization.SourceStrings;
local l_LocalizedStrings_0 = l_script_FirstAncestor_0.Src.Resources.Localization.LocalizedStrings;
local l_TextService_0 = game:GetService("TextService");
local v10 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagMaterialPickerRemoveToggles);
local v11 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagEnableMaterialGenerator);
local v12 = string.format("rbxasset://studio_svg_textures/Lua/MaterialPicker/%s/Standard/Generate.png", "Light");
local v13 = string.format("rbxasset://studio_svg_textures/Lua/MaterialPicker/%s/Standard/Generate.png", "Dark");
local v14 = string.format("rbxasset://studio_svg_textures/Shared/Modeling/%s/Large/Material.png", "Light");
local v15 = string.format("rbxasset://studio_svg_textures/Shared/Modeling/%s/Large/Material.png", "Dark");
local v16 = string.format("rbxasset://studio_svg_textures/Lua/MaterialPicker/%s/Standard/Grid.png", "Light");
local v17 = string.format("rbxasset://studio_svg_textures/Lua/MaterialPicker/%s/Standard/Grid.png", "Dark");
local v18 = string.format("rbxasset://studio_svg_textures/Lua/MaterialPicker/%s/Standard/List.png", "Light");
local v19 = {
    [l_StyleKey_0.MaterialGeneratorButtonIcon] = v13, 
    [l_StyleKey_0.MaterialManagerButtonIcon] = v15, 
    [l_StyleKey_0.ViewToggleButtonGridIcon] = v17, 
    [l_StyleKey_0.ViewToggleButtonListIcon] = string.format("rbxasset://studio_svg_textures/Lua/MaterialPicker/%s/Standard/List.png", "Dark"), 
    [l_StyleKey_0.FilterChipTextColor] = Color3.fromHex("FFFFFF"), 
    [l_StyleKey_0.FilterChipBorderColor] = Color3.fromHex("262626"), 
    [l_StyleKey_0.FilterChipInactiveBackgroundColor] = Color3.fromHex("3C3C3C"), 
    [l_StyleKey_0.FilterChipInactiveHoverBackgroundColor] = Color3.fromHex("424242"), 
    [l_StyleKey_0.FilterChipActiveBackgroundColor] = Color3.fromHex("1A1A1A"), 
    [l_StyleKey_0.FilterChipActiveHoverBackgroundColor] = Color3.fromHex("252525")
};
local v20 = {
    [l_StyleKey_0.MaterialGeneratorButtonIcon] = v12, 
    [l_StyleKey_0.MaterialManagerButtonIcon] = v14, 
    [l_StyleKey_0.ViewToggleButtonGridIcon] = v16, 
    [l_StyleKey_0.ViewToggleButtonListIcon] = v18, 
    [l_StyleKey_0.FilterChipTextColor] = Color3.fromHex("000000"), 
    [l_StyleKey_0.FilterChipBorderColor] = Color3.fromHex("B6B6B6"), 
    [l_StyleKey_0.FilterChipInactiveBackgroundColor] = Color3.fromHex("FFFFFF"), 
    [l_StyleKey_0.FilterChipInactiveHoverBackgroundColor] = Color3.fromHex("E4EEFE"), 
    [l_StyleKey_0.FilterChipActiveBackgroundColor] = Color3.fromHex("A8A8A8"), 
    [l_StyleKey_0.FilterChipActiveHoverBackgroundColor] = Color3.fromHex("D8E6FF")
};
return function(v21)
    local v22 = {
        MainView = {
            Padding = 10, 
            ScrollBarThickness = 8
        }, 
        PrimaryTools = {
            Size = UDim2.new(1, 0, 0, 40), 
            Spacing = 4, 
            Padding = 8, 
            SearchBar = {
                Size = UDim2.new(1, -24, 1, 0)
            }, 
            ViewToggle = {
                Size = UDim2.new(0, 24, 0, 24), 
                LeftIconGrid = l_StyleKey_0.ViewToggleButtonGridIcon, 
                LeftIconList = l_StyleKey_0.ViewToggleButtonListIcon
            }
        }, 
        Filters = {
            Size = UDim2.new(1, 0, 0, 30), 
            ChipSize = UDim2.new(1, 0, 0, 22), 
            TextColor = l_StyleKey_0.FilterChipTextColor, 
            BorderColor = l_StyleKey_0.FilterChipBorderColor, 
            InactiveBackgroundColor = l_StyleKey_0.FilterChipInactiveBackgroundColor, 
            InactiveHoverBackgroundColor = l_StyleKey_0.FilterChipInactiveHoverBackgroundColor, 
            ActiveBackgroundColor = l_StyleKey_0.FilterChipActiveBackgroundColor, 
            ActiveHoverBackgroundColor = l_StyleKey_0.FilterChipActiveHoverBackgroundColor, 
            TextSize = 15
        }, 
        MaterialGrid = {
            GridItemsPerRow = 3, 
            GridItemRowsPerPage = 3, 
            GridItemPadding = 4, 
            GridItemSize = 80, 
            ListPadding = {
                Top = 3, 
                Left = 3
            }, 
            SnapshotSize = UDim2.fromOffset(64, 64), 
            SnapshotBorderThickness = 0.6, 
            TooltipDelay = 0.4
        }, 
        Footer = {
            Padding = 8, 
            Spacing = 4, 
            Size = UDim2.new(1, 0, 0, 40), 
            IconButton = {
                ActiveBackgroundColor = if not v10() then l_StyleKey_0.BackgroundDefault else nil, 
                BackgroundColor = l_StyleKey_0.Button, 
                IconSize = 16, 
                Spacing = 8, 
                Padding = 8, 
                MaterialManagerButton = {
                    Icon = l_StyleKey_0.MaterialManagerButtonIcon
                }, 
                MaterialGeneratorButton = {
                    Icon = l_StyleKey_0.MaterialGeneratorButtonIcon, 
                    Size = UDim2.new(0, 97, 1, 0)
                }
            }
        }
    };
    local l_GridItemSize_0 = v22.MaterialGrid.GridItemSize;
    local l_ScrollBarThickness_0 = v22.MainView.ScrollBarThickness;
    local l_GridItemsPerRow_0 = v22.MaterialGrid.GridItemsPerRow;
    local l_GridItemPadding_0 = v22.MaterialGrid.GridItemPadding;
    local v27 = (l_GridItemsPerRow_0 * l_GridItemSize_0 + (l_GridItemsPerRow_0 + 1) * l_GridItemPadding_0) + l_ScrollBarThickness_0;
    local l_GridItemRowsPerPage_0 = v22.MaterialGrid.GridItemRowsPerPage;
    local v29 = l_GridItemRowsPerPage_0 * l_GridItemSize_0 + (l_GridItemRowsPerPage_0 + 1) * l_GridItemPadding_0;
    local v30 = ((v22.PrimaryTools.Size.Y.Offset + v22.Filters.Size.Y.Offset) + v29) + v22.Footer.Size.Y.Offset;
    local l_IconSize_0 = v22.Footer.IconButton.IconSize;
    local l_Size_0 = v22.Footer.IconButton.MaterialGeneratorButton.Size;
    local v33 = ((v27 - l_Size_0.X.Offset) - v22.Footer.Padding * 2) - v22.Footer.Spacing;
    local v34 = nil;
    v34 = if not v21 then l_ContextServices_0.Localization.new({
        stringResourceTable = l_SourceStrings_0, 
        translationResourceTable = l_LocalizedStrings_0, 
        pluginName = "MaterialPicker"
    }):getText("MainView", "MaterialManagerButton") else "Material Manager";
    local v35 = ((v33 - l_IconSize_0) - v22.Footer.IconButton.Padding * 2) - v22.Footer.IconButton.Spacing;
    local l_X_0 = l_TextService_0:GetTextSize(v34, l_IconSize_0, Enum.Font.SourceSans, Vector2.new(v33, l_IconSize_0)).X;
    if v35 < l_X_0 then
        v33 = (v33 + (l_X_0 - v35)) + 16;
    end;
    local v37 = nil;
    v37 = if not v11() then (v27 - v22.Footer.Padding * 2) - v22.Footer.Spacing else ((v27 - l_Size_0.X.Offset) - v22.Footer.Padding * 2) - v22.Footer.Spacing;
    if v37 < v33 then
        v27 = v27 + (v33 - v37);
    end;
    v22.Popup = {
        Size = Vector2.new(v27, v30)
    };
    v22.Footer.IconButton.MaterialManagerButton.Size = UDim2.new(0, v33, 1, 0);
    v22.MaterialGrid.ContainerXBounds = NumberRange.new(0, v22.Popup.Size.X - v22.MainView.ScrollBarThickness);
    v22.MaterialGrid.ContainerYBounds = NumberRange.new(v22.PrimaryTools.Size.Y.Offset + v22.Filters.Size.Y.Offset, v22.Popup.Size.Y - v22.Footer.Size.Y.Offset);
    v22.MaterialGrid.Size = UDim2.new(1, 0, 0, v29);
    return {
        createTheme = function()
            local _ = nil;
            return (if not v21 then l_Theme_0.new(v19, v20) else l_Theme_0.mock(v19)):extend(v22);
        end, 
        Popup = v22.Popup
    };
end;
