local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.RoactRodux);
local v3 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v6 = v3.RobloxAPI.new();
local v7 = require(l_Parent_0.Src.Actions.SetPublishInfo);
local v8 = require(l_Parent_0.Src.Actions.SetScreen);
local v9 = require(l_Parent_0.Src.Actions.SetIsPublishing);
local v10 = require(l_Parent_0.Src.Resources.Constants);
local l_StyleModifier_0 = v3.Util.StyleModifier;
local l_Button_0 = v3.UI.Button;
local v13 = require(l_Parent_0.Src.Network.Requests.SettingsImpl);
local l_StudioPublishService_0 = game:GetService("StudioPublishService");
local l_ContentProvider_0 = game:GetService("ContentProvider");
local v16 = v1.PureComponent:extend("ScreenPublishFail");
v16.init = function(v17)
    v17.state = {};
    v17.finishedConnection = nil;
    v17.isMounted = false;
    v17.thumbnailUrl = string.format("rbxthumb://type=Asset&id=%i&w=%i&h=%i", v17.props.Id, 150, 150);
end;
v16.didMount = function(v18)
    v18.isMounted = true;
    spawn(function()
        l_ContentProvider_0:PreloadAsync({
            v18.thumbnailUrl
        }, function(_, v20)
            if v18.isMounted then
                v18:setState({
                    assetFetchStatus = v20
                });
            end;
        end);
    end);
    v18.finishedConnection = l_StudioPublishService_0.GamePublishFinished:connect(function(v21)
        if v21 then
            v18.props.OpenPublishSuccessfulPage(v18.props.Id, v18.props.Name, v18.props.ParentGameName);
        end;
    end);
end;
v16.willUnmount = function(v22)
    v22.isMounted = false;
    if v22.finishedConnection then
        v22.finishedConnection:disconnect();
    end;
end;
v16.render = function(v23)
    local l_props_0 = v23.props;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local l_Localization_0 = l_props_0.Localization;
    local l_v6_0 = v6;
    local l_Id_0 = l_props_0.Id;
    local l_Name_0 = l_props_0.Name;
    local l_ParentGameId_0 = l_props_0.ParentGameId;
    local l_Settings_0 = l_props_0.Settings;
    local l_IsPublishing_0 = l_props_0.IsPublishing;
    local l_dispatchSetIsPublishing_0 = l_props_0.dispatchSetIsPublishing;
    local _ = nil;
    return v1.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundColor3 = l_Stylizer_0.backgroundColor, 
        BorderSizePixel = 0
    }, {
        Icon = v1.createElement("ImageLabel", {
            Position = UDim2.new(0.5, 0, 0.2, 0), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Size = UDim2.new(0, 150, 0, 150), 
            Image = v23.state.assetFetchStatus == Enum.AssetFetchStatus.Success and v23.thumbnailUrl or l_Stylizer_0.icons.thumbnailPlaceHolder, 
            BorderSizePixel = 0
        }), 
        Name = v1.createElement("TextLabel", {
            Text = l_Name_0, 
            Position = UDim2.new(0.5, 0, 0.35, 0), 
            TextSize = 20, 
            BackgroundTransparency = 1, 
            TextColor3 = l_Stylizer_0.header.text, 
            TextXAlignment = Enum.TextXAlignment.Center, 
            Font = l_Stylizer_0.header.font
        }), 
        Fail = v1.createElement("TextLabel", {
            Text = if not l_IsPublishing_0 then l_Localization_0:getText("PublishFail", "SaveFail") else l_Localization_0:getText("PublishFail", "Fail"), 
            Position = UDim2.new(0.5, 0, 0.5, 0), 
            TextSize = 24, 
            BackgroundTransparency = 1, 
            TextXAlignment = Enum.TextXAlignment.Center, 
            TextColor3 = l_Stylizer_0.failText.text, 
            Font = l_Stylizer_0.failText.font
        }), 
        Retry = v1.createElement(l_Button_0, {
            AnchorPoint = Vector2.new(0.5, 0.5), 
            OnClick = function()
                if not l_IsPublishing_0 then
                    if l_ParentGameId_0 == 0 then
                        v13.saveAll(l_Settings_0, l_Localization_0, l_v6_0, nil, l_props_0.IsPublish);
                    else
                        l_StudioPublishService_0:publishAs(l_ParentGameId_0, l_Id_0, 0, l_props_0.IsPublish, nil);
                    end;
                end;
                l_dispatchSetIsPublishing_0(true);
            end, 
            Position = UDim2.new(0.5, 0, 0.8, 0), 
            Size = UDim2.new(0, 150, 0, 40), 
            Style = "Round", 
            StyleModifier = if not l_IsPublishing_0 then nil else l_StyleModifier_0.Disabled, 
            Text = l_Localization_0:getText("Button", "Retry")
        }), 
        Message = v1.createElement("TextLabel", {
            Text = not (l_props_0.Message ~= nil) and "" or l_props_0.Message, 
            TextSize = 24, 
            Position = UDim2.new(0.5, 0, 0.5, 32), 
            BackgroundTransparency = 1, 
            TextXAlignment = Enum.TextXAlignment.Center, 
            TextColor3 = l_Stylizer_0.failText.text, 
            Font = l_Stylizer_0.failText.font
        })
    });
end;
return v2.connect(function(v35, _)
    local l_publishInfo_0 = v35.PublishedPlace.publishInfo;
    return {
        Id = l_publishInfo_0.id, 
        Name = l_publishInfo_0.name, 
        ParentGameName = l_publishInfo_0.parentGameName, 
        ParentGameId = l_publishInfo_0.parentGameId, 
        Settings = l_publishInfo_0.settings, 
        IsPublishing = v35.PublishedPlace.isPublishing, 
        Message = l_publishInfo_0.message
    };
end, function(v38)
    return {
        OpenPublishSuccessfulPage = function(v39, v40, v41)
            v38(v7({
                id = v39, 
                name = v40, 
                parentGameName = v41
            }));
            v38(v8(v10.SCREENS.PUBLISH_SUCCESSFUL));
        end, 
        dispatchSetIsPublishing = function(v42)
            v38(v9(v42));
        end
    };
end)((l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer, 
    Localization = l_ContextServices_0.Localization, 
    API = l_ContextServices_0.API
})(v16)));
