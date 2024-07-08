local v0 = {};
v0.__index = v0;
v0.new = function(v1, v2)
    return (setmetatable({
        _handler = v2, 
        _draggerContext = v1, 
        _boundsChanged = v2
    }, v0));
end;
v0.install = function(v3)
    v3._scrubberChangedConnection = v3._draggerContext.ScrubberSignal:Connect(v3._boundsChanged);
end;
v0.uninstall = function(v4)
    v4._scrubberChangedConnection:Disconnect();
end;
v0.setSelection = function(_, _)
end;
return v0;
