local l_Parent_0 = script.Parent.Parent.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v2 = require(l_Packages_0.Roact);
local v3 = require(l_Packages_0.Framework);
local v4 = require(l_Parent_0.Core.Util.Constants);
local l_Votes_0 = v3.UI.Votes;
local l_ContextServices_0 = require(l_Packages_0.Framework).ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v8 = v2.PureComponent:extend("VoteBar");
v8.render = function(v9)
    local l_props_0 = v9.props;
    local _ = l_props_0.Stylizer;
    return v2.createElement("Frame", {
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, 0, 1, 0) or UDim2.new(1, 0, 0, v4.ASSET_VOTING_HEIGHT)
    }, {
        UIListLayout = v2.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            FillDirection = Enum.FillDirection.Horizontal, 
            Padding = UDim.new(0, v4.ASSET_INNER_PADDING)
        }), 
        Votes = v2.createElement(l_Votes_0, {
            Voting = {
                UpVotes = l_props_0.voting.UpVotes, 
                DownVotes = l_props_0.voting.DownVotes, 
                VoteCount = l_props_0.voting.VoteCount, 
                UpVotePercent = l_props_0.voting.UpVotePercent
            }, 
            TextSize = v4.ASSET_VOTE_COUNT_FONT_SIZE, 
            AutomaticSize = Enum.AutomaticSize.X, 
            Font = v4.FONT, 
            Size = UDim2.new(0, 0, 0, 0), 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            Padding = v4.ASSET_VOTE_COUNT_HORIZONTAL_PADDING, 
            IncludeVoteCount = true, 
            VoteCountHeight = v4.ASSET_VOTE_COUNT_HEIGHT
        })
    });
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer
})(v8));
