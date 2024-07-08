local v0 = require(script:FindFirstAncestor("AnimationClipEditor").Packages.Roact);
local function _(v1)
    local v2 = v1.Title or "";
    local v3 = v1.Name or v2:gsub("%s", "");
    return v2, v3, v1.Id or v3;
end;
return function(v5, v6)
    local v7 = v0.PureComponent:extend(v5);
    v7.init = function(v8, v9)
        local v10 = v9.Title or "";
        local v11 = v9.Name or v10:gsub("%s", "");
        local v12 = v9.Id or v11;
        local l_v10_0 = v10;
        local l_v11_0 = v11;
        v8.widget = v6(v8, v12);
        if v8.widget:IsA("PluginGui") then
            v8.widget.Title = l_v10_0;
        end;
        v8.widget.Name = l_v11_0;
        v8.widget.ZIndexBehavior = v9.ZIndexBehavior or Enum.ZIndexBehavior.Global;
        if v8.props[v0.Ref] then
            v8.props[v0.Ref](v8.widget);
        end;
        if v8.props[v0.Change.Enabled] then
            v8.changedConnection = v8.widget:GetPropertyChangedSignal("Enabled"):Connect(function()
                v8.props[v0.Change.Enabled](v8.widget.Enabled);
            end);
        end;
    end;
    v7.didUpdate = function(v15, v16, _)
        local v18 = v16.Title or "";
        local v19 = v16.Name or v18:gsub("%s", "");
        local v20 = v16.Id or v19;
        local l_v18_0 = v18;
        local l_v19_0 = v19;
        local _ = v20;
        local l_props_0 = v15.props;
        local v25 = l_props_0.Title or "";
        local v26 = l_props_0.Name or v25:gsub("%s", "");
        local v27 = l_props_0.Id or v26;
        v18 = v25;
        v19 = v26;
        v20 = v27;
        if not (not (v18 ~= l_v18_0) or not v15.widget:IsA("PluginGui")) then
            v15.widget.Title = v18;
        end;
        if v19 ~= l_v19_0 then
            v15.widget.Name = v19;
        end;
        if v15.props.ZIndexBehavior ~= v16.ZIndexBehavior then
            v15.widget.ZIndexBehavior = v15.props.ZIndexBehavior;
        end;
        if v15.props.Enabled ~= v16.Enabled then
            v15.widget.Enabled = v15.props.Enabled;
        end;
    end;
    v7.render = function(v28)
        return v0.createElement(v0.Portal, {
            target = v28.widget
        }, v28.props[v0.Children]);
    end;
    v7.willUnmount = function(v29)
        if v29.changedConnection then
            v29.changedConnection:Disconnect();
        end;
        if v29.widget then
            v29.widget:Destroy();
        end;
    end;
    return v7;
end;
