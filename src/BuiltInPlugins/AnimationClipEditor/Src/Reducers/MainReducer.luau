local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
return require(l_script_FirstAncestor_0.Packages.Rodux).combineReducers({
    Status = require(l_script_FirstAncestor_0.Src.Reducers.Status), 
    AnimationData = require(l_script_FirstAncestor_0.Src.Reducers.AnimationData), 
    History = require(l_script_FirstAncestor_0.Src.Reducers.History), 
    Notifications = require(l_script_FirstAncestor_0.Src.Reducers.Notifications)
});
