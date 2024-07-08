local l_script_FirstAncestor_0 = script:FindFirstAncestor("CompositorDebugger");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Packages.RoactRodux);
local v3 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Selection_0 = game:GetService("Selection");
local v7 = v1.PureComponent:extend("InstanceSelector");
v3.Util.Typecheck.wrap(v7, script);
v7.didMount = function(v8)
    local l_props_0 = v8.props;
    local l_IsSelectedInstanceValid_0 = l_props_0.IsSelectedInstanceValid;
    local l_OnValidSelection_0 = l_props_0.OnValidSelection;
    local l_OnInvalidSelection_0 = l_props_0.OnInvalidSelection;
    v8.SelectionChangedHandle = l_Selection_0.SelectionChanged:Connect(function()
        local l_Actor_0 = v8.props.Actor;
        if #l_Selection_0:Get() == 1 then
            local v14 = l_Selection_0:Get()[1];
            if v14 ~= l_Actor_0 then
                if not l_IsSelectedInstanceValid_0(v14) then
                    l_OnInvalidSelection_0(v14);
                else
                    l_OnValidSelection_0(v14);
                    return ;
                end;
            end;
        end;
    end);
end;
v7.willUnmount = function(v15)
    if v15.SelectionChangedHandle then
        v15.SelectionChangedHandle:Disconnect();
    end;
end;
v7.render = function(_)
    return nil;
end;
v7 = l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer, 
    Localization = l_ContextServices_0.Localization, 
    Mouse = l_ContextServices_0.Mouse, 
    Plugin = l_ContextServices_0.Plugin
})(v7);
InstancSelector = v2.connect(function(v17, _)
    return {
        Actor = v17.Status.Actor
    };
end, function(_)
    return {};
end)(v7);
return v7;
