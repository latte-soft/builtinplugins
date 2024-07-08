local l_Parent_0 = script.Parent.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Framework);
local v2 = require(l_Parent_0.Packages.Roact);
local v3 = require(l_Parent_0.Packages.Cryo);
local l_withContext_0 = v1.ContextServices.withContext;
local v5 = require(l_Parent_0.Src.ContextItems);
local l_UI_0 = v1.UI;
local l_Container_0 = l_UI_0.Container;
local l_Tooltip_0 = l_UI_0.Tooltip;
local l_Dialog_0 = l_UI_0.Dialog;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_LayoutOrderIterator_0 = v1.Util.LayoutOrderIterator;
local l_ellipsizeMiddle_0 = v1.Util.ellipsizeMiddle;
local v13 = require(l_Parent_0.Src.Components.StatusIcon);
local v14 = require(l_Parent_0.Src.Util.Constants);
local v15 = Vector2.new(400, 400);
local v16 = Vector2.new(100, 100);
local v17 = UDim.new(0, 16);
local l_TextService_0 = game:GetService("TextService");
local v19 = v2.PureComponent:extend("PreviewToolbarButton");
v19.init = function(v20)
    v20.state = {
        isHovered = false
    };
    v20.onHovered = function()
        v20:setState({
            isHovered = true
        });
    end;
    v20.onHoverEnded = function()
        v20:setState({
            isHovered = false
        });
    end;
end;
v19.render = function(v21)
    local l_promptSelectorWithPreviewTheme_0 = v21.props.Theme:get().promptSelectorWithPreviewTheme;
    return v2.createElement("ImageButton", v3.Dictionary.join(v21.props, {
        Size = UDim2.new(1, 0, 1, 0), 
        SizeConstraint = Enum.SizeConstraint.RelativeYY, 
        ZIndex = 5, 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        [v2.Event.MouseEnter] = v21.onHovered, 
        [v2.Event.MouseLeave] = v21.onHoverEnded, 
        Image = "", 
        Icon = v3.None, 
        Theme = v3.None
    }), {
        Background = v2.createElement("Frame", {
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Position = UDim2.new(0.5, 0, 0.5, 0), 
            Size = UDim2.new(0, 28, 0, 28), 
            BackgroundTransparency = not v21.state.isHovered and 1 or 0, 
            BorderSizePixel = 0, 
            BackgroundColor3 = l_promptSelectorWithPreviewTheme_0.toolbarButtonBackgroundColor
        }, {
            Icon = v2.createElement("ImageLabel", {
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Position = UDim2.new(0.5, 0, 0.5, 0), 
                Size = UDim2.new(0, 18, 0, 18), 
                ZIndex = 6, 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                Image = v21.props.Icon, 
                ImageColor3 = not not v21.state.isHovered and l_promptSelectorWithPreviewTheme_0.buttonIconHoveredColor or l_promptSelectorWithPreviewTheme_0.buttonIconColor
            })
        })
    });
end;
v19 = l_withContext_0({
    Theme = v5.DEPRECATED_Theme
})(v19);
local v23 = v2.PureComponent:extend("PreviewDialog");
v23.render = function(v24)
    local v25 = v24.props.Theme:get();
    local l_promptSelectorWithPreviewTheme_1 = v25.promptSelectorWithPreviewTheme;
    local v27 = v24.props.PreviewTitle or "";
    local v28 = nil;
    if v24.props.RenderPreview then
        v28 = v24.props.RenderPreview();
    end;
    local v29 = v24.props.Metadata or {};
    local v30 = #v29 > 0 and 4 + 20 * #v29 or 0;
    local v31 = l_LayoutOrderIterator_0.new();
    local v32 = {
        UIListLayout = v2.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, 4)
        }), 
        PreviewContentContainer = v2.createElement("Frame", {
            LayoutOrder = v31:getNextOrder(), 
            Size = UDim2.new(1, 0, 1, -v30), 
            BackgroundColor3 = l_promptSelectorWithPreviewTheme_1.previewBackgroundColor, 
            BorderColor3 = l_promptSelectorWithPreviewTheme_1.previewBorderColor
        }, {
            PreviewContent = v28
        }), 
        EmptyRow = v2.createElement(l_Container_0, {
            LayoutOrder = v31:getNextOrder(), 
            Size = UDim2.new(1, 0, 0, 0)
        })
    };
    for v33, v34 in ipairs(v29) do
        v32["Metadata_" .. tostring(v33)] = v2.createElement(l_TextLabel_0, {
            LayoutOrder = v31:getNextOrder(), 
            Size = UDim2.new(1, 0, 0, 16), 
            Text = v34, 
            TextSize = 16, 
            TextXAlignment = Enum.TextXAlignment.Left
        });
    end;
    return v2.createElement(l_Dialog_0, {
        Title = v27, 
        Size = v15, 
        MinSize = v16, 
        Resizable = true, 
        Enabled = true, 
        Modal = false, 
        ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
        OnClose = v24.props.OnClose
    }, {
        Background = v2.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundColor3 = v25.backgroundColor
        }, {
            UIPadding = v2.createElement("UIPadding", {
                PaddingTop = v17, 
                PaddingBottom = v17, 
                PaddingLeft = v17, 
                PaddingRight = v17
            }), 
            Container = v2.createElement(l_Container_0, {}, v32)
        })
    });
end;
v23 = l_withContext_0({
    Theme = v5.DEPRECATED_Theme
})(v23);
local v35 = v2.PureComponent:extend(script.Name);
v35.init = function(v36)
    v36.state = {
        promptSelectionHovered = false, 
        showingExpandedPreview = false
    };
    v36.onPromptSelectionHover = function()
        v36:setState({
            promptSelectionHovered = true
        });
    end;
    v36.onPromptSelectionHoverEnd = function()
        v36:setState({
            promptSelectionHovered = false
        });
    end;
    v36.openExpandedPreview = function()
        v36:setState({
            showingExpandedPreview = true
        });
    end;
    v36.closeExpandedPreview = function()
        v36:setState({
            showingExpandedPreview = false
        });
    end;
    v36.selectionNameRef = v2.createRef();
    v36.getSelectionNameWidth = function(v37)
        local l_current_0 = v36.selectionNameRef.current;
        if l_current_0 then
            return l_TextService_0:GetTextSize(v37, l_current_0.TextSize, l_current_0.Font, Vector2.new(math.huge, math.huge)).x;
        else
            return 0;
        end;
    end;
    v36.lastSelectionName = "";
    v36.lastSelectionNameWidth = 0;
    v36.updateSelectionNameText = function()
        local l_current_1 = v36.selectionNameRef.current;
        if l_current_1 then
            local l_x_0 = l_current_1.AbsoluteSize.x;
            local v41 = v36.props.SelectionName or "";
            if not (v41 == v36.lastSelectionName) or l_x_0 ~= v36.lastSelectionNameWidth then
                l_current_1.Text = l_ellipsizeMiddle_0(v41, l_x_0, v36.getSelectionNameWidth, v14.FILENAME_ELLIPSIZE_MIDDLE_SUFFIX_LENGTH);
                v36.lastSelectionName = v41;
                v36.lastSelectionNameWidth = l_x_0;
            end;
            return ;
        else
            return ;
        end;
    end;
end;
v35.didMount = function(v42)
    v42.updateSelectionNameText();
end;
v35.didUpdate = function(v43)
    v43.updateSelectionNameText();
end;
v35.render = function(v44)
    local v45 = v44.props.Theme:get();
    local l_promptSelectorWithPreviewTheme_2 = v45.promptSelectorWithPreviewTheme;
    local v47 = v44.props.SelectionName or "";
    local v48 = v44.props.PreviewTitle or "";
    local l_HasSelection_0 = v44.props.HasSelection;
    local l_promptSelectionHovered_0 = v44.state.promptSelectionHovered;
    local l_showingExpandedPreview_0 = v44.state.showingExpandedPreview;
    local v52 = nil;
    if not (not l_HasSelection_0 or not v44.props.RenderPreview) then
        v52 = v44.props.RenderPreview();
    end;
    local v53 = not not l_HasSelection_0 and (l_promptSelectionHovered_0 and true or false);
    local v54 = nil;
    if l_showingExpandedPreview_0 then
        v54 = if not v44.props.GetMetadata then {
            v47
        } else v3.List.join({
            v47
        }, v44.props.GetMetadata());
    end;
    return v2.createElement("Frame", {
        BackgroundTransparency = 1, 
        Size = UDim2.new(0, v14.SECOND_COLUMN_WIDTH, 0, 108)
    }, {
        UIListLayout = v2.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, 4)
        }), 
        PreviewRow = v2.createElement("Frame", {
            LayoutOrder = 1, 
            Size = UDim2.new(0, 88, 0, 88), 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0
        }, {
            ImportButton = v2.createElement("ImageButton", {
                ZIndex = 1, 
                Size = UDim2.new(1, 0, 1, 0), 
                BackgroundTransparency = 0, 
                BorderSizePixel = 1, 
                BackgroundColor3 = not not l_promptSelectionHovered_0 and l_promptSelectorWithPreviewTheme_2.previewHoveredBackgroundColor or l_promptSelectorWithPreviewTheme_2.previewBackgroundColor, 
                BorderColor3 = l_promptSelectorWithPreviewTheme_2.previewBorderColor, 
                Image = "", 
                AutoButtonColor = false, 
                [v2.Event.Activated] = v44.props.PromptSelection, 
                [v2.Event.MouseEnter] = v44.onPromptSelectionHover, 
                [v2.Event.MouseLeave] = v44.onPromptSelectionHoverEnd
            }, {
                Icon = v2.createElement("ImageLabel", {
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    Position = UDim2.new(0.5, 0, 0.5, 0), 
                    Size = UDim2.new(0, 24, 0, 24), 
                    BackgroundTransparency = 1, 
                    Image = l_promptSelectorWithPreviewTheme_2.importIcon, 
                    ImageColor3 = not not l_promptSelectionHovered_0 and l_promptSelectorWithPreviewTheme_2.buttonIconHoveredColor or l_promptSelectorWithPreviewTheme_2.buttonIconColor
                })
            }), 
            ClickBlocker = l_HasSelection_0 and v2.createElement("ImageButton", {
                ZIndex = 2, 
                Size = UDim2.new(1, 0, 1, 0), 
                Image = "", 
                AutoButtonColor = false, 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0
            }, {
                PreviewContentContainer = v2.createElement("Frame", {
                    ZIndex = 3, 
                    Size = UDim2.new(1, 0, 1, 0), 
                    BackgroundColor3 = v45.backgroundColor, 
                    BorderSizePixel = 0
                }, {
                    PreviewContent = v52
                }), 
                Toolbar = v2.createElement("Frame", {
                    ZIndex = 4, 
                    AnchorPoint = Vector2.new(0, 1), 
                    Position = UDim2.new(0, 0, 1, 0), 
                    Size = UDim2.new(1, 0, 0, 32), 
                    Visible = v53, 
                    BackgroundTransparency = l_promptSelectorWithPreviewTheme_2.toolbarTransparency, 
                    BorderSizePixel = 0, 
                    BackgroundColor3 = l_promptSelectorWithPreviewTheme_2.toolbarBackgroundColor
                }, {
                    ExpandPreview = v2.createElement(v19, {
                        Icon = l_promptSelectorWithPreviewTheme_2.expandIcon, 
                        [v2.Event.Activated] = v44.openExpandedPreview
                    }), 
                    ClearButton = v2.createElement(v19, {
                        AnchorPoint = Vector2.new(1, 0), 
                        Position = UDim2.new(1, 0, 0, 0), 
                        Icon = l_promptSelectorWithPreviewTheme_2.clearIcon, 
                        [v2.Event.Activated] = v44.props.ClearSelection
                    })
                })
            }), 
            StatusIcon = v2.createElement(v13, {
                Position = UDim2.new(0, 96, 0, 0), 
                ErrorMessage = v44.props.ErrorMessage, 
                WarningMessage = v44.props.WarningMessage, 
                InfoMessage = v44.props.InfoMessage
            })
        }), 
        SelectionName = v2.createElement("TextLabel", {
            LayoutOrder = 2, 
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 0, 16), 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextColor3 = v45.textColor, 
            Font = v45.font, 
            TextSize = v45.textSize, 
            [v2.Ref] = v44.selectionNameRef, 
            [v2.Change.AbsoluteSize] = v44.updateSelectionNameText
        }, {
            Tooltip = v2.createElement(l_Tooltip_0, {
                Text = v47, 
                Enabled = l_HasSelection_0
            })
        }), 
        ExpandedPreview = l_showingExpandedPreview_0 and v2.createElement(v23, {
            PreviewTitle = v48, 
            RenderPreview = v44.props.RenderPreview, 
            Metadata = v54, 
            OnClose = v44.closeExpandedPreview
        })
    });
end;
return (l_withContext_0({
    Theme = v5.DEPRECATED_Theme
})(v35));
