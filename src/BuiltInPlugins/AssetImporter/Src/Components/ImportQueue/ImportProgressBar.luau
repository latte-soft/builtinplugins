local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetImporter");
local v1 = require(l_script_FirstAncestor_0.Packages.Roact);
local v2 = require(l_script_FirstAncestor_0.Packages.RoactRodux);
local v3 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Localization_0 = l_ContextServices_0.Localization;
local l_Stylizer_0 = v3.Style.Stylizer;
local l_UI_0 = v3.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_LoadingBar_0 = l_UI_0.LoadingBar;
local l_TextLabel_0 = l_UI_0.TextLabel;
local v12 = v1.PureComponent:extend("ImportProgressBar");
v12.render = function(v13)
    local l_props_0 = v13.props;
    local l_Localization_1 = l_props_0.Localization;
    local v16 = ("%* - %*"):format(l_Localization_1:getText("ImportQueue", "FilesRemaining2", {
        currentFileIndex = tostring(0), 
        totalFiles = tostring(0)
    }), (l_Localization_1:getText("ImportQueue", "Complete")));
    local l_ImportQueue_0 = l_props_0.Stylizer.ImportQueue;
    local l_Padding_0 = l_ImportQueue_0.Padding;
    return v1.createElement(l_Pane_0, {
        Size = l_props_0.Size, 
        LayoutOrder = l_props_0.LayoutOrder, 
        Layout = Enum.FillDirection.Vertical, 
        VerticalAlignment = Enum.VerticalAlignment.Top, 
        Padding = l_Padding_0, 
        Spacing = l_Padding_0
    }, {
        LoadingText = v1.createElement(l_TextLabel_0, {
            LayoutOrder = 1, 
            Size = UDim2.new(1, 0, 0, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            Text = v16, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextWrapped = true
        }), 
        LoadingBar = v1.createElement(l_LoadingBar_0, {
            Size = UDim2.new(1, 0, 0, l_ImportQueue_0.LoadingBarWidth), 
            Progress = 1
        })
    });
end;
return v2.connect(function(v19)
    return {
        SessionQueue = v19.Sessions.sessionQueue
    };
end, nil)((l_withContext_0({
    Localization = l_Localization_0, 
    Stylizer = l_Stylizer_0
})(v12)));
