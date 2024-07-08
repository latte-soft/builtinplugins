local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v2.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Localization_0 = l_ContextServices_0.Localization;
local l_UI_0 = v2.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_SimpleExpandablePane_0 = l_UI_0.SimpleExpandablePane;
local l_Slider_0 = l_UI_0.Slider;
local l_Checkbox_0 = l_UI_0.Checkbox;
local v11 = v1.PureComponent:extend("GraphicsPane");
local l_UserGameSettings_0 = UserSettings():GetService("UserGameSettings");
local l_Rendering_0 = settings().Rendering;
local l_l_UserGameSettings_0_PropertyChangedSignal_0 = l_UserGameSettings_0:GetPropertyChangedSignal("SavedQualityLevel");
local l_l_UserGameSettings_0_PropertyChangedSignal_1 = l_UserGameSettings_0:GetPropertyChangedSignal("GraphicsQualityLevel");
local v16 = l_Rendering_0:GetMaxQualityLevel() - 1;
v11.init = function(v17, _)
    v17.state = {
        graphicsQuality = l_UserGameSettings_0.GraphicsQualityLevel, 
        graphicsQualityAutoMode = l_UserGameSettings_0.GraphicsQualityLevel == 0
    };
    v17.setGraphicsQuality = function(v19)
        local v20 = math.clamp(v19, 1, v16);
        local l_GraphicsQualityLevel_0 = l_UserGameSettings_0.GraphicsQualityLevel;
        l_UserGameSettings_0.GraphicsQualityLevel = v20;
        l_Rendering_0.QualityLevel = v20;
        return v20, v20 - l_GraphicsQualityLevel_0;
    end;
    v17.toggleGraphicsQualityAutomatic = function()
        local v22 = not v17.state.graphicsQualityAutoMode;
        if not v22 then
            l_UserGameSettings_0.GraphicsQualityLevel = v17.state.graphicsQuality;
            l_Rendering_0.QualityLevel = v17.state.graphicsQuality;
        else
            l_UserGameSettings_0.GraphicsQualityLevel = 0;
            l_Rendering_0.QualityLevel = 0;
        end;
        v17:setState({
            graphicsQualityAutoMode = v22
        });
    end;
    local function v24()
        local l_GraphicsQualityLevel_1 = l_UserGameSettings_0.GraphicsQualityLevel;
        if l_GraphicsQualityLevel_1 ~= 0 then
            v17:setState({
                graphicsQuality = l_GraphicsQualityLevel_1
            });
        end;
        v17:setState({
            graphicsQualityAutoMode = l_GraphicsQualityLevel_1 == 0
        });
    end;
    v17.graphicsQualityLevelChangedConnection = l_l_UserGameSettings_0_PropertyChangedSignal_1:Connect(v24);
    v17.savedQualityLevelChangedConnection = l_l_UserGameSettings_0_PropertyChangedSignal_0:Connect(v24);
end;
v11.willUnmount = function(v25)
    v25.graphicsQualityLevelChangedConnection:Disconnect();
    v25.savedQualityLevelChangedConnection:Disconnect();
end;
v11.render = function(v26)
    local l_props_0 = v26.props;
    local l_state_0 = v26.state;
    local l_Localization_1 = l_props_0.Localization;
    return v1.createElement(l_Pane_0, {
        AutomaticSize = Enum.AutomaticSize.Y, 
        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
        Layout = Enum.FillDirection.Vertical, 
        Padding = 10, 
        Spacing = 10
    }, {
        GraphicsQualityPane = v1.createElement(l_SimpleExpandablePane_0, {
            AutomaticSize = Enum.AutomaticSize.Y, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            Layout = Enum.FillDirection.Vertical, 
            AlwaysExpanded = true, 
            LayoutOrder = 1, 
            Style = "Box", 
            Text = l_Localization_1:getText("GraphicsQuality", "GraphicsQualityLabel")
        }, {
            v1.createElement(l_Slider_0, {
                AnchorPoint = Vector2.new(0, 0.5), 
                Disabled = l_state_0.graphicsQualityAutoMode, 
                Value = l_state_0.graphicsQuality, 
                Min = 0, 
                Max = v16, 
                OnValueChanged = v26.setGraphicsQuality, 
                Size = UDim2.new(0, 200, 0, 20), 
                Padding = UDim.new(10, 10), 
                SnapIncrement = 1, 
                VerticalDragTolerance = 0
            }), 
            v1.createElement(l_Checkbox_0, {
                Checked = l_state_0.graphicsQualityAutoMode, 
                Key = "graphicsQualityAutoMode", 
                OnClick = v26.toggleGraphicsQualityAutomatic, 
                Text = l_Localization_1:getText("GraphicsQuality", "AutoGraphicsQualityLabel")
            })
        })
    });
end;
return (l_withContext_0({
    Localization = l_Localization_0, 
    Stylizer = l_ContextServices_0.Stylizer
})(v11));
