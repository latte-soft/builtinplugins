local l_Parent_0 = script.Parent.Parent.Parent;
local l_StudioAssetManagerAddRecentlyImportedView_0 = game:GetFastFlag("StudioAssetManagerAddRecentlyImportedView");
local l_EnableAssetManagerGlobalSearchBar_0 = game:GetFastFlag("EnableAssetManagerGlobalSearchBar");
local l_EnableAssetManagerSortButton_0 = game:GetFastFlag("EnableAssetManagerSortButton");
local v4 = require(l_Parent_0.Packages.Roact);
local v5 = require(l_Parent_0.Packages.RoactRodux);
local v6 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v6.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_UI_0 = v6.UI;
local l_Button_0 = l_UI_0.Button;
local l_DropdownMenu_0 = l_UI_0.DropdownMenu;
local l_HoverArea_0 = l_UI_0.HoverArea;
local l_LinkText_0 = l_UI_0.LinkText;
local l_Pane_0 = l_UI_0.Pane;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_Tooltip_0 = l_UI_0.Tooltip;
local l_SearchBar_0 = l_UI_0.SearchBar;
local l_Util_0 = v6.Util;
local l_LayoutOrderIterator_0 = l_Util_0.LayoutOrderIterator;
local l_StyleModifier_0 = l_Util_0.StyleModifier;
local l_GetTextSize_0 = l_Util_0.GetTextSize;
local v22 = require(l_Parent_0.Src.Actions.SetRecentViewToggled);
local v23 = require(l_Parent_0.Src.Actions.SetSearchTerm);
local v24 = require(l_Parent_0.Src.Actions.SetToPreviousScreen);
local v25 = require(l_Parent_0.Src.Actions.SetToNextScreen);
local v26 = require(l_Parent_0.Src.Actions.SetView);
local v27 = require(l_Parent_0.Src.Thunks.LaunchBulkImport);
local v28 = require(l_Parent_0.Src.Util.Screens);
local v29 = require(l_Parent_0.Src.Util.View);
local l_BulkImportService_0 = game:GetService("BulkImportService");
local l_enableBadgesCallout_0 = require(l_Parent_0.Src.Util.AssetManagerUtilities).enableBadgesCallout;
local v32 = not not l_enableBadgesCallout_0() and require(script.Parent.TeachingCallout) or nil;
local v33 = v4.PureComponent:extend("TopBar");
v33.init = function(v34)
    v34.state = {
        showSortDropdown = false
    };
    v34.OnTreeViewButtonActivated = function()
        v34.props.OnOverlayActivated();
    end;
    v34.OnSearchRequested = function(v35)
        local l_props_0 = v34.props;
        l_props_0.Analytics:report("search");
        l_props_0.dispatchSetSearchTerm(v35);
    end;
    v34.OnSelectSortItem = function(_, _)
        v34:setState({
            showSortDropdown = false
        });
    end;
    v34.OnOpenSortDropdown = function()
        v34:setState({
            showSortDropdown = true
        });
    end;
    v34.OnCloseSortDropdown = function()
        v34:setState({
            showSortDropdown = false
        });
    end;
end;
v33.render = function(v39)
    local l_props_1 = v39.props;
    local l_Analytics_0 = l_props_1.Analytics;
    local l_Stylizer_0 = l_props_1.Stylizer;
    local l_TopBar_0 = l_Stylizer_0.TopBar;
    local l_Localization_0 = l_props_1.Localization;
    local l_Size_0 = l_props_1.Size;
    local l_LayoutOrder_0 = l_props_1.LayoutOrder;
    local l_Enabled_0 = l_props_1.Enabled;
    local l_RecentViewToggled_0 = l_props_1.RecentViewToggled;
    local l_dispatchSetRecentViewToggled_0 = l_props_1.dispatchSetRecentViewToggled;
    local l_CurrentScreen_0 = l_props_1.CurrentScreen;
    local l_PreviousScreens_0 = l_props_1.PreviousScreens;
    local l_NextScreens_0 = l_props_1.NextScreens;
    local l_dispatchSetToPreviousScreen_0 = l_props_1.dispatchSetToPreviousScreen;
    local l_dispatchSetToNextScreen_0 = l_props_1.dispatchSetToNextScreen;
    local v55 = #l_PreviousScreens_0 > 0;
    local v56 = #l_NextScreens_0 > 0;
    local l_BulkImporterRunning_0 = l_props_1.BulkImporterRunning;
    local l_dispatchLaunchBulkImporter_0 = l_props_1.dispatchLaunchBulkImporter;
    local v59 = l_Localization_0:getText("BulkImport", "BulkImportRunning");
    local v60 = l_Localization_0:getText("BulkImport", "BulkImportShowLink");
    local v61 = (l_GetTextSize_0(v59, l_TopBar_0.Tooltip.TextSize, l_Stylizer_0.Font, Vector2.new(l_TopBar_0.Tooltip.Width, math.huge)).Y + l_TopBar_0.Tooltip.Padding) + l_GetTextSize_0(v60, l_TopBar_0.Tooltip.TextSize, l_Stylizer_0.Font, Vector2.new(l_TopBar_0.Tooltip.Width, math.huge)).Y;
    local l_View_0 = l_props_1.View;
    local l_dispatchSetView_0 = l_props_1.dispatchSetView;
    local v64 = nil;
    if l_View_0.Key == v29.GRID.Key then
        v64 = "ListViewButton";
    elseif l_View_0.Key == v29.LIST.Key then
        v64 = "GridViewButton";
    end;
    local v65 = nil;
    v65 = if not l_EnableAssetManagerSortButton_0 then l_TopBar_0.Button.Size * 5 + l_TopBar_0.Padding * 4 else l_TopBar_0.Button.Size * 6 + l_TopBar_0.Padding * 2;
    local v66 = nil;
    local v67 = nil;
    if not l_EnableAssetManagerGlobalSearchBar_0 then
        v66 = l_CurrentScreen_0.Path ~= v28.MAIN.Path;
        v67 = l_Localization_0:getText("SearchBar", "PlaceholderText") .. " " .. l_Localization_0:getText("Folders", l_CurrentScreen_0.Path);
    else
        v66 = true;
        v67 = if l_CurrentScreen_0.Path ~= v28.MAIN.Path then l_Localization_0:getText("SearchBar", "PlaceholderText") .. " " .. l_Localization_0:getText("Folders", l_CurrentScreen_0.Path) else l_Localization_0:getText("SearchBar", "GlobalPlaceholderText");
    end;
    local v68 = l_LayoutOrderIterator_0.new();
    local v69 = l_Localization_0:getText("TopBar", "ExplorerOverlayButton");
    local v70 = l_Localization_0:getText("TopBar", "BackButton");
    local v71 = l_Localization_0:getText("TopBar", "ForwardButton");
    local v72 = l_Localization_0:getText("TopBar", "BulkImportButton");
    local v73 = nil;
    if l_View_0.Key == v29.GRID.Key then
        v73 = l_Localization_0:getText("TopBar", "ListViewButton");
    elseif l_View_0.Key == v29.LIST.Key then
        v73 = l_Localization_0:getText("TopBar", "GridViewButton");
    end;
    local v74 = nil;
    local v75 = nil;
    local v76 = nil;
    local v77 = nil;
    local v78 = nil;
    if l_EnableAssetManagerSortButton_0 then
        v74 = l_Localization_0:getText("TopBar", "SortButton");
        v75 = l_Localization_0:getText("SortOption", "RecentlyAdded");
        v76 = l_Localization_0:getText("SortOption", "RecentlyUsed");
        v77 = l_Localization_0:getText("SortOption", "AscendingName");
        v78 = l_Localization_0:getText("SortOption", "DescendingName");
    end;
    return v4.createElement("Frame", {
        Size = l_Size_0, 
        LayoutOrder = l_LayoutOrder_0, 
        BackgroundColor3 = l_Stylizer_0.BackgroundColor, 
        BorderColor3 = l_Stylizer_0.BorderColor, 
        BorderSizePixel = 1
    }, {
        TopBarLayout = v4.createElement("UIListLayout", {
            Padding = UDim.new(0, l_TopBar_0.Padding), 
            FillDirection = Enum.FillDirection.Horizontal, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            SortOrder = Enum.SortOrder.LayoutOrder
        }), 
        Padding = v4.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, l_TopBar_0.Padding), 
            PaddingRight = UDim.new(0, l_TopBar_0.Padding)
        }), 
        ExplorerOverlayButton = v4.createElement(l_Button_0, {
            Size = UDim2.new(0, l_TopBar_0.Button.Size, 0, l_TopBar_0.Button.Size), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            LayoutOrder = v68:getNextOrder(), 
            Style = "OverlayButton", 
            OnClick = function()
                if l_Enabled_0 then
                    v39.OnTreeViewButtonActivated();
                end;
            end
        }, {
            HoverArea = l_Enabled_0 and v4.createElement(l_HoverArea_0, {
                Cursor = "PointingHand", 
                MouseEnter = v39.mouseEnter, 
                MouseLeave = v39.mouseLeave
            }), 
            Tooltip = l_Enabled_0 and v4.createElement(l_Tooltip_0, {
                Text = v69, 
                Enabled = true
            })
        }), 
        NavigationButtonsFrame = v4.createElement("Frame", {
            Size = UDim2.new(0, 2 * l_TopBar_0.Button.Size, 0, l_TopBar_0.Button.Size), 
            BackgroundTransparency = 1, 
            LayoutOrder = v68:getNextOrder()
        }, {
            ButtonLayout = v4.createElement("UIListLayout", {
                Padding = UDim.new(0, 0), 
                FillDirection = Enum.FillDirection.Horizontal, 
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            PreviousButton = v4.createElement(l_Button_0, {
                Size = UDim2.new(0, l_TopBar_0.Button.Size, 0, l_TopBar_0.Button.Size), 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                LayoutOrder = 1, 
                Style = "PreviousButton", 
                StyleModifier = not v55 and l_StyleModifier_0.Disabled, 
                OnClick = function()
                    if not (not v55 or not l_Enabled_0) then
                        l_dispatchSetToPreviousScreen_0(v55);
                        if not (not l_StudioAssetManagerAddRecentlyImportedView_0 or not l_RecentViewToggled_0) then
                            l_dispatchSetRecentViewToggled_0(false);
                        end;
                    end;
                end
            }, {
                HoverArea = (v55 and l_Enabled_0) and v4.createElement(l_HoverArea_0, {
                    Cursor = "PointingHand", 
                    MouseEnter = v39.mouseEnter, 
                    MouseLeave = v39.mouseLeave
                }), 
                Tooltip = (v55 and l_Enabled_0) and v4.createElement(l_Tooltip_0, {
                    Text = v70, 
                    Enabled = true
                })
            }), 
            NextButton = v4.createElement(l_Button_0, {
                Size = UDim2.new(0, l_TopBar_0.Button.Size, 0, l_TopBar_0.Button.Size), 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                LayoutOrder = 2, 
                Style = "NextButton", 
                StyleModifier = not v56 and l_StyleModifier_0.Disabled, 
                OnClick = function()
                    if not (not v56 or not l_Enabled_0) then
                        l_dispatchSetToNextScreen_0(v56);
                        if not (not l_StudioAssetManagerAddRecentlyImportedView_0 or not l_RecentViewToggled_0) then
                            l_dispatchSetRecentViewToggled_0(false);
                        end;
                    end;
                end
            }, {
                HoverArea = (v56 and l_Enabled_0) and v4.createElement(l_HoverArea_0, {
                    Cursor = "PointingHand", 
                    MouseEnter = v39.mouseEnter, 
                    MouseLeave = v39.mouseLeave
                }), 
                Tooltip = (v56 and l_Enabled_0) and v4.createElement(l_Tooltip_0, {
                    Text = v71, 
                    Enabled = true
                })
            })
        }), 
        BulkImporterButton = v4.createElement(l_Button_0, {
            Size = UDim2.new(0, l_TopBar_0.Button.Size, 0, l_TopBar_0.Button.Size), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            LayoutOrder = v68:getNextOrder(), 
            Style = "BulkImporterButton", 
            StyleModifier = l_BulkImporterRunning_0 and l_StyleModifier_0.Disabled, 
            OnClick = function()
                if not (l_BulkImporterRunning_0 or not l_Enabled_0) then
                    l_Analytics_0:report("clickBulkImportButton");
                    l_dispatchLaunchBulkImporter_0(0);
                end;
            end
        }, {
            OpenBulkImporterTooltip = v4.createElement(l_Tooltip_0, {
                Content = v4.createElement(l_Pane_0, {
                    Layout = Enum.FillDirection.Vertical, 
                    Spacing = l_TopBar_0.Tooltip.Padding, 
                    Style = "Box"
                }, {
                    TextLabel = v4.createElement(l_TextLabel_0, {
                        AutomaticSize = Enum.AutomaticSize.Y, 
                        Font = l_Stylizer_0.Font, 
                        LayoutOrder = 1, 
                        Size = UDim2.fromScale(1, 0), 
                        Text = v59, 
                        TextSize = l_TopBar_0.Tooltip.TextSize, 
                        TextWrapped = true, 
                        TextXAlignment = Enum.TextXAlignment.Left
                    }), 
                    LinkText = v4.createElement(l_LinkText_0, {
                        LayoutOrder = 2, 
                        Style = "BulkImporterTooltip", 
                        Text = v60, 
                        OnClick = function()
                            l_BulkImportService_0:ShowBulkImportView();
                        end
                    })
                }), 
                ContentExtents = Vector2.new(l_TopBar_0.Tooltip.Width, v61), 
                Enabled = l_BulkImporterRunning_0
            }), 
            HoverArea = (not l_BulkImporterRunning_0 and l_Enabled_0) and v4.createElement(l_HoverArea_0, {
                Cursor = "PointingHand", 
                MouseEnter = v39.mouseEnter, 
                MouseLeave = v39.mouseLeave
            }), 
            BulkImportButtonTooltip = (not l_BulkImporterRunning_0 and l_Enabled_0) and v4.createElement(l_Tooltip_0, {
                Text = v72, 
                Enabled = true
            })
        }), 
        GridListToggleButton = v4.createElement(l_Button_0, {
            Size = UDim2.new(0, l_TopBar_0.Button.Size, 0, l_TopBar_0.Button.Size), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            LayoutOrder = v68:getNextOrder(), 
            Style = v64, 
            StyleModifier = l_BulkImporterRunning_0 and l_StyleModifier_0.Disabled, 
            OnClick = function()
                if l_View_0.Key == v29.GRID.Key then
                    l_dispatchSetView_0(v29.LIST);
                    return ;
                else
                    if l_View_0.Key == v29.LIST.Key then
                        l_dispatchSetView_0(v29.GRID);
                    end;
                    return ;
                end;
            end
        }, {
            HoverArea = (not l_BulkImporterRunning_0 and l_Enabled_0) and v4.createElement(l_HoverArea_0, {
                Cursor = "PointingHand", 
                MouseEnter = v39.mouseEnter, 
                MouseLeave = v39.mouseLeave
            }), 
            Tooltip = l_Enabled_0 and v4.createElement(l_Tooltip_0, {
                Text = v73, 
                Enabled = true
            }), 
            TeachingCallout = l_enableBadgesCallout_0() and v4.createElement(v32, {
                DefinitionId = "AssetManagerBadgesDevProductCallout", 
                LocationId = "GridListToggleButton"
            })
        }), 
        SearchBar = if not l_EnableAssetManagerSortButton_0 and v66 then v4.createElement(l_SearchBar_0, {
            Size = UDim2.new(1, -v65, 1, -2), 
            LayoutOrder = v68:getNextOrder(), 
            Disabled = not l_Enabled_0, 
            Style = "Compact", 
            ShowSearchIcon = true, 
            ShowSearchButton = false, 
            PlaceholderText = v67, 
            IncrementalTextSearch = true, 
            IncrementalTextSearchDelay = 0, 
            OnSearchRequested = v39.OnSearchRequested
        }) else nil, 
        SearchSortFrame = if not l_EnableAssetManagerSortButton_0 then nil else v4.createElement(l_Pane_0, {
            Size = UDim2.new(1, -v65, 0, l_TopBar_0.Button.Size), 
            BackgroundTransparency = 1, 
            Layout = Enum.FillDirection.Horizontal, 
            LayoutOrder = v68:getNextOrder()
        }, {
            SearchBar = v66 and v4.createElement(l_SearchBar_0, {
                Size = UDim2.new(1, -l_TopBar_0.Button.Size, 1, -2), 
                LayoutOrder = 1, 
                Disabled = not l_Enabled_0, 
                Style = "Compact", 
                ShowSearchIcon = true, 
                ShowSearchButton = false, 
                PlaceholderText = v67, 
                IncrementalTextSearch = true, 
                IncrementalTextSearchDelay = 0, 
                OnSearchRequested = v39.OnSearchRequested
            }), 
            SortButton = v4.createElement(l_Button_0, {
                Size = UDim2.new(0, l_TopBar_0.Button.Size, 0, l_TopBar_0.Button.Size), 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                LayoutOrder = 2, 
                Style = "SortButton", 
                StyleModifier = v39.state.showSortDropdown and l_StyleModifier_0.Selected, 
                OnClick = function()
                    if l_Enabled_0 then
                        v39.OnOpenSortDropdown();
                    end;
                end
            }, {
                Menu = v4.createElement(l_DropdownMenu_0, {
                    Hide = not v39.state.showSortDropdown, 
                    Items = {
                        v75, 
                        v76, 
                        v77, 
                        v78
                    }, 
                    OnItemActivated = v39.OnSelectSortItem, 
                    OnFocusLost = v39.OnCloseSortDropdown
                }), 
                HoverArea = l_Enabled_0 and v4.createElement(l_HoverArea_0, {
                    Cursor = "PointingHand", 
                    MouseEnter = v39.mouseEnter, 
                    MouseLeave = v39.mouseLeave
                }), 
                Tooltip = l_Enabled_0 and v4.createElement(l_Tooltip_0, {
                    Text = v74, 
                    Enabled = true
                })
            })
        })
    });
end;
return v5.connect(function(v79, _)
    return {
        BulkImporterRunning = v79.AssetManagerReducer.bulkImporterRunning, 
        CurrentScreen = v79.Screen.currentScreen, 
        PreviousScreens = v79.Screen.previousScreens, 
        NextScreens = v79.Screen.nextScreens, 
        RecentViewToggled = v79.AssetManagerReducer.recentViewToggled, 
        View = v79.AssetManagerReducer.view
    };
end, function(v81)
    return {
        dispatchLaunchBulkImporter = function(v82)
            v81(v27(v82));
        end, 
        dispatchSetRecentViewToggled = function(v83)
            v81(v22(v83));
        end, 
        dispatchSetSearchTerm = function(v84)
            v81(v23(v84));
        end, 
        dispatchSetToPreviousScreen = function(v85)
            if v85 then
                v81(v24());
            end;
        end, 
        dispatchSetToNextScreen = function(v86)
            if v86 then
                v81(v25());
            end;
        end, 
        dispatchSetView = function(v87)
            v81(v26(v87));
        end
    };
end)((l_withContext_0({
    Analytics = l_ContextServices_0.Analytics, 
    Localization = l_ContextServices_0.Localization, 
    Stylizer = l_ContextServices_0.Stylizer
})(v33)));
