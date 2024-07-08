local v0 = require(script.Parent.Parent.Parent.Packages.Framework);
local l_createStyleRule_0 = v0.Styling.createStyleRule;
local l_createStyleSheet_0 = v0.Styling.createStyleSheet;
local v3 = {
    BorderSize = 1, 
    ButtonHeight = 36, 
    Icon16 = UDim2.fromOffset(16, 16), 
    Icon22 = UDim2.fromOffset(22, 22), 
    PaddingSm = 5, 
    Padding = 10, 
    PropertyCellSize = UDim2.new(1, 0, 0, 24), 
    SearchBarHeight = 32, 
    Spacing = 10, 
    TitleTextSize = 24, 
    TokenTooltipRowHeight = 20, 
    TooltipMaxWidth = 350, 
    ColorKeypoint = Color3.fromRGB(252, 116, 116), 
    ColorKeypointSelected = Color3.fromRGB(255, 0, 0), 
    CursorOpenedHand = "rbxasset://textures/advCursor-openedHand.png"
};
return (l_createStyleSheet_0("StyleEditor", {
    l_createStyleRule_0(".Icon16", {
        Size = "$Icon16"
    }), 
    l_createStyleRule_0(".Icon22", {
        Size = "$Icon22"
    }), 
    l_createStyleRule_0(".ItemTextSize", {
        TextSize = 18
    }), 
    l_createStyleRule_0(".PositionCenter", {
        AnchorPoint = Vector2.new(0.5, 0.5), 
        Position = UDim2.fromScale(0.5, 0.5)
    }), 
    l_createStyleRule_0(".PositionRight", {
        AnchorPoint = Vector2.new(1, 0), 
        Position = UDim2.fromScale(1, 0)
    }), 
    l_createStyleRule_0(".PropertyCellSize", {
        Size = "$PropertyCellSize"
    }), 
    l_createStyleRule_0(".ScrollingAutomaticSize", {
        AutomaticCanvasSize = Enum.AutomaticSize.Y, 
        CanvasSize = UDim2.fromScale(0, 0)
    }), 
    l_createStyleRule_0(".TextXAlignLeft", {
        TextXAlignment = Enum.TextXAlignment.Left
    }), 
    l_createStyleRule_0(".SearchInput", {}, {
        l_createStyleRule_0(">> UIStroke", {
            Thickness = 0
        }), 
        l_createStyleRule_0(">> UICorner", {
            CornerRadius = UDim.new()
        })
    }), 
    l_createStyleRule_0(".LeftItems", {
        BackgroundTransparency = 0, 
        BackgroundColor3 = "$BackgroundPaper"
    }), 
    l_createStyleRule_0(".TokenSource", {}, {
        l_createStyleRule_0("::UIPadding", {
            PaddingLeft = UDim.new(0, 5)
        }), 
        l_createStyleRule_0(">> .TokenSourceIcon", {
            Size = UDim2.fromOffset(20, 20)
        })
    }), 
    l_createStyleRule_0(".PreviewGrid", {
        BackgroundTransparency = 1, 
        ScaleType = Enum.ScaleType.Tile, 
        TileSize = UDim2.fromOffset(20, 20)
    }), 
    l_createStyleRule_0(".OnboardingPage", {}, {
        l_createStyleRule_0(":: UISizeConstraint", {
            MaxSize = Vector2.new(400, 400), 
            MinSize = Vector2.new(180, 180)
        }), 
        l_createStyleRule_0("> #StylingImage", {
            Size = UDim2.fromOffset(400, 180)
        }, {
            l_createStyleRule_0(":: UIAspectRatioConstraint", {
                AspectRatio = 3.75, 
                AspectType = Enum.AspectType.ScaleWithParentSize
            })
        }), 
        l_createStyleRule_0("> #Description", {
            TextSize = 16, 
            TextWrapped = true
        }), 
        l_createStyleRule_0("> #ButtonContainer", {
            Size = UDim2.new(1, 0, 0, 90)
        }, {
            l_createStyleRule_0(":: UIPadding", {
                PaddingTop = UDim.new(0, 16)
            }), 
            l_createStyleRule_0("> #Link", {
                AnchorPoint = Vector2.new(0, 0.5)
            }), 
            l_createStyleRule_0("> #BlankButton", {
                AnchorPoint = Vector2.new(1, 0.5)
            })
        })
    }), 
    l_createStyleRule_0(".FontStyle", {}, {
        l_createStyleRule_0("Frame", {
            BackgroundColor3 = "$ActionActivated", 
            BackgroundTransparency = 0, 
            Size = UDim2.fromOffset(24, 24)
        }, {
            l_createStyleRule_0(":hover", {
                BackgroundColor3 = "$ActionHover"
            }), 
            l_createStyleRule_0(".Selected", {
                BackgroundColor3 = "$ActionEnabled"
            })
        }), 
        l_createStyleRule_0("TextButton", {
            BackgroundTransparency = 1, 
            RichText = true, 
            TextColor3 = "$TextSecondary"
        }, {
            l_createStyleRule_0(":hover", {
                TextColor3 = "$TextContrast"
            }), 
            l_createStyleRule_0(":pressed", {
                TextColor3 = "$TextContrast"
            }), 
            l_createStyleRule_0(".Selected", {
                TextColor3 = "$TextDisabled"
            }), 
            l_createStyleRule_0("#BoldButton", {
                Text = "<font family='rbxasset://fonts/families/SourceSansPro.json'><b>B</b></font>"
            }), 
            l_createStyleRule_0("#ItalicButton", {
                Text = "<font family='rbxasset://fonts/families/Inconsolata.json'><i>I</i></font>"
            })
        })
    }), 
    l_createStyleRule_0(".SequenceKeypoint", {
        AnchorPoint = Vector2.new(0.5, 0.5), 
        BackgroundColor3 = "$ColorKeypoint", 
        BackgroundTransparency = 0, 
        Text = "", 
        ZIndex = 3
    }, {
        l_createStyleRule_0(".Selected", {
            BackgroundColor3 = "$ColorKeypointSelected"
        }, {
            l_createStyleRule_0("::UIStroke", {
                ApplyStrokeMode = Enum.ApplyStrokeMode.Border, 
                Color = Color3.fromRGB(0, 0, 0), 
                Thickness = 2, 
                Transparency = 0.6
            })
        })
    }), 
    l_createStyleRule_0(".NumberSequenceKeypoint", {
        Size = UDim2.fromOffset(8, 8)
    }), 
    l_createStyleRule_0(".NumberSequenceLine", {
        BorderSizePixel = 0, 
        ZIndex = 2, 
        BackgroundTransparency = 0.6, 
        BackgroundColor3 = "$ColorKeypoint"
    }, {
        l_createStyleRule_0(".SelectedStart", {
            BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        }, {
            l_createStyleRule_0("::UIGradient", {
                Color = ColorSequence.new(v3.ColorKeypointSelected, v3.ColorKeypoint)
            })
        }), 
        l_createStyleRule_0(".SelectedEnd", {
            BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        }, {
            l_createStyleRule_0("::UIGradient", {
                Color = ColorSequence.new(v3.ColorKeypoint, v3.ColorKeypointSelected)
            })
        })
    }), 
    l_createStyleRule_0(".ColorSequenceKeypoint", {
        Size = UDim2.fromOffset(8, 16)
    }), 
    l_createStyleRule_0(".ColorSequenceLine", {
        AnchorPoint = Vector2.new(0.5, 0), 
        BackgroundColor3 = Color3.fromRGB(255, 255, 255), 
        BackgroundTransparency = 0.7, 
        BorderPixelSize = 0, 
        Size = UDim2.new(0, 2, 1, 0), 
        ZIndex = 2
    }, {
        l_createStyleRule_0(".Selected", {
            BackgroundTransparency = 0.4
        }, {
            l_createStyleRule_0("::UIStroke", {
                Color = Color3.fromRGB(0, 0, 0), 
                Thickness = 2, 
                Transparency = 0.75
            })
        })
    }), 
    l_createStyleRule_0(".SequencePreviewButton", {
        Size = UDim2.fromOffset(20, 20), 
        BackgroundColor3 = Color3.new(1, 1, 1)
    }), 
    l_createStyleRule_0(".LabelCell", {}, {
        l_createStyleRule_0("::UIPadding", {
            PaddingLeft = UDim.new(0, 5), 
            PaddingRight = UDim.new(0, 5)
        })
    }), 
    l_createStyleRule_0(".DropdownItem", {
        Size = UDim2.new(1, 0, 0, 40), 
        BackgroundTransparency = 0, 
        BackgroundColor3 = "$ForegroundMain"
    }, {
        l_createStyleRule_0(":hover", {
            BackgroundColor3 = "$ActionHover"
        }), 
        l_createStyleRule_0(":pressed", {
            BackgroundColor3 = "$ActionActivated"
        })
    }), 
    l_createStyleRule_0(".DeriveRenderer", {}, {
        l_createStyleRule_0(">> ImageLabel", {
            ImageTransparency = 1
        }), 
        l_createStyleRule_0(":hover >> ImageLabel", {
            ImageTransparency = 0
        })
    }), 
    l_createStyleRule_0(".BreadcrumbRadioSize", {
        Size = UDim2.new(1, -80, 1, 0)
    }), 
    l_createStyleRule_0(".PropertyCellDisabled >> TextBox", {
        TextTransparency = 0.5
    })
}, v3));
