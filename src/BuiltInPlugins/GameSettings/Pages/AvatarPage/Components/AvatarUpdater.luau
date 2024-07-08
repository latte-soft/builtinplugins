local l_Parent_0 = script.Parent.Parent;
local v1 = require(script.Parent.Parent.Parent.Parent.Packages.Roact);
local v2 = require(l_Parent_0.Util.LifetimeManagerAvatar);
local v3 = v1.Component:extend("ComponentAvatarUpdater");
v3.applyRigUpdates = function(v4)
    if not (not v4.props.StateTemplates or not v4.props.StateTemplates.templates) then
        v2.apply(v4.props.StateTemplates.templates);
    end;
end;
v3.didMount = function(v5)
    v5:applyRigUpdates();
end;
v3.render = function(_)
    return nil;
end;
v3.didUpdate = function(v7)
    v7:applyRigUpdates();
end;
v3.willUnmount = function(_)
    v2:destroy();
end;
return v3;
