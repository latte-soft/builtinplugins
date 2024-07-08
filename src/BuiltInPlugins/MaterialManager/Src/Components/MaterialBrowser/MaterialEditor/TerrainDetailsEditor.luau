local l_Parent_0 = script.Parent.Parent.Parent.Parent.Parent;
local _ = require(l_Parent_0.Src.Types);
local v2 = require(l_Parent_0.Packages.Roact);
local v3 = require(l_Parent_0.Packages.RoactRodux);
local v4 = require(l_Parent_0.Packages.Framework);
local l_LayoutOrderIterator_0 = v4.Util.LayoutOrderIterator;
local l_Stylizer_0 = v4.Style.Stylizer;
local l_ContextServices_0 = v4.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Analytics_0 = l_ContextServices_0.Analytics;
local l_Localization_0 = l_ContextServices_0.Localization;
local l_UI_0 = v4.UI;
local l_Button_0 = l_UI_0.Button;
local l_DEPRECATED_TextInput_0 = l_UI_0.DEPRECATED_TextInput;
local l_ExpandablePane_0 = l_UI_0.ExpandablePane;
local l_Pane_0 = l_UI_0.Pane;
local l_Image_0 = l_UI_0.Image;
local l_Separator_0 = l_UI_0.Separator;
local l_Tooltip_0 = l_UI_0.Tooltip;
local l_TruncatedTextLabel_0 = l_UI_0.TruncatedTextLabel;
local v20 = require(l_Parent_0.Src.Actions.SetExpandedPane);
local _ = require(l_Parent_0.Src.Reducers.MainReducer);
local v22 = require(l_Parent_0.Src.Controllers.GeneralServiceController);
local l_MaterialEditor_0 = l_Parent_0.Src.Components.MaterialBrowser.MaterialEditor;
local v24 = require(l_MaterialEditor_0.LabeledElement);
local v25 = require(l_MaterialEditor_0.TextureSettings);
local v26 = require(l_MaterialEditor_0.TilingSettings);
local v27 = require(l_Parent_0.Src.Resources.Constants.getSettingsNames)();
local v28 = v2.PureComponent:extend("TerrainDetailsEditor");
v28.init = function(v29)
    v29.state = {
        name = v29.props.TerrainDetail.Name
    };
    v29.onNameChanged = function(v30)
        v29:setState({
            name = v30
        });
    end;
    v29.onFocusLost = function()
        local l_props_0 = v29.props;
        if v29.state.name and v29.state.name ~= "" then
            l_props_0.GeneralServiceController:setTerrainDetailName(l_props_0.TerrainDetail, v29.state.name);
            return ;
        else
            v29:setState({
                name = l_props_0.TerrainDetail.Name
            });
            return ;
        end;
    end;
    v29.onExpandedChanged = function()
        local l_props_1 = v29.props;
        l_props_1.dispatchSetExpandedPane(v27.TerrainDetailsEditor[l_props_1.TerrainFace], not l_props_1.ExpandedPane);
    end;
    v29.headerComponent = function()
        local l_props_2 = v29.props;
        local l_TerrainDetailsEditor_0 = l_props_2.Stylizer.TerrainDetailsEditor;
        local l_Localization_1 = l_props_2.Localization;
        local v36 = l_LayoutOrderIterator_0.new();
        return v2.createElement(v24, {
            LabelColumnWidth = l_TerrainDetailsEditor_0.LabelColumnWidth, 
            LayoutOrder = 1, 
            Padding = 0, 
            Text = l_Localization_1:getText("TerrainDetails", l_props_2.TerrainFace), 
            VerticalAlignment = Enum.VerticalAlignment.Center
        }, {
            v2.createElement(l_Pane_0, {
                Layout = Enum.FillDirection.Horizontal, 
                Size = UDim2.fromScale(1, 1), 
                HorizontalAlignment = Enum.HorizontalAlignment.Right, 
                VerticalAlignment = Enum.VerticalAlignment.Center
            }, {
                Name = v2.createElement(l_TruncatedTextLabel_0, {
                    LayoutOrder = v36:getNextOrder(), 
                    Size = l_TerrainDetailsEditor_0.NameLabelSize, 
                    Text = v29.state.name, 
                    TextTruncate = Enum.TextTruncate.AtEnd, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextYAlignment = Enum.TextYAlignment.Center
                }), 
                Delete = v2.createElement(l_Button_0, {
                    LayoutOrder = v36:getNextOrder(), 
                    OnClick = l_props_2.OnDelete, 
                    Size = l_TerrainDetailsEditor_0.ButtonSize, 
                    Style = l_TerrainDetailsEditor_0.ButtonStyle
                }, {
                    Image = v2.createElement(l_Image_0, {
                        Style = l_TerrainDetailsEditor_0.Delete, 
                        Size = l_TerrainDetailsEditor_0.ImageSize, 
                        Position = l_TerrainDetailsEditor_0.ImagePosition
                    }), 
                    Tooltip = v2.createElement(l_Tooltip_0, {
                        Text = l_Localization_1:getText("TerrainDetails", "Delete")
                    })
                })
            })
        });
    end;
end;
v28.didUpdate = function(v37, _, v39)
    if v37.state.name ~= v37.props.TerrainDetail.Name and v39.name == v37.state.name then
        v37:setState({
            name = v37.props.TerrainDetail.Name
        });
    end;
end;
v28.render = function(v40)
    local l_props_3 = v40.props;
    local l_TerrainDetailsEditor_1 = l_props_3.Stylizer.TerrainDetailsEditor;
    local l_Localization_2 = l_props_3.Localization;
    local v44 = l_LayoutOrderIterator_0.new();
    return v2.createElement(l_ExpandablePane_0, {
        ContentPadding = {
            Top = 5, 
            Bottom = 5
        }, 
        ContentSpacing = 5, 
        LayoutOrder = l_props_3.LayoutOrder, 
        HeaderComponent = v40.headerComponent, 
        Expanded = l_props_3.ExpandedPane, 
        OnExpandedChanged = v40.onExpandedChanged
    }, {
        Name = v2.createElement(v24, {
            LabelColumnWidth = l_TerrainDetailsEditor_1.LabelColumnWidth, 
            LayoutOrder = v44:getNextOrder(), 
            Text = l_Localization_2:getText("CreateDialog", "NameVariant")
        }, {
            v2.createElement(l_DEPRECATED_TextInput_0, {
                Style = "FilledRoundedBorder", 
                Size = l_TerrainDetailsEditor_1.DialogColumnSize, 
                Text = v40.state.name, 
                OnTextChanged = v40.onNameChanged, 
                OnFocusLost = v40.onFocusLost
            })
        }), 
        TextureSettings = v2.createElement(v25, {
            LayoutOrder = v44:getNextOrder(), 
            PBRMaterial = l_props_3.TerrainDetail, 
            Expandable = false
        }), 
        TilingSettings = v2.createElement(v26, {
            LayoutOrder = v44:getNextOrder(), 
            PBRMaterial = l_props_3.TerrainDetail, 
            Expandable = false
        }), 
        Separator = if l_props_3.TerrainFace ~= "Bottom" then v2.createElement(l_Separator_0, {
            LayoutOrder = v44:getNextOrder(), 
            DominantAxis = Enum.DominantAxis.Width
        }) else nil
    });
end;
return v3.connect(function(v45, v46)
    return {
        ExpandedPane = v45.MaterialBrowserReducer.ExpandedPane[v27.TerrainDetailsEditor[v46.TerrainFace]]
    };
end, function(v47)
    return {
        dispatchSetExpandedPane = function(v48, v49)
            v47(v20(v48, v49));
        end
    };
end)((l_withContext_0({
    Analytics = l_Analytics_0, 
    GeneralServiceController = v22, 
    Localization = l_Localization_0, 
    Stylizer = l_Stylizer_0
})(v28)));
