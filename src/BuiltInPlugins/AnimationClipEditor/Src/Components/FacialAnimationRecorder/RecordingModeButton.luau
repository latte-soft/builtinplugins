local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Roact);
local v2 = require(l_script_FirstAncestor_0.Packages.RoactRodux);
local v3 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_Button_0 = v3.UI.Button;
local l_StyleModifier_0 = v3.Util.StyleModifier;
local l_GetTextSize_0 = v3.Util.GetTextSize;
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v9 = require(l_script_FirstAncestor_0.Src.Util.RigUtils);
local v10 = require(l_script_FirstAncestor_0.Src.Thunks.Recording.ToggleRecordingAndEndReview);
local v11 = require(l_script_FirstAncestor_0.Src.Components.TeachingCallout);
local v12 = v1.PureComponent:extend("RecordingModeButton");
v12.init = function(_)
end;
v12.render = function(v14)
    local l_Localization_0 = v14.props.Localization;
    local l_props_0 = v14.props;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local l_button_0 = l_Stylizer_0.button;
    local _ = v14.state;
    local l_Analytics_0 = l_props_0.Analytics;
    local l_ReadOnly_0 = l_props_0.ReadOnly;
    local function v22()
        l_props_0.ToggleRecordingAndEndReview(l_Analytics_0);
    end;
    local v23 = v9.canUseFaceControlsEditor(l_props_0.RootInstance);
    local v24 = l_Localization_0:getText("FaceCapture", "MainButtonTitle");
    local l_textSize_0 = l_Stylizer_0.ikTheme.textSize;
    local l_font_0 = l_Stylizer_0.font;
    return v14.props.RootInstance and v1.createElement("Frame", {
        Position = l_props_0.Position, 
        Size = UDim2.new(0, l_GetTextSize_0(v24, l_textSize_0, l_font_0, Vector2.new(1000, 1000)).X + 10, 0, 18), 
        BackgroundTransparency = 1, 
        AnchorPoint = Vector2.new(0, 0.5), 
        LayoutOrder = 3
    }, {
        FaceControlsEditorButton = (l_props_0.RootInstance and v23) and v1.createElement(l_Button_0, {
            Style = if not l_props_0.inReviewState then l_button_0.FaceControlsEditorDefault else "RoundPrimary", 
            StyleModifier = if not l_ReadOnly_0 then nil else l_StyleModifier_0.Disabled, 
            Size = UDim2.new(1, 0, 1, 0), 
            IsDisabled = true, 
            OnClick = v22
        }, {
            Label = v1.createElement("TextLabel", {
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, 0, 1, 0), 
                TextYAlignment = Enum.TextYAlignment.Center, 
                TextSize = l_textSize_0, 
                Text = v24, 
                Font = l_font_0, 
                TextColor3 = l_Stylizer_0.ikTheme.textColor
            }, {
                TeachingCallout = if not not l_props_0.RootInstance and v23 then v1.createElement(v11, {
                    Offset = Vector2.new(0, 6), 
                    DefinitionId = "FaceRecorderCallout", 
                    LocationId = "RecordingModeButton"
                }) else nil
            })
        })
    });
end;
return v2.connect(function(v27, _)
    return {
        inReviewState = v27.Status.inReviewState, 
        ReadOnly = v27.Status.ReadOnly, 
        RootInstance = v27.Status.RootInstance
    };
end, function(v29)
    return {
        ToggleRecordingAndEndReview = function(v30)
            v29(v10(v30));
        end
    };
end)((l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer, 
    Localization = l_ContextServices_0.Localization, 
    Analytics = l_ContextServices_0.Analytics
})(v12)));
