local l_ChangeHistoryService_0 = game:GetService("ChangeHistoryService");
local l_Parent_0 = script.Parent.Parent.Parent;
local v2 = require(l_Parent_0.Packages.Roact);
local v3 = require(l_Parent_0.Packages.Framework);
local v4 = require(l_Parent_0.Src.Util.Orientation);
local v5 = require(l_Parent_0.Src.Util.MouseCursorManager);
local l_Components_0 = l_Parent_0.Src.Components;
local v7 = require(l_Components_0.ImageEditor);
local v8 = require(l_Components_0.TextEditor);
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Analytics_0 = l_ContextServices_0.Analytics;
local l_Localization_0 = l_ContextServices_0.Localization;
local l_StyleModifier_0 = v3.Util.StyleModifier;
local l_UI_0 = v3.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_Button_0 = l_UI_0.Button;
local l_9SliceEditorAllowUnloadedImages_0 = game:GetFastFlag("9SliceEditorAllowUnloadedImages");
local l_TextLabel_0 = l_UI_0.TextLabel;
local v19 = v2.PureComponent:extend("SliceEditor");
local v20 = v4.Left.rawValue();
local v21 = v4.Right.rawValue();
local v22 = v4.Top.rawValue();
local v23 = v4.Bottom.rawValue();
local function _(v24, v25)
    local v26 = false;
    if v24[v20] == v25[v20] then
        v26 = false;
        if v24[v21] == v25[v21] then
            v26 = false;
            if v24[v22] == v25[v22] then
                v26 = v24[v23] == v25[v23];
            end;
        end;
    end;
    return v26;
end;
v19.init = function(v28, _)
    v28.getImageDimensions = function()
        local l_imageRectSize_0 = v28.props.imageRectSize;
        if (l_imageRectSize_0 and l_imageRectSize_0.X > 0) and l_imageRectSize_0.Y > 0 then
            return l_imageRectSize_0;
        else
            return v28.props.pixelDimensions;
        end;
    end;
    v28.clampAndRoundSliceRect = function(v31)
        local v32 = v28.getImageDimensions();
        local _ = nil;
        local _ = nil;
        local _ = nil;
        local _ = nil;
        return {
            math.clamp(math.round(v31[v20]), 0, v32.X), 
            math.clamp(math.round(v31[v21]), 0, v32.X), 
            math.clamp(math.round(v31[v22]), 0, v32.Y), 
            (math.clamp(math.round(v31[v23]), 0, v32.Y))
        };
    end;
    v28.setSliceRect = function(v37, v38)
        local l_v37_0 = v37;
        if v38 then
            l_v37_0 = v28.clampAndRoundSliceRect(v37);
        end;
        if v28.props.selectedObject then
            v28.props.selectedObject.SliceCenter = Rect.new(l_v37_0[v20], l_v37_0[v22], l_v37_0[v21], l_v37_0[v23]);
        end;
        l_ChangeHistoryService_0:SetWaypoint("9SliceEditor changed SliceCenter");
    end;
    v28.onRevert = function()
        v28.setSliceRect(v28.props.revertSliceRect, false);
    end;
end;
v19.didMount = function(v40)
    v5.resetCursor(v40.props.Mouse);
end;
v19.render = function(v41)
    local l_props_0 = v41.props;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local l_selectedObject_0 = l_props_0.selectedObject;
    local v45 = v41.getImageDimensions();
    local l_setSliceRect_0 = v41.setSliceRect;
    local l_sliceRect_0 = l_props_0.sliceRect;
    local l_Localization_1 = l_props_0.Localization;
    local l_Button_1 = l_props_0.Stylizer.Button;
    local v50 = false;
    if l_selectedObject_0 then
        local l_sliceRect_1 = l_props_0.sliceRect;
        local l_revertSliceRect_0 = l_props_0.revertSliceRect;
        local v53 = false;
        if l_sliceRect_1[v20] == l_revertSliceRect_0[v20] then
            v53 = false;
            if l_sliceRect_1[v21] == l_revertSliceRect_0[v21] then
                v53 = false;
                if l_sliceRect_1[v22] == l_revertSliceRect_0[v22] then
                    v53 = l_sliceRect_1[v23] == l_revertSliceRect_0[v23];
                end;
            end;
        end;
        if not v53 then
            v50 = true;
        end;
        return v2.createElement(l_Pane_0, {
            Style = "Box", 
            Size = UDim2.fromScale(1, 1), 
            Position = UDim2.fromOffset(0, 0), 
            Layout = Enum.FillDirection.Vertical, 
            Spacing = 0, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            VerticalAlignment = Enum.VerticalAlignment.Top
        }, {
            Upper = v2.createElement(l_Pane_0, {
                Size = UDim2.new(1, 0, 1, -l_Stylizer_0.ButtonsAreaSize.Y.Offset), 
                Layout = Enum.FillDirection.Horizontal, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                Spacing = 0, 
                Padding = {
                    Top = l_Stylizer_0.PaddingPx, 
                    Left = l_Stylizer_0.PaddingPx, 
                    Right = l_Stylizer_0.PaddingPx, 
                    Bottom = 0
                }
            }, {
                ImageEditorComponent = v2.createElement(v7, {
                    layoutOrder = 1, 
                    size = UDim2.new(1 - l_Stylizer_0.TextAreaXWindowScaleFactor, -l_Stylizer_0.TextAreaSize.X.Offset, 1, 0), 
                    selectedObject = l_selectedObject_0, 
                    pixelDimensions = v45, 
                    setSliceRect = l_setSliceRect_0, 
                    sliceRect = l_sliceRect_0, 
                    imageRectOffset = l_props_0.imageRectOffset, 
                    imageRectSize = v45, 
                    imageColor3 = l_props_0.imageColor3, 
                    resampleMode = l_props_0.resampleMode
                }), 
                TextEditorComponent = v2.createElement(v8, {
                    layoutOrder = 2, 
                    size = UDim2.new(l_Stylizer_0.TextAreaXWindowScaleFactor, l_Stylizer_0.TextAreaSize.X.Offset, 0, l_Stylizer_0.TextAreaSize.Y.Offset), 
                    pixelDimensions = v45, 
                    setSliceRect = l_setSliceRect_0, 
                    sliceRect = l_sliceRect_0
                })
            }), 
            Lower = v2.createElement(l_Pane_0, {
                LayoutOrder = 2, 
                Layout = Enum.FillDirection.Horizontal, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                Size = UDim2.new(1, 0, 0, l_Stylizer_0.ButtonsAreaSize.Y.Offset), 
                Position = UDim2.fromOffset(0, l_Stylizer_0.ButtonsAreaYPos), 
                Spacing = l_Stylizer_0.ButtonsSpacing
            }, {
                CloseButton = v2.createElement(l_Button_0, {
                    OnClick = l_props_0.onClose, 
                    Size = l_Button_1.Size, 
                    Style = l_Button_1.Style, 
                    LayoutOrder = 1, 
                    Text = l_Localization_1:getText("SliceEditor", "CloseButton")
                }), 
                RevertButton = v2.createElement(l_Button_0, {
                    OnClick = v41.onRevert, 
                    Size = l_Button_1.Size, 
                    Style = l_Button_1.Style, 
                    StyleModifier = not v50 and l_StyleModifier_0.Disabled or nil, 
                    LayoutOrder = 2, 
                    Text = l_Localization_1:getText("SliceEditor", "RevertButton")
                })
            })
        });
    else
        local v54 = l_Localization_1:getText("SliceEditor", "NoImageSelectedMessage");
        if l_props_0.loading then
            v54 = l_Localization_1:getText("SliceEditor", "ImageLoadingMessage");
        end;
        return v2.createElement(l_Pane_0, {
            Style = "Box", 
            Size = UDim2.fromScale(1, 1), 
            Position = UDim2.fromOffset(0, 0)
        }, {
            EntireFrame = v2.createElement(l_Pane_0, {
                AutomaticSize = Enum.AutomaticSize.XY, 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Position = UDim2.fromScale(0.5, 0.5)
            }, {
                Message = v2.createElement(l_TextLabel_0, {
                    Text = v54, 
                    TextWrapped = true, 
                    Size = l_Stylizer_0.InfoBoxSize
                })
            }), 
            LoadingImage = if not l_9SliceEditorAllowUnloadedImages_0 then nil else v2.createElement("ImageLabel", {
                BackgroundTransparency = 1, 
                ImageTransparency = 0.99, 
                Image = l_props_0.contentIdToLoad, 
                Size = UDim2.fromOffset(1, 1), 
                Position = UDim2.fromOffset(0, 0), 
                ScaleType = Enum.ScaleType.Fit, 
                [v2.Ref] = l_props_0.loadingImageRef
            })
        });
    end;
end;
return (l_withContext_0({
    Analytics = l_Analytics_0, 
    Localization = l_Localization_0, 
    Stylizer = l_ContextServices_0.Stylizer, 
    Mouse = l_ContextServices_0.Mouse
})(v19));
