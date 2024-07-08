local v0 = require(script.Parent.Parent.Parent.Src.Actions.SetControlsPanelBlockerActivity);
return function(_)
    return function(v2)
        v2:dispatch(v0(false));
    end;
end;
