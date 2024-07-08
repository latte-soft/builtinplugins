local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Rodux);
local v2 = require(l_Parent_0.Src.Reducers.RecordTabReducer);
local v3 = require(l_Parent_0.Src.Reducers.PlaybackTabReducer);
local v4 = require(l_Parent_0.Src.Reducers.EventTypeEnabledReducer);
return (v1.combineReducers({
    recordTab = v2, 
    recordTabFilter = v4.makeReducerForName("recordTabFilter"), 
    playbackTab = v3, 
    playbackTabFilter = v4.makeReducerForName("playbackTabFilter"), 
    common = require(l_Parent_0.Src.Reducers.CommonReducer)
}));
