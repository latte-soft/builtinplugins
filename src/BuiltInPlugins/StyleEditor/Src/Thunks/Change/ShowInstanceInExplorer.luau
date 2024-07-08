local l_Selection_0 = game:GetService("Selection");
local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local _ = require(l_Parent_0.Src.Reducers.RootReducer);
local _ = require(l_Parent_0.Src.Thunks.Types);
return function(v4)
    return function(_, _)
        l_Selection_0:Set({
            v4
        });
    end;
end;
