local l_Packages_0 = script.Parent.Parent.Parent.Parent.Packages;
local v1 = require(l_Packages_0.Roact);
local l_withForwardRef_0 = require(l_Packages_0.Framework).Wrappers.withForwardRef;
local function _(v3)
    local v4 = v3.Title or "";
    local v5 = v3.Name or v4:gsub("%s", "");
    return v4, v5, v3.Id or v5;
end;
return function(v7, v8)
    local v9 = v1.PureComponent:extend(v7);
    v9.init = function(v10, v11)
        v10.state = {
            pluginGui = nil
        };
        local v12 = v11.Title or "";
        local v13 = v11.Name or v12:gsub("%s", "");
        local v14 = v11.Id or v13;
        local l_v12_0 = v12;
        local l_v13_0 = v13;
        v10.widget = v8(v10, v14);
        v10.widget.Title = l_v12_0;
        v10.widget.Name = l_v13_0;
        v10.widget.ZIndexBehavior = v11.ZIndexBehavior or Enum.ZIndexBehavior.Global;
        v10.widget:GetPropertyChangedSignal("Enabled"):connect(function(...)
            if v10.props[v1.Change.Enabled] then
                v10.props[v1.Change.Enabled](v10.widget, ...);
            end;
        end);
        v10.widget.AncestryChanged:connect(function(...)
            if v10.props[v1.Event.AncestryChanged] then
                v10.props[v1.Event.AncestryChanged](v10.widget, ...);
            end;
        end);
        v12 = v11.ForwardRef;
        if v12 then
            v12(v10.widget);
        end;
    end;
    v9.didUpdate = function(v17, v18, _)
        local v20 = v18.Title or "";
        local v21 = v18.Name or v20:gsub("%s", "");
        local v22 = v18.Id or v21;
        local l_v20_0 = v20;
        local l_v21_0 = v21;
        local _ = v22;
        local l_props_0 = v17.props;
        local v27 = l_props_0.Title or "";
        local v28 = l_props_0.Name or v27:gsub("%s", "");
        local v29 = l_props_0.Id or v28;
        v20 = v27;
        v21 = v28;
        v22 = v29;
        if v20 ~= l_v20_0 then
            v17.widget.Title = v20;
        end;
        if v21 ~= l_v21_0 then
            v17.widget.Name = v21;
        end;
        if v17.props.ZIndexBehavior ~= v18.ZIndexBehavior then
            v17.widget.ZIndexBehavior = v17.props.ZIndexBehavior;
        end;
        if v17.props.Enabled ~= v18.Enabled then
            v17.widget.Enabled = v17.props.Enabled;
        end;
    end;
    v9.render = function(v30)
        return v1.createElement(v1.Portal, {
            target = v30.widget
        }, v30.props[v1.Children]);
    end;
    v9.didMount = function(v31)
        v31:setState({
            pluginGui = v31.widget
        });
    end;
    v9.willUnmount = function(v32)
        if v32.widget then
            v32.widget:Destroy();
        end;
    end;
    return (l_withForwardRef_0(v9));
end;
