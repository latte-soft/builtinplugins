local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v2.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v5 = require(l_Parent_0.Src.Components.TextInput);
local l_RadioButtonList_0 = v2.UI.RadioButtonList;
local l_INPUT_PANE_LAYOUT_0 = require(l_Parent_0.Src.Util.Constants).INPUT_PANE_LAYOUT;
local v8 = v1.PureComponent:extend("ThemeView");
local v9 = {
    Routes = {}, 
    SelectedKey = "", 
    ThemeName = "", 
    FocusLost = function()
    end
};
v8.init = function(v10)
    v10.state = {
        SelectedKey = nil
    };
    v10.OnClick = function(v11)
        v10:setState({
            SelectedKey = v11
        });
    end;
    v10.createRoutes = function()
        local v12 = {};
        for v13, v14 in pairs(v9.Routes) do
            table.insert(v12, {
                Key = v14, 
                Text = "Use " .. v13
            });
        end;
        return v12;
    end;
end;
v8.render = function(v15)
    return v1.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        LayoutOrder = l_INPUT_PANE_LAYOUT_0.View, 
        BackgroundTransparency = 1, 
        ZIndex = -5
    }, {
        Layout = v1.createElement("UIListLayout", v15.props.Stylizer.Layout.Vertical), 
        TextInput = v1.createElement(v5, {
            Label = "Theme Name", 
            Text = v9.ThemeName, 
            OnChange = v9.FocusLost, 
            LayoutOrder = 1
        }), 
        Switch = v1.createElement(l_RadioButtonList_0, {
            Buttons = v15.createRoutes(), 
            OnClick = v15.OnClick, 
            SelectedKey = v15.state.SelectedKey, 
            LayoutOrder = 2
        })
    });
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer
})(v8));
