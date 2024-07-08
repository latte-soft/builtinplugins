local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.RoactRodux);
local v3 = require(l_Parent_0.Packages.FitFrame);
local l_ContextServices_0 = require(l_Parent_0.Packages.Framework).ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_LayoutOrderIterator_0 = require(l_Parent_0.Packages.Framework).Util.LayoutOrderIterator;
local v7 = require(l_Parent_0.Src.Util.Constants);
local v8 = require(l_Parent_0.Src.ContextServices.PluginAPI2);
local v9 = require(l_Parent_0.Src.ContextServices.Navigation);
local v10 = require(l_Parent_0.Src.Components.IconWithText);
local l_FitTextLabel_0 = v3.FitTextLabel;
local v12 = v1.PureComponent:extend("HttpRequestOverview");
v12.defaultProps = {
    assetId = nil, 
    LayoutOrder = 1, 
    navigation = nil
};
v12.init = function(v13)
    v13.openPluginDetails = function()
        v13.props.Navigation:get().navigation.navigate({
            routeName = v7.APP_PAGE.Detail, 
            params = {
                assetId = v13.props.assetId
            }
        });
    end;
end;
v12.render = function(v14)
    local l_acceptedRequestsCount_0 = v14.props.acceptedRequestsCount;
    local l_deniedRequestsCount_0 = v14.props.deniedRequestsCount;
    local l_allowedScriptInjection_0 = v14.props.allowedScriptInjection;
    local v18 = true;
    if l_acceptedRequestsCount_0 <= 0 then
        v18 = l_deniedRequestsCount_0 > 0;
    end;
    local v19 = l_allowedScriptInjection_0 ~= nil;
    local v20 = v18 or v19;
    local l_LayoutOrder_0 = v14.props.LayoutOrder;
    local l_Localization_0 = v14.props.Localization;
    local l_Stylizer_0 = v14.props.Stylizer;
    local v24 = l_LayoutOrderIterator_0.new();
    local l_createElement_0 = v1.createElement;
    local v26 = "TextButton";
    local v27 = {
        BackgroundTransparency = 1, 
        LayoutOrder = l_LayoutOrder_0, 
        Size = UDim2.new(1, 0, 0, 16), 
        Text = "", 
        [v1.Event.Activated] = v14.openPluginDetails
    };
    local v28 = {
        Layout = v1.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            Padding = UDim.new(0, 8), 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            VerticalAlignment = Enum.VerticalAlignment.Top
        }), 
        NoPermissionsRequested = not v20 and v1.createElement(l_FitTextLabel_0, {
            BackgroundTransparency = 1, 
            Font = l_Stylizer_0.Font, 
            LayoutOrder = v24:getNextOrder(), 
            Size = UDim2.new(1, 0, 0, 16), 
            TextSize = 16, 
            Text = l_Localization_0:getText("PluginEntry", "NoPermissionsRequested"), 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextColor3 = l_Stylizer_0.HttpOverviewTextColor, 
            width = l_FitTextLabel_0.Width.FitToText
        }), 
        Label = v18 and v1.createElement(l_FitTextLabel_0, {
            BackgroundTransparency = 1, 
            Font = l_Stylizer_0.Font, 
            LayoutOrder = v24:getNextOrder(), 
            Size = UDim2.new(1, 0, 0, 16), 
            TextSize = 16, 
            Text = l_Localization_0:getText("PluginEntry", "HttpRequest"), 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextColor3 = l_Stylizer_0.HttpOverviewTextColor, 
            width = l_FitTextLabel_0.Width.FitToText
        })
    };
    local v29 = false;
    if l_acceptedRequestsCount_0 > 0 then
        v29 = v1.createElement(v10, {
            Image = "rbxasset://textures/PluginManagement/allowed.png", 
            imageSize = v7.HTTP_OVERVIEW_ICON_SIZE, 
            imageTopPadding = 1, 
            LayoutOrder = v24:getNextOrder(), 
            Text = l_acceptedRequestsCount_0, 
            TextColor3 = l_Stylizer_0.HttpOverviewTextColor, 
            TextSize = 16
        });
    end;
    v28.Allowed = v29;
    v29 = false;
    if l_deniedRequestsCount_0 > 0 then
        v29 = v1.createElement(v10, {
            Image = "rbxasset://textures/PluginManagement/declined.png", 
            imageSize = v7.HTTP_OVERVIEW_ICON_SIZE, 
            imageTopPadding = 1, 
            LayoutOrder = v24:getNextOrder(), 
            Text = l_deniedRequestsCount_0, 
            TextColor3 = l_Stylizer_0.HttpOverviewTextColor, 
            TextSize = 16
        });
    end;
    v28.Denied = v29;
    v28.Border = v18 and v1.createElement("Frame", {
        BorderSizePixel = 0, 
        BackgroundColor3 = l_Stylizer_0.BorderColor, 
        LayoutOrder = v24:getNextOrder(), 
        Size = UDim2.new(0, 1, 0, v7.HTTP_OVERVIEW_ICON_SIZE)
    });
    v28.ScriptInjection = v19 and v1.createElement(l_FitTextLabel_0, {
        BackgroundTransparency = 1, 
        Font = l_Stylizer_0.Font, 
        LayoutOrder = v24:getNextOrder(), 
        Size = UDim2.new(1, 0, 0, 16), 
        TextSize = 16, 
        Text = l_Localization_0:getText("PluginEntry", not l_allowedScriptInjection_0 and "ScriptInjectionDenied" or "ScriptInjectionAllowed"), 
        TextXAlignment = Enum.TextXAlignment.Left, 
        TextColor3 = l_Stylizer_0.HttpOverviewTextColor, 
        width = l_FitTextLabel_0.Width.FitToText
    });
    v28.Border2 = v19 and v1.createElement("Frame", {
        BorderSizePixel = 0, 
        BackgroundColor3 = l_Stylizer_0.BorderColor, 
        LayoutOrder = v24:getNextOrder(), 
        Size = UDim2.new(0, 1, 0, v7.HTTP_OVERVIEW_ICON_SIZE)
    });
    v28.EditButton = v20 and v1.createElement("ImageLabel", {
        BackgroundTransparency = 1, 
        Image = "rbxasset://textures/PluginManagement/edit.png", 
        ImageColor3 = l_Stylizer_0.HttpOverviewTextColor, 
        LayoutOrder = v24:getNextOrder(), 
        Size = UDim2.new(0, v7.HTTP_OVERVIEW_ICON_SIZE, 0, v7.HTTP_OVERVIEW_ICON_SIZE)
    });
    return l_createElement_0(v26, v27, v28);
end;
return v2.connect(function(v30, v31)
    local v32 = v30.PluginPermissions[v31.assetId];
    return {
        acceptedRequestsCount = not not v32 and v32.allowedHttpCount or 0, 
        deniedRequestsCount = not not v32 and v32.deniedHttpCount or 0, 
        allowedScriptInjection = v32 and v32.allowedScriptInjection
    };
end, nil)((l_withContext_0({
    Navigation = v9, 
    Localization = l_ContextServices_0.Localization, 
    Stylizer = l_ContextServices_0.Stylizer, 
    API = v8
})(v12)));
