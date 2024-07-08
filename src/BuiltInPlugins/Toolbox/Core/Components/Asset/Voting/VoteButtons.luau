local l_Parent_0 = script.Parent.Parent.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v2 = require(l_Packages_0.Roact);
local v3 = require(l_Packages_0.RoactRodux);
local v4 = require(l_Packages_0.Framework);
local l_ContextServices_0 = v4.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_LOCALIZATION_PROJECT_NAME_0 = v4.Resources.LOCALIZATION_PROJECT_NAME;
local v8 = require(l_Parent_0.Core.Util.Constants);
local v9 = require(l_Parent_0.Core.Components.Asset.Voting.VoteButton);
local v10 = require(l_Parent_0.Core.Networking.Requests.PostUnvoteRequest);
local v11 = require(l_Parent_0.Core.Networking.Requests.PostVoteRequest);
local v12 = require(l_Parent_0.Core.ContextServices.NetworkContext);
local v13 = v2.PureComponent:extend("VoteButtons");
v13.init = function(v14, _)
    local l_assetId_0 = v14.props.assetId;
    local l_onVoteRequested_0 = v14.props.onVoteRequested;
    local l_onUnvoteRequested_0 = v14.props.onUnvoteRequested;
    v14.onVoteUpClicked = function(_, _, _)
        local l_networkInterface_0 = v14.props.Network.networkInterface;
        local l_voting_0 = v14.props.voting;
        if not l_voting_0.HasVoted or not l_voting_0.UserVote then
            l_onVoteRequested_0(l_networkInterface_0, l_assetId_0, true);
            return ;
        else
            l_onUnvoteRequested_0(l_networkInterface_0, l_assetId_0);
            return ;
        end;
    end;
    v14.onVoteDownClicked = function(_, _, _)
        local l_networkInterface_1 = v14.props.Network.networkInterface;
        local l_voting_1 = v14.props.voting;
        if not l_voting_1.HasVoted or l_voting_1.UserVote then
            l_onVoteRequested_0(l_networkInterface_1, l_assetId_0, false);
            return ;
        else
            l_onUnvoteRequested_0(l_networkInterface_1, l_assetId_0);
            return ;
        end;
    end;
end;
v13.render = function(v29)
    local l_props_0 = v29.props;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local l_voting_2 = l_Stylizer_0.asset.voting;
    local l_Localization_0 = l_props_0.Localization;
    local l_showBackgroundBox_0 = l_props_0.showBackgroundBox;
    return v2.createElement("Frame", {
        BackgroundTransparency = not l_showBackgroundBox_0 and 1 or 0.95, 
        BackgroundColor3 = if not l_showBackgroundBox_0 then nil else l_voting_2.votingButtonsBackgroundBoxColor, 
        LayoutOrder = nil, 
        Size = UDim2.new(1, 0, 0, v8.ASSET_VOTING_BUTTONS_HEIGHT)
    }, {
        UIListLayout = v2.createElement("UIListLayout", {
            Padding = UDim.new(0, v8.ASSET_VOTE_BUTTONS_HORIZONTAL_PADDING), 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Horizontal, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            VerticalAlignment = Enum.VerticalAlignment.Center
        }), 
        UICorner = if not l_showBackgroundBox_0 then nil else v2.createElement("UICorner", {
            CornerRadius = UDim.new(0, v8.ASSET_VOTING_BUTTONS_BACKGROUND_BOX_CORNER_RADIUS)
        }), 
        RateText = v2.createElement("TextLabel", {
            AutomaticSize = Enum.AutomaticSize.XY, 
            LayoutOrder = 0, 
            Text = l_Localization_0:getProjectText(l_LOCALIZATION_PROJECT_NAME_0, "VoteButons", "Rate"), 
            BackgroundTransparency = 1, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            Font = v8.FONT, 
            TextSize = v8.FONT_SIZE_SMALL, 
            TextColor3 = l_Stylizer_0.asset.voting.rateTextColor
        }, {
            UIPadding = v2.createElement("UIPadding", {
                PaddingRight = UDim.new(0, v8.ASSET_VOTE_BUTTONS_TEXT_PADDING)
            })
        }), 
        VoteUpButton = v2.createElement(v9, {
            isVoteUp = true, 
            hasVoted = l_props_0.voting.HasVoted, 
            userVote = l_props_0.voting.UserVote, 
            onClicked = v29.onVoteUpClicked
        }), 
        VoteDownButton = v2.createElement(v9, {
            isVoteUp = false, 
            hasVoted = l_props_0.voting.HasVoted, 
            userVote = l_props_0.voting.UserVote, 
            onClicked = v29.onVoteDownClicked
        })
    });
end;
return v3.connect(nil, function(v35)
    return {
        onVoteRequested = function(v36, v37, v38)
            v35(v11(v36, v37, v38));
        end, 
        onUnvoteRequested = function(v39, v40)
            v35(v10(v39, v40));
        end
    };
end)((l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer, 
    Localization = l_ContextServices_0.Localization, 
    Network = v12
})(v13)));
