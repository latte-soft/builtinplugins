local l_Parent_0 = script.Parent.Parent.Parent;
local l_MemStorageService_0 = game:GetService("MemStorageService");
local l_StudioService_0 = game:GetService("StudioService");
local l_MarketplaceService_0 = game:GetService("MarketplaceService");
local l_PermissionsService_0 = game:GetService("PermissionsService");
local v5 = require(l_Parent_0.Packages.Roact);
local v6 = require(l_Parent_0.Packages.RoactRodux);
local v7 = require(l_Parent_0.Src.Components.PluginHolder);
local v8 = require(l_Parent_0.Src.Thunks.GetAllPluginPermissions);
local v9 = require(l_Parent_0.Src.Util.Constants);
local _ = require(l_Parent_0.Src.Components.MovedDialog);
local l_ContextServices_0 = require(l_Parent_0.Packages.Framework).ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_UI_0 = require(l_Parent_0.Packages.Framework).UI;
local l_Util_0 = require(l_Parent_0.Packages.Framework).Util;
local v15 = require(l_Parent_0.Src.ContextServices.PluginAPI2);
local v16 = require(l_Parent_0.Src.Thunks.UpdateAllPlugins);
local v17 = require(l_Parent_0.Src.Thunks.RefreshPlugins);
local l_Button_0 = l_UI_0.Button;
local l_StyleModifier_0 = l_Util_0.StyleModifier;
local l_LoadingIndicator_0 = l_UI_0.LoadingIndicator;
local v21 = require(l_Parent_0.SharedPluginConstants);
local v22 = v5.Component:extend("ManagementMainView");
v22.init = function(v23)
    v23.tokens = {};
    v23.state = {
        updating = false, 
        showingMovedDialog = false
    };
    v23.anyUpdateNeeded = function()
        if v23.props.pluginList then
            for _, v25 in pairs(v23.props.pluginList) do
                if not l_StudioService_0:IsPluginUpToDate(v25.assetId, v25.latestVersion) then
                    return true;
                end;
            end;
        end;
        return false;
    end;
    v23.refreshPlugins = function()
        v23.props.dispatchRefreshPlugins((v23.props.API:get()));
        v23.getAllPluginPermissions();
    end;
    v23.getAllPluginPermissions = function()
        v23.props.getAllPluginPermissions((v23.props.API:get()));
    end;
    v23.updateAllPlugins = function()
        v23:setState({
            updating = true
        });
        local l_props_0 = v23.props;
        l_props_0.Analytics:report("TryUpdateAllPlugins");
        l_props_0.UpdateAllPlugins(l_props_0.Analytics);
        spawn(function()
            if v23.mounted then
                v23.refreshPlugins();
                v23:setState({
                    updating = false
                });
            end;
        end);
    end;
    v23.findPlugins = function()
        if not v23:isPlaceOpen() then
            warn("findPlugins not supported when no place is open");
            return ;
        else
            l_MemStorageService_0:Fire(v21.SHOW_TOOLBOX_PLUGINS_EVENT);
            return ;
        end;
    end;
    v23.onCloseMoveDialog = function()
        v23:setState({
            showingMovedDialog = false
        });
    end;
    table.insert(v23.tokens, (l_StudioService_0.OnPluginInstalledFromToolbox:connect(v23.refreshPlugins)));
end;
v22.isPlaceOpen = function(v27)
    return v27.props.Plugin:get().MultipleDocumentInterfaceInstance.FocusedDataModelSession;
end;
v22.didMount = function(v28)
    v28.mounted = true;
    v28.refreshPlugins();
end;
v22.willUnmount = function(v29)
    v29.mounted = false;
    for _, v31 in ipairs(v29.tokens) do
        v31:Disconnect();
    end;
    v29.tokens = {};
end;
v22.render = function(v32)
    local l_props_1 = v32.props;
    local l_state_0 = v32.state;
    local v35 = l_props_1.Plugin:get();
    local l_pluginList_0 = l_props_1.pluginList;
    local l_updating_0 = l_state_0.updating;
    local l_Localization_0 = l_props_1.Localization;
    local l_Stylizer_0 = v32.props.Stylizer;
    local v40 = v32.anyUpdateNeeded();
    local v41 = not v40 or l_updating_0;
    local v42 = l_pluginList_0 == nil;
    local v43 = not v42 and next(l_pluginList_0) ~= nil;
    local v44 = not v43 and not v42;
    local _ = nil;
    local v46 = v32:isPlaceOpen();
    return v5.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundColor3 = l_Stylizer_0.BackgroundColor
    }, {
        PluginLabel = v5.createElement("TextLabel", {
            Size = UDim2.new(0, v9.HEADER_TITLE_WIDTH, 0, v9.HEADER_BUTTON_SIZE), 
            Position = UDim2.new(0, v9.HEADER_LEFT_PADDING, 0, v9.HEADER_TOP_PADDING), 
            Text = l_Localization_0:getText("Main", "Title"), 
            TextSize = 24, 
            TextColor3 = l_Stylizer_0.TextColor, 
            Font = Enum.Font.SourceSansSemibold, 
            BackgroundTransparency = 1, 
            TextXAlignment = Enum.TextXAlignment.Left.Value
        }), 
        UpdateAllButton = v40 and v5.createElement(l_Button_0, {
            Size = UDim2.new(0, v9.HEADER_UPDATE_WIDTH, 0, v9.HEADER_BUTTON_SIZE), 
            Position = UDim2.new(1, (v9.HEADER_RIGHT_PADDING * 2 - v9.HEADER_UPDATE_WIDTH) - v9.HEADER_BUTTON_SIZE, 0, v9.HEADER_TOP_PADDING), 
            Style = "Round", 
            StyleModifier = not not v41 and l_StyleModifier_0.Disabled or nil, 
            OnClick = not v41 and v32.updateAllPlugins or function()
            end
        }, {
            Label = v5.createElement("TextLabel", {
                Size = UDim2.new(1, 0, 1, 0), 
                Text = l_Localization_0:getText("Main", "UpdateAllButton"), 
                TextColor3 = not not v41 and l_Stylizer_0.DisabledColor or l_Stylizer_0.TextColor, 
                Font = Enum.Font.SourceSans, 
                TextSize = 18, 
                BackgroundTransparency = 1
            })
        }), 
        FindPluginsButton = not not v46 and v5.createElement(l_Button_0, {
            Size = UDim2.new(0, v9.HEADER_BUTTON_SIZE, 0, v9.HEADER_BUTTON_SIZE), 
            Position = UDim2.new(1, v9.HEADER_RIGHT_PADDING, 0, v9.HEADER_TOP_PADDING), 
            AnchorPoint = Vector2.new(1, 0), 
            Style = "RoundPrimary", 
            BackgroundTransparency = 1, 
            OnClick = v32.findPlugins
        }, {
            Dots = v5.createElement("TextLabel", {
                Position = UDim2.new(0, 0, 0, 0), 
                Size = UDim2.new(1, 0, 1, 0), 
                Text = "+", 
                TextColor3 = l_Stylizer_0.White, 
                Font = Enum.Font.SourceSansBold, 
                TextSize = 24, 
                BackgroundTransparency = 1
            })
        }) or nil, 
        NoPluginsMessage = v44 and v5.createElement("TextLabel", {
            Position = UDim2.new(0, v9.HEADER_LEFT_PADDING, 0, v9.HEADER_HEIGHT), 
            Size = UDim2.new(1, -v9.HEADER_LEFT_PADDING, 0, v9.HEADER_MESSAGE_LINE_HEIGHT), 
            Text = l_Localization_0:getText("Main", "NoPluginsMessage"), 
            TextSize = 17, 
            TextColor3 = l_Stylizer_0.TextColor, 
            Font = Enum.Font.SourceSans, 
            BackgroundTransparency = 1, 
            TextXAlignment = Enum.TextXAlignment.Left.Value, 
            TextYAlignment = Enum.TextYAlignment.Top.Value
        }), 
        FindPluginsMessage = v44 and v5.createElement("TextLabel", {
            Position = UDim2.new(0, v9.HEADER_LEFT_PADDING, 0, v9.HEADER_HEIGHT + v9.HEADER_MESSAGE_LINE_HEIGHT), 
            Size = UDim2.new(1, -v9.HEADER_LEFT_PADDING, 0, v9.HEADER_MESSAGE_LINE_HEIGHT), 
            Text = if not v46 then l_Localization_0:getText("Main", "FindPluginsMessage") else l_Localization_0:getText("Main", "FindPluginsWithButtonMessage"), 
            TextSize = 17, 
            TextColor3 = l_Stylizer_0.TextColor, 
            Font = Enum.Font.SourceSans, 
            BackgroundTransparency = 1, 
            TextXAlignment = Enum.TextXAlignment.Left.Value, 
            TextYAlignment = Enum.TextYAlignment.Top.Value
        }), 
        ScrollablePluginList = v43 and v5.createElement(v7, {
            position = UDim2.new(0, 0, 1, 0), 
            size = UDim2.new(1, 0, 1, -1 * v9.HEADER_HEIGHT), 
            anchorPoint = Vector2.new(0, 1), 
            plugin = v35, 
            pluginList = l_pluginList_0, 
            onPluginUninstalled = v32.refreshPlugins
        }), 
        Indicator = v42 and v5.createElement(l_LoadingIndicator_0, {
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Position = UDim2.fromScale(0.5, 0.5), 
            Size = UDim2.new(0, 92, 0, 24)
        })
    });
end;
return v6.connect(function(v47, _)
    return {
        pluginList = v47.Management.plugins
    };
end, function(v49)
    return {
        UpdateAllPlugins = function(v50)
            v49(v16(v50));
        end, 
        dispatchRefreshPlugins = function(v51)
            v49(v17(v51, l_MarketplaceService_0));
        end, 
        getAllPluginPermissions = function(v52)
            v49(v8(l_PermissionsService_0, v52));
        end
    };
end)((l_withContext_0({
    Plugin = l_ContextServices_0.Plugin, 
    Localization = l_ContextServices_0.Localization, 
    Stylizer = l_ContextServices_0.Stylizer, 
    API = v15, 
    Analytics = l_ContextServices_0.Analytics
})(v22)));
