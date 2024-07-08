local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local v2 = require(l_script_FirstAncestor_0.Packages.React);
local l_ContextServices_0 = v1.ContextServices;
local l_Localization_0 = l_ContextServices_0.Localization;
local l_Stylizer_0 = l_ContextServices_0.Stylizer;
local l_UI_0 = v1.UI;
local l_Dialog_0 = l_UI_0.Dialog;
local l_Image_0 = l_UI_0.Image;
local l_Pane_0 = l_UI_0.Pane;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_LayoutOrderIterator_0 = v1.Util.LayoutOrderIterator;
local _ = require(l_script_FirstAncestor_0.Src.Resources.Theme);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v14 = require(l_script_FirstAncestor_0.Src.Util.getMetadata);
return function(v15)
    local v16 = l_Localization_0:use();
    local v17 = l_Stylizer_0:use("MetadataDialog");
    local l_Image_1 = v15.Image;
    local v19 = v14(l_Image_1);
    local l_MetadataLineHeight_0 = v17.MetadataLineHeight;
    local l_Padding_0 = v17.Padding;
    local l_Spacing_0 = v17.Spacing;
    local v23 = l_LayoutOrderIterator_0.new();
    local v24 = (#v19 * l_MetadataLineHeight_0 + (#v19 - 1) * l_Spacing_0) + l_Padding_0 * 2;
    local v25 = {};
    for v26, v27 in v19, nil, nil do
        v25[("Metadata%*"):format(v26)] = v2.createElement(l_TextLabel_0, {
            LayoutOrder = v23:getNextOrder(), 
            Size = UDim2.new(1, 0, 0, l_MetadataLineHeight_0), 
            Text = ("%*: %*"):format(v16:getText("Image", v27.Label), v27.Value), 
            TextSize = l_MetadataLineHeight_0, 
            TextXAlignment = Enum.TextXAlignment.Left
        });
    end;
    return v2.createElement(l_Dialog_0, {
        Title = v16:getText("Image", "ImagePreview"), 
        Size = v17.Size, 
        MinSize = v17.MinSize, 
        Resizable = true, 
        Enabled = true, 
        Modal = false, 
        ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
        OnClose = v15.OnClose
    }, {
        Content = v2.createElement(l_Pane_0, {
            Layout = Enum.FillDirection.Vertical
        }, {
            Wrapper = v2.createElement(l_Pane_0, {
                BackgroundColor = v17.ImageBackgroundColor, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                LayoutOrder = v23:getNextOrder(), 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                Size = UDim2.new(1, 0, 1, -v24)
            }, {
                Image = v2.createElement(l_Image_0, {
                    Image = l_Image_1.Preview.Id or l_Image_1.File:GetTemporaryId(), 
                    ScaleType = Enum.ScaleType.Fit
                })
            }), 
            Metadata = v2.createElement(l_Pane_0, {
                Layout = Enum.FillDirection.Vertical, 
                LayoutOrder = v23:getNextOrder(), 
                Padding = l_Padding_0, 
                Size = UDim2.new(1, 0, 0, v24), 
                Spacing = l_Spacing_0
            }, v25)
        })
    });
end;
