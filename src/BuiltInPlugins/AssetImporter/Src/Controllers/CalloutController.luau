local v0 = require(script:FindFirstAncestor("AssetImporter").Packages.Framework).ContextServices.ContextItem:extend("CalloutController");
v0.new = function(v1)
    local v2 = {
        _calloutService = v1 or game:GetService("CalloutService")
    };
    assert(v2._calloutService, "CalloutController requires a CalloutService");
    return (setmetatable(v2, v0));
end;
v0.destroy = function(v3)
    v3._calloutService = nil;
end;
v0.defineCallout = function(v4, v5, v6, v7, v8)
    v4._calloutService:DefineCallout(v5, v6, v7, v8);
end;
v0.attachCallout = function(v9, v10, v11, v12)
    v9._calloutService:AttachCallout(v10, v11, v12);
end;
v0.detachCalloutsByDefinitionId = function(v13, v14)
    v13._calloutService:DetachCalloutsByDefinitionId(v14);
end;
return v0;
