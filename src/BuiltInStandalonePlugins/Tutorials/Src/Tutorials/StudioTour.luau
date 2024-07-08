return {
    id = "StudioTour", 
    steps = {
        {
            id = "welcome", 
            kind = "Dialog"
        }, 
        {
            id = "parts", 
            kind = "Insert", 
            callout = {
                target = "placePartAction", 
                anchorPoint = Vector2.new(0.5, 0)
            }, 
            className = "Part", 
            widgets = "Ribbon-Home"
        }, 
        {
            id = "focus", 
            kind = "Focus", 
            onBind = function()
                game:GetService("TutorialService"):SetTutorialCompletionStatus(true);
            end
        }, 
        {
            id = "color", 
            kind = "Edit", 
            callout = {
                target = "actionColorSelector", 
                anchorPoint = Vector2.new(0.5, 0)
            }, 
            className = "Part", 
            changes = {
                Color = true
            }, 
            widgets = "Ribbon-Home"
        }, 
        {
            id = "moveCamera", 
            kind = "Input", 
            keys = {
                Enum.KeyCode.W, 
                Enum.KeyCode.A, 
                Enum.KeyCode.S, 
                Enum.KeyCode.D
            }
        }, 
        {
            id = "panCamera", 
            kind = "Input", 
            keys = {
                Enum.KeyCode.E, 
                Enum.KeyCode.Q
            }
        }, 
        {
            id = "zoomCamera", 
            kind = "Input", 
            inputs = {
                Enum.UserInputType.MouseWheel
            }
        }, 
        {
            id = "rotateCamera", 
            kind = "Input", 
            inputs = {
                Enum.UserInputType.MouseButton2
            }, 
            keys = {
                Enum.KeyCode.LeftControl
            }
        }, 
        {
            id = "explorer", 
            callout = {
                target = "explorerWidgetPanel", 
                hideArrow = true
            }, 
            showNext = true, 
            widgets = "Ribbon-Home,Explorer"
        }, 
        {
            id = "workspace", 
            path = "Workspace", 
            callout = {
                target = "explorerWidgetPanel", 
                rowName = "Workspace", 
                hideArrow = true
            }, 
            showNext = true, 
            onBind = function(v0)
                local l_dataModel_0 = v0.dataModel;
                l_dataModel_0:GetService("Selection"):Set({
                    l_dataModel_0:GetService("Workspace")
                });
            end, 
            widgets = "Ribbon-Home,Explorer"
        }, 
        {
            id = "select", 
            kind = "Select", 
            path = "Part", 
            callout = {
                target = "explorerWidgetPanel", 
                rowName = "Part", 
                hideArrow = true
            }, 
            widgets = "Ribbon-Home,Explorer"
        }, 
        {
            id = "properties", 
            callout = {
                target = "propertiesWidgetPanel", 
                hideArrow = true
            }, 
            showNext = true, 
            widgets = "Ribbon-Home,Explorer,Properties"
        }, 
        {
            id = "material", 
            kind = "Edit", 
            callout = {
                target = "propertiesWidgetPanel", 
                hideArrow = true
            }, 
            className = "Part", 
            changes = {
                Material = true
            }, 
            widgets = "Ribbon-Home,Explorer,Properties"
        }, 
        {
            id = "playtest", 
            kind = "Playtest", 
            widgets = "Ribbon-Home"
        }
    }
};
