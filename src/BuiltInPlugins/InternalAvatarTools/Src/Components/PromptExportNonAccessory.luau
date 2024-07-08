local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.Framework);
local l_StyledDialog_0 = v2.UI.StyledDialog;
local l_ContextServices_0 = v2.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Plugin_0 = l_ContextServices_0.Plugin;
local l_Localization_0 = l_ContextServices_0.Localization;
local v8 = v1.PureComponent:extend("PromptExportNonAccessory");
v8.init = function(v9)
    v9.onClose = function()
        v9.props.onCancel();
    end;
end;
v8.render = function(v10)
    return v1.createElement(l_StyledDialog_0, {
        Title = v10.props.Localization:getText("DialogTitle", "ExportNonAccessory"), 
        Buttons = {
            {
                Key = "Export", 
                Text = v10.props.Localization:getText("Dialog", "Export"), 
                Style = "RoundPrimary"
            }, 
            {
                Key = "Cancel", 
                Text = v10.props.Localization:getText("Dialog", "Cancel"), 
                Style = "Round"
            }
        }, 
        Resizable = false, 
        MinContentSize = Vector2.new(0, 0), 
        OnButtonPressed = function(v11)
            if v11 == "Export" then
                v10.props.onConfirm();
                return ;
            else
                v10.props.onCancel();
                return ;
            end;
        end, 
        OnClose = v10.props.onCancel
    });
end;
return (l_withContext_0({
    Plugin = l_Plugin_0, 
    Localization = l_Localization_0
})(v8));
