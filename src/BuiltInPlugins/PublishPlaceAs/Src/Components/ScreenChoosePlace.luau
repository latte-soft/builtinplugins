local l_StudioPublishService_0 = game:GetService("StudioPublishService");
local l_Parent_0 = script.Parent.Parent.Parent;
local v2 = require(l_Parent_0.Packages.Roact);
local v3 = require(l_Parent_0.Packages.RoactRodux);
local v4 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v4.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v7 = require(l_Parent_0.Src.Resources.Constants);
local l_UI_0 = v4.UI;
local l_Button_0 = l_UI_0.Button;
local l_ScrollingFrame_0 = l_UI_0.ScrollingFrame;
local l_LoadingIndicator_0 = l_UI_0.LoadingIndicator;
local l_UI_1 = v4.UI;
local l_SearchBar_0 = l_UI_1.SearchBar;
local l_Separator_0 = l_UI_1.Separator;
local v15 = require(l_Parent_0.Src.Actions.SetIsPublishing);
local v16 = require(l_Parent_0.Src.Actions.SetScreen);
local v17 = require(l_Parent_0.Src.Actions.SetPlaceInfo);
local v18 = require(l_Parent_0.Src.Actions.SetPublishInfo);
local v19 = require(l_Parent_0.Src.Actions.SetPublishInProgress);
local v20 = require(l_Parent_0.Src.Thunks.LoadExistingPlaces);
local v21 = require(l_Parent_0.Src.Components.Footer);
local v22 = require(l_Parent_0.Src.Components.TilePlace);
local _ = require(l_Parent_0.Src.Util.PublishPlaceAsUtilities).shouldShowDevPublishLocations;
local _ = require(l_Parent_0.Src.Util.PublishPlaceAsUtilities).getIsOptInChina;
local v25 = v2.PureComponent:extend("ScreenChoosePlace");
local l_StudioUsePublishInProgressScreen2_0 = game:GetFastFlag("StudioUsePublishInProgressScreen2");
v25.init = function(v27)
    v27.state = {
        searchTerm = ""
    };
    v27.finishedConnection = nil;
    v27.layoutRef = v2.createRef();
    v27.OnSearchRequested = function(v28)
        v27:setState({
            searchTerm = v28
        });
    end;
end;
v25.didMount = function(v29)
    v29.finishedConnection = l_StudioPublishService_0.GamePublishFinished:connect(function(v30, _, v32)
        if v29.state.selectedPlace == nil then
            return ;
        elseif not v30 then
            v29.props.OpenPublishFailPage(v29.state.selectedPlace, v29.props.ParentGame, v32);
            return ;
        else
            v29.props.OpenPublishSuccessfulPage(v29.state.selectedPlace, v29.props.ParentGame);
            return ;
        end;
    end);
end;
v25.willUnmount = function(v33)
    for v34, _ in pairs(v33.props.Places) do
        v33.props.Places[v34] = nil;
    end;
    if v33.finishedConnection then
        v33.finishedConnection:disconnect();
    end;
end;
v25.render = function(v36)
    local l_props_0 = v36.props;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local l_Localization_0 = l_props_0.Localization;
    local l_OnClose_0 = l_props_0.OnClose;
    local l_NextPageCursor_0 = l_props_0.NextPageCursor;
    local l_Places_0 = l_props_0.Places;
    local l_ParentGame_0 = l_props_0.ParentGame;
    local l_IsPublishing_0 = l_props_0.IsPublishing;
    local l_SourceGameMinAge_0 = l_props_0.SourceGameMinAge;
    if l_SourceGameMinAge_0 then
        l_SourceGameMinAge_0 = false;
        if l_props_0.SourceGameMinAge >= 17 then
            l_SourceGameMinAge_0 = l_props_0.ParentGame.minimumAge and l_props_0.ParentGame.minimumAge < 17;
        end;
    end;
    local l_DispatchLoadExistingPlaces_0 = l_props_0.DispatchLoadExistingPlaces;
    local l_dispatchSetIsPublishing_0 = l_props_0.dispatchSetIsPublishing;
    local l_OpenChooseGamePage_0 = l_props_0.OpenChooseGamePage;
    local l_OpenPublishInProgressPage_0 = l_props_0.OpenPublishInProgressPage;
    local v50 = false;
    if v36.state.selectedPlace ~= nil then
        v50 = v36.state.selectedPlace.placeId == 0;
    end;
    local v51 = l_Localization_0:getText("ScreenHeader", "ChoosePlace", {
        not not l_ParentGame_0 and l_ParentGame_0.name or ""
    });
    local v52 = l_Localization_0:getText("General", "UntitledGame");
    local v53 = {
        v2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            VerticalAlignment = Enum.VerticalAlignment.Top, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, 0), 
            [v2.Ref] = v36.layoutRef
        })
    };
    if l_props_0.PlacesQueryState == v7.QUERY_STATE.QUERY_STATE_SUCCESS then
        for _, v55 in pairs(l_Places_0) do
            if string.find(v55.name:lower(), v36.state.searchTerm:lower()) then
                local l_createElement_0 = v2.createElement;
                local l_v22_0 = v22;
                local v58 = {
                    Name = v55.name, 
                    Id = v55.placeId, 
                    LayoutOrder = #v53 + 1
                };
                local v59 = false;
                if v36.state.selectedPlace ~= nil then
                    v59 = v36.state.selectedPlace.placeId == v55.placeId;
                end;
                v58.Selected = v59;
                v58.LastItem = false;
                v58.OnActivated = function()
                    v36:setState({
                        selectedPlace = v55
                    });
                end;
                v53[#v53 + 1] = l_createElement_0(l_v22_0, v58);
            end;
        end;
        v53[0] = v2.createElement(v22, {
            Name = l_Localization_0:getText("Button", "AddNewPlaceToGame"), 
            LayoutOrder = 1, 
            Selected = v50, 
            OnActivated = function()
                v36:setState({
                    selectedPlace = {
                        placeId = 0, 
                        name = v52
                    }
                });
            end
        });
    end;
    local v60 = not v50 and "Overwrite" or "Create";
    local _ = 200;
    if not (not ((not not v53 and math.ceil(#v53 * 80) or 200) < 560) or not l_NextPageCursor_0) then
        l_DispatchLoadExistingPlaces_0(l_ParentGame_0, l_NextPageCursor_0);
    end;
    local l_createElement_1 = v2.createElement;
    local v63 = "Frame";
    local v64 = {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundColor3 = l_Stylizer_0.backgroundColor, 
        BorderSizePixel = 0
    };
    local v65 = {
        Back = v2.createElement("ImageButton", {
            Image = l_Stylizer_0.icons.backArrow, 
            Size = UDim2.new(0, 20, 0, 20), 
            Position = UDim2.new(0, 30, 0, 10), 
            Style = 0, 
            BorderSizePixel = 0, 
            BackgroundTransparency = 1, 
            [v2.Event.Activated] = function()
                l_OpenChooseGamePage_0();
            end
        }), 
        Sep1 = v2.createElement(l_Separator_0, {
            Position = UDim2.new(0.5, 0, 0, 50)
        }), 
        Header = v2.createElement("TextLabel", {
            Text = v51, 
            Position = UDim2.new(0, 30, 0, 80), 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextSize = 20, 
            BackgroundTransparency = 1, 
            Font = l_Stylizer_0.header.font, 
            TextColor3 = l_Stylizer_0.textColor
        }), 
        Warning17PlusFrame = if not l_SourceGameMinAge_0 then nil else v2.createElement("Frame", {
            Position = UDim2.new(0, 30, 0, 105), 
            Size = UDim2.new(1, 0, 0, 20), 
            BackgroundTransparency = 1
        }, {
            WarningIcon = v2.createElement("ImageLabel", {
                Size = UDim2.fromOffset(20, 20), 
                AnchorPoint = Vector2.new(0, 0.5), 
                Image = l_Stylizer_0.icons.warning, 
                BackgroundTransparency = 1
            }), 
            WarningText = v2.createElement("TextLabel", {
                Position = UDim2.fromOffset(25, 0), 
                Text = l_Localization_0:getText("ScreenHeader", "17PlusWarning"), 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextSize = 20, 
                BackgroundTransparency = 1, 
                Font = l_Stylizer_0.header.font, 
                TextColor3 = l_Stylizer_0.warningTextColor
            })
        }), 
        SearchBar = v2.createElement("Frame", {
            Position = UDim2.new(0.7, 4, 0, 62), 
            Size = UDim2.new(0, l_Stylizer_0.DROPDOWN_WIDTH + 20, 0, l_Stylizer_0.DROPDOWN_HEIGHT), 
            BackgroundTransparency = 1
        }, {
            v2.createElement(l_SearchBar_0, {
                Size = UDim2.new(0.7, 0, 1, 0), 
                ShowSearchIcon = true, 
                ShowSearchButton = false, 
                IncrementalTextSearch = true, 
                OnSearchRequested = v36.OnSearchRequested
            })
        })
    };
    local v66 = false;
    if l_props_0.PlacesQueryState == v7.QUERY_STATE.QUERY_STATE_SUCCESS then
        v66 = v2.createElement(l_ScrollingFrame_0, {
            AutomaticCanvasSize = Enum.AutomaticSize.Y, 
            Size = UDim2.new(1, 0, 0.5, l_Stylizer_0.FOOTER_HEIGHT * 2), 
            Position = UDim2.new(0, 0, 0, 135), 
            NextPageRequestDistance = 100, 
            NextPageFunc = function()
                if l_NextPageCursor_0 then
                    l_DispatchLoadExistingPlaces_0(l_ParentGame_0, l_NextPageCursor_0);
                end;
            end
        }, v53);
    end;
    v65.MainContentsSuccess = v66;
    v66 = false;
    if l_props_0.PlacesQueryState == v7.QUERY_STATE.QUERY_STATE_QUERYING then
        v66 = v2.createElement("Frame", {
            Position = UDim2.new(0, 30, 0, 115), 
            Size = UDim2.new(0.95, 0, 0.7, 0), 
            BackgroundColor3 = l_Stylizer_0.backgroundColor
        }, {
            v2.createElement(l_LoadingIndicator_0, {
                Position = UDim2.new(0.5, -100, 0, 115), 
                Size = UDim2.new(0, 200, 0, 50)
            })
        });
    end;
    v65.MainContentsQuerying = v66;
    v66 = false;
    if l_props_0.PlacesQueryState == v7.QUERY_STATE.QUERY_STATE_FAILED then
        v66 = v2.createElement("Frame", {
            Position = UDim2.new(0, 30, 0, 115), 
            Size = UDim2.new(0.95, 0, 0.7, 0), 
            BackgroundColor3 = l_Stylizer_0.backgroundColor
        }, {
            v2.createElement("TextLabel", {
                Text = l_Localization_0:getText("General", "FetchFailed"), 
                Position = UDim2.new(0.5, 0, 0, 50), 
                TextSize = 24, 
                BackgroundTransparency = 1, 
                TextXAlignment = Enum.TextXAlignment.Center, 
                TextColor3 = l_Stylizer_0.failText.text, 
                Font = l_Stylizer_0.failText.font
            }), 
            v2.createElement(l_Button_0, {
                AnchorPoint = Vector2.new(0.5, 0.5), 
                OnClick = function()
                    l_DispatchLoadExistingPlaces_0(l_ParentGame_0);
                end, 
                Position = UDim2.new(0.5, 0, 0, 100), 
                Size = UDim2.new(0, 150, 0, 75), 
                Style = "Round", 
                Text = l_Localization_0:getText("Button", "Retry")
            })
        });
    end;
    v65.MainContentsFailed = v66;
    v66 = v2.createElement;
    local l_v21_0 = v21;
    local v68 = {};
    local v69 = {
        Name = v60
    };
    local l_l_ParentGame_0_0 = l_ParentGame_0;
    if l_l_ParentGame_0_0 then
        l_l_ParentGame_0_0 = false;
        if v36.state.selectedPlace ~= nil then
            l_l_ParentGame_0_0 = not l_IsPublishing_0;
        end;
    end;
    v69.Active = l_l_ParentGame_0_0;
    v69.OnActivated = function()
        if l_StudioUsePublishInProgressScreen2_0 and v36.state.selectedPlace.placeId ~= 0 then
            l_OpenPublishInProgressPage_0(l_ParentGame_0, v36.state.selectedPlace, l_props_0.IsPublish);
            return ;
        else
            game:GetService("StudioPublishService"):SetTeamCreateOnPublishInfo(false, "");
            if v36.state.selectedPlace.placeId == 0 then
                l_StudioPublishService_0:setUploadNames("New Place", l_ParentGame_0.name);
            else
                l_StudioPublishService_0:setUploadNames(v36.state.selectedPlace.name, l_ParentGame_0.name);
            end;
            l_StudioPublishService_0:publishAs(l_ParentGame_0.universeId, v36.state.selectedPlace.placeId, 0, l_props_0.IsPublish, nil);
            l_dispatchSetIsPublishing_0(true);
            return ;
        end;
    end;
    v68.MainButton = v69;
    v68.OnClose = l_OnClose_0;
    v65.Footer = v66(l_v21_0, v68);
    return l_createElement_1(v63, v64, v65);
end;
return v3.connect(function(v71, _)
    local l_placeInfo_0 = v71.ExistingGame.placeInfo;
    local l_selectedGame_0 = v71.ExistingGame.selectedGame;
    local _ = v71.ExistingGame.gameConfiguration;
    return {
        NextPageCursor = l_placeInfo_0.nextPageCursor, 
        Places = l_placeInfo_0.places, 
        ParentGame = l_selectedGame_0, 
        IsPublishing = v71.PublishedPlace.isPublishing, 
        PlacesQueryState = l_placeInfo_0.queryState, 
        SourceGameMinAge = v71.ExistingGame.gameInfo.minimumAge
    };
end, function(v76)
    return {
        DispatchLoadExistingPlaces = function(v77, v78)
            v76(v20(v77, v78));
        end, 
        dispatchSetIsPublishing = function(v79)
            v76(v15(v79));
        end, 
        OpenChooseGamePage = function()
            v76(v17({
                places = {}
            }));
            v76(v16(v7.SCREENS.CHOOSE_GAME));
        end, 
        OpenPublishInProgressPage = function(v80, v81, v82)
            v76(v19({
                universe = v80, 
                place = v81, 
                isPublish = v82, 
                failCount = 0, 
                requestInFlight = false
            }));
            v76(v16(v7.SCREENS.PUBLISH_IN_PROGRESS));
        end, 
        OpenPublishSuccessfulPage = function(v83, v84)
            v76(v18({
                id = v84.universeId, 
                name = v83.name, 
                parentGameName = v84.name
            }));
            v76(v16(v7.SCREENS.PUBLISH_SUCCESSFUL));
        end, 
        OpenPublishFailPage = function(v85, v86, v87)
            v76(v18({
                id = v85.placeId, 
                name = v85.name, 
                parentGameName = v86.name, 
                parentGameId = v86.universeId, 
                failed = true, 
                message = v87
            }));
            v76(v16(v7.SCREENS.PUBLISH_FAIL));
        end, 
        ClearPlaces = function()
            v76(v17({
                places = {}
            }));
        end
    };
end)((l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer, 
    Localization = l_ContextServices_0.Localization
})(v25)));
