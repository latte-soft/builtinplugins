local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.React);
local l_withContext_0 = require(l_Parent_0.Packages.Framework).ContextServices.withContext;
local v3 = v1.PureComponent:extend("SignalListener");
v3.init = function(v4)
    local l_props_0 = v4.props;
    v4.state = {
        connection = l_props_0.signal:Connect(l_props_0.callback)
    };
end;
v3.willUnmount = function(v6)
    if v6.state.connection ~= nil then
        v6.state.connection:Disconnect();
    end;
end;
v3.render = function(_)
    return nil;
end;
return (l_withContext_0({})(v3));
