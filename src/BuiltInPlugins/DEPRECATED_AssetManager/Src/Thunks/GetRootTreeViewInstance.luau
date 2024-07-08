local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Src.Util.PreviewModelGetter);
local v2 = require(l_Parent_0.Src.Actions.SetRootTreeViewInstance);
return function(v3, v4)
    return function(v5)
        return v1(v3, v4):andThen(function(v6)
            if type(v6) == "string" then
                v5:dispatch(v2(v3, nil));
                return ;
            else
                v5:dispatch(v2(v3, v6));
                return ;
            end;
        end);
    end;
end;
