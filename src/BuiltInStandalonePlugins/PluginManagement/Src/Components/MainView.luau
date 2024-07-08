local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.RoactRodux);
local l_ContextServices_0 = require(l_Parent_0.Packages.Framework).ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v5 = require(l_Parent_0.Src.Constants.PluginInstalledStatus);
local v6 = v1.Component:extend("MainView");
v6.renderContentNotReady = function(v7, v8, v9)
    return {
        SimpleLabel = v1.createElement("TextLabel", {
            Text = v9:getText("Main", "InstallingPlugin", {
                v7.props.pluginId
            }), 
            Size = UDim2.new(1, 0, 1, 0), 
            Position = UDim2.new(0, 0, 0, 0), 
            BackgroundTransparency = 1, 
            TextColor3 = v8.TextColor, 
            TextSize = 18, 
            TextWrapped = true, 
            TextXAlignment = Enum.TextXAlignment.Center, 
            TextYAlignment = Enum.TextYAlignment.Center
        })
    };
end;
v6.renderInstallSuccess = function(v10, v11, v12)
    return {
        ListLayout = v1.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder
        }), 
        Title = v1.createElement("TextLabel", {
            Text = v12:getText("Progress", "Completed"), 
            TextColor3 = v11.TextColor, 
            TextSize = 16, 
            Font = Enum.Font.SourceSansSemibold, 
            BackgroundTransparency = 1, 
            TextWrapped = true, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            Size = UDim2.new(1, 0, 0, 18), 
            LayoutOrder = 1
        }), 
        Padding = v1.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 0, 24), 
            LayoutOrder = 2
        }), 
        Message = v1.createElement("TextLabel", {
            Text = v12:getText("Progress", "CompletedMessage", {
                "\"" .. (v10.props.info.name or "") .. "\""
            }), 
            TextColor3 = v11.TextColor, 
            TextSize = 16, 
            Font = Enum.Font.SourceSans, 
            TextWrapped = true, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            Size = UDim2.new(1, 0, 0, 48), 
            BackgroundTransparency = 1, 
            LayoutOrder = 3
        })
    };
end;
v6.renderInstallProgress = function(v13, v14, v15)
    local l_pluginId_0 = v13.props.pluginId;
    local l_info_0 = v13.props.info;
    local l_installStatus_0 = l_info_0.installStatus;
    local l_installationMsg_0 = l_info_0.installationMsg;
    local v20 = nil;
    if l_installStatus_0 == v5.UNKNOWN then
        v20 = v15:getText("Main", "InstallingPlugin", {
            l_pluginId_0
        });
    elseif l_installStatus_0 == v5.HTTP_ERROR then
        v20 = v15:getText("Progress", "HttpError", {
            l_installationMsg_0
        });
    elseif l_installStatus_0 == v5.PLUGIN_NOT_OWNED then
        v20 = v15:getText("Progress", "NotOwned", {
            l_installationMsg_0
        });
    elseif l_installStatus_0 == v5.PLUGIN_DETAILS_UNAVAILABLE then
        v20 = v15:getText("Progress", "Unavailable", {
            l_installationMsg_0
        });
    elseif l_installStatus_0 == v5.PLUGIN_NOT_INSTALLED then
        v20 = v15:getText("Progress", "NotInstalled", {
            l_installationMsg_0
        });
    elseif l_installStatus_0 == v5.PLUGIN_AlREADY_INSTALLED then
        v20 = v15:getText("Progress", "AlreadyInstalled", {
            l_installationMsg_0
        });
    end;
    return {
        SimpleLabel = v1.createElement("TextLabel", {
            Text = v20, 
            Size = UDim2.new(1, 0, 1, 0), 
            Position = UDim2.new(0, 0, 0, 0), 
            BackgroundTransparency = 1, 
            TextColor3 = v14.TextColor, 
            TextSize = 18, 
            TextWrapped = true, 
            TextXAlignment = Enum.TextXAlignment.Center, 
            TextYAlignment = Enum.TextYAlignment.Center
        })
    };
end;
v6.render = function(v21)
    local l_info_1 = v21.props.info;
    local l_Stylizer_0 = v21.props.Stylizer;
    local l_Localization_0 = v21.props.Localization;
    local _ = nil;
    return v1.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        Position = UDim2.new(0, 0, 0, 0), 
        BackgroundTransparency = 1
    }, if l_info_1 then if l_info_1.installStatus == v5.PLUGIN_INSTALLED_SUCCESSFULLY then v21:renderInstallSuccess(l_Stylizer_0, l_Localization_0) else v21:renderInstallProgress(l_Stylizer_0, l_Localization_0) else v21:renderContentNotReady(l_Stylizer_0, l_Localization_0));
end;
return v2.connect(function(v26, v27)
    return {
        info = v26.PluginInfo.plugins[v27.pluginId]
    };
end)((l_withContext_0({
    Localization = l_ContextServices_0.Localization, 
    Stylizer = l_ContextServices_0.Stylizer
})(v6)));
