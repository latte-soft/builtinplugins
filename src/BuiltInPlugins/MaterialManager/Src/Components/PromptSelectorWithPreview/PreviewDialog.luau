local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.Framework);
local l_withContext_0 = v2.ContextServices.withContext;
local l_Stylizer_0 = v2.Style.Stylizer;
local l_UI_0 = v2.UI;
local l_Container_0 = l_UI_0.Container;
local l_LayoutOrderIterator_0 = v2.Util.LayoutOrderIterator;
local l_Dialog_0 = l_UI_0.Dialog;
local l_Image_0 = l_UI_0.Image;
local l_TextLabel_0 = l_UI_0.TextLabel;
local v11 = require(l_Parent_0.Src.Components.LoadingImage);
local v12 = v1.PureComponent:extend("PreviewDialog");
v12.render = function(v13)
    local l_props_0 = v13.props;
    local l_PromptSelectorWithPreview_0 = l_props_0.Stylizer.PromptSelectorWithPreview;
    local v16 = l_props_0.PreviewTitle or "";
    local v17 = l_props_0.Metadata or {};
    local v18 = #v17 > 0 and 8 + l_PromptSelectorWithPreview_0.TextHeight or 0;
    local v19 = l_LayoutOrderIterator_0.new();
    local v20 = {
        UIListLayout = v1.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, 4)
        }), 
        PreviewContentContainer = v1.createElement("Frame", {
            LayoutOrder = v19:getNextOrder(), 
            Size = UDim2.new(1, 0, 1, -v18), 
            BackgroundColor3 = l_PromptSelectorWithPreview_0.PreviewBackgroundColor, 
            BorderColor3 = l_PromptSelectorWithPreview_0.PreviewBorderColor
        }, {
            PreviewContent = if l_props_0.IsTempId == true then v1.createElement(v11, {
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, 0, 1, 0), 
                Image = l_props_0.ImageId, 
                ScaleType = Enum.ScaleType.Fit
            }) else v1.createElement(l_Image_0, {
                Size = UDim2.new(1, 0, 1, 0), 
                Image = l_props_0.ImageId
            })
        }), 
        EmptyRow = v1.createElement(l_Container_0, {
            LayoutOrder = v19:getNextOrder(), 
            Size = UDim2.new(1, 0, 0, 0)
        })
    };
    for v21, v22 in ipairs(v17) do
        v20["Metadata_" .. tostring(v21)] = v1.createElement(l_TextLabel_0, {
            LayoutOrder = v19:getNextOrder(), 
            Size = UDim2.new(1, 0, 0, l_PromptSelectorWithPreview_0.TextHeight), 
            Text = v22, 
            TextSelectable = true, 
            TextSize = l_PromptSelectorWithPreview_0.TextHeight, 
            TextXAlignment = Enum.TextXAlignment.Left
        });
    end;
    return v1.createElement(l_Dialog_0, {
        Title = v16, 
        Size = l_PromptSelectorWithPreview_0.ExpandedPreviewDefaultSize, 
        MinSize = l_PromptSelectorWithPreview_0.ExpandedPreviewMinSize, 
        Resizable = true, 
        Enabled = true, 
        Modal = true, 
        OnClose = l_props_0.OnClose
    }, {
        Background = v1.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundColor3 = l_PromptSelectorWithPreview_0.PreviewBackgroundColor
        }, {
            UIPadding = v1.createElement("UIPadding", {
                PaddingTop = l_PromptSelectorWithPreview_0.ExpandedPreviewPadding, 
                PaddingBottom = l_PromptSelectorWithPreview_0.ExpandedPreviewPadding, 
                PaddingLeft = l_PromptSelectorWithPreview_0.ExpandedPreviewPadding, 
                PaddingRight = l_PromptSelectorWithPreview_0.ExpandedPreviewPadding
            }), 
            Container = v1.createElement(l_Container_0, {}, v20)
        })
    });
end;
return (l_withContext_0({
    Stylizer = l_Stylizer_0
})(v12));
