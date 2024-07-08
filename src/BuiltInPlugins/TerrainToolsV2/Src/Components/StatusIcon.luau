local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Framework);
local v2 = require(l_Parent_0.Packages.Roact);
local v3 = require(l_Parent_0.Packages.Cryo);
local l_UI_0 = v1.UI;
local l_Container_0 = l_UI_0.Container;
local l_Tooltip_0 = v1.UI.Tooltip;
local l_Image_0 = l_UI_0.Image;
local function v10(v8)
    local l_Message_0 = v8.Message;
    return v2.createElement(l_Container_0, {
        AnchorPoint = v8.AnchorPoint, 
        Position = v8.Position, 
        LayoutOrder = v8.LayoutOrder, 
        Size = UDim2.new(0, 18, 0, 18)
    }, {
        Decoration = v2.createElement(l_Image_0, {
            Style = {
                Image = v8.Icon
            }
        }), 
        Tooltip = v2.createElement(l_Tooltip_0, {
            Text = l_Message_0 or "", 
            Enabled = l_Message_0 ~= nil
        })
    });
end;
return function(v11)
    local l_ErrorMessage_0 = v11.ErrorMessage;
    local l_WarningMessage_0 = v11.WarningMessage;
    local l_InfoMessage_0 = v11.InfoMessage;
    local v15 = nil;
    local v16 = nil;
    if l_ErrorMessage_0 and #l_ErrorMessage_0 > 0 then
        v15 = "rbxasset://textures/StudioSharedUI/alert_error@2x.png";
        v16 = l_ErrorMessage_0;
    elseif l_WarningMessage_0 and #l_WarningMessage_0 > 0 then
        v15 = "rbxasset://textures/StudioSharedUI/alert_warning@2x.png";
        v16 = l_WarningMessage_0;
    elseif l_InfoMessage_0 and #l_InfoMessage_0 > 0 then
        v15 = "rbxasset://textures/StudioSharedUI/alert_info@2x.png";
        v16 = l_InfoMessage_0;
    end;
    if v15 then
        return v2.createElement(v10, (v3.Dictionary.join(v11, {
            Icon = v15, 
            Message = v16, 
            ErrorMessage = v3.None, 
            WarningMessage = v3.None, 
            InfoMessage = v3.None
        })));
    else
        return nil;
    end;
end;
