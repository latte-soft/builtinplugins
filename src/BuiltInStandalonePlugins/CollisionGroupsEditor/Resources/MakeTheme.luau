local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Framework);
local v2 = require(l_Parent_0.Packages.Dash);
local l_StyleModifier_0 = v1.Util.StyleModifier;
local l_Style_0 = v1.Style;
local l_BaseTheme_0 = l_Style_0.Themes.BaseTheme;
local l_StudioTheme_0 = l_Style_0.Themes.StudioTheme;
local l_ColorSystem_0 = l_Style_0.ColorSystem;
local l_StyleKey_0 = l_Style_0.StyleKey;
local l_ComponentSymbols_0 = l_Style_0.ComponentSymbols;
local v10 = require(l_Parent_0.Plugin.Constants);
l_ComponentSymbols_0:add("GroupButton");
local function v14()
    local l_GroupRowHeight_0 = v10.GroupRowHeight;
    local l_ControlsHeaderButtonWidth_0 = v10.ControlsHeaderButtonWidth;
    local l_ScrollBarThickness_0 = l_BaseTheme_0[l_ComponentSymbols_0.ScrollingFrame].ScrollBarThickness;
    return {
        [l_ComponentSymbols_0.Pane] = v2.join(l_BaseTheme_0[l_ComponentSymbols_0.Pane], {
            ["&BorderBox"] = l_BaseTheme_0[l_ComponentSymbols_0.Pane]["&Box"], 
            ["&GroupLabel"] = {
                Border = {
                    Color = l_StyleKey_0.SubBackground
                }, 
                Background = l_StyleKey_0.ForegroundMain, 
                [l_StyleModifier_0.Pressed] = {
                    Background = l_StyleKey_0.ForegroundMain
                }, 
                [l_StyleModifier_0.Hover] = {
                    Background = l_StyleKey_0.ButtonHover
                }, 
                [l_StyleModifier_0.Selected] = {
                    Background = l_StyleKey_0.ActionFocusBorder
                }
            }
        }), 
        [l_ComponentSymbols_0.TextLabel] = v2.join(l_BaseTheme_0[l_ComponentSymbols_0.TextLabel], {
            ["&GroupLabel"] = {
                TextSize = 14, 
                [l_StyleModifier_0.Selected] = {
                    TextColor = l_ColorSystem_0.White[0]
                }
            }
        }), 
        [l_ComponentSymbols_0.Button] = v2.join(l_BaseTheme_0[l_ComponentSymbols_0.Button], {
            TextWrapped = true
        }), 
        [l_ComponentSymbols_0.Table] = {
            Border = l_StyleKey_0.MainBackground
        }, 
        [l_ComponentSymbols_0.GroupButton] = {
            Size = UDim2.fromOffset(32, 32), 
            ImageSize = UDim2.fromOffset(26, 26), 
            Padding = 6, 
            ["&Rename"] = {
                Image = "rbxasset://textures/CollisionGroupsEditor/rename.png", 
                HoveredImage = "rbxasset://textures/CollisionGroupsEditor/rename-hover.png"
            }, 
            ["&SetMembership"] = {
                Padding = 10, 
                ImageSize = UDim2.fromOffset(22, 22), 
                Image = "rbxasset://textures/CollisionGroupsEditor/assign.png", 
                HoveredImage = "rbxasset://textures/CollisionGroupsEditor/assign-hover.png"
            }, 
            ["&Delete"] = {
                Image = "rbxasset://textures/CollisionGroupsEditor/delete.png", 
                HoveredImage = "rbxasset://textures/CollisionGroupsEditor/delete-hover.png"
            }
        }, 
        ScrollingFrameNoBar = v2.join(l_BaseTheme_0[l_ComponentSymbols_0.ScrollingFrame], {
            ScrollBarThickness = 0
        }), 
        TableEntryBackground = l_StyleKey_0.ForegroundMain, 
        TableEntrySelected = l_StyleKey_0.ActionFocusBorder, 
        TableEntryHover = l_StyleKey_0.ButtonHover, 
        AddGroupInternalButtonSize = UDim2.new(0, l_ControlsHeaderButtonWidth_0, 0, 34), 
        ScrollBarThickness = l_ScrollBarThickness_0, 
        GroupLabelStyle = {
            GroupSetMembershipButtonWidth = 36, 
            GroupNameLabelSize = UDim2.new(1, -36, 1, -2), 
            CursorGroupNameLabelSize = UDim2.new(1, 0, 1, -2)
        }, 
        GroupLabelColumn = {
            Padding = {
                Top = 1, 
                Bottom = 1, 
                Left = 1, 
                Right = 1
            }
        }, 
        TableHeader = {
            Padding = {
                Top = 1, 
                Bottom = 1, 
                Left = 2, 
                Right = l_ScrollBarThickness_0
            }, 
            ScrollingFrameSize = UDim2.new(1, -v10.GroupRowWidth + 1, 0, v10.GroupRowHeight), 
            ScrollingFramePadding = {
                Top = 0, 
                Bottom = 0, 
                Left = 0, 
                Right = l_ScrollBarThickness_0
            }
        }, 
        ListHeader = {
            Padding = {
                Top = 1, 
                Bottom = 1, 
                Left = 2, 
                Right = 0
            }, 
            LabelPanePadding = {
                Top = 0, 
                Bottom = 0, 
                Left = 12, 
                right = 0
            }
        }, 
        MainView = {
            MiddlePaneSize = UDim2.new(1, 0, 1, -l_GroupRowHeight_0 * 2 - 12), 
            GridFrameSize = UDim2.new(1, -v10.GroupRowWidth, 1, 0), 
            ListFrameSize = UDim2.new(1, -v10.GroupRowWidth - l_ScrollBarThickness_0, 1, 0)
        }, 
        GroupListView = {
            MainPanePadding = {
                Top = 2, 
                Bottom = 5, 
                Left = 4, 
                Right = 4
            }, 
            UnselectedViewPadding = l_ScrollBarThickness_0
        }, 
        CollisionCheckbox = v2.join(l_ComponentSymbols_0.TableRow, {
            Border = l_StyleKey_0.SubBackground, 
            BackgroundOdd = l_StyleKey_0.MainBackground, 
            BackgroundEven = l_StyleKey_0.SubBackground2, 
            CheckboxUncheckedImage = l_StyleKey_0.CheckboxUncheckedImage, 
            CheckboxCheckedImage = l_StyleKey_0.CheckboxCheckedImage, 
            NoCheckboxPanelColor = l_StyleKey_0.ForegroundMain
        }), 
        ControlsHeaderRow = {
            Size = UDim2.new(1, 0, 0, l_GroupRowHeight_0 + 12), 
            Padding = 6, 
            Spacing = 6, 
            ButtonWidth = l_ControlsHeaderButtonWidth_0, 
            ButtonHeight = 34, 
            GroupButtonsPaneSize = UDim2.new(0, 63, 1, 0), 
            TextButtonPane = {
                Size = UDim2.new(1, -66, 1, 0), 
                Padding = 0, 
                Spacing = 6
            }
        }, 
        GroupRenameDialog = {
            DialogMinimumSize = Vector2.new(450, 200), 
            Padding = 5, 
            Spacing = 5, 
            WarningTextSize = UDim2.new(1, 0, 1, -60)
        }, 
        CannotConfigureSelectionDialog = {
            DialogMinimumSize = Vector2.new(450, 100)
        }, 
        CGEAlert = {
            CornerRadius = UDim.new(0, 4), 
            StrokeColor = Color3.new(1, 0, 0), 
            BackgroundColor = l_StyleKey_0.MainBackground, 
            BackgroundColorHoverDarkerMultiplier = 0.15, 
            Padding = {
                Top = 2, 
                Left = 4, 
                Right = 4, 
                Bottom = 6
            }, 
            LinePadding = 4, 
            LineSpacing = 4
        }
    };
end;
return function(v15)
    local _ = nil;
    return (if not v15 then l_StudioTheme_0.new() else l_StudioTheme_0.mock()):extend((v14()));
end;
