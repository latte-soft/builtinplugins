local l_DevFrameworkDropdownMenuHeight_0 = game:GetFastFlag("DevFrameworkDropdownMenuHeight");
local l_Parent_0 = script.Parent.Parent.Parent;
local v2 = require(l_Parent_0.Packages.Roact);
local v3 = require(l_Parent_0.Packages.RoactRodux);
local l_StudioService_0 = game:GetService("StudioService");
local v5 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v5.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_map_0 = v5.Dash.map;
local v9 = require(l_Parent_0.Src.Resources.Constants);
local v10 = require(l_Parent_0.Src.Thunks.LoadExistingGames);
local v11 = require(l_Parent_0.Src.Thunks.LoadExistingPlaces);
local v12 = require(l_Parent_0.Src.Thunks.LoadGroups);
local _ = require(l_Parent_0.Src.Thunks.LoadGameConfiguration);
local v14 = require(l_Parent_0.Src.Actions.SetScreen);
local v15 = require(l_Parent_0.Src.Actions.SetSelectedGroup);
local v16 = require(l_Parent_0.Src.Components.Footer);
local v17 = require(l_Parent_0.Src.Components.TileGame);
local l_UI_0 = v5.UI;
local l_Button_0 = l_UI_0.Button;
local l_LoadingIndicator_0 = l_UI_0.LoadingIndicator;
local l_ScrollingFrame_0 = l_UI_0.ScrollingFrame;
local l_SearchBar_0 = l_UI_0.SearchBar;
local l_SelectInput_0 = l_UI_0.SelectInput;
local l_Separator_0 = l_UI_0.Separator;
local v25 = v2.PureComponent:extend("ScreenChooseGame");
local v26 = l_StudioService_0:getUserId();
local l_USER_0 = v9.SUBJECT_TYPE.USER;
local v28 = nil;
v25.init = function(v29)
    v29.state = {
        searchTerm = ""
    };
    v29.props.DispatchLoadExistingGames(l_USER_0, v26);
    v29.props.DispatchLoadGroups();
    v29.createContentForSelectInput = function(v30)
        return {
            Id = v30.Text, 
            Key = v30.Key, 
            Label = v30.Text, 
            Text = v30.Text, 
            Type = v30.Type
        };
    end;
    v29.onItemActivated = function(v31, _)
        if v31.Key ~= v26 then
            v26 = v31.Key;
            l_USER_0 = v31.Type;
            v28 = v31.Text;
            v29.props.DispatchLoadExistingGames(v31.Type, v31.Key);
            v29.props.DispatchSetSelectedGroup(v31.Key);
        end;
    end;
    v29.OnSearchRequested = function(v33)
        v29:setState({
            searchTerm = v33
        });
    end;
end;
v25.render = function(v34)
    local l_props_0 = v34.props;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local l_Localization_0 = l_props_0.Localization;
    local l_OnClose_0 = l_props_0.OnClose;
    local l_Games_0 = l_props_0.Games;
    local l_NextPageCursor_0 = l_props_0.NextPageCursor;
    local l_Groups_0 = l_props_0.Groups;
    local v42 = l_props_0.CurrentGameMinAge and l_props_0.CurrentGameMinAge >= 17;
    local l_DispatchLoadExistingGames_0 = l_props_0.DispatchLoadExistingGames;
    local l_OpenChoosePlacePage_0 = l_props_0.OpenChoosePlacePage;
    local v45 = {
        {
            Type = v9.SUBJECT_TYPE.USER, 
            Key = l_StudioService_0:getUserId(), 
            Text = l_Localization_0:getText("GroupDropdown", "MyGames")
        }
    };
    if l_Groups_0 and next(l_Groups_0) ~= nil then
        for _, v47 in pairs(l_Groups_0) do
            table.insert(v45, {
                Type = v9.SUBJECT_TYPE.GROUP, 
                Key = v47.groupId, 
                Text = v47.name
            });
        end;
    end;
    local v48 = v28 or v45[1].Text;
    local v49 = {
        v2.createElement("UIGridLayout", {
            CellSize = UDim2.new(0, l_Stylizer_0.SCREEN_CHOOSE_GAME.ICON_SIZE, 0, l_Stylizer_0.SCREEN_CHOOSE_GAME.TILE_HEIGHT), 
            CellPadding = UDim2.new(0, l_Stylizer_0.SCREEN_CHOOSE_GAME.CELL_PADDING_X, 0, l_Stylizer_0.SCREEN_CHOOSE_GAME.CELL_PADDING_Y), 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            [v2.Ref] = v34.layoutRef
        })
    };
    if l_props_0.GamesQueryState == v9.QUERY_STATE.QUERY_STATE_SUCCESS then
        for _, v51 in pairs(l_Games_0) do
            assert(v51.isUserEligible ~= nil);
            if not (not string.find(v51.name:lower(), v34.state.searchTerm:lower()) or not v51.isUserEligible) then
                v49[#v49 + 1] = v2.createElement(v17, {
                    Name = v51.name, 
                    Id = v51.rootPlaceId, 
                    PrivacyType = v51.privacyType, 
                    MinimumAge = v51.minimumAge, 
                    LayoutOrder = #v49 + 1, 
                    OnActivated = function()
                        l_OpenChoosePlacePage_0(v51, nil);
                    end
                });
            end;
        end;
    end;
    local v52 = (l_Stylizer_0.SCREEN_CHOOSE_GAME.ICON_SIZE + l_Stylizer_0.SCREEN_CHOOSE_GAME.TILE_FOOTER_SIZE) + l_Stylizer_0.SCREEN_CHOOSE_GAME.CELL_PADDING_Y;
    if not (((not (math.ceil((#v49 - 1) / 5) * v52 < 3 * v52) or not l_NextPageCursor_0) or not l_USER_0) or not v26) then
        l_DispatchLoadExistingGames_0(l_USER_0, v26, l_NextPageCursor_0);
    end;
    local v53 = l_Localization_0:getText("ScreenHeader", "ChooseGameNew");
    if v42 then
        v53 = v53 .. " " .. l_Localization_0:getText("ScreenHeader", "17PlusWarning");
    end;
    local l_createElement_0 = v2.createElement;
    local v55 = "Frame";
    local v56 = {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundColor3 = l_Stylizer_0.backgroundColor
    };
    local v57 = {
        ChooseGameText = v2.createElement("TextLabel", {
            Text = v53, 
            Position = UDim2.new(0, 30, 0, 25), 
            BackgroundTransparency = 1, 
            TextColor3 = l_Stylizer_0.header.text, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            Font = l_Stylizer_0.header.font, 
            TextSize = 18
        }), 
        Sep1 = v2.createElement(l_Separator_0, {
            Position = UDim2.new(0.5, 0, 0, 50)
        }), 
        SearchBar = v2.createElement("Frame", {
            Position = UDim2.new(0.6, 4, 0, 70), 
            Size = UDim2.new(0, l_Stylizer_0.DROPDOWN_WIDTH - 10, 0, l_Stylizer_0.DROPDOWN_HEIGHT), 
            BackgroundTransparency = 1
        }, {
            v2.createElement(l_SearchBar_0, {
                Size = UDim2.new(1, 0, 1, 0), 
                ShowSearchIcon = true, 
                ShowSearchButton = false, 
                IncrementalTextSearch = true, 
                OnSearchRequested = v34.OnSearchRequested
            })
        }), 
        GroupDropdownMenu = v2.createElement(l_SelectInput_0, {
            Items = l_map_0(v45, v34.createContentForSelectInput), 
            MenuHeight = if not l_DevFrameworkDropdownMenuHeight_0 then nil else 600, 
            OnItemActivated = v34.onItemActivated, 
            PlaceholderText = v48, 
            Position = UDim2.new(0, 30, 0, 70), 
            SelectedIndex = v26, 
            Size = UDim2.new(0, l_Stylizer_0.selectInput.width.creator, 0, l_Stylizer_0.selectInput.button.height), 
            Width = l_Stylizer_0.selectInput.width.creator
        })
    };
    local v58 = false;
    if l_props_0.GamesQueryState == v9.QUERY_STATE.QUERY_STATE_SUCCESS then
        v58 = v2.createElement(l_ScrollingFrame_0, {
            AutomaticCanvasSize = Enum.AutomaticSize.Y, 
            Position = UDim2.new(0, 30, 0, 115), 
            Size = UDim2.new(0.95, 0, 0.7, 0), 
            NextPageRequestDistance = 100, 
            NextPageFunc = function()
                if not ((not l_NextPageCursor_0 or not l_USER_0) or not v26) then
                    l_DispatchLoadExistingGames_0(l_USER_0, v26, l_NextPageCursor_0);
                end;
            end
        }, v49);
    end;
    v57.MainContentsSuccess = v58;
    v58 = false;
    if l_props_0.GamesQueryState == v9.QUERY_STATE.QUERY_STATE_QUERYING then
        v58 = v2.createElement("Frame", {
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
    v57.MainContentsQuerying = v58;
    v58 = false;
    if l_props_0.GamesQueryState == v9.QUERY_STATE.QUERY_STATE_FAILED then
        v58 = v2.createElement("Frame", {
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
                Position = UDim2.new(0.5, 0, 0, 100), 
                Size = UDim2.new(0, 150, 0, 75), 
                Style = "Round", 
                Text = l_Localization_0:getText("Button", "Retry"), 
                OnClick = function()
                    l_DispatchLoadExistingGames_0(l_USER_0, v26);
                end
            })
        });
    end;
    v57.MainContentsFailed = v58;
    v57.Footer = v2.createElement(v16, {
        MainButton = {
            Name = "Create", 
            Active = false
        }, 
        OnClose = l_OnClose_0, 
        NextScreen = v9.SCREENS.CREATE_NEW_GAME, 
        NextScreenText = "CreateNewGame"
    });
    return l_createElement_0(v55, v56, v57);
end;
v25.willUnmount = function(v59)
    for v60, _ in v59.props.Games, nil, nil do
        v59.props.Games[v60] = nil;
    end;
end;
return v3.connect(function(v62, _)
    local l_gameInfo_0 = v62.ExistingGame.gameInfo;
    return {
        NextPageCursor = l_gameInfo_0.nextPageCursor, 
        Games = l_gameInfo_0.games, 
        Groups = v62.GroupsHavePermission.groupInfo.groups, 
        GamesQueryState = l_gameInfo_0.queryState, 
        CurrentGameMinAge = l_gameInfo_0.minimumAge
    };
end, function(v65)
    return {
        DispatchLoadGroups = function()
            v65(v12());
        end, 
        DispatchLoadExistingGames = function(v66, v67, v68)
            v65(v10(v66, v67, v68));
        end, 
        OpenChoosePlacePage = function(v69, _)
            v65(v11(v69));
            v65(v14(v9.SCREENS.CHOOSE_PLACE));
        end, 
        DispatchSetSelectedGroup = function(v71)
            v65(v15(v71));
        end
    };
end)((l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer, 
    Localization = l_ContextServices_0.Localization, 
    API = l_ContextServices_0.API
})(v25)));
