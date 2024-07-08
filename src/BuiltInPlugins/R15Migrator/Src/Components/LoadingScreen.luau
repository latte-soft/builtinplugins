local l_script_FirstAncestor_0 = script:FindFirstAncestor("R15Migrator");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local v2 = require(l_script_FirstAncestor_0.Packages.Roact);
local v3 = require(l_script_FirstAncestor_0.Packages.RoactRodux);
local l_ContextServices_0 = v1.ContextServices;
local l_UI_0 = v1.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_LoadingIndicator_0 = l_UI_0.LoadingIndicator;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_LayoutOrderIterator_0 = v1.Util.LayoutOrderIterator;
local l_Status_0 = require(l_script_FirstAncestor_0.Src.Util.AnimationConversion.constants).Status;
local v11 = v2.PureComponent:extend("LoadingScreen");
v11.init = function(v12)
    local l_StartScan_0 = v12.props.StartScan;
    task.spawn(function()
        wait(1);
        l_StartScan_0();
    end);
end;
v11.render = function(v14)
    local l_props_0 = v14.props;
    local l_status_0 = l_props_0.status;
    local l_Localization_0 = l_props_0.Localization;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local v19 = "";
    if not (l_status_0 ~= l_Status_0.ScanningScripts and l_status_0 ~= l_Status_0.ScanningWorkspace) or l_status_0 == l_Status_0.ConvertingAnimations then
        v19 = l_Localization_0:getText("AnimationConversion", l_status_0);
    end;
    local v20 = l_LayoutOrderIterator_0.new();
    return v2.createElement(l_Pane_0, {
        Layout = Enum.FillDirection.Vertical, 
        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
        VerticalAlignment = Enum.VerticalAlignment.Center, 
        Spacing = l_Stylizer_0.Spacing, 
        Padding = l_Stylizer_0.Padding
    }, {
        Text = v2.createElement(l_TextLabel_0, {
            Text = v19, 
            AutomaticSize = Enum.AutomaticSize.XY, 
            LayoutOrder = v20:getNextOrder()
        }), 
        LoadingIndicator = v2.createElement(l_LoadingIndicator_0, {
            LayoutOrder = v20:getNextOrder()
        })
    });
end;
return v3.connect(function(v21, _)
    return {
        status = v21.AnimationConversion.status
    };
end)((l_ContextServices_0.withContext({
    Stylizer = l_ContextServices_0.Stylizer, 
    Localization = l_ContextServices_0.Localization
})(v11)));
