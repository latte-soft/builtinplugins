local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Core.Util.SharedFlags.getFFlagToolboxEnableSearchOptionsRefactor);
local l_Packages_0 = l_Parent_0.Packages;
local v3 = require(l_Packages_0.Roact);
local v4 = require(l_Packages_0.RoactRodux);
local v5 = require(l_Packages_0.Framework);
local l_Util_0 = l_Parent_0.Core.Util;
local v7 = require(l_Util_0.Constants);
local v8 = require(l_Util_0.Images);
local v9 = require(l_Util_0.debounce);
local _ = require(l_Parent_0.Core.Components.createFitToContent);
local l_ContextServices_0 = v5.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v13 = require(l_Parent_0.Core.ContextServices.Settings);
local v14 = require(l_Parent_0.Core.ContextServices.ModalContext);
local v15 = require(l_Parent_0.Core.ContextServices.NetworkContext);
local v16 = require(l_Parent_0.Core.Components.SearchOptions.LiveSearchBar);
local l_RadioButtonList_0 = require(l_Packages_0.Framework).UI.RadioButtonList;
local l_UI_0 = v5.UI;
local l_Checkbox_0 = l_UI_0.Checkbox;
local l_Pane_0 = l_UI_0.Pane;
local l_Image_0 = l_UI_0.Image;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_ShowOnTop_0 = l_UI_0.ShowOnTop;
local l_ScrollingFrame_0 = l_UI_0.ScrollingFrame;
local l_Tooltip_0 = l_UI_0.Tooltip;
local v26 = require(l_Parent_0.Core.Components.Audio.AudioSearch);
local v27 = require(l_Parent_0.Core.Components.SearchOptions.SearchOptionsEntry);
local v28 = require(l_Parent_0.Core.Components.SearchOptions.SearchOptionsFooter);
local l_getShouldHideNonRelevanceSorts_0 = require(l_Parent_0.Core.Util.ToolboxUtilities).getShouldHideNonRelevanceSorts;
local l_Separator_0 = l_UI_0.Separator;
local v31 = require(l_Parent_0.Core.Networking.Requests.SearchWithOptions);
local v32 = require(l_Parent_0.Core.Networking.Requests.UserSearchRequest);
local l_showRobloxCreatedAssets_0 = require(l_Parent_0.Core.Util.ToolboxUtilities).showRobloxCreatedAssets;
local v34 = require(l_Parent_0.Core.Types.Category);
local l_game_FastInt_0 = game:GetFastInt("ToolboxLiveSearchDebounceWait");
local v36 = v3.PureComponent:extend("SearchOptions");
if not v1() then
    v36.defaultProps = {
        showCreatorSearch = true
    };
    v36.init = function(v37, v38)
        v37.layoutRef = v3.createRef();
        v37.containerRef = v3.createRef();
        v37.buttonsContainerRef = v3.createRef();
        v37.currentLayout = 0;
        v37.searchTerm = v38.LiveSearchData.searchTerm;
        v37.extraSearchDetails = {};
        local l_audioSearchInfo_0 = v37.props.audioSearchInfo;
        v37.state = {
            minDuration = not not l_audioSearchInfo_0 and l_audioSearchInfo_0.minDuration or v7.MIN_AUDIO_SEARCH_DURATION, 
            maxDuration = not not l_audioSearchInfo_0 and l_audioSearchInfo_0.maxDuration or v7.MAX_AUDIO_SEARCH_DURATION, 
            SortIndex = nil, 
            includeUnverifiedCreators = v37.props.includeUnverifiedCreators
        };
        v37.sortsList = {};
        v37.mouseEnter = function()
            v37.props.Modal.onSearchOptionsMouse(true);
        end;
        v37.mouseLeave = function()
            v37.props.Modal.onSearchOptionsMouse(false);
        end;
        v37.debouncedUserSearch = v9(function(v40)
            local l_props_0 = v37.props;
            l_props_0.userSearch(l_props_0.Network.networkInterface, v40);
        end, l_game_FastInt_0);
        v37.updateSearch = function(v42, v43)
            v37.searchTerm = v42;
            v37.extraSearchDetails = v43;
            v37.debouncedUserSearch(v42);
        end;
        v37.selectSort = function(v44)
            local v45 = nil;
            for v46, v47 in pairs(v37.sortsList) do
                if v47.Key == v44 then
                    v45 = v46;
                end;
            end;
            v37:setState({
                SortIndex = v45
            });
        end;
        v37.apply = function(v48)
            v37.onSearchOptionsClosed(v48);
        end;
        v37.cancel = function()
            v37.onSearchOptionsClosed(nil);
        end;
        v37.footerButtonClicked = function(v49)
            local v50 = {
                SortIndex = v37.state.SortIndex, 
                Creator = v37.searchTerm
            };
            if not (v37.state.minDuration == v7.MIN_AUDIO_SEARCH_DURATION) or v37.state.maxDuration ~= v7.MAX_AUDIO_SEARCH_DURATION then
                v50.AudioSearch = {
                    minDuration = v37.state.minDuration, 
                    maxDuration = v37.state.maxDuration
                };
            end;
            if v37.extraSearchDetails and next(v37.extraSearchDetails) ~= nil then
                v50.Creator = {
                    Name = v37.extraSearchDetails.Name, 
                    Id = v37.extraSearchDetails.Id
                };
            end;
            v50.includeUnverifiedCreators = v37.state.includeUnverifiedCreators;
            v37:setState({
                SortIndex = v3.None, 
                Creator = v3.None
            });
            if v49 == "Cancel" then
                v37.cancel();
                return ;
            else
                if v49 == "Apply" then
                    v37.apply(v50);
                end;
                return ;
            end;
        end;
        v37.onDurationChange = function(v51, v52)
            if not (v51 == v37.state.minDuration) or v52 ~= v37.state.maxDuration then
                v37:setState({
                    minDuration = v51, 
                    maxDuration = v52
                });
            end;
        end;
        v37.onToggleIdVerified = function()
            v37:setState(function(v53)
                return {
                    includeUnverifiedCreators = not v53.includeUnverifiedCreators
                };
            end);
        end;
        v37.updateContainerSize = function(v54)
            v37:setState({
                windowSize = v54.AbsoluteSize
            });
        end;
        v37.updateContentsSize = function(v55)
            spawn(function()
                v37:setState({
                    contentSize = v55
                });
            end);
        end;
        v37.onSearchOptionsClosed = function(v56)
            if v56 then
                v37.props.searchWithOptions(v37.props.Network.networkInterface, v37.props.Settings:get("Plugin"), v56);
            end;
            if v37.props.onSearchOptionsToggled then
                v37.props.onSearchOptionsToggled();
            end;
        end;
    end;
    v36.createSeparator = function(v57, _)
        return v3.createElement(l_Separator_0, {
            LayoutOrder = v57:nextLayout()
        });
    end;
    v36.resetLayout = function(v59)
        v59.currentLayout = 0;
    end;
    v36.nextLayout = function(v60)
        v60.currentLayout = v60.currentLayout + 1;
        return v60.currentLayout;
    end;
    v36.render = function(v61)
        local l_state_0 = v61.state;
        local l_searchOptions_0 = v61.props.Stylizer.searchOptions;
        local l_LiveSearchData_0 = v61.props.LiveSearchData;
        local l_minDuration_0 = l_state_0.minDuration;
        local l_maxDuration_0 = l_state_0.maxDuration;
        local l_Localization_0 = v61.props.Localization;
        local v68 = l_Localization_0:getText("General", "SearchOptionAudioLength");
        local v69 = l_Localization_0:getText("General", "SearchOptionsIncludeUnverifiedDescription");
        local v70 = l_Localization_0:getText("General", "SearchOptionsIncludeUnverifiedHeader");
        local v71 = l_Localization_0:getText("General", "SearchOptionsIncludeUnverifiedTooltip");
        local v72 = v34.categoryIsAudio(v61.props.categoryName);
        local v73 = true;
        if l_showRobloxCreatedAssets_0() then
            v73 = false;
        end;
        v61.sortsList = {
            {
                Key = "Relevance", 
                Text = l_Localization_0:getText("General", "SortByRelevance")
            }, 
            {
                Key = "MostTaken", 
                Text = l_Localization_0:getText("General", "SortByMostTaken")
            }, 
            {
                Key = "Favorites", 
                Text = l_Localization_0:getText("General", "SortByFavorites")
            }, 
            {
                Key = "Updated", 
                Text = l_Localization_0:getText("General", "SortByUpdated")
            }, 
            {
                Key = "Ratings", 
                Text = l_Localization_0:getText("General", "SortByRatings")
            }
        };
        local l_Key_0 = v61.sortsList[v61.state.SortIndex or v61.props.SortIndex].Key;
        local l_TAB_WIDGET_HEIGHT_0 = v7.TAB_WIDGET_HEIGHT;
        v61:resetLayout();
        local v76 = not l_getShouldHideNonRelevanceSorts_0();
        local v77 = v73 and not v72;
        local v78 = l_TAB_WIDGET_HEIGHT_0 + v7.HEADER_HEIGHT;
        local v79 = nil;
        v79 = if not v61.state.contentSize then UDim2.new(0, 0, 0, 0) else UDim2.new(0, v61.state.contentSize.X, 0, v61.state.contentSize.Y);
        local v80 = true;
        local v81 = UDim2.new(1, 0, 1, 0);
        if v61.containerRef.current then
            local v82 = v61.containerRef.current.AbsoluteSize.Y - (v78 + 40);
            local v83 = v79.Y.Offset + 42;
            if v83 < v82 then
                v81 = UDim2.new(1, 0, 0, v83);
                v80 = false;
            end;
        end;
        return v3.createElement("Frame", {
            BackgroundTransparency = 1
        }, {
            Portal = v3.createElement(l_ShowOnTop_0, {
                Priority = 2
            }, {
                ClickEventDetectFrame = v3.createElement("ImageButton", {
                    ZIndex = 10, 
                    Position = UDim2.new(0, 0, 0, 0), 
                    Size = UDim2.new(1, 0, 1, 0), 
                    BackgroundTransparency = 1, 
                    AutoButtonColor = false, 
                    [v3.Ref] = v61.containerRef, 
                    [v3.Event.Activated] = v61.cancel
                }, {
                    Main = v3.createElement("Frame", {
                        BackgroundTransparency = 1, 
                        AnchorPoint = Vector2.new(1, 0), 
                        Position = UDim2.new(1, -4, 0, v78 + 4), 
                        Size = UDim2.new(0, v7.TOOLBOX_MIN_WIDTH, 1, -((v78 + 8) + 42)), 
                        [v3.Ref] = v61.containerRef, 
                        [v3.Change.AbsoluteSize] = v61.updateContainerSize
                    }, {
                        Contents = v3.createElement("Frame", {
                            BackgroundColor3 = l_searchOptions_0.background, 
                            BorderColor3 = l_searchOptions_0.border, 
                            BackgroundTransparency = 0, 
                            Size = v81, 
                            [v3.Event.MouseEnter] = v61.mouseEnter, 
                            [v3.Event.MouseLeave] = v61.mouseLeave
                        }, {
                            Container = v3.createElement(l_ScrollingFrame_0, {
                                Position = UDim2.new(0, 0, 0, 0), 
                                Size = UDim2.new(1, 0, 1, -42), 
                                OnCanvasResize = v61.updateContentsSize, 
                                Layout = Enum.FillDirection.Vertical, 
                                AutoSizeCanvas = true, 
                                AutoSizeLayoutOptions = {
                                    SortOrder = Enum.SortOrder.LayoutOrder, 
                                    Padding = UDim.new(0, 10)
                                }
                            }, {
                                Padding = v3.createElement("UIPadding", {
                                    PaddingLeft = UDim.new(0, 10), 
                                    PaddingRight = UDim.new(0, 10), 
                                    PaddingTop = UDim.new(0, 10), 
                                    PaddingBottom = UDim.new(0, 10)
                                }), 
                                AllViews = v3.createElement(v27, {
                                    Header = l_Localization_0:getText("General", "SearchOptionsAllViews"), 
                                    LayoutOrder = v61:nextLayout()
                                }, {
                                    CheckboxAndDescriptionContainer = v3.createElement(l_Pane_0, {
                                        AutomaticSize = Enum.AutomaticSize.XY, 
                                        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                                        Layout = Enum.FillDirection.Vertical, 
                                        LayoutOrder = v61:nextLayout(), 
                                        Spacing = 3
                                    }, {
                                        IncludeUnverifiedToggle = v3.createElement(l_Checkbox_0, {
                                            Checked = l_state_0.includeUnverifiedCreators, 
                                            LayoutOrder = v61:nextLayout(), 
                                            OnClick = v61.onToggleIdVerified, 
                                            Text = v70, 
                                            TextWrapped = true
                                        }), 
                                        VerifiedDescriptionContainer = v3.createElement(l_Pane_0, {
                                            AutomaticSize = Enum.AutomaticSize.XY, 
                                            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                                            Layout = Enum.FillDirection.Horizontal, 
                                            LayoutOrder = v61:nextLayout(), 
                                            Padding = {
                                                Left = 24
                                            }, 
                                            Spacing = 6, 
                                            VerticalAlignment = Enum.VerticalAlignment.Top
                                        }, {
                                            Image = v3.createElement(l_Image_0, {
                                                AnchorPoint = Vector2.new(0, 0.5), 
                                                Image = v8.WARNING_ICON_SMALL, 
                                                ImageColor3 = l_searchOptions_0.warningIconColor, 
                                                LayoutOrder = v61:nextLayout(), 
                                                Size = UDim2.fromOffset(16, 16)
                                            }, {
                                                Tooltip = v3.createElement(l_Tooltip_0, {
                                                    Text = v71, 
                                                    Priority = 11
                                                })
                                            }), 
                                            VerifiedDescription = v3.createElement(l_TextLabel_0, {
                                                AutomaticSize = Enum.AutomaticSize.XY, 
                                                LayoutOrder = v61:nextLayout(), 
                                                Style = "SubText", 
                                                Text = v69, 
                                                TextSize = 14, 
                                                TextWrapped = true, 
                                                TextXAlignment = Enum.TextXAlignment.Left
                                            })
                                        })
                                    })
                                }), 
                                Separator = v61:createSeparator(l_searchOptions_0.separator), 
                                Creator = v73 and v3.createElement(v27, {
                                    LayoutOrder = v61:nextLayout(), 
                                    Header = l_Localization_0:getText("General", "SearchOptionCreator")
                                }, {
                                    SearchBar = v3.createElement(v16, {
                                        defaultTextKey = "SearchBarCreatorText", 
                                        searchTerm = l_LiveSearchData_0.searchTerm, 
                                        results = l_LiveSearchData_0.results, 
                                        updateSearch = v61.updateSearch, 
                                        width = v7.SEARCH_BAR_WIDTH
                                    })
                                }), 
                                Separator1 = v77 and v61:createSeparator(l_searchOptions_0.separator), 
                                AudioSearchHeader = v72 and v3.createElement(v27, {
                                    LayoutOrder = v61:nextLayout(), 
                                    Header = v68
                                }, {
                                    AudioSearch = v3.createElement(v26, {
                                        minDuration = l_minDuration_0, 
                                        maxDuration = l_maxDuration_0, 
                                        onDurationChange = v61.onDurationChange
                                    })
                                }), 
                                Separator2 = v72 and v61:createSeparator(l_searchOptions_0.separator), 
                                SortBy = v76 and v3.createElement(v27, {
                                    LayoutOrder = v61:nextLayout(), 
                                    Header = l_Localization_0:getText("General", "SearchOptionSort")
                                }, {
                                    RadioButtons = v3.createElement(l_RadioButtonList_0, {
                                        Buttons = v61.sortsList, 
                                        SelectedKey = l_Key_0, 
                                        OnClick = v61.selectSort
                                    })
                                }), 
                                ViewPadding = v76 and v3.createElement("Frame", {
                                    BackgroundTransparency = 1, 
                                    Size = UDim2.new(1, 0, 0, 10), 
                                    LayoutOrder = v61:nextLayout()
                                })
                            }), 
                            BottomButtonsContainer = v3.createElement("Frame", {
                                BackgroundTransparency = 1, 
                                Size = UDim2.new(1, 0, 0, 42), 
                                Position = UDim2.new(0, 0, 1, -42), 
                                ZIndex = 3
                            }, {
                                Padding = v3.createElement("UIPadding", {
                                    PaddingLeft = UDim.new(0, 10), 
                                    PaddingRight = UDim.new(0, 10)
                                }), 
                                GradientOverlay = v80 and v3.createElement("Frame", {
                                    LayoutOrder = v61:nextLayout(), 
                                    Size = UDim2.new(1, -8, 0, 20), 
                                    Position = UDim2.new(0, 0, 0, -20), 
                                    BackgroundColor3 = Color3.new(1, 1, 1), 
                                    BorderColor3 = Color3.new(1, 1, 1)
                                }, {
                                    Gradient = v3.createElement("UIGradient", {
                                        Color = ColorSequence.new(l_searchOptions_0.background), 
                                        Rotation = 90, 
                                        Transparency = NumberSequence.new({
                                            NumberSequenceKeypoint.new(0, 1), 
                                            NumberSequenceKeypoint.new(1, 0.25)
                                        })
                                    })
                                }), 
                                Separator = v3.createElement(l_Separator_0, {
                                    Position = UDim2.new(0.5, 0, 0, 0), 
                                    ZIndex = 2
                                }), 
                                Footer = v3.createElement(v28, {
                                    AnchorPoint = Vector2.new(0, 1), 
                                    Position = UDim2.new(0, 0, 1, -8), 
                                    onButtonClicked = v61.footerButtonClicked
                                })
                            })
                        })
                    })
                })
            })
        });
    end;
    return v4.connect(function(v84, _)
        v84 = v84 or {};
        local v86 = v84.pageInfo or {};
        local v87 = nil;
        if v84.liveSearch then
            v87 = {
                searchTerm = v84.liveSearch.searchTerm, 
                results = v84.liveSearch.results
            };
        end;
        return {
            audioSearchInfo = v86.audioSearchInfo, 
            includeUnverifiedCreators = v86.includeUnverifiedCreators, 
            categoryName = v86.categoryName or v34.DEFAULT.name, 
            LiveSearchData = v87, 
            SortIndex = v86.sortIndex or 1
        };
    end, function(v88)
        return {
            userSearch = function(v89, v90)
                v88(v32(v89, v90));
            end, 
            searchWithOptions = function(v91, v92, v93)
                v88(v31(v91, v92, v93));
            end
        };
    end)((l_withContext_0({
        Localization = l_ContextServices_0.Localization, 
        Settings = v13, 
        Stylizer = l_ContextServices_0.Stylizer, 
        Modal = v14, 
        Network = v15
    })(v36)));
else
    return nil;
end;
