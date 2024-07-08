local l_Parent_0 = script.Parent.Parent.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v2 = require(l_Packages_0.Roact);
local v3 = require(l_Parent_0.Core.Util.Constants);
local v4 = require(l_Parent_0.Core.Util.Images);
local l_ContextServices_0 = require(l_Packages_0.Framework).ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v7 = v2.PureComponent:extend("VoteButton");
v7.init = function(v8, _)
    v8.state = {
        isHovered = false, 
        voteDownButtonHovered = false
    };
    v8.onMouseEntered = function(_, _, _)
        v8:setState({
            isHovered = true
        });
    end;
    v8.onMouseLeft = function(_, _, _)
        v8:setState({
            isHovered = false
        });
    end;
end;
v7.render = function(v16)
    local l_props_0 = v16.props;
    local l_state_0 = v16.state;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local _ = l_Stylizer_0.asset.voting;
    local l_hasVoted_0 = l_props_0.hasVoted;
    local l_userVote_0 = l_props_0.userVote;
    local l_isVoteUp_0 = l_props_0.isVoteUp;
    if not l_isVoteUp_0 then
        l_userVote_0 = not l_userVote_0;
    end;
    local l_isHovered_0 = l_state_0.isHovered;
    local l_onClicked_0 = l_props_0.onClicked;
    local l_voting_1 = l_Stylizer_0.asset.voting;
    local l_votingButtonImage_0 = l_voting_1.votingButtonImage;
    local l_voteThumb_0 = l_voting_1.voteThumb;
    local v29 = 0;
    local v30 = UDim2.new(1, -2, 1, -2);
    if not (not l_hasVoted_0 or not l_userVote_0) then
        if not l_isVoteUp_0 then
            l_voteThumb_0 = l_voting_1.votedDownThumb;
            l_votingButtonImage_0 = v4.THUMB_UP_RED;
        else
            l_voteThumb_0 = l_voting_1.votedUpThumb;
            l_votingButtonImage_0 = v4.THUMB_UP_GREEN;
        end;
    end;
    if not l_isVoteUp_0 then
        v29 = 180;
    end;
    return v2.createElement("ImageButton", {
        BackgroundTransparency = 1, 
        LayoutOrder = not l_isVoteUp_0 and 2 or 1, 
        Size = UDim2.new(0, v3.THUMB_ICON_WIDTH, 0, v3.THUMB_ICON_HEIGHT), 
        AutoButtonColor = false, 
        [v2.Event.MouseEnter] = v16.onMouseEntered, 
        [v2.Event.MouseLeave] = v16.onMouseLeft, 
        [v2.Event.MouseButton1Click] = l_onClicked_0
    }, {
        Thumb = v2.createElement("ImageLabel", {
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Position = UDim2.new(0.5, 0, 0.5, 0), 
            Size = v30, 
            Rotation = v29, 
            BackgroundTransparency = 1, 
            Image = l_votingButtonImage_0, 
            ImageTransparency = not l_isHovered_0 and 0.2 or 0
        })
    });
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer
})(v7));
