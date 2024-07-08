local v0 = require(script:FindFirstAncestor("VisualizationModes").Packages.Framework);
local l_createStyleRule_0 = v0.Styling.createStyleRule;
return v0.Styling.createStyleSheet("VisualizationModes", {
    l_createStyleRule_0(".VisualizationModes-Bottom-Divider", {
        Size = UDim2.new(1, 0, 0, 5), 
        Position = UDim2.new(0.5, 0, 1, 0), 
        AnchorPoint = Vector2.new(0.5, 1), 
        BackgroundTransparency = 1
    }, {
        l_createStyleRule_0("> #DividerRender", {
            Size = UDim2.new(1, 0, 0, 1), 
            Position = UDim2.fromOffset(0, 2), 
            BackgroundColor3 = "$VisualizationModesDivider", 
            BorderSizePixel = 0
        })
    }), 
    l_createStyleRule_0(".VisualizationModes-TextLabel-Container", {
        BorderSizePixel = 0, 
        BackgroundTransparency = 1, 
        Size = UDim2.fromScale(0, 1), 
        AutomaticSize = Enum.AutomaticSize.X
    }), 
    l_createStyleRule_0(".VisualizationModes-Highlight", {
        BackgroundTransparency = 0, 
        BorderSizePixel = 0, 
        BackgroundColor3 = "$VisualizationModesHighlightColor", 
        AnchorPoint = Vector2.new(0, 0.5), 
        Position = UDim2.fromScale(0, 0.5)
    }), 
    l_createStyleRule_0(".VisualizationModes-Highlight-TextLabel", {
        TextColor3 = "$VisualizationModesHighlightTextColor", 
        AnchorPoint = Vector2.new(0, 0.5), 
        Position = UDim2.fromScale(0, 0.5)
    }), 
    l_createStyleRule_0(".VisualizationModes-TextLabel", {
        TextColor3 = "$TextPrimary", 
        BorderSizePixel = 0, 
        BackgroundTransparency = 1, 
        TextXAlignment = Enum.TextXAlignment.Left, 
        TextYAlignment = Enum.TextYAlignment.Center, 
        Size = UDim2.fromScale(0, 1), 
        AutomaticSize = Enum.AutomaticSize.X
    }, {
        l_createStyleRule_0(".VisualizationModes-Disabled", {
            TextColor3 = "$TextDisabled"
        })
    }), 
    l_createStyleRule_0(".VisualizationModes-Badge", {
        BorderSizePixel = 0, 
        BackgroundColor3 = "$VisualizationModesBadgeBackground"
    }, {
        l_createStyleRule_0("::UICorner", {
            CornerRadius = UDim.new(0.5, 0)
        }), 
        l_createStyleRule_0("::UIPadding", {
            PaddingLeft = UDim.new(0, 6), 
            PaddingTop = UDim.new(0, 1), 
            PaddingBottom = UDim.new(0, 1), 
            PaddingRight = UDim.new(0, 6)
        }), 
        l_createStyleRule_0(">> .Component-TextLabel", {
            TextSize = 12, 
            TextColor3 = "$VisualizationModesBadgeText", 
            TextYAlignment = Enum.TextYAlignment.Center
        })
    }), 
    l_createStyleRule_0(".VisualizationModes-MainPane", {}, {
        l_createStyleRule_0("::UIStroke", {})
    }), 
    l_createStyleRule_0(".VisualizationModes-ExpandIcon", {
        BackgroundTransparency = 1, 
        ImageColor3 = "$TextPrimary"
    }, {
        l_createStyleRule_0("ArrowImage", {
            Size = UDim2.fromOffset(16, 16), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Position = UDim2.fromScale(0.5, 0.5)
        }), 
        l_createStyleRule_0(":pressed", {
            ImageColor3 = "$TextSecondary"
        }), 
        l_createStyleRule_0(":hover", {
            ImageColor3 = "$TextSecondary"
        })
    }), 
    l_createStyleRule_0(".VisualizationModes-ExpandIcon-Expanded", {
        Image = "rbxasset://studio_svg_textures/Shared/Navigation/Dark/Standard/ArrowDown.png"
    }), 
    l_createStyleRule_0(".VisualizationModes-ExpandIcon-Collapsed", {
        Image = "rbxasset://studio_svg_textures/Shared/Navigation/Dark/Standard/ArrowRight.png"
    }), 
    l_createStyleRule_0(".VisualizationModes-Entry", {
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, 0, 0, 32), 
        AutoButtonColor = false
    }, {
        l_createStyleRule_0("> #VisualizationModesEntryBacking", {
            BorderSizePixel = 0, 
            Size = UDim2.new(1, 0, 0, 28), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Position = UDim2.fromScale(0.5, 0.5), 
            BackgroundTransparency = 1
        }, {
            l_createStyleRule_0("::UICorner", {
                CornerRadius = UDim.new(0, 4)
            })
        }), 
        l_createStyleRule_0(".VisualizationModes-Active:pressed > #VisualizationModesEntryBacking", {
            BackgroundTransparency = 0, 
            BackgroundColor3 = "$ActionActivated"
        }), 
        l_createStyleRule_0(".VisualizationModes-Active:hover > #VisualizationModesEntryBacking", {
            BackgroundTransparency = 0, 
            BackgroundColor3 = "$VisualizationModesDimActionHover"
        })
    }), 
    l_createStyleRule_0(".ScrollingAutomaticSize", {
        AutomaticCanvasSize = Enum.AutomaticSize.Y, 
        CanvasSize = UDim2.new(1, 0, 0, 20)
    }), 
    l_createStyleRule_0(".VisualizationModes-EntryButton", {
        BorderSizePixel = 0, 
        Size = UDim2.new(1, -20, 1, 0), 
        BackgroundTransparency = 1, 
        AutoButtonColor = false
    }), 
    l_createStyleRule_0(".VisualizationModes-Group", {
        BorderSizePixel = 0, 
        Size = UDim2.fromScale(1, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        BackgroundTransparency = 1, 
        AutoButtonColor = false
    }), 
    l_createStyleRule_0(".VisualizationModes-MainScrollingFrame", {
        ScrollBarThickness = 3
    }, {
        l_createStyleRule_0("> #Content", {
            Size = UDim2.new(1, -4, 0, 0)
        })
    }), 
    l_createStyleRule_0(".VisualizationModes-Popup", {}, {
        l_createStyleRule_0("::UIPadding", {
            PaddingLeft = UDim.new(0, 5), 
            PaddingBottom = UDim.new(0, 5), 
            PaddingTop = UDim.new(0, 5), 
            PaddingRight = UDim.new(0, 2)
        })
    }), 
    l_createStyleRule_0(".VisualizationModesStrokePane", {
        Name = "UIStrokePane", 
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, -2, 1, -2), 
        AnchorPoint = Vector2.new(0.5, 0.5), 
        Position = UDim2.fromScale(0.5, 0.5)
    }, {
        l_createStyleRule_0("::UIStroke", {
            Color = "$Divider"
        })
    }), 
    l_createStyleRule_0(".VisualizationModes-HiddenCountLabel", {
        TextXAlignment = Enum.TextXAlignment.Center, 
        TextYAlignment = Enum.TextYAlignment.Center, 
        TextColor3 = "$TextSecondary", 
        Size = UDim2.new(1, 0, 0, 28), 
        BackgroundTransparency = 1
    })
}, {});
