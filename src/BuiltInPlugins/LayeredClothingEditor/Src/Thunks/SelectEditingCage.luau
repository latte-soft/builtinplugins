local v0 = require(script.Parent.Parent.Parent.Src.Actions.SetEditingCage);
return function(v1)
    return function(v2)
        if v2:getState().selectItem.editingCage ~= v1 then
            v2:dispatch(v0(v1));
        end;
    end;
end;
