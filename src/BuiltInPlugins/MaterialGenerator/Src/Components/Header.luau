local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Framework);
local v2 = require(l_Parent_0.Packages.MaterialFramework);
local v3 = require(l_Parent_0.Packages.React);
local v4 = require(l_Parent_0.Packages.RoactRodux);
local _ = require(l_Parent_0.Packages._Index.DeveloperFramework.DeveloperFramework.Types);
local v6 = require(l_Parent_0.Src.Enum.GenerationErrorType);
local l_ContextServices_0 = v1.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Analytics_0 = l_ContextServices_0.Analytics;
local l_Localization_0 = l_ContextServices_0.Localization;
local l_Stylizer_0 = v1.Style.Stylizer;
local l_UI_0 = v1.UI;
local l_Button_0 = l_UI_0.Button;
local l_Image_0 = l_UI_0.Image;
local l_Pane_0 = l_UI_0.Pane;
local l_TextInput_0 = l_UI_0.TextInput;
local l_LoadingIndicator_0 = l_UI_0.LoadingIndicator;
local l_StyleModifier_0 = v1.Util.StyleModifier;
local l_StudioServices_0 = v2.Context.StudioServices;
local l_Actions_0 = l_Parent_0.Src.Actions;
local v21 = require(l_Actions_0.SetTextPrompt);
local v22 = require(l_Actions_0.SetInitialImageId);
local v23 = require(l_Actions_0.SetGenerationError);
local v24 = require(l_Parent_0.Src.Thunks.GenerateImages);
local v25 = require(l_Parent_0.Src.Flags.getFFlagMaterialGeneratorSupportVariations2);
local l_MaterialGeneratorErrorAnalytics_0 = game:GetFastFlag("MaterialGeneratorErrorAnalytics");
local _ = require(l_Parent_0.Src.Types);
local v28 = v3.PureComponent:extend("Header");
v28.init = function(v29)
    v29:setState({
        retriesAttempt = 0, 
        addedImageHovered = false, 
        addImageCloseButtonHovered = false, 
        textInputShouldFocus = true, 
        isQueryingForImage = false
    });
    v29.textPromptChanged = function(v30)
        v29.props.dispatchSetTextPrompt(v30);
    end;
    v29.onAddedImageHovered = function()
        if v25() then
            v29:setState({
                addedImageHovered = true
            });
            return ;
        else
            return ;
        end;
    end;
    v29.onAddedImageUnhovered = function()
        if v25() then
            v29:setState({
                addedImageHovered = false
            });
            return ;
        else
            return ;
        end;
    end;
    v29.onAddedImageCloseButtonHovered = function()
        if v25() then
            v29:setState({
                addImageCloseButtonHovered = true
            });
            return ;
        else
            return ;
        end;
    end;
    v29.onAddedImageCloseButtonUnhovered = function()
        if v25() then
            v29:setState({
                addImageCloseButtonHovered = false
            });
            return ;
        else
            return ;
        end;
    end;
    v29.addImage = function()
        if v25() then
            if not v29.state.isQueryingForImage then
                v29:setState({
                    addedImageHovered = false, 
                    isQueryingForImage = true
                });
                local v31 = {
                    "png", 
                    "jpg", 
                    "jpeg"
                };
                local v32 = nil;
                local l_status_0, l_result_0 = pcall(function()
                    v32 = v29.props.StudioServices:getService("StudioService"):PromptImportFile(v31);
                end);
                if not l_status_0 then
                    v29.props.dispatchSetImageError(l_result_0);
                elseif v32 then
                    v29.props.dispatchSetInitialImageId(v32:GetTemporaryId());
                end;
                v29:setState({
                    isQueryingForImage = false
                });
                return ;
            else
                return ;
            end;
        else
            return ;
        end;
    end;
    v29.clearImage = function()
        if v25() then
            v29:setState({
                addedImageHovered = false
            });
            v29.props.dispatchSetInitialImageId(nil);
            return ;
        else
            return ;
        end;
    end;
    v29.generate = function(v35)
        if v29.props.Localization then
            v29.props.dispatchGenerateImages(v29.props.StudioServices, v29.props.Analytics, v35);
            v29:setState({
                textInputShouldFocus = true
            });
            return ;
        else
            return ;
        end;
    end;
    v29.unsetFocusLater = function()
        task.defer(function()
            v29:setState({
                textInputShouldFocus = false
            });
        end);
    end;
end;
v28.didMount = function(v36)
    v36.unsetFocusLater();
end;
v28.willUnmount = function(v37)
    v37:_setDeferredTask(nil);
end;
v28.didUpdate = function(v38)
    if v38.state.textInputShouldFocus then
        v38.unsetFocusLater();
    end;
end;
v28._computeRetryTime = function(_, v40)
    return 1 + 5 / (1 + 2.71828 ^ ((0.5 - v40 / 10) * 10));
end;
v28._setDeferredTask = function(v41, v42)
    if v41.deferredQueryingTask then
        task.cancel(v41.deferredQueryingTask);
        v41.deferredQueryingTask = nil;
    end;
    v41.deferredQueryingTask = v42;
end;
v28._renderLoader = function(_, v44, v45)
    return v3.createElement(l_Pane_0, {
        Layout = Enum.FillDirection.Vertical, 
        LayoutOrder = v44.LayoutOrder, 
        Padding = v45.Padding, 
        Spacing = v45.VerticalSpacing, 
        VerticalAlignment = Enum.VerticalAlignment.Center
    }, {
        Loading = v3.createElement(l_LoadingIndicator_0)
    });
end;
v28.render = function(v46)
    local l_props_0 = v46.props;
    local l_Header_0 = l_props_0.Stylizer.Header;
    local l_Localization_1 = l_props_0.Localization;
    local l_IsGeneratingImages_0 = l_props_0.IsGeneratingImages;
    if not l_IsGeneratingImages_0 then
        l_IsGeneratingImages_0 = true;
        if l_props_0.TextPrompt ~= nil then
            l_IsGeneratingImages_0 = l_props_0.TextPrompt == "";
        end;
    end;
    local v51 = 0;
    local v52 = nil;
    local v53 = false;
    if v25() then
        if v46.props.initialImageId or v46.state.isQueryingForImage then
            v51 = l_Header_0.PromptHeight + l_Header_0.ImagePadding;
            v53 = false;
            v52 = v3.createElement("Frame", {
                Size = UDim2.fromOffset(l_Header_0.PromptHeight, l_Header_0.PromptHeight), 
                Position = UDim2.fromScale(0, 0.5), 
                AnchorPoint = Vector2.new(0, 0.5), 
                BackgroundTransparency = 1
            }, {
                ImagePreview = v3.createElement("ImageButton", {
                    BackgroundColor3 = l_Header_0.ImageBackgroundColor3, 
                    BorderSizePixel = 0, 
                    Image = v46.props.initialImageId, 
                    Size = UDim2.fromOffset(l_Header_0.PromptHeight - 2, l_Header_0.PromptHeight - 2), 
                    Position = UDim2.fromScale(0.5, 0.5), 
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    ZIndex = 2, 
                    ImageColor3 = l_Header_0.ImageColor3, 
                    ScaleType = Enum.ScaleType.Crop, 
                    [v3.Event.Activated] = v46.addImage, 
                    [v3.Event.MouseEnter] = v46.onAddedImageHovered, 
                    [v3.Event.MouseLeave] = v46.onAddedImageUnhovered
                }, {
                    UICorner = v3.createElement("UICorner", {
                        CornerRadius = l_Header_0.ImageCornerRadius
                    }), 
                    UIStroke = v3.createElement("UIStroke", {
                        Thickness = 1, 
                        Color = l_Header_0.ImageBorderColor
                    }), 
                    AddImageIcon = v3.createElement("ImageLabel", {
                        BackgroundTransparency = 1, 
                        ImageColor3 = if not v46.props.initialImageId then l_Header_0.AddImageButtonIconColorNoImage else l_Header_0.AddImageButtonIconColor, 
                        Size = UDim2.fromOffset(32, 32), 
                        Visible = v46.state.addedImageHovered or v46.state.isQueryingForImage, 
                        Image = "rbxasset://textures/MaterialGenerator/AddImage_64x64.png", 
                        AnchorPoint = Vector2.new(0.5, 0.5), 
                        Position = UDim2.fromScale(0.5, 0.5)
                    }), 
                    CloseButton = v3.createElement("ImageButton", {
                        BackgroundTransparency = 1, 
                        Size = UDim2.fromOffset(22, 22), 
                        AnchorPoint = Vector2.new(1, 0), 
                        Position = UDim2.fromScale(1, 0), 
                        Visible = v46.state.addedImageHovered, 
                        [v3.Event.Activated] = v46.clearImage, 
                        [v3.Event.MouseEnter] = v46.onAddedImageCloseButtonHovered, 
                        [v3.Event.MouseLeave] = v46.onAddedImageCloseButtonUnhovered
                    }, {
                        Icon = v3.createElement(l_Image_0, {
                            BackgroundTransparency = 1, 
                            Image = "rbxasset://textures/StudioSharedUI/close.png", 
                            Size = UDim2.fromOffset(16, 16), 
                            Position = UDim2.fromScale(0.5, 0.5), 
                            AnchorPoint = Vector2.new(0.5, 0.5)
                        }, {
                            UIScale = v3.createElement("UIScale", {
                                Scale = not v46.state.addImageCloseButtonHovered and 1 or 1.2
                            })
                        })
                    })
                })
            });
        else
            v53 = true;
            v52 = nil;
        end;
    end;
    local function v54()
        v46.generate("ButtonClick");
    end;
    return v3.createElement(l_Pane_0, {
        AutomaticSize = Enum.AutomaticSize.Y, 
        Layout = Enum.FillDirection.Vertical, 
        LayoutOrder = l_props_0.LayoutOrder, 
        Padding = l_Header_0.Padding, 
        Spacing = l_Header_0.VerticalSpacing, 
        VerticalAlignment = Enum.VerticalAlignment.Top
    }, {
        TextPromptPane = v3.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, l_Header_0.PromptHeight), 
            BackgroundTransparency = 1
        }, {
            Preview = v52, 
            TextPrompt = v3.createElement(l_TextInput_0, {
                LayoutOrder = 1, 
                MultiLine = l_Header_0.MultiLinePrompt, 
                OnEnter = if not l_IsGeneratingImages_0 then if l_MaterialGeneratorErrorAnalytics_0 then function()
                    v46.generate("KeyboardEnter");
                end else v46.generate else nil, 
                OnTextChanged = v46.textPromptChanged, 
                PlaceholderText = l_Localization_1:getText("Header", "PromptPlaceholderText"), 
                ShouldFocus = v46.state.textInputShouldFocus, 
                Position = UDim2.new(0, v51, 0, 0), 
                Size = UDim2.new(1, -v51, 0, l_Header_0.PromptHeight), 
                Text = l_props_0.TextPrompt, 
                TextYAlignment = l_Header_0.TextYAlignment
            }), 
            AddImageButton = v53 and v3.createElement(l_Button_0, {
                Style = "RoundSubtle", 
                Size = l_Header_0.UploadButtonSize, 
                AnchorPoint = Vector2.new(0, 1), 
                Position = UDim2.new(0, 5 + v51, 1, -5), 
                Tooltip = l_Localization_1:getText("Header", "AddImageTooltip"), 
                OnClick = v46.addImage
            }, {
                Icon = v3.createElement(l_Image_0, {
                    BackgroundTransparency = 1, 
                    ImageColor3 = l_Header_0.AddImageButtonIconColor, 
                    Image = "rbxasset://textures/MaterialGenerator/AddImage_48x48.png", 
                    Size = UDim2.fromOffset(24, 24), 
                    Position = UDim2.fromScale(0.5, 0.5), 
                    AnchorPoint = Vector2.new(0.5, 0.5)
                })
            }), 
            GenerateButton = v25() and v3.createElement(l_Button_0, {
                OnClick = if not l_MaterialGeneratorErrorAnalytics_0 then v46.generate else v54, 
                Size = l_Header_0.GenerateButtonSize, 
                AnchorPoint = Vector2.new(1, 1), 
                Position = UDim2.new(1, -5, 1, -5), 
                Style = "RoundPrimary", 
                StyleModifier = if not l_IsGeneratingImages_0 then nil else l_StyleModifier_0.Disabled, 
                Text = if not l_props_0.IsGeneratingImages then l_Localization_1:getText("Header", "GenerateButton") else ""
            }, {
                LoadingIndicator = l_props_0.IsGeneratingImages and v3.createElement(l_LoadingIndicator_0, {
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    Position = UDim2.fromScale(0.5, 0.5), 
                    Size = UDim2.fromOffset(24, 16)
                })
            })
        }), 
        SettingsRow = if v25() then nil else v3.createElement(l_Pane_0, {
            HorizontalAlignment = Enum.HorizontalAlignment.Right, 
            Layout = Enum.FillDirection.Horizontal, 
            LayoutOrder = 2, 
            Size = UDim2.new(1, 0, 0, l_Header_0.RowHeight), 
            VerticalAlignment = Enum.VerticalAlignment.Center
        }, {
            GenerateButton = v3.createElement(l_Button_0, {
                OnClick = if not l_MaterialGeneratorErrorAnalytics_0 then v46.generate else v54, 
                Size = l_Header_0.GenerateButtonSize, 
                Style = "RoundPrimary", 
                StyleModifier = if not l_IsGeneratingImages_0 then nil else l_StyleModifier_0.Disabled, 
                Text = l_Localization_1:getText("Header", "GenerateButton")
            })
        })
    });
end;
v28.getDerivedStateFromProps = function(_, v56)
    local v57 = nil;
    if not v56.isQueryingForImage then
        if v56.addedImageHovered then
            v57 = l_StyleModifier_0.Hover;
        end;
    else
        v57 = l_StyleModifier_0.Selected;
    end;
    if v57 ~= v56.StyleModifier then
        return {
            StyleModifier = v57 or v3.None
        };
    else
        return nil;
    end;
end;
return v4.connect(function(v58, _)
    return {
        initialImageId = v58.MaterialsReducer.initialImageId, 
        IsGeneratingImages = v58.AppStateReducer.generatingImages > 0, 
        TextPrompt = v58.AppStateReducer.textPrompt
    };
end, function(v60)
    return {
        dispatchSetImageError = function(v61)
            v60(v23(v6.FailedToSetImage, v61));
        end, 
        dispatchGenerateImages = function(v62, v63)
            v60(v24(v62, v63));
        end, 
        dispatchSetTextPrompt = function(v64)
            v60(v21(v64));
        end, 
        dispatchSetInitialImageId = function(v65)
            v60(v22(v65));
        end
    };
end)((l_withContext_0({
    Analytics = l_Analytics_0, 
    Localization = l_Localization_0, 
    StudioServices = l_StudioServices_0, 
    Stylizer = l_Stylizer_0
})(v28)));
