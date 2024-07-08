local l_script_FirstAncestor_0 = script:FindFirstAncestor("R15Migrator");
local v1 = require(l_script_FirstAncestor_0.Packages.Roact);
local v2 = require(l_script_FirstAncestor_0.Packages.Cryo);
local v3 = require(l_script_FirstAncestor_0.Packages.Dash);
local v4 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_omit_0 = v3.omit;
local l_ContextServices_0 = v4.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_UI_0 = v4.UI;
local l_CaptureFocus_0 = l_UI_0.CaptureFocus;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_Pane_0 = l_UI_0.Pane;
local l_FakeLoadingBar_0 = l_UI_0.FakeLoadingBar;
local l_LoadingBar_0 = l_UI_0.LoadingBar;
local l_LayoutOrderIterator_0 = v4.Util.LayoutOrderIterator;
local v15 = v1.PureComponent:extend("ProgressBar");
v15.renderFakeLoadingBar = function(v16, v17)
    local l_props_0 = v16.props;
    return v1.createElement(l_FakeLoadingBar_0, (v2.Dictionary.join(l_omit_0(l_props_0.FakeLoadProps, "OnFakeLoadCompleted"), {
        Size = UDim2.new(1, 0, 0, l_props_0.Stylizer.BarHeight), 
        LayoutOrder = v17
    })));
end;
v15.renderLoadingBar = function(v19, v20)
    local l_props_1 = v19.props;
    return v1.createElement(l_LoadingBar_0, {
        Size = UDim2.new(1, 0, 0, l_props_1.Stylizer.BarHeight), 
        LayoutOrder = v20, 
        Progress = l_props_1.Progress
    });
end;
v15.render = function(v22)
    local l_props_2 = v22.props;
    local l_Text_0 = l_props_2.Text;
    local l_FakeLoadProps_0 = l_props_2.FakeLoadProps;
    local l_Stylizer_0 = l_props_2.Stylizer;
    local v27 = l_LayoutOrderIterator_0.new();
    return v1.createElement(l_CaptureFocus_0, {
        OnFocusLost = function()
        end
    }, {
        Pane = v1.createElement(l_Pane_0, {
            BackgroundColor3 = l_Stylizer_0.BackgroundColor, 
            BackgroundTransparency = l_Stylizer_0.BackgroundTransparency, 
            Layout = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            Padding = l_Stylizer_0.Padding
        }, {
            Text = v1.createElement(l_TextLabel_0, {
                AutomaticSize = Enum.AutomaticSize.XY, 
                BackgroundTransparency = 1, 
                TextSize = l_Stylizer_0.TextSize, 
                Text = l_Text_0, 
                TextWrapped = true, 
                LayoutOrder = v27:getNextOrder()
            }), 
            ProgressBar = if not l_FakeLoadProps_0 then v22:renderLoadingBar(v27:getNextOrder()) else v22:renderFakeLoadingBar(v27:getNextOrder())
        })
    });
end;
v15.didUpdate = function(v28, v29, _)
    local l_FakeLoadProps_1 = v29.FakeLoadProps;
    local l_FakeLoadProps_2 = v28.props.FakeLoadProps;
    if l_FakeLoadProps_2 and l_FakeLoadProps_2.Completed then
        if not (not (not l_FakeLoadProps_1 or l_FakeLoadProps_1.Completed ~= l_FakeLoadProps_2.Completed) or not l_FakeLoadProps_2.OnFakeLoadCompleted) then
            l_FakeLoadProps_2.OnFakeLoadCompleted();
        end;
        return ;
    else
        return ;
    end;
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer
})(v15));
