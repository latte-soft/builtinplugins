local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Core.Util.SharedFlags.getFFlagToolboxEnableSearchOptionsRefactor);
local v2 = require(l_Parent_0.Packages.Rodux);
local v3 = require(l_Parent_0.Core.Util.DebugFlags);
local l_Reducers_0 = l_Parent_0.Core.Reducers;
local v5 = require(l_Reducers_0.Assets);
local v6 = require(l_Reducers_0.Dialog);
local v7 = require(l_Reducers_0.Groups);
local v8 = require(l_Reducers_0.Autocomplete);
local v9 = require(l_Reducers_0.NetworkErrors);
local v10 = require(l_Reducers_0.PageInfo);
local v11 = require(l_Reducers_0.ReducerLogger);
local v12 = v2.combineReducers({
    assets = v5, 
    autocompleteResults = v8, 
    dialog = v6, 
    groups = if not v1() then nil else v7, 
    homeConfiguration = require(l_Reducers_0.HomeConfiguration), 
    networkErrors = v9, 
    pageInfo = v10, 
    sound = require(l_Reducers_0.Sound), 
    voting = require(l_Reducers_0.VotingReducer), 
    liveSearch = require(l_Reducers_0.LiveSearch), 
    favorite = require(l_Reducers_0.Favorite), 
    roles = require(l_Reducers_0.RolesReducer), 
    itemTags = require(l_Reducers_0.ItemTagsReducer), 
    purchase = require(l_Reducers_0.Purchase), 
    packages = require(l_Reducers_0.Packages), 
    tryInStudio = require(l_Reducers_0.TryInStudio), 
    tutorialLimits = require(l_Reducers_0.TutorialLimitsReducer)
});
return function(v13, v14)
    if not v3.shouldDebugState() then
        return v12(v13, v14);
    else
        return v11(v12, v13, v14);
    end;
end;
