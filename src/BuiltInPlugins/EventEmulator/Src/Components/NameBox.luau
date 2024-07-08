local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.RoactRodux);
local l_ContextServices_0 = require(l_Parent_0.Packages.Framework).ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v5 = require(l_Parent_0.Src.Components.TextInput);
local v6 = require(l_Parent_0.Src.Actions.ChangeCurrentEventName);
local l_INPUT_PANE_LAYOUT_0 = require(l_Parent_0.Src.Util.Constants).INPUT_PANE_LAYOUT;
local v8 = v1.PureComponent:extend("NameBox");
v8.init = function(v9)
    v9.OnChange = function(v10)
        v9.props.ChangeCurrentEventName(v10);
    end;
end;
v8.render = function(v11)
    return v1.createElement(v5, {
        Label = "Name", 
        Text = v11.props.CurrentEventName, 
        LayoutOrder = l_INPUT_PANE_LAYOUT_0.NameBox, 
        OnChange = v11.OnChange
    });
end;
return v2.connect(function(v12, _)
    return {
        CurrentEventName = v12.Status.CurrentEventName
    };
end, function(v14)
    return {
        ChangeCurrentEventName = function(v15)
            v14(v6(v15));
        end
    };
end)((l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer
})(v8)));
