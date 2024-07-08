local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Src.Actions.SessionStats.PluginFocusStart);
local _ = require(l_Parent_0.Src.Types);
local _ = require(l_Parent_0.Src.Reducers.RootReducer);
local _ = require(l_Parent_0.Src.Thunks.Types);
return function()
    return function(v5, _)
        v5:dispatch(v1((os.time())));
    end;
end;
