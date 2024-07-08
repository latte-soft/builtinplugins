local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Roact);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_ContextServices_0 = v2.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_CaptureFocus_0 = v2.UI.CaptureFocus;
local v6 = v1.PureComponent:extend("RecordingModeCover");
v6.render = function(v7)
    local l_Stylizer_0 = v7.props.Stylizer;
    return v1.createElement(l_CaptureFocus_0, {
        Priority = 100
    }, {
        Text = v1.createElement("TextButton", {
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundColor3 = Color3.new(), 
            BackgroundTransparency = 0.35, 
            AutoButtonColor = false, 
            Font = l_Stylizer_0.font, 
            TextSize = l_Stylizer_0.startScreenTheme.textSize, 
            TextColor3 = l_Stylizer_0.startScreenTheme.darkTextColor, 
            Text = v7.props.Localization:getText("FaceCapture", "IsRecordingCoverText")
        })
    });
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer, 
    Localization = l_ContextServices_0.Localization
})(v6));
