local v0 = require(script.Parent.Parent.Parent.Parent.Core.Actions.ResumePreviewSound);
return function()
    return function(v1)
        v1:dispatch(v0());
    end;
end;
