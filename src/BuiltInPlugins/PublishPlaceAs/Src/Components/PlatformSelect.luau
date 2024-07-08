local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v2.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v5 = require(l_Parent_0.Src.Components.CheckBoxSet);
local v6 = require(l_Parent_0.Src.Components.ListDialog);
local v7 = v1.PureComponent:extend("PlatformSelect");
local _ = v2.SharedFlags;
local l_StudioEnableVRToggle_0 = game:GetFastFlag("StudioEnableVRToggle");
local l_RemoveVRToggleDialog2_0 = game:GetFastFlag("RemoveVRToggleDialog2");
v7.init = function(v11)
    local v12 = nil;
    if not (not l_StudioEnableVRToggle_0 or l_RemoveVRToggleDialog2_0) then
        v12 = false;
    end;
    v11.state = {
        VRDialogEnabled = if not l_RemoveVRToggleDialog2_0 then v12 else nil
    };
    if not (not l_StudioEnableVRToggle_0 or l_RemoveVRToggleDialog2_0) then
        v11.props.DeviceSelected("VR", false);
        v11.showVRDialog = function()
            v11:setState({
                VRDialogEnabled = true
            });
        end;
        v11.closeVRDialog = function(v13)
            if v13 then
                v11.props.DeviceSelected("VR", v13);
            end;
            v11:setState({
                VRDialogEnabled = false
            });
        end;
    end;
end;
v7.render = function(v14)
    local l_props_0 = v14.props;
    local l_Localization_0 = l_props_0.Localization;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local v18 = l_props_0.LayoutOrder or 0;
    local l_DevicesError_0 = l_props_0.DevicesError;
    local l_DeviceSelected_0 = l_props_0.DeviceSelected;
    local l_Devices_0 = l_props_0.Devices;
    return v1.createElement(v5, {
        Title = l_Localization_0:getText("PageTitle", "Devices"), 
        LayoutOrder = v18, 
        Boxes = {
            {
                Id = "Computer", 
                Title = l_Localization_0:getText("Devices", "Computer"), 
                Selected = l_Devices_0.Computer
            }, 
            {
                Id = "Phone", 
                Title = l_Localization_0:getText("Devices", "Phone"), 
                Selected = l_Devices_0.Phone
            }, 
            {
                Id = "Tablet", 
                Title = l_Localization_0:getText("Devices", "Tablet"), 
                Selected = l_Devices_0.Tablet
            }, 
            {
                Id = "Console", 
                Title = l_Localization_0:getText("Devices", "Console"), 
                Selected = l_Devices_0.Console
            }, 
            if not l_StudioEnableVRToggle_0 then nil else {
                Id = "VR", 
                Title = l_Localization_0:getText("Devices", "VR"), 
                Selected = l_Devices_0.VR
            }
        }, 
        ErrorMessage = not not l_DevicesError_0 and l_Localization_0:getText("Error", "NoDevices") or nil, 
        EntryClicked = function(v22)
            if not (not (l_RemoveVRToggleDialog2_0 or not l_StudioEnableVRToggle_0) and v22.Id == "VR") or v22.Selected then
                l_DeviceSelected_0(v22.Id, not v22.Selected);
                return ;
            else
                v14.showVRDialog();
                return ;
            end;
        end, 
        AbsoluteMaxHeight = l_Stylizer_0.checkboxset.maxHeight, 
        UseGridLayout = true
    }, {
        VRDialog = if not v14.state.VRDialogEnabled or l_RemoveVRToggleDialog2_0 then nil else v1.createElement(v6, {
            Title = l_Localization_0:getText("VRPrompt", "Title"), 
            Header = l_Localization_0:getText("VRPrompt", "Header"), 
            Entries = {
                l_Localization_0:getText("VRPrompt", "DialogItem1"), 
                l_Localization_0:getText("VRPrompt", "DialogItem2"), 
                l_Localization_0:getText("VRPrompt", "DialogItem3"), 
                l_Localization_0:getText("VRPrompt", "DialogItem4")
            }, 
            Buttons = {
                {
                    Key = "Disagree", 
                    Text = l_Localization_0:getText("Button", "ReplyDisagree"), 
                    Style = "RoundLargeText"
                }, 
                {
                    Key = "Agree", 
                    Text = l_Localization_0:getText("Button", "ReplyAgree"), 
                    Style = "RoundLargeTextPrimary"
                }
            }, 
            OnButtonClicked = function(v23)
                if v23 == "Agree" then
                    v14.closeVRDialog(true);
                    return ;
                else
                    v14.closeVRDialog(false);
                    return ;
                end;
            end, 
            OnClose = function()
                v14.closeVRDialog(false);
            end, 
            minContentSize = Vector2.new(600, 220)
        })
    });
end;
return (l_withContext_0({
    Localization = l_ContextServices_0.Localization, 
    Stylizer = l_ContextServices_0.Stylizer
})(v7));
