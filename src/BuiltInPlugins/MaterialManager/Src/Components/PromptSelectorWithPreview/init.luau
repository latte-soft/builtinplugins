local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v2.ContextServices;
local l_Localization_0 = l_ContextServices_0.Localization;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Stylizer_0 = v2.Style.Stylizer;
local l_UI_0 = v2.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_IconButton_0 = l_UI_0.IconButton;
local l_DEPRECATED_TextInput_0 = l_UI_0.DEPRECATED_TextInput;
local l_Components_0 = l_Parent_0.Src.Components;
local v12 = require(l_Components_0.PromptSelectorWithPreview.PreviewDialog);
local v13 = require(l_Components_0.PromptSelectorWithPreview.PreviewImage);
local v14 = v1.PureComponent:extend("PromptSelectorWithPreview");
v14.init = function(v15)
    v15.state = {
        showingExpandedPreview = false
    };
    v15.openExpandedPreview = function()
        v15:setState({
            showingExpandedPreview = true
        });
    end;
    v15.closeExpandedPreview = function()
        v15:setState({
            showingExpandedPreview = false
        });
    end;
end;
v14.render = function(v16)
    local l_props_0 = v16.props;
    local l_Localization_1 = l_props_0.Localization;
    local l_state_0 = v16.state;
    local l_PromptSelectorWithPreview_0 = l_props_0.Stylizer.PromptSelectorWithPreview;
    local v21 = l_props_0.SelectionName or "";
    local v22 = l_props_0.PreviewTitle or "";
    local v23 = l_props_0.ColumnWidth or l_PromptSelectorWithPreview_0.ColumnWidth;
    local v24 = (v23 - 60) / 2 - 5;
    local v25 = (v23 - 60) / 2 + 5;
    local v26 = v23 + l_PromptSelectorWithPreview_0.LabelColumnWidth.Offset;
    local l_PreviewSize_0 = l_PromptSelectorWithPreview_0.PreviewSize;
    local l_LabelWidth_0 = l_props_0.LabelWidth;
    local l_ButtonHeight_0 = l_PromptSelectorWithPreview_0.ButtonHeight;
    local l_showingExpandedPreview_0 = l_state_0.showingExpandedPreview;
    local v31 = nil;
    if l_showingExpandedPreview_0 then
        v31 = {
            v21
        };
    end;
    return v1.createElement("Frame", {
        BackgroundTransparency = 1, 
        Size = UDim2.new(0, v26, 0, l_PreviewSize_0 + l_PromptSelectorWithPreview_0.PaddingVertical)
    }, {
        UIListLayout = v1.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, l_PromptSelectorWithPreview_0.PaddingVertical)
        }), 
        TwoColumn = v1.createElement(l_Pane_0, {
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            Layout = Enum.FillDirection.Horizontal, 
            Size = UDim2.new(1, 0, 0, l_PreviewSize_0), 
            Spacing = l_PromptSelectorWithPreview_0.PaddingHorizontal
        }, {
            PreviewColumn = v1.createElement(l_Pane_0, {
                LayoutOrder = 1, 
                Size = UDim2.new(l_LabelWidth_0, UDim.new(1, 0))
            }, {
                PreviewImage = v1.createElement(v13, {
                    ImageId = l_props_0.ImageId, 
                    IsTempId = l_props_0.IsTempId, 
                    ClearSelection = l_props_0.ClearSelection, 
                    OpenExpandedPreview = v16.openExpandedPreview
                }), 
                ExpandedPreview = l_showingExpandedPreview_0 and v1.createElement(v12, {
                    PreviewTitle = v22, 
                    ImageId = l_props_0.ImageId, 
                    IsTempId = l_props_0.IsTempId, 
                    Metadata = v31, 
                    OnClose = v16.closeExpandedPreview
                })
            }), 
            ImportColumn = v1.createElement(l_Pane_0, {
                Size = UDim2.new(0, v23, 1, 0), 
                Style = "RoundBox", 
                Spacing = 10, 
                VerticalAlignment = Enum.VerticalAlignment.Top, 
                Layout = Enum.FillDirection.Vertical, 
                LayoutOrder = 2
            }, {
                UrlImport = v1.createElement(l_DEPRECATED_TextInput_0, {
                    PlaceholderText = l_Localization_1:getText("CreateDialog", "InsertAssetURL"), 
                    Text = l_props_0.SearchUrl, 
                    Size = UDim2.new(1, 0, 0, l_ButtonHeight_0), 
                    OnFocusLost = l_props_0.OnFocusLost, 
                    Style = "FilledRoundedBorder"
                }), 
                IconImport = v1.createElement(l_IconButton_0, {
                    Size = UDim2.new(1, 0, 0, l_ButtonHeight_0), 
                    Text = l_Localization_1:getText("CreateDialog", "Import"), 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    LeftIcon = l_PromptSelectorWithPreview_0.ImportIcon, 
                    IconColor = l_PromptSelectorWithPreview_0.ImportIconColor, 
                    BackgroundColor = l_PromptSelectorWithPreview_0.ButtonColor, 
                    OnClick = l_props_0.PromptSelection, 
                    Padding = {
                        Left = v24, 
                        Right = v25
                    }
                })
            })
        })
    });
end;
return (l_withContext_0({
    Stylizer = l_Stylizer_0, 
    Localization = l_Localization_0
})(v14));
