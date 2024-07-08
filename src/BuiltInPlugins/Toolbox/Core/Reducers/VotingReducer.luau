local l_Parent_0 = script.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v2 = require(l_Packages_0.Cryo);
local v3 = require(l_Packages_0.Rodux);
local v4 = require(l_Parent_0.Core.Actions.GetAssets);
local v5 = require(l_Parent_0.Core.Actions.GetVote);
local v6 = require(l_Parent_0.Core.Actions.GetAssetsVotingData);
local v7 = require(l_Parent_0.Core.Actions.PostInsertAsset);
local v8 = require(l_Parent_0.Core.Actions.PostUnvote);
local v9 = require(l_Parent_0.Core.Actions.PostVote);
local v10 = require(l_Parent_0.Core.Actions.SetVoteLoading);
local function v15(v11, v12, v13)
    local v14 = v13 ~= nil;
    return v2.Dictionary.join(v11, {
        [v12] = v2.Dictionary.join(v11[v12], {
            HasVoted = v14, 
            UserVote = v13, 
            showVoteButtons = v14
        })
    });
end;
local function v23(v16, v17, v18)
    local v19 = v16[v17];
    local l_UpVotes_0 = v19.UpVotes;
    local l_DownVotes_0 = v19.DownVotes;
    local l_VoteCount_0 = v19.VoteCount;
    if not v18 then
        if not (not v19.HasVoted or not v19.UserVote) then
            l_UpVotes_0 = v19.UpVotes - 1;
            l_VoteCount_0 = l_VoteCount_0 - 1;
        end;
        l_DownVotes_0 = v19.DownVotes + 1;
        l_VoteCount_0 = l_VoteCount_0 + 1;
    else
        if not (not v19.HasVoted or v19.UserVote) then
            l_DownVotes_0 = v19.DownVotes - 1;
            l_VoteCount_0 = l_VoteCount_0 - 1;
        end;
        l_UpVotes_0 = v19.UpVotes + 1;
        l_VoteCount_0 = l_VoteCount_0 + 1;
    end;
    return v2.Dictionary.join(v16, {
        [v17] = v2.Dictionary.join(v16[v17], {
            HasVoted = true, 
            UserVote = v18, 
            UpVotes = l_UpVotes_0, 
            DownVotes = l_DownVotes_0, 
            VoteCount = v19.VoteCount, 
            showVoteButtons = true
        })
    });
end;
local function v30(v24, v25)
    local v26 = v24[v25];
    local l_UpVotes_1 = v26.UpVotes;
    local l_DownVotes_1 = v26.DownVotes;
    local l_VoteCount_1 = v26.VoteCount;
    if v26.HasVoted then
        if v26.UserVote == true then
            l_UpVotes_1 = l_UpVotes_1 - 1;
        else
            l_DownVotes_1 = l_DownVotes_1 - 1;
        end;
        l_VoteCount_1 = l_VoteCount_1 - 1;
    end;
    return v2.Dictionary.join(v24, {
        [v25] = v2.Dictionary.join(v24[v25], {
            HasVoted = false, 
            UserVote = v2.None, 
            UpVotes = l_UpVotes_1, 
            DownVotes = l_DownVotes_1, 
            VoteCount = v26.VoteCount
        })
    });
end;
local function v33(v31, v32)
    return v2.Dictionary.join(v31, {
        [v32] = v2.Dictionary.join(v31[v32] or {}, {
            showVoteButtons = true
        })
    });
end;
local function v38(v34, v35, v36, v37)
    return v2.Dictionary.join(v34, {
        [v35] = v2.Dictionary.join(v34[v35] or {}, {
            VoteLoading = v36, 
            VoteFetchAttempted = v37
        })
    });
end;
local function v45(v39, v40)
    local v41 = {};
    for _, v43 in ipairs(v40.assets) do
        local _ = v39[v43.Asset.Id];
        v41[v43.Asset.Id] = v43.Voting;
    end;
    return v2.Dictionary.join(v39, v41);
end;
return v3.createReducer({}, {
    [v4.name] = function(v46, v47)
        return v45(v46, v47);
    end, 
    [v6.name] = function(v48, v49)
        return v45(v48, v49);
    end, 
    [v7.name] = function(v50, v51)
        return v33(v50, v51.assetId);
    end, 
    [v5.name] = function(v52, v53)
        return v15(v52, v53.assetId, v53.userVote);
    end, 
    [v9.name] = function(v54, v55)
        return v23(v54, v55.assetId, v55.userVote);
    end, 
    [v8.name] = function(v56, v57)
        return v30(v56, v57.assetId);
    end, 
    [v10.name] = function(v58, v59)
        return v38(v58, v59.AssetId, v59.VoteLoading, v59.VoteFetchAttempted);
    end
});
