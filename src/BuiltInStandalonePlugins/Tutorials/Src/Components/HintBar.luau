local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.React);
local v2 = require(l_Parent_0.Packages.Framework);
local l_CoreGui_0 = game:GetService("CoreGui");
local l_ContextServices_0 = v2.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Stylizer_0 = l_ContextServices_0.Stylizer;
local l_Localization_0 = l_ContextServices_0.Localization;
local v8 = require(l_Parent_0.Src.Components.HintKeys);
local v9 = require(l_Parent_0.Src.Util.counter);
local l_UI_0 = v2.UI;
local l_Button_0 = l_UI_0.Button;
local l_Image_0 = l_UI_0.Image;
local l_LoadingBar_0 = l_UI_0.LoadingBar;
local l_Pane_0 = l_UI_0.Pane;
local l_TextLabel_0 = l_UI_0.TextLabel;
local v16 = v1.PureComponent:extend("HintBar");
v16.init = function(v17)
    v17.guiRef = v1.createRef();
end;
v16.didMount = function(v18)
    local l_Tutorial_0 = l_CoreGui_0:FindFirstChild("Tutorial");
    if l_Tutorial_0 then
        l_Tutorial_0:Destroy();
    end;
    v18.guiRef.current.Parent = l_CoreGui_0;
end;
v16.render = function(v20)
    local l_props_0 = v20.props;
    local l_Localization_1 = l_props_0.Localization;
    local v23 = v9();
    local l_TutorialData_0 = l_props_0.TutorialData;
    local v25 = if not l_TutorialData_0 then nil else l_TutorialData_0.step;
    local v26 = v25 and v25.kind == "Dialog";
    local l_PressedKeys_0 = l_props_0.PressedKeys;
    return v1.createElement("ScreenGui", {
        Name = "Tutorial", 
        ref = v20.guiRef
    }, {
        Content = if not (not v25 or v25.callout) and v25.kind ~= "Playtest" then v1.createElement(l_Pane_0, {
            AnchorPoint = if not v26 then Vector2.new(0.5, 1) else Vector2.new(0.5, 0.5), 
            ClipsDescendants = true, 
            AutomaticSize = Enum.AutomaticSize.XY, 
            Layout = Enum.FillDirection.Vertical, 
            Style = "Box", 
            BackgroundTransparency = 0.05, 
            Spacing = 20, 
            Position = if not v26 then UDim2.new(0.5, 0, 1, -48) else UDim2.fromScale(0.5, 0.5)
        }, {
            Corner = v1.createElement("UICorner", {
                CornerRadius = UDim.new(0, 16)
            }), 
            MaxSize = v1.createElement("UISizeConstraint", {
                MaxSize = Vector2.new(500, 500)
            }), 
            Hint = v1.createElement(l_Pane_0, {
                AutomaticSize = Enum.AutomaticSize.XY, 
                Layout = Enum.FillDirection.Vertical, 
                Padding = 20, 
                Spacing = 20
            }, {
                Tick = if v25.kind == "Completed" then v1.createElement(l_Image_0, {
                    LayoutOrder = v23(), 
                    Image = "rbxasset://textures/Tutorials/Tick.png", 
                    Size = UDim2.fromOffset(52, 52)
                }) else nil, 
                Keys = if not l_PressedKeys_0 then nil else v1.createElement(v8, {
                    LayoutOrder = v23(), 
                    PressedKeys = l_PressedKeys_0
                }), 
                Title = if not not v25.title and v25.kind == "Dialog" then v1.createElement(l_TextLabel_0, {
                    AutomaticSize = Enum.AutomaticSize.XY, 
                    LayoutOrder = v23(), 
                    TextWrapped = true, 
                    Text = v25.title, 
                    Font = Enum.Font.SourceSansBold, 
                    TextSize = 26
                }) else nil, 
                Subtitle = if not v25.description then nil else v1.createElement(l_TextLabel_0, {
                    AutomaticSize = Enum.AutomaticSize.XY, 
                    LayoutOrder = v23(), 
                    Text = v25.description, 
                    TextSize = 22, 
                    TextWrapped = true, 
                    RichText = true
                }), 
                ButtonRow = if not (v25.kind ~= "Dialog") or v25.showNext then v1.createElement(l_Pane_0, {
                    AutomaticSize = Enum.AutomaticSize.XY, 
                    Layout = Enum.FillDirection.Horizontal, 
                    LayoutOrder = v23(), 
                    Spacing = 20
                }, {
                    Next = v1.createElement(l_Button_0, {
                        LayoutOrder = v23(), 
                        Text = v25.nextText or l_Localization_1:getText("Tutorial", "Begin"), 
                        Style = "RoundPrimary", 
                        OnClick = l_props_0.OnNext, 
                        Size = UDim2.fromOffset(80, 32)
                    })
                }) else nil
            })
        }) else nil, 
        ProgressRow = l_TutorialData_0 and v1.createElement(l_Pane_0, {
            AnchorPoint = Vector2.new(0, 1), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            BackgroundTransparency = 0.05, 
            Layout = Enum.FillDirection.Horizontal, 
            Position = UDim2.fromScale(0, 1), 
            Padding = 5, 
            Spacing = 10, 
            Size = UDim2.fromScale(1, 0), 
            Style = "Box"
        }, {
            Name = v1.createElement(l_TextLabel_0, {
                AutomaticSize = Enum.AutomaticSize.XY, 
                Style = "Subtitle", 
                Text = l_props_0.Title
            }), 
            Progress = v1.createElement(l_LoadingBar_0, {
                LayoutOrder = v23(), 
                Progress = (l_TutorialData_0.currentStep - 1) / l_TutorialData_0.stepCount, 
                Size = UDim2.new(1, -300, 0, 20)
            }), 
            Skip = v1.createElement(l_Button_0, {
                LayoutOrder = v23(), 
                Text = l_Localization_1:getText("Tutorial", "SkipStep"), 
                Style = "Round", 
                OnClick = l_props_0.OnSkip, 
                Size = UDim2.fromOffset(80, 32)
            })
        })
    });
end;
return (l_withContext_0({
    Localization = l_Localization_0, 
    Stylizer = l_Stylizer_0
})(v16));
