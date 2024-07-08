local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Roact);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local v3 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local v4 = require(l_script_FirstAncestor_0.Src.Components.EditEventsDialog.FocusedPrompt);
local l_ContextServices_0 = v2.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v7 = v1.PureComponent:extend("ProgressScreen");
v7.statusCodeToKey = function(_, v9)
    for v10, v11 in pairs(v3.ANIMATION_FROM_VIDEO_STATUS) do
        if v11 == v9 then
            return v10;
        end;
    end;
    return "Error";
end;
v7.statusCodeToString = function(v12, v13)
    return v12.props.Localization:getText("AnimationFromVideo", (v12:statusCodeToKey(v13)));
end;
v7.render = function(v14)
    local l_Stylizer_0 = v14.props.Stylizer;
    local l_Localization_0 = v14.props.Localization;
    local _ = l_Stylizer_0.progressScreenTheme;
    local l_props_0 = v14.props;
    local l_OnCancelled_0 = l_props_0.OnCancelled;
    local l_OnClose_0 = l_props_0.OnClose;
    local l_dialogTheme_0 = l_Stylizer_0.dialogTheme;
    return v1.createElement(v4, {
        Size = UDim2.new(0, 380, 0, 140), 
        Buttons = {
            {
                Key = false, 
                Text = l_Localization_0:getText("Dialog", "Cancel")
            }
        }, 
        OnButtonClicked = l_OnCancelled_0, 
        OnClose = l_OnClose_0
    }, {
        Layout = v1.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Vertical, 
            Padding = UDim.new(0, 8)
        }), 
        PromptText = v1.createElement("TextLabel", {
            Size = UDim2.new(1, 0, 0, v3.TRACK_HEIGHT), 
            BackgroundTransparency = 1, 
            TextSize = l_dialogTheme_0.textSize, 
            TextColor3 = l_dialogTheme_0.textColor, 
            Font = l_Stylizer_0.font, 
            Text = v14:statusCodeToString(l_props_0.Status), 
            TextTruncate = Enum.TextTruncate.AtEnd, 
            LayoutOrder = 1
        }), 
        ProgressBarContainer = v1.createElement("Frame", {
            BackgroundColor3 = l_Stylizer_0.BorderColor, 
            BackgroundTransparency = 0, 
            BorderSizePixel = 1, 
            Size = UDim2.new(1, 0, 0, v3.TRACK_HEIGHT), 
            LayoutOrder = 2
        }, {
            ProgressBar = v1.createElement("Frame", {
                BackgroundColor3 = l_Stylizer_0.progressBarTheme.backgroundColor, 
                Size = UDim2.new(math.max(0, (math.min(1, l_props_0.Progress / 100))), 0, 0, v3.TRACK_HEIGHT)
            })
        })
    });
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer, 
    Localization = l_ContextServices_0.Localization
})(v7));
