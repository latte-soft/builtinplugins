local l_script_FirstAncestor_0 = script:FindFirstAncestor("Toolbox");
local l_Packages_0 = l_script_FirstAncestor_0.Packages;
local v2 = require(l_Packages_0.Framework);
local v3 = require(l_Packages_0.Roact);
local v4 = require(l_Packages_0.RoactRodux);
local l_ContextServices_0 = v2.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_UI_0 = v2.UI;
local l_LoadingBar_0 = l_UI_0.LoadingBar;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_Util_0 = l_script_FirstAncestor_0.Core.Util;
local v11 = require(l_Util_0.Colors);
local v12 = require(l_Util_0.Constants);
local v13 = v3.Component:extend("ProgressBarWrapper");
v13.didUpdate = function(v14, v15)
    local l_props_0 = v14.props;
    if l_props_0.uploadSucceeded ~= nil and v15.uploadSucceeded ~= l_props_0.uploadSucceeded then
        l_props_0.onFinish();
    end;
end;
v13.render = function(v17)
    local l_props_1 = v17.props;
    local l_Localization_0 = l_props_1.Localization;
    local l_progress_0 = l_props_1.progress;
    local l_progressText_0 = l_props_1.progressText;
    local l_progressTitle_0 = l_props_1.progressTitle;
    return v3.createElement("Frame", {
        BackgroundTransparency = 1, 
        Position = UDim2.new(0.5, -200, 0, 314), 
        Size = UDim2.new(0, 400, 0, 6)
    }, {
        ProgressTitle = if not l_progressTitle_0 then nil else v3.createElement(l_TextLabel_0, {
            Position = UDim2.new(0, 0, 0, -54), 
            Size = UDim2.new(1, 0, 0, 30), 
            Text = l_progressTitle_0, 
            TextSize = v12.FONT_SIZE_TITLE, 
            TextXAlignment = Enum.TextXAlignment.Center, 
            TextYAlignment = Enum.TextYAlignment.Center
        }), 
        ProgressMessage = if not l_progressText_0 then nil else v3.createElement(l_TextLabel_0, {
            Position = UDim2.new(0, 0, 0, -32), 
            Size = UDim2.new(1, 0, 0, 30), 
            Text = l_progressText_0, 
            TextSize = v12.FONT_SIZE_TITLE, 
            TextXAlignment = Enum.TextXAlignment.Center, 
            TextYAlignment = Enum.TextYAlignment.Center
        }), 
        LoadingBar = v3.createElement(l_LoadingBar_0, {
            Progress = l_progress_0, 
            Size = UDim2.new(1, 0, 1, 0)
        }), 
        ProgressPercentText = v3.createElement(l_TextLabel_0, {
            Position = UDim2.new(0, 0, 0, 15), 
            Size = UDim2.new(1, 0, 0, 10), 
            Text = l_Localization_0:getText("AssetConfig", "ProgressBarProgressText", {
                percent = math.floor(l_progress_0 * 100)
            }), 
            TextColor = v11.GRAY_3, 
            TextSize = v12.FONT_SIZE_LARGE, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Center
        }), 
        TimeWarning = v3.createElement(l_TextLabel_0, {
            Position = UDim2.new(0, 0, 0, 15), 
            Size = UDim2.new(1, 0, 0, 10), 
            Text = l_Localization_0:getText("AssetConfig", "ProgressUploadWaitTimeWarning"), 
            TextColor = v11.GRAY_2, 
            TextSize = v12.FONT_SIZE_MEDIUM, 
            TextXAlignment = Enum.TextXAlignment.Right, 
            TextYAlignment = Enum.TextYAlignment.Center
        })
    });
end;
return v4.connect(function(v23, _)
    v23 = v23 or {};
    return {
        progress = v23.progressPercentage, 
        progressText = v23.progressText, 
        progressTitle = v23.progressTitle, 
        uploadSucceeded = v23.uploadSucceeded
    };
end)((l_withContext_0({
    Localization = l_ContextServices_0.Localization, 
    Stylizer = l_ContextServices_0.Stylizer
})(v13)));
