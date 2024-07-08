local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.RoactRodux);
local v3 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_UI_0 = v3.UI;
local l_Button_0 = l_UI_0.Button;
local l_HoverArea_0 = l_UI_0.HoverArea;
local l_StyledDialog_0 = l_UI_0.StyledDialog;
local _ = l_UI_0.TextLabel;
local l_Util_0 = v3.Util;
local l_LayoutOrderIterator_0 = l_Util_0.LayoutOrderIterator;
local l_GetTextSize_0 = l_Util_0.GetTextSize;
local v14 = require(l_Parent_0.Src.Components.AssetGridContainer);
local v15 = require(l_Parent_0.Src.Components.AssetPreviewWrapper);
local v16 = require(l_Parent_0.Src.Components.ExplorerOverlay);
local v17 = require(l_Parent_0.Src.Components.NavBar);
local v18 = require(l_Parent_0.Src.Components.RecentlyImportedView);
local v19 = require(l_Parent_0.Src.Components.TopBar);
local v20 = require(l_Parent_0.Src.Util.Screens);
local v21 = require(l_Parent_0.Src.Thunks.LoadAllAliases);
local v22 = require(l_Parent_0.Src.Thunks.GetUniverseConfiguration);
local v23 = require(l_Parent_0.Src.Thunks.OnScreenChange);
local l_StudioPublishService_0 = game:GetService("StudioPublishService");
local l_MemStorageService_0 = game:GetService("MemStorageService");
local v26 = v1.PureComponent:extend("MainView");
local l_StudioAssetManagerAddRecentlyImportedView_0 = game:GetFastFlag("StudioAssetManagerAddRecentlyImportedView");
local v28 = false;
local v29 = require(l_Parent_0.Src.Util.ModernIcons);
local function v37(v30, v31, v32, v33)
    local v34 = v29.getIconForCurrentTheme(v29.IconEnums.BlankFolder);
    local l_Height_0 = v33.Height;
    local v36 = {
        text = v32:getText("Folders", v30.Path), 
        icon = {
            Image = v34, 
            Size = UDim2.new(0, l_Height_0, 0, l_Height_0), 
            ImageColor3 = v33.ColorIcon
        }, 
        Screen = v30.Path, 
        children = {}, 
        Parent = v31
    };
    if v31 then
        v31.children[v30.LayoutOrder] = v36;
    end;
end;
v26.init = function(v38)
    v38.state = {
        currentScreen = "", 
        showAssetPreview = false, 
        showOverlay = false, 
        showConfirmRemovePlaceDialog = false, 
        fileExplorerData = {
            text = "Game 1", 
            Screen = v20.MAIN.Path, 
            children = {}
        }
    };
    v38.gamePublishedConnection = nil;
    v38.openConfirmRemovePlaceDialog = function()
        v38:setState({
            showConfirmRemovePlaceDialog = true
        });
    end;
    v38.closeConfirmRemovePlaceDialog = function()
        v38:setState({
            showConfirmRemovePlaceDialog = false
        });
    end;
    v38.openOverlay = function()
        v38:setState({
            showOverlay = true
        });
    end;
    v38.closeOverlay = function()
        v38:setState({
            showOverlay = false
        });
    end;
    v38.closeAssetPreview = function()
        v38:setState({
            showAssetPreview = false, 
            assetPreview = nil
        });
    end;
    v38.openAssetPreview = function(v39, v40)
        if v40 then
            if type(v40) == "table" then
                v38:setState({
                    showAssetPreview = true, 
                    assetPreview = v1.createElement(v15, {
                        AssetPreviewData = v40, 
                        OnAssetPreviewClose = v38.closeAssetPreview, 
                        AssetData = v39
                    })
                });
                return ;
            else
                warn((v38.props.Localization:getText("MainView", "AssetPreviewError")));
                return ;
            end;
        else
            return ;
        end;
    end;
end;
v26.didMount = function(v41)
    if game.GameId ~= 0 then
        v41.props.dispatchGetUniverseConfiguration(v41.props.API:get());
    end;
    v41.gamePublishedConnection = l_StudioPublishService_0.GamePublishFinished:connect(function()
        v41.props.dispatchGetUniverseConfiguration(v41.props.API:get());
    end);
end;
v26.willUnmount = function(v42)
    if v42.gamePublishedConnection then
        v42.gamePublishedConnection:disconnect();
    end;
end;
v26.didUpdate = function(v43)
    local l_props_0 = v43.props;
    local l_Localization_0 = l_props_0.Localization;
    for _, v47 in pairs(v20) do
        if v47.Path ~= v20.MAIN.Path then
            v37(v47, v43.state.fileExplorerData, l_Localization_0, l_props_0.Stylizer.TreeViewItem);
        end;
    end;
    local v48 = l_props_0.API:get();
    local l_CurrentScreen_0 = l_props_0.CurrentScreen;
    if l_CurrentScreen_0 ~= v43.state.currentScreen then
        l_props_0.dispatchOnScreenChange(v48, l_CurrentScreen_0);
        v43:setState({
            currentScreen = l_CurrentScreen_0
        });
    end;
end;
v26.render = function(v50)
    local l_props_1 = v50.props;
    local l_Stylizer_0 = l_props_1.Stylizer;
    local l_Localization_1 = l_props_1.Localization;
    local l_UniverseName_0 = l_props_1.UniverseName;
    local v55 = l_LayoutOrderIterator_0.new();
    v50.state.fileExplorerData.text = l_UniverseName_0;
    if not (not (l_UniverseName_0 ~= "") or v28) then
        v28 = true;
    end;
    local v56 = game.GameId ~= 0;
    local v57 = l_Localization_1:getText("MainView", "SaveText");
    local v58 = l_GetTextSize_0(v57, l_Stylizer_0.FontSizeLarge, l_Stylizer_0.Font, Vector2.new(l_Stylizer_0.MainView.PublishText.Width, math.huge));
    local v59 = l_Localization_1:getText("MainView", "ButtonText");
    v59 = l_Localization_1:getText("MainView", "SaveToRobloxButtonText");
    local v60 = l_GetTextSize_0(v59, l_Stylizer_0.FontSizeLarge, l_Stylizer_0.Font);
    local l_RecentViewToggled_0 = l_props_1.RecentViewToggled;
    local v62 = next(l_props_1.RecentAssets) ~= nil;
    local v63 = (l_Stylizer_0.TopBar.Height + l_Stylizer_0.NavBar.Height) + (not not v62 and l_Stylizer_0.RecentView.Bar.Height or 0);
    local v64 = l_Stylizer_0.TopBar.Height + l_Stylizer_0.NavBar.Height;
    local v65 = not v50.state.showOverlay and not v50.state.showAssetPreview;
    return v1.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        Position = UDim2.new(0, 0, 0, 0), 
        BackgroundTransparency = 0, 
        BackgroundColor3 = l_Stylizer_0.BackgroundColor
    }, {
        UseText = not v56 and v1.createElement("TextLabel", {
            Size = UDim2.new(0, v58.X, 0, v58.Y), 
            Position = UDim2.new(0.5, 0, 0, l_Stylizer_0.MainView.PublishText.Offset), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            LayoutOrder = v55:getNextOrder(), 
            BackgroundTransparency = 1, 
            Font = l_Stylizer_0.Font, 
            Text = v57, 
            TextColor3 = l_Stylizer_0.TextColor, 
            TextSize = l_Stylizer_0.FontSizeLarge, 
            TextXAlignment = Enum.TextXAlignment.Center, 
            TextWrapped = true
        }), 
        PublishButton = not v56 and v1.createElement(l_Button_0, {
            Style = "RoundPrimary", 
            Text = v59, 
            Size = UDim2.new(0, v60.X + l_Stylizer_0.MainView.PublishButton.PaddingX, 0, v60.Y + l_Stylizer_0.MainView.PublishButton.PaddingY), 
            Position = UDim2.new(0.5, 0, 0, l_Stylizer_0.MainView.PublishButton.Offset), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            LayoutOrder = v55:getNextOrder(), 
            OnClick = function()
                l_StudioPublishService_0:ShowSaveOrPublishPlaceToRoblox(false, false, Enum.StudioCloseMode.None);
            end
        }, {
            v1.createElement(l_HoverArea_0, {
                Cursor = "PointingHand"
            })
        }), 
        MainViewLayout = v56 and v1.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            VerticalAlignment = Enum.VerticalAlignment.Top
        }), 
        ExplorerOverlay = (v56 and v50.state.showOverlay) and v1.createElement(v16, {
            FileExplorerData = {
                v50.state.fileExplorerData
            }, 
            CloseOverlay = v50.closeOverlay
        }), 
        AssetPreview = (v56 and v50.state.showAssetPreview) and v50.state.assetPreview, 
        TopBar = v56 and v1.createElement(v19, {
            Size = UDim2.new(1, 0, 0, l_Stylizer_0.TopBar.Button.Size), 
            LayoutOrder = v55:getNextOrder(), 
            OnOverlayActivated = v50.openOverlay, 
            Enabled = not v50.state.showOverlay
        }), 
        NavBar = v56 and v1.createElement(v17, {
            Size = UDim2.new(1, 0, 0, l_Stylizer_0.NavBar.Height), 
            LayoutOrder = v55:getNextOrder()
        }), 
        AssetGridView = (not l_StudioAssetManagerAddRecentlyImportedView_0 and v56) and v1.createElement(v14, {
            Size = UDim2.new(1, 0, 1, -l_Stylizer_0.TopBar.Button.Size - l_Stylizer_0.NavBar.Height), 
            LayoutOrder = v55:getNextOrder(), 
            OnOpenAssetPreview = v50.openAssetPreview, 
            OnAssetPreviewClose = v50.closeAssetPreview, 
            Enabled = v65
        }), 
        RecentsAssetGridView = ((l_StudioAssetManagerAddRecentlyImportedView_0 and v56) and not l_RecentViewToggled_0) and v1.createElement(v14, {
            Size = UDim2.new(1, 0, 1, -v63), 
            LayoutOrder = v55:getNextOrder(), 
            OnOpenAssetPreview = v50.openAssetPreview, 
            OnAssetPreviewClose = v50.closeAssetPreview, 
            OnOpenConfirmRemovePlaceDialog = v50.openConfirmRemovePlaceDialog, 
            Enabled = v65
        }), 
        RecentlyImportedView = (l_StudioAssetManagerAddRecentlyImportedView_0 and v62) and v1.createElement(v18, {
            Size = UDim2.new(1, 0, not l_RecentViewToggled_0 and 0 or 1, not not l_RecentViewToggled_0 and -v64 or l_Stylizer_0.RecentView.Bar.Height), 
            LayoutOrder = v55:getNextOrder(), 
            Enabled = not v50.state.showOverlay
        }), 
        ConfirmRemovePlaceDialog = v1.createElement(l_StyledDialog_0, {
            Style = "Alert", 
            Enabled = v50.state.showConfirmRemovePlaceDialog, 
            Title = "", 
            MinContentSize = l_Stylizer_0.MainView.ConfirmRemovePlaceDialogSize, 
            Buttons = {
                {
                    Key = "Confirm", 
                    Text = l_Localization_1:getText("MainView", "ConfirmText")
                }, 
                {
                    Key = "Cancel", 
                    Text = l_Localization_1:getText("MainView", "CancelText")
                }
            }, 
            OnButtonPressed = function(v66)
                if v66 == "Confirm" then
                    l_MemStorageService_0:Fire("RemovePlaceConfirmed");
                end;
                v50.closeConfirmRemovePlaceDialog();
            end, 
            OnClose = function()
                v50.closeConfirmRemovePlaceDialog();
            end
        }, {
            Contents = v1.createElement("TextLabel", {
                BackgroundTransparency = 1, 
                Position = UDim2.fromScale(0, 0), 
                Size = UDim2.fromScale(1, 1), 
                Font = l_Stylizer_0.Font, 
                Text = l_Localization_1:getText("MainView", "ConfirmRemovePlaceText"), 
                TextColor3 = l_Stylizer_0.TextColor, 
                TextSize = l_Stylizer_0.FontSizeLarge, 
                TextXAlignment = Enum.TextXAlignment.Center, 
                TextWrapped = true
            })
        })
    });
end;
return v2.connect(function(v67, _)
    local l_AssetManagerReducer_0 = v67.AssetManagerReducer;
    return {
        AssetsTable = l_AssetManagerReducer_0.assetsTable, 
        CurrentScreen = v67.Screen.currentScreen, 
        UniverseName = l_AssetManagerReducer_0.universeName, 
        RecentAssets = l_AssetManagerReducer_0.recentAssets, 
        RecentViewToggled = l_AssetManagerReducer_0.recentViewToggled
    };
end, function(v70)
    return {
        dispatchLoadAllAliases = function(v71, v72)
            v70(v21(v71, v72));
        end, 
        dispatchGetUniverseConfiguration = function(v73)
            v70(v22(v73));
        end, 
        dispatchOnScreenChange = function(v74, v75)
            v70(v23(v74, v75));
        end
    };
end)((l_withContext_0({
    API = l_ContextServices_0.API, 
    Stylizer = l_ContextServices_0.Stylizer, 
    Localization = l_ContextServices_0.Localization
})(v26)));
