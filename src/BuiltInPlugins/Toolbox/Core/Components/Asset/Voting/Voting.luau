local l_Parent_0 = script.Parent.Parent.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v2 = require(l_Packages_0.Framework);
local v3 = require(l_Packages_0.Roact);
local v4 = require(l_Parent_0.Core.Util.Constants);
local v5 = require(l_Parent_0.Core.Components.Asset.Voting.VoteBar);
local v6 = require(l_Parent_0.Core.Components.Asset.Voting.VoteButtons);
local l_LoadingIndicator_0 = v2.UI.LoadingIndicator;
return function(v8)
    local v9 = v8.LayoutOrder or 0;
    local l_ShowVotes_0 = v8.voting.ShowVotes;
    local v11 = v8.voting.showVoteButtons or false;
    local l_VoteLoading_0 = v8.voting.VoteLoading;
    local v13 = {};
    if l_ShowVotes_0 then
        if not l_VoteLoading_0 then
            if not v11 then
                v13.VoteBar = v3.createElement(v5, v8);
            else
                v13.VoteButtons = v3.createElement(v6, v8);
            end;
        else
            v13.VoteLoading = v3.createElement(l_LoadingIndicator_0, {
                Size = UDim2.new(0.333, 0, 0.333, 0)
            });
            v13.UIListLayout = v3.createElement("UIListLayout", {
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                VerticalAlignment = Enum.VerticalAlignment.Center
            });
        end;
    end;
    return v3.createElement("Frame", {
        BackgroundTransparency = 1, 
        LayoutOrder = v9, 
        Size = UDim2.new(1, 0, 0, if not v11 then v4.ASSET_VOTE_COUNT_HEIGHT else v4.ASSET_VOTING_BUTTONS_HEIGHT)
    }, v13);
end;
