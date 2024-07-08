local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.React);
local v2 = require(l_Parent_0.Packages.Framework);
local l_joinTags_0 = v2.Styling.joinTags;
local v4 = v2.Util.LayoutOrderIterator.new();
local function v5()
    return v1.createElement("ScrollingFrame", {
        [v1.Tag] = l_joinTags_0("X-Column", "Component-TokenExamples")
    }, {
        BackgroundDefault = v1.createElement("Frame", {
            LayoutOrder = v4:getNextOrder()
        }, {
            Text = v1.createElement("TextLabel", {
                Text = "BackgroundDefault"
            })
        }), 
        BackgroundPaper = v1.createElement("Frame", {
            LayoutOrder = v4:getNextOrder()
        }, {
            Text = v1.createElement("TextLabel", {
                Text = "BackgroundPaper"
            })
        }), 
        ForegroundMain = v1.createElement("Frame", {
            LayoutOrder = v4:getNextOrder()
        }, {
            Text = v1.createElement("TextLabel", {
                Text = "ForegroundMain"
            })
        }), 
        ForegroundMuted = v1.createElement("Frame", {
            LayoutOrder = v4:getNextOrder()
        }, {
            Text = v1.createElement("TextLabel", {
                Text = "ForegroundMuted"
            })
        }), 
        ForegroundContrast = v1.createElement("Frame", {
            LayoutOrder = v4:getNextOrder()
        }, {
            Text = v1.createElement("TextLabel", {
                Text = "ForegroundContrast"
            })
        }), 
        TextPrimary = v1.createElement("TextLabel", {
            LayoutOrder = v4:getNextOrder(), 
            Text = "TextPrimary"
        }), 
        TextSecondary = v1.createElement("TextLabel", {
            LayoutOrder = v4:getNextOrder(), 
            Text = "TextSecondary"
        }), 
        TextContrast = v1.createElement("TextLabel", {
            LayoutOrder = v4:getNextOrder(), 
            Text = "TextContrast"
        }), 
        TextLink = v1.createElement("TextLabel", {
            LayoutOrder = v4:getNextOrder(), 
            Text = "TextLink"
        }), 
        TextDisabled = v1.createElement("TextLabel", {
            LayoutOrder = v4:getNextOrder(), 
            Text = "TextDisabled"
        }), 
        TextError = v1.createElement("TextLabel", {
            LayoutOrder = v4:getNextOrder(), 
            Text = "TextError"
        }), 
        TextSuccess = v1.createElement("TextLabel", {
            LayoutOrder = v4:getNextOrder(), 
            Text = "TextSuccess"
        }), 
        TextWarning = v1.createElement("TextLabel", {
            LayoutOrder = v4:getNextOrder(), 
            Text = "TextWarning"
        }), 
        ErrorMain = v1.createElement("Frame", {
            LayoutOrder = v4:getNextOrder()
        }, {
            Text = v1.createElement("TextLabel", {
                Text = "ErrorMain"
            })
        }), 
        SuccessMain = v1.createElement("Frame", {
            LayoutOrder = v4:getNextOrder()
        }, {
            Text = v1.createElement("TextLabel", {
                Text = "SuccessMain"
            })
        }), 
        WarningMain = v1.createElement("Frame", {
            LayoutOrder = v4:getNextOrder()
        }, {
            Text = v1.createElement("TextLabel", {
                Text = "WarningMain"
            })
        }), 
        ActionEnabled = v1.createElement("TextButton", {
            LayoutOrder = v4:getNextOrder(), 
            Text = "ActionEnabled"
        }), 
        ActionSelected = v1.createElement("TextButton", {
            LayoutOrder = v4:getNextOrder(), 
            Text = "ActionSelected"
        }), 
        ActionActivated = v1.createElement("TextButton", {
            LayoutOrder = v4:getNextOrder(), 
            Text = "ActionActivated"
        }), 
        ActionHover = v1.createElement("TextButton", {
            LayoutOrder = v4:getNextOrder(), 
            Text = "ActionHover (hover over me)"
        }), 
        ActionFocusBorder = v1.createElement("TextButton", {
            LayoutOrder = v4:getNextOrder(), 
            Text = "ActionFocusBorder (border color)"
        }), 
        PrimaryMain = v1.createElement("Frame", {
            LayoutOrder = v4:getNextOrder()
        }, {
            Text = v1.createElement("TextLabel", {
                Text = "PrimaryMain"
            })
        }), 
        PrimaryHoverBackground = v1.createElement("Frame", {
            LayoutOrder = v4:getNextOrder()
        }, {
            Text = v1.createElement("TextLabel", {
                Text = "PrimaryHoverBackground (hover over me)"
            })
        }), 
        SecondaryMain = v1.createElement("Frame", {
            LayoutOrder = v4:getNextOrder()
        }, {
            Text = v1.createElement("TextLabel", {
                Text = "SecondaryMain"
            })
        }), 
        SecondaryMuted = v1.createElement("Frame", {
            LayoutOrder = v4:getNextOrder()
        }, {
            Text = v1.createElement("TextLabel", {
                Text = "SecondaryMuted"
            })
        }), 
        SecondaryContrast = v1.createElement("Frame", {
            LayoutOrder = v4:getNextOrder()
        }, {
            Text = v1.createElement("TextLabel", {
                Text = "SecondaryContrast"
            })
        }), 
        SecondaryHoverBackground = v1.createElement("Frame", {
            LayoutOrder = v4:getNextOrder()
        }, {
            Text = v1.createElement("TextLabel", {
                Text = "SecondaryHoverBackground (hover over me)"
            })
        }), 
        SecondaryHoverOutlineBorder = v1.createElement("Frame", {
            LayoutOrder = v4:getNextOrder()
        }, {
            Text = v1.createElement("TextLabel", {
                Text = "SecondaryHoverOutlineBorder"
            })
        }), 
        SecondaryRestingOutlineBorder = v1.createElement("Frame", {
            LayoutOrder = v4:getNextOrder()
        }, {
            Text = v1.createElement("TextLabel", {
                Text = "SecondaryRestingOutlineBorder"
            })
        }), 
        FilledInputBackground = v1.createElement("Frame", {
            LayoutOrder = v4:getNextOrder()
        }, {
            Text = v1.createElement("TextLabel", {
                Text = "FilledInputBackground"
            })
        }), 
        Divider = v1.createElement("Frame", {
            LayoutOrder = v4:getNextOrder()
        }, {
            Text = v1.createElement("TextLabel", {
                Text = "Divider"
            })
        }), 
        CheckboxUncheckedImage = v1.createElement("ImageLabel", {
            LayoutOrder = v4:getNextOrder()
        }), 
        CheckboxCheckedImage = v1.createElement("ImageLabel", {
            LayoutOrder = v4:getNextOrder()
        }), 
        CheckboxIndeterminateImage = v1.createElement("ImageLabel", {
            LayoutOrder = v4:getNextOrder()
        }), 
        CheckboxDisabledImage = v1.createElement("ImageLabel", {
            LayoutOrder = v4:getNextOrder()
        })
    });
end;
local function _()
end;
return v5;
