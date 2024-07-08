local l_Parent_0 = script.Parent.Parent.Parent;
local l_StudioPublishService_0 = game:GetService("StudioPublishService");
local _ = game:GetService("StudioService");
local v3 = require(l_Parent_0.Packages.Framework);
local v4 = require(l_Parent_0.Packages.Roact);
local v5 = require(l_Parent_0.Packages.RoactRodux);
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_UI_0 = v3.UI;
local l_Button_0 = l_UI_0.Button;
local l_LoadingIndicator_0 = l_UI_0.LoadingIndicator;
local _ = game:GetService("ContentProvider");
local v12 = require(l_Parent_0.Src.Resources.Constants);
local v13 = require(l_Parent_0.Src.Actions.SetPublishInfo);
local v14 = require(l_Parent_0.Src.Actions.SetPublishInProgress);
local v15 = require(l_Parent_0.Src.Actions.SetScreen);
local v16 = v4.PureComponent:extend("ScreenPublishInProgress");
local l_game_FastInt_0 = game:GetFastInt("StudioTeamCreateConflictRetryCount");
local l_game_FastInt_1 = game:GetFastInt("StudioTeamCreateConflictDelaySec");
local v19 = 0;
v16.init = function(v20)
    v20.state = {};
    v20.isMounted = false;
    if v20.props.Id == 0 then
        local _ = game.GameId;
    end;
end;
v16.didMount = function(v22)
    v22.isMounted = true;
    v22.finishedConnection = l_StudioPublishService_0.GamePublishFinished:connect(function(v23, _, v25, v26)
        local _ = v22.props.Progress.FailCount;
        if v26 == Enum.StudioPlaceUpdateFailureReason.TeamCreateConflict and v19 < l_game_FastInt_0 then
            v19 = v19 + 1;
            if v22.retryThread ~= nil then
                task.cancel(v22.retryThread);
                v22.retryThread = nil;
            end;
            v22.retryThread = task.delay(l_game_FastInt_1, function()
                l_StudioPublishService_0:setUploadNames(v22.props.Progress.Place.name, v22.props.Progress.Universe.name);
                l_StudioPublishService_0:publishAs(v22.props.Progress.Universe.universeId, v22.props.Progress.Place.placeId, 0, v22.props.Progress.IsPublish, nil, v19 < l_game_FastInt_0);
            end);
            return ;
        else
            v22.props.DispatchRequestInFlight(false);
            if not v23 then
                v22.props.OpenPublishFailPage(v22.props.Progress.Place, v22.props.Progress.Universe, v25);
                return ;
            else
                v22.props.OpenPublishSuccessfulPage(v22.props.Progress.Place, v22.props.Progress.Universe);
                return ;
            end;
        end;
    end);
    v19 = 0;
end;
v16.willUnmount = function(v28)
    v28.isMounted = false;
    if v28.retryThread ~= nil then
        task.cancel(v28.retryThread);
        v28.retryThread = nil;
    end;
    if v28.finishedConnection then
        v28.finishedConnection:disconnect();
    end;
end;
v16.render = function(v29)
    local l_props_0 = v29.props;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local l_Localization_0 = l_props_0.Localization;
    local _ = l_props_0.OnClose;
    local _ = l_props_0.Name;
    local _ = l_props_0.ParentGameName;
    if l_props_0.Progress.RequestInFlight == false and l_props_0.Progress.FailCount == 0 then
        l_StudioPublishService_0:setUploadNames(l_props_0.Progress.Place.name, l_props_0.Progress.Universe.name);
        l_StudioPublishService_0:publishAs(l_props_0.Progress.Universe.universeId, l_props_0.Progress.Place.placeId, 0, l_props_0.Progress.IsPublish, nil, v19 < l_game_FastInt_0);
        l_props_0.DispatchRequestInFlight(true);
    end;
    local v36 = l_Localization_0:getText("General", "UploadInProgressElps");
    local v37 = l_Localization_0:getText("General", "PleaseWait");
    if v19 > 0 then
        v37 = l_Localization_0:getText("General", "UploadConflictRetry");
    end;
    return v4.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundColor3 = l_Stylizer_0.backgroundColor, 
        BorderSizePixel = 0
    }, {
        Icon = v4.createElement(l_LoadingIndicator_0, {
            Position = UDim2.new(0.5, 0, 0.3, 0), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Size = UDim2.new(0, 150, 0, 50)
        }), 
        UploadInProgressLabel = v4.createElement("TextLabel", {
            Text = v36, 
            Position = UDim2.new(0.5, 0, 0.5, 0), 
            TextSize = 24, 
            BackgroundTransparency = 1, 
            TextXAlignment = Enum.TextXAlignment.Center, 
            TextColor3 = l_Stylizer_0.successText.text, 
            Font = l_Stylizer_0.successText.font
        }), 
        PleaseWaitLabel = v4.createElement("TextLabel", {
            Text = v37, 
            Position = UDim2.new(0.5, 0, 0.6, 0), 
            TextSize = 24, 
            BackgroundTransparency = 1, 
            TextColor3 = l_Stylizer_0.header.text, 
            TextXAlignment = Enum.TextXAlignment.Center, 
            Font = l_Stylizer_0.header.font
        }), 
        CancelButton = v4.createElement(l_Button_0, {
            AnchorPoint = Vector2.new(0.5, 0.5), 
            OnClick = l_props_0.OnClose, 
            Position = UDim2.new(0.5, 0, 0.9, 0), 
            Size = UDim2.new(0, 150, 0, 30), 
            Style = "Round", 
            Text = l_Localization_0:getText("Button", "Cancel")
        })
    });
end;
return v5.connect(function(v38, _)
    local l_publishInfo_0 = v38.PublishedPlace.publishInfo;
    local l_publishInProgress_0 = v38.PublishInProgress.publishInProgress;
    return {
        Id = l_publishInfo_0.id, 
        Name = l_publishInfo_0.name, 
        ParentGameName = l_publishInfo_0.parentGameName, 
        Progress = {
            Universe = l_publishInProgress_0.universe, 
            Place = l_publishInProgress_0.place, 
            IsPublish = l_publishInProgress_0.isPublish, 
            FailCount = l_publishInProgress_0.failCount, 
            RequestInFlight = l_publishInProgress_0.requestInFlight
        }
    };
end, function(v42)
    return {
        DispatchRequestInFlight = function(v43)
            v42(v14({
                requestInFlight = v43
            }));
        end, 
        OpenPublishSuccessfulPage = function(v44, v45)
            v42(v13({
                id = v45.universeId, 
                name = v44.name, 
                parentGameName = v45.name
            }));
            v42(v15(v12.SCREENS.PUBLISH_SUCCESSFUL));
        end, 
        OpenPublishFailPage = function(v46, v47, v48)
            v42(v13({
                id = v46.placeId, 
                name = v46.name, 
                parentGameName = v47.name, 
                parentGameId = v47.universeId, 
                failed = true, 
                message = v48
            }));
            v42(v15(v12.SCREENS.PUBLISH_FAIL));
        end
    };
end)((l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer, 
    Localization = l_ContextServices_0.Localization
})(v16)));
