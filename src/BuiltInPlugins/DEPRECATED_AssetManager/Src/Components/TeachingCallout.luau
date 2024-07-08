local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local l_withContext_0 = require(l_Parent_0.Packages.Framework).ContextServices.withContext;
local v3 = require(l_Parent_0.Src.Util.CalloutController);
local v4 = v1.PureComponent:extend("TeachingCallout");
v4.init = function(v5)
    v5.targetRef = v1.createRef();
end;
v4.didMount = function(v6)
    v6._isMounted = true;
    spawn(function()
        if not (not v6._isMounted or not v6.targetRef) and v6.targetRef.current then
            v6._attachedDefinitionId = v6.props.DefinitionId;
            v6.props.CalloutController:attachCallout(v6._attachedDefinitionId, v6.props.LocationId, v6.targetRef.current);
            return ;
        else
            return ;
        end;
    end);
end;
v4.willUnmount = function(v7)
    v7._isMounted = false;
    if v7._attachedDefinitionId then
        v7.props.CalloutController:detachCalloutsByDefinitionId(v7._attachedDefinitionId);
    end;
end;
v4.render = function(v8)
    local v9 = v8.props.Offset or Vector2.new(0, 0);
    return v1.createElement("Frame", {
        BackgroundTransparency = 1, 
        Position = UDim2.new(0, v9.X, 0, v9.Y), 
        Size = UDim2.new(1, 0, 1, 0), 
        [v1.Ref] = v8.targetRef
    });
end;
return (l_withContext_0({
    CalloutController = v3
})(v4));
