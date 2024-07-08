local v0 = require(script.Parent.Parent.Parent.Packages.Framework).ContextServices.ContextItem:extend("CalloutController");
v0.new = function(v1)
    local v2 = {
        _calloutService = v1 or game:GetService("CalloutService")
    };
    assert(v2._calloutService, "CalloutController requires a CalloutService");
    return (setmetatable(v2, v0));
end;
v0.defineCallout = function(v3, v4, v5, v6, v7)
    v3._calloutService:DefineCallout(v4, v5, v6, v7);
end;
v0.attachCallout = function(v8, v9, v10, v11)
    v8._calloutService:AttachCallout(v9, v10, v11);
end;
v0.detachCalloutsByDefinitionId = function(v12, v13)
    v12._calloutService:DetachCalloutsByDefinitionId(v13);
end;
return v0;
