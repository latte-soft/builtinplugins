local l_EnableStudioServiceOpenBrowser_0 = game:GetFastFlag("EnableStudioServiceOpenBrowser");
local v1 = game:getService("StudioService");
local v2 = game:getService("ContentProvider");
local l_PluginPolicyService_0 = game:GetService("PluginPolicyService");
local v4 = game:getService("GuiService");
local v5 = game:getService("HttpService");
local l_TextService_0 = game:GetService("TextService");
local l_Parent_0 = script.Parent.Parent.Parent;
local v8 = require(l_Parent_0.Packages.Roact);
local v9 = require(l_Parent_0.Packages.RoactRodux);
local v10 = require(l_Parent_0.Src.Util.Constants);
local v11 = require(l_Parent_0.Src.Util.UpdateStatus);
local l_ContextServices_0 = require(l_Parent_0.Packages.Framework).ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v14 = require(l_Parent_0.Src.ContextServices.PluginAPI2);
local v15 = require(l_Parent_0.Src.ContextServices.Navigation);
local v16 = require(l_Parent_0.Src.Thunks.SetPluginEnabledState);
local v17 = require(l_Parent_0.Src.Thunks.UpdatePlugin);
local l_UI_0 = require(l_Parent_0.Packages.Framework).UI;
local l_Button_0 = l_UI_0.Button;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_DropdownMenu_0 = l_UI_0.DropdownMenu;
local l_ToggleButton_0 = l_UI_0.ToggleButton;
local l_FakeLoadingBar_0 = l_UI_0.FakeLoadingBar;
local v24 = require(l_Parent_0.Src.Actions.RemovePluginData);
local v25 = require(l_Parent_0.Src.Components.HttpRequestOverview);
local v26 = require(l_Parent_0.Src.Components.UpdateOverview);
local v27 = UDim2.new(0, 120, 0, 8);
local function _(v28, v29, v30, v31)
    return l_TextService_0:GetTextSize(v28, v29, v30, Vector2.new(v31, 10000)).Y;
end;
local l_Y_0 = l_TextService_0:GetTextSize("a", 16, Enum.Font.SourceSans, Vector2.new(9999, 10000)).Y;
local v34 = v8.Component:extend("PluginEntry");
v34.init = function(v35)
    v35.state = {
        showSuccessMessage = false, 
        showMore = false
    };
    v35.getMoreItems = function()
        local l_Localization_0 = v35.props.Localization;
        return {
            {
                Key = "Details", 
                Text = l_Localization_0:getText("EntrySeeMore", "DetailsButton")
            }, 
            {
                Key = "Remove", 
                Text = l_Localization_0:getText("EntrySeeMore", "RemoveButton")
            }
        };
    end;
    v35.onPluginEnabled = function()
        local l_props_0 = v35.props;
        l_props_0.onPluginSetEnabledState(l_props_0.data, true);
    end;
    v35.onPluginDisabled = function()
        v35.props.onPluginSetEnabledState(v35.props.data, false);
    end;
    v35.showDetails = function()
        local l_assetId_0 = v35.props.data.assetId;
        local l_BaseUrl_0 = v2.BaseUrl;
        local l_CreatorMarketplaceWebUrl_0 = l_PluginPolicyService_0:getPluginPolicy("Toolbox").CreatorMarketplaceWebUrl;
        local v41 = if not l_CreatorMarketplaceWebUrl_0 then string.format("%s/library/%s/asset", l_BaseUrl_0, v5:urlEncode(l_assetId_0)) else string.format("%sasset/%s", l_CreatorMarketplaceWebUrl_0, v5:urlEncode(l_assetId_0));
        if not l_EnableStudioServiceOpenBrowser_0 then
            v4:OpenBrowserWindow(v41);
            return ;
        else
            v1:OpenInBrowser_DONOTUSE(v41);
            return ;
        end;
    end;
    v35.uninstallPlugin = function()
        v35.props.removePluginData(v35.props.data.assetId);
        v1:UninstallPlugin(v35.props.data.assetId);
        wait();
        v35.props.onPluginUninstalled();
    end;
    v35.onShowMoreActivated = function()
        v35:setState({
            showMore = true
        });
    end;
    v35.hideShowMore = function()
        v35:setState({
            showMore = false
        });
    end;
    v35.moreItemClicked = function(v42)
        v35.hideShowMore();
        if v42.Key == "Details" then
            v35.showDetails();
            return ;
        else
            if v42.Key == "Remove" then
                v35.uninstallPlugin();
            end;
            return ;
        end;
    end;
    v35.updatePlugin = function()
        local l_props_1 = v35.props;
        l_props_1.Analytics:report("TryUpdatePlugin", l_props_1.data.assetId);
        l_props_1.UpdatePlugin(l_props_1.data, l_props_1.Analytics);
    end;
    v35.openCreatorProfile = function()
        local l_data_0 = v35.props.data;
        local v45 = string.format("%susers/%d/profile", v2.BaseUrl, v5:urlEncode(l_data_0.creator and l_data_0.creator.Id));
        if not l_EnableStudioServiceOpenBrowser_0 then
            v4:OpenBrowserWindow(v45);
            return ;
        else
            v1:OpenInBrowser_DONOTUSE(v45);
            return ;
        end;
    end;
    v35.openPluginDetails = function()
        v35.props.Navigation:get().navigation.navigate({
            routeName = v10.APP_PAGE.Detail, 
            params = {
                assetId = v35.props.data.assetId
            }
        });
    end;
    v35.onToggleClick = function()
        local l_data_1 = v35.props.data;
        local l_isModerated_0 = l_data_1.isModerated;
        if not (not l_isModerated_0 and l_data_1.enabled) then
            if not l_isModerated_0 then
                v35.onPluginEnabled();
            end;
            return ;
        else
            v35.onPluginDisabled();
            return ;
        end;
    end;
end;
v34.getDerivedStateFromProps = function(v48, _)
    if v48.data.status == v11.Success then
        return {
            showSuccessMessage = true
        };
    elseif v48.isUpdated then
        return nil;
    else
        return {
            showSuccessMessage = false
        };
    end;
end;
v34.render = function(v50)
    local l_props_2 = v50.props;
    local l_state_0 = v50.state;
    local l_data_2 = l_props_2.data;
    local l_allowedHttpCount_0 = l_props_2.allowedHttpCount;
    local l_deniedHttpCount_0 = l_props_2.deniedHttpCount;
    local l_allowedScriptInjection_0 = l_props_2.allowedScriptInjection;
    local l_showMore_0 = l_state_0.showMore;
    local l_plugin_0 = l_props_2.plugin;
    local l_Localization_1 = l_props_2.Localization;
    local l_Stylizer_0 = l_props_2.Stylizer;
    local v61 = l_props_2.API:get();
    local l_LayoutOrder_0 = l_props_2.LayoutOrder;
    local l_isUpdated_0 = l_props_2.isUpdated;
    local l_isModerated_1 = l_data_2.isModerated;
    local l_status_0 = l_data_2.status;
    local l_assetId_1 = l_data_2.assetId;
    local v67 = not l_isModerated_1 and l_data_2.enabled;
    local v68 = l_data_2.name or "";
    local v69 = l_data_2.description or "";
    local v70 = not not l_data_2.creator and l_data_2.creator.Name or "";
    local v71 = v61.Images.AssetThumbnailUrl(l_assetId_1);
    local v72 = (not l_isModerated_1 and not l_isUpdated_0) and l_status_0 ~= v11.Updating;
    local v73 = UDim2.new(1, (v10.PLUGIN_HORIZONTAL_PADDING * -3 - v10.PLUGIN_ENABLE_WIDTH) - v10.PLUGIN_CONTEXT_WIDTH, 0.5, 0);
    local v74 = true;
    if l_allowedHttpCount_0 <= 0 then
        v74 = l_deniedHttpCount_0 > 0;
    end;
    local _ = v74 or l_allowedScriptInjection_0 ~= nil;
    local l_createElement_0 = v8.createElement;
    local v77 = "Frame";
    local v78 = {
        BackgroundColor3 = l_Stylizer_0.BackgroundColor, 
        BorderSizePixel = 0, 
        LayoutOrder = l_LayoutOrder_0, 
        Size = UDim2.new(1, v10.SCROLLBAR_WIDTH_ADJUSTMENT, 0, v10.PLUGIN_ENTRY_HEIGHT)
    };
    local v79 = {
        Padding = v8.createElement("UIPadding", {
            PaddingTop = UDim.new(0, v10.PLUGIN_ENTRY_PADDING), 
            PaddingBottom = UDim.new(0, v10.PLUGIN_ENTRY_PADDING)
        }), 
        Thumbnail = v8.createElement("ImageLabel", {
            Size = UDim2.new(0, v10.THUMBNAIL_SIZE, 0, v10.THUMBNAIL_SIZE), 
            Position = UDim2.new(0, v10.PLUGIN_HORIZONTAL_PADDING, 0, v10.PLUGIN_VERTICAL_PADDING), 
            Image = v71, 
            BackgroundTransparency = 1
        }), 
        Contents = v8.createElement("Frame", {
            BackgroundTransparency = 1, 
            Position = UDim2.new(0, v10.THUMBNAIL_SIZE + v10.PLUGIN_HORIZONTAL_PADDING * 2, 0, 0), 
            Size = UDim2.new(0.5, -v10.THUMBNAIL_SIZE - v10.PLUGIN_HORIZONTAL_PADDING, 1, 0)
        }, {
            Layout = v8.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Vertical, 
                Padding = UDim.new(0, 2)
            }), 
            Name = v8.createElement("TextLabel", {
                LayoutOrder = 0, 
                TextWrapped = true, 
                TextSize = 22, 
                Size = UDim2.new(1, 0, 0, 20), 
                BackgroundTransparency = 1, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                Text = v68, 
                TextColor3 = l_Stylizer_0.EmphasisTextColor, 
                Font = Enum.Font.SourceSans
            }), 
            Creator = v8.createElement("TextButton", {
                LayoutOrder = 1, 
                TextWrapped = true, 
                Size = UDim2.new(1, 0, 0, 16), 
                BackgroundTransparency = 1, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                Text = v70, 
                Font = Enum.Font.SourceSansLight, 
                TextColor3 = l_Stylizer_0.LinkColor, 
                TextSize = 16, 
                BorderSizePixel = 1, 
                [v8.Event.Activated] = v50.openCreatorProfile
            }), 
            Description = v8.createElement("TextLabel", {
                ClipsDescendants = true, 
                LayoutOrder = 2, 
                TextWrapped = true, 
                Size = UDim2.new(1, 0, 0, l_Y_0 * 2), 
                BackgroundTransparency = 1, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextYAlignment = Enum.TextYAlignment.Top, 
                Text = v69, 
                TextColor3 = l_Stylizer_0.TextColor, 
                TextTruncate = Enum.TextTruncate.AtEnd, 
                Font = Enum.Font.SourceSans, 
                TextSize = 16
            }), 
            HttpRequestOverview = v8.createElement(v25, {
                assetId = l_data_2.assetId, 
                LayoutOrder = 3
            }), 
            UpdateOverview = v8.createElement(v26, {
                data = l_data_2, 
                LayoutOrder = 4, 
                plugin = l_plugin_0, 
                updateAvailable = v72
            })
        }), 
        ModeratedWarning = l_isModerated_1 and v8.createElement("TextLabel", {
            AnchorPoint = Vector2.new(1, 0.5), 
            Size = UDim2.new(0, v10.MODERATED_WARNING_WIDTH, 0, v10.HEADER_BUTTON_SIZE), 
            Position = v73, 
            BackgroundTransparency = 1, 
            TextXAlignment = Enum.TextXAlignment.Right, 
            TextYAlignment = Enum.TextYAlignment.Top, 
            TextSize = 14, 
            TextWrapped = true, 
            Font = Enum.Font.SourceSans, 
            TextColor3 = l_Stylizer_0.TextColor, 
            Text = l_Localization_1:getText("Entry", "ModeratedWarning")
        })
    };
    local l_v72_0 = v72;
    if l_v72_0 then
        l_v72_0 = v8.createElement;
        local l_l_Button_0_0 = l_Button_0;
        local v82 = {
            AnchorPoint = Vector2.new(1, 0.5), 
            Size = UDim2.new(0, v10.HEADER_UPDATE_WIDTH, 0, v10.HEADER_BUTTON_SIZE), 
            Position = v73, 
            Style = "Round", 
            OnClick = v50.updatePlugin
        };
        local v83 = {
            Label = v8.createElement("TextLabel", {
                Size = UDim2.new(1, 0, 1, 0), 
                Text = l_Localization_1:getText("Entry", "UpdateButton"), 
                TextColor3 = l_Stylizer_0.TextColor, 
                Font = Enum.Font.SourceSans, 
                TextSize = 18, 
                BackgroundTransparency = 1
            })
        };
        local v84 = false;
        if l_status_0 ~= v11.Error then
            v84 = v8.createElement("TextLabel", {
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, 0, 0, 14), 
                Position = UDim2.new(0, 0, 1, 3), 
                TextSize = 14, 
                Font = Enum.Font.SourceSans, 
                TextColor3 = l_Stylizer_0.TextColor, 
                TextTransparency = 0, 
                Text = l_Localization_1:getText("Entry", "LastUpdatedDate", {
                    date = l_data_2.updated
                })
            });
        end;
        v83.DateLabel = v84;
        v84 = false;
        if l_status_0 == v11.Error then
            v84 = v8.createElement("TextLabel", {
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, 0, 0, 14), 
                Position = UDim2.new(0, 0, 1, 3), 
                TextSize = 14, 
                Font = Enum.Font.SourceSans, 
                TextColor3 = l_Stylizer_0.ErrorColor, 
                Text = l_Localization_1:getText("Entry", "UpdateError")
            });
        end;
        v83.ErrorLabel = v84;
        l_v72_0 = l_v72_0(l_l_Button_0_0, v82, v83);
    end;
    v79.UpdateButton = l_v72_0;
    l_v72_0 = not l_isUpdated_0;
    if l_v72_0 then
        l_v72_0 = false;
        if l_status_0 == v11.Updating then
            l_v72_0 = v8.createElement(l_FakeLoadingBar_0, {
                AnchorPoint = Vector2.new(1, 0.5), 
                Position = v73, 
                Size = v27, 
                LoadingTime = 0.5
            });
        end;
    end;
    v79.ProgressIndicator = l_v72_0;
    v79.SuccessLabel = (l_isUpdated_0 and l_state_0.showSuccessMessage) and v8.createElement("TextLabel", {
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, 0, 0, 14), 
        AnchorPoint = Vector2.new(1, 0.5), 
        Position = v73, 
        TextSize = 14, 
        Font = Enum.Font.SourceSans, 
        TextColor3 = l_Stylizer_0.Green, 
        TextXAlignment = Enum.TextXAlignment.Right, 
        Text = l_Localization_1:getText("Entry", "UpdateSuccess")
    });
    v79.ToggleButton = v8.createElement(l_ToggleButton_0, {
        Disabled = false, 
        Selected = v67, 
        OnClick = v50.onToggleClick, 
        Size = UDim2.new(0, v10.PLUGIN_ENABLE_WIDTH, 0, 24), 
        Position = UDim2.new(1, (v10.PLUGIN_HORIZONTAL_PADDING * -2 - v10.PLUGIN_ENABLE_WIDTH) - v10.PLUGIN_CONTEXT_WIDTH, 0.5, 0)
    });
    v79.ShowMoreButton = v8.createElement(l_Button_0, {
        AnchorPoint = Vector2.new(0, 0.5), 
        Size = UDim2.new(0, v10.HEADER_BUTTON_SIZE, 0, v10.HEADER_BUTTON_SIZE), 
        Position = UDim2.new(1, -1 * (v10.PLUGIN_HORIZONTAL_PADDING + v10.PLUGIN_CONTEXT_WIDTH), 0.5, 0), 
        Style = "Round", 
        OnClick = v50.onShowMoreActivated
    }, {
        Dots = v8.createElement("TextLabel", {
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Position = UDim2.new(0.5, 0, 0.5, -4), 
            Size = UDim2.new(0, 16, 0, 16), 
            Text = "...", 
            TextColor3 = l_Stylizer_0.TextColor, 
            Font = Enum.Font.SourceSansBold, 
            TextSize = 18, 
            BackgroundTransparency = 1
        }), 
        Dropdown = v8.createElement(l_DropdownMenu_0, {
            Hide = not l_showMore_0, 
            Size = UDim2.fromOffset(90, 40 * #v50.getMoreItems()), 
            Items = v50.getMoreItems(), 
            OnRenderItem = function(v85, v86, v87)
                return v8.createElement(l_Button_0, {
                    Size = UDim2.new(1, 0, 0, 40), 
                    LayoutOrder = v86, 
                    OnClick = v87
                }, {
                    Label = v8.createElement(l_TextLabel_0, {
                        Size = UDim2.new(1, 0, 1, 0), 
                        TextSize = 18, 
                        Text = v85.Text, 
                        TextXAlignment = Enum.TextXAlignment.Left
                    }, {
                        Padding = v8.createElement("UIPadding", {
                            PaddingLeft = UDim.new(0, 10)
                        })
                    })
                });
            end, 
            OnItemActivated = v50.moreItemClicked, 
            OnFocusLost = v50.hideShowMore
        })
    });
    return l_createElement_0(v77, v78, v79);
end;
return v9.connect(function(v88, v89)
    local v90 = v88.PluginPermissions[v89.data.assetId];
    return {
        allowedHttpCount = not not v90 and v90.allowedHttpCount or 0, 
        deniedHttpCount = not not v90 and v90.deniedHttpCount or 0, 
        allowedScriptInjection = not not v90 and v90.allowedScriptInjection or nil
    };
end, function(v91)
    return {
        removePluginData = function(v92)
            v91(v24(v92));
        end, 
        onPluginSetEnabledState = function(v93, v94)
            v91(v16(v93, v94));
        end, 
        UpdatePlugin = function(v95, v96)
            v91(v17(v95, v96));
        end
    };
end)((l_withContext_0({
    Navigation = v15, 
    Localization = l_ContextServices_0.Localization, 
    Stylizer = l_ContextServices_0.Stylizer, 
    API = v14, 
    Analytics = l_ContextServices_0.Analytics
})(v34)));
