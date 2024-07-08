local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.RoactRodux);
local v3 = require(l_Parent_0.Packages.Framework);
local v4 = require(script.Parent.TargetTree);
local v5 = require(l_Parent_0.Src.Util.TabIds);
local v6 = require(l_Parent_0.Src.Components.RoactInspectorView);
local v7 = require(l_Parent_0.Src.Components.RoactProfilerView);
local v8 = require(l_Parent_0.Src.Components.TopBar);
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_UI_0 = v3.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_TextLabel_0 = l_UI_0.TextLabel;
local v14 = v1.PureComponent:extend("MainView");
v14.render = function(v15)
    local l_props_0 = v15.props;
    return not not l_props_0.SelectedTarget and v15:renderTarget(l_props_0) or v15:renderSelectTarget(l_props_0);
end;
v14.renderSelectTarget = function(v17, v18)
    local l_Stylizer_0 = v18.Stylizer;
    return v1.createElement(l_Pane_0, {
        Style = "SubtleBox", 
        Layout = Enum.FillDirection.Vertical, 
        Padding = l_Stylizer_0.Padding
    }, {
        Label = v1.createElement(l_TextLabel_0, {
            LayoutOrder = 1, 
            Text = "Roact Trees", 
            Size = UDim2.new(1, 0, 0, l_Stylizer_0.HeaderHeight), 
            TextXAlignment = Enum.TextXAlignment.Left
        }), 
        TargetTree = v1.createElement(l_Pane_0, {
            LayoutOrder = 2, 
            Size = UDim2.new(1, 0, 1, -l_Stylizer_0.HeaderHeight)
        }, {
            Child = v1.createElement(v4, {
                selectTarget = v17.selectTarget
            })
        })
    });
end;
v14.renderTarget = function(_, v21)
    local l_Stylizer_1 = v21.Stylizer;
    local v23 = nil;
    if v21.SelectedTab.Id == v5.ELEMENTS then
        v23 = v1.createElement(v6, {});
    elseif v21.SelectedTab.Id == v5.PROFILE then
        v23 = v1.createElement(v7, {});
    else
        error({
            name = "Missing tab", 
            tab = v21.SelectedTab
        });
    end;
    return v1.createElement(l_Pane_0, {
        Layout = Enum.FillDirection.Vertical, 
        Style = "Box"
    }, {
        TopBar = v1.createElement(v8, {
            Active = v21.Active
        }), 
        Content = v1.createElement(l_Pane_0, {
            LayoutOrder = 2, 
            Size = UDim2.new(1, 0, 1, -l_Stylizer_1.HeaderHeight)
        }, {
            Child = v23
        })
    });
end;
return v2.connect(function(v24, _)
    return {
        SelectedTab = v24.Targets.selectedTab, 
        SelectedTarget = v24.Targets.selectedTarget
    };
end)((l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer
})(v14)));
