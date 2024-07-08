local l_Parent_0 = script.Parent.Parent.Parent.Parent.Parent;
local _ = require(l_Parent_0.Src.Types);
local v2 = require(l_Parent_0.Packages.Roact);
local v3 = require(l_Parent_0.Packages.RoactRodux);
local v4 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v4.ContextServices;
local l_Localization_0 = l_ContextServices_0.Localization;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Stylizer_0 = v4.Style.Stylizer;
local l_UI_0 = v4.UI;
local l_Button_0 = l_UI_0.Button;
local l_Pane_0 = l_UI_0.Pane;
local l_Slider_0 = l_UI_0.Slider;
local l_Image_0 = l_UI_0.Image;
local l_TextLabel_0 = l_UI_0.TextLabel;
local v15 = require(l_Parent_0.Src.Resources.Constants.getViewTypes);
local _ = require(l_Parent_0.Src.Reducers.MainReducer);
local v17 = require(l_Parent_0.Src.Controllers.PluginController);
local v18 = require(l_Parent_0.Src.Actions.SetMaterialTileSize);
local v19 = v15();
local v20 = v2.PureComponent:extend("ViewTypeButton");
v20.init = function(v21)
    v21.selectMaterialTileSize = function(v22)
        local l_props_0 = v21.props;
        l_props_0.dispatchSetMaterialTileSize(v22);
        l_props_0.PluginController:setMaterialTileSize(v22);
    end;
end;
v20.render = function(v24)
    local l_props_1 = v24.props;
    local l_ViewTypeButton_0 = l_props_1.Stylizer.ViewTypeButton;
    return v2.createElement(l_Pane_0, {
        BackgroundColor = l_ViewTypeButton_0.ViewTypeBackground, 
        Layout = Enum.FillDirection.Vertical, 
        LayoutOrder = l_props_1.LayoutOrder, 
        Size = if l_props_1.ViewType == v19.Grid then UDim2.new(1, 0, 0, 60) else UDim2.new(1, 0, 0, 40)
    }, {
        Button = v2.createElement(l_Button_0, {
            Size = UDim2.new(1, 0, 0, 40), 
            LayoutOrder = l_props_1.LayoutOrder, 
            OnClick = l_props_1.OnClick
        }, {
            ImageContainer = v2.createElement(l_Pane_0, {
                LayoutOrder = 1, 
                Size = UDim2.fromOffset(40, 40)
            }, {
                Image = v2.createElement(l_Image_0, {
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    Position = UDim2.fromScale(0.5, 0.5), 
                    Size = UDim2.fromOffset(16, 16), 
                    Style = {
                        Image = if l_props_1.ViewType == v19.Grid then l_ViewTypeButton_0.Grid else l_ViewTypeButton_0.List
                    }
                })
            }), 
            Label = v2.createElement(l_TextLabel_0, {
                LayoutOrder = 2, 
                Size = UDim2.new(1, -40, 1, 0), 
                Text = l_props_1.Localization:getText("ViewType", l_props_1.ViewType), 
                TextXAlignment = Enum.TextXAlignment.Left
            }, {
                Padding = v2.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, 40)
                })
            })
        }), 
        Slider = if l_props_1.ViewType == v19.Grid then v2.createElement(l_Slider_0, {
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Disabled = false, 
            Value = v24.props.MaterialTileSize, 
            Min = 60, 
            Max = 200, 
            LayoutOrder = 2, 
            OnValueChanged = v24.selectMaterialTileSize, 
            Position = UDim2.new(0.5, 0, 0.5, 0), 
            Size = UDim2.new(1, 0, 0, 20), 
            SnapIncrement = 10, 
            VerticalDragTolerance = 300
        }) else nil
    });
end;
return v3.connect(function(v27)
    return {
        MaterialTileSize = v27.MaterialBrowserReducer.MaterialTileSize
    };
end, function(v28)
    return {
        dispatchSetMaterialTileSize = function(v29)
            v28(v18(v29));
        end
    };
end)((l_withContext_0({
    Localization = l_Localization_0, 
    PluginController = v17, 
    Stylizer = l_Stylizer_0
})(v20)));
