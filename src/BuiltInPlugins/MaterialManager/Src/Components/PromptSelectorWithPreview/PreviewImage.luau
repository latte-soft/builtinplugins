local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v2.ContextServices;
local l_Localization_0 = l_ContextServices_0.Localization;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Stylizer_0 = v2.Style.Stylizer;
local l_UI_0 = v2.UI;
local l_Image_0 = l_UI_0.Image;
local l_TextLabel_0 = l_UI_0.TextLabel;
local v10 = require(l_Parent_0.Src.Components.PromptSelectorWithPreview.PreviewToolbarButton);
local v11 = require(l_Parent_0.Src.Components.LoadingImage);
local v12 = v1.PureComponent:extend("PreviewImage");
v12.init = function(v13)
    v13.state = {
        promptSelectionHovered = false
    };
    v13.onPromptSelectionHover = function()
        v13:setState({
            promptSelectionHovered = true
        });
    end;
    v13.onPromptSelectionHoverEnd = function()
        v13:setState({
            promptSelectionHovered = false
        });
    end;
end;
v12.render = function(v14)
    local l_props_0 = v14.props;
    local l_PromptSelectorWithPreview_0 = l_props_0.Stylizer.PromptSelectorWithPreview;
    local l_Localization_1 = l_props_0.Localization;
    local l_state_0 = v14.state;
    local v19 = l_props_0.ImageId and l_props_0.ImageId ~= "";
    return v1.createElement("ImageLabel", {
        ZIndex = 1, 
        Size = UDim2.new(0, l_PromptSelectorWithPreview_0.PreviewSize, 0, l_PromptSelectorWithPreview_0.PreviewSize), 
        Image = "", 
        [v1.Event.MouseEnter] = v14.onPromptSelectionHover, 
        [v1.Event.MouseLeave] = v14.onPromptSelectionHoverEnd
    }, {
        PreviewNoImageSign = not v19 and v1.createElement("Frame", {
            ZIndex = 2, 
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundColor3 = l_PromptSelectorWithPreview_0.ImportImageBackground
        }, {
            NoImageText = v1.createElement(l_TextLabel_0, {
                Size = UDim2.new(1, 0, 1, 0), 
                TextXAlignment = Enum.TextXAlignment.Center, 
                TextSize = l_PromptSelectorWithPreview_0.TextHeight, 
                Text = l_Localization_1:getText("CreateDialog", "NoImageSelected"), 
                TextWrapped = true, 
                TextColor = l_PromptSelectorWithPreview_0.ButtonIconColor
            })
        }), 
        PreviewContentContainer = v19 and v1.createElement("Frame", {
            ZIndex = 2, 
            Size = UDim2.new(1, 0, 1, 0)
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
        Toolbar = if l_props_0.IsTempId == false then v1.createElement("Frame", {
            ZIndex = 3, 
            AnchorPoint = Vector2.new(0, 1), 
            Position = UDim2.new(0, 0, 1, 0), 
            Size = UDim2.new(1, 0, 0, l_PromptSelectorWithPreview_0.ToolbarHeight), 
            Visible = not not v19 and (l_state_0.promptSelectionHovered and true or false), 
            BackgroundTransparency = l_PromptSelectorWithPreview_0.ToolbarTransparency, 
            BorderSizePixel = 0, 
            BackgroundColor3 = l_PromptSelectorWithPreview_0.ToolbarBackgroundColor
        }, {
            ExpandPreview = v1.createElement(v10, {
                Icon = l_PromptSelectorWithPreview_0.ExpandIcon, 
                [v1.Event.Activated] = l_props_0.OpenExpandedPreview
            }), 
            ClearButton = v1.createElement(v10, {
                AnchorPoint = Vector2.new(1, 0), 
                Position = UDim2.new(1, 0, 0, 0), 
                Icon = l_PromptSelectorWithPreview_0.ClearIcon, 
                [v1.Event.Activated] = l_props_0.ClearSelection
            })
        }) else nil
    });
end;
return (l_withContext_0({
    Stylizer = l_Stylizer_0, 
    Localization = l_Localization_0
})(v12));
