local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.RoactRodux);
local v3 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Actions_0 = l_Parent_0.Src.Actions;
local v7 = require(l_Actions_0.SetView);
local v8 = require(l_Actions_0.ChangeCurrentEventName);
local l_VIEW_ID_0 = require(l_Parent_0.Src.Util.Constants).VIEW_ID;
local l_SelectInput_0 = v3.UI.SelectInput;
local v11 = v1.PureComponent:extend("Dropdown");
v11.init = function(v12)
    v12.selectItem = function(v13)
        v12.props.SetView(v13);
        v12.props.ChangeCurrentEventName(v13);
    end;
    v12.toggle = function()
        v12:setState({
            isOpen = not v12.state.isOpen
        });
    end;
    v12.Items = (function(_)
        local v15 = {};
        for _, v17 in pairs(l_VIEW_ID_0) do
            table.insert(v15, (tostring(v17)));
        end;
        return v15;
    end)(l_VIEW_ID_0);
end;
v11.render = function(v18)
    return v1.createElement(l_SelectInput_0, {
        OnItemActivated = v18.selectItem, 
        PlaceholderText = v18.props.ActiveView, 
        Items = v18.Items
    });
end;
return v2.connect(function(v19, _)
    return {
        ActiveView = v19.Status.ActiveView
    };
end, function(v21)
    return {
        SetView = function(v22)
            v21(v7(v22));
        end, 
        ChangeCurrentEventName = function(v23)
            v21(v8(v23));
        end
    };
end)((l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer
})(v11)));
