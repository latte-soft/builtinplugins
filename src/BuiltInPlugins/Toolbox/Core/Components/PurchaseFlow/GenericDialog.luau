local l_script_FirstAncestor_0 = script:FindFirstAncestor("Toolbox");
local l_Packages_0 = l_script_FirstAncestor_0.Packages;
local v2 = require(l_Packages_0.React);
local v3 = require(l_Packages_0.Framework);
local l_UI_0 = v3.UI;
local l_Image_0 = l_UI_0.Image;
local l_Pane_0 = v3.UI.Pane;
local l_StyledDialog_0 = l_UI_0.StyledDialog;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_Util_0 = l_script_FirstAncestor_0.Core.Util;
local v10 = require(l_Util_0.Constants);
local v11 = require(l_Util_0.LayoutOrderIterator);
local l_Dialog_0 = v10.Dialog;
local l_Stylizer_0 = v3.ContextServices.Stylizer;
local l_ContextServices_0 = v3.ContextServices;
local v15 = require(l_script_FirstAncestor_0.Core.Util.SharedFlags.getFFlagToolboxFixGenericDialogSize);
return function(v16)
    local v17 = l_ContextServices_0.Localization:use();
    local v18 = l_Stylizer_0:use();
    local l_Description_0 = v16.Description;
    local l_Header_0 = v16.Header;
    local l_Image_1 = v16.Image;
    local l_OnClose_0 = v16.OnClose;
    local v23 = if not v16.Title then v17:getText("General", "RobloxStudio") else v16.Title;
    local v24 = v11.new();
    return v2.createElement(l_StyledDialog_0, {
        Buttons = {
            {
                Key = false, 
                Style = "RoundPrimary", 
                Text = v17:getText("Common", "OK")
            }
        }, 
        FitTextButtonWidth = true, 
        LayoutOrder = v16.LayoutOrder, 
        MinContentSize = Vector2.new(l_Dialog_0.IMAGE_SIZE.X.Offset + l_Dialog_0.PROMPT_SIZE.X.Offset, l_Dialog_0.PROMPT_SIZE.Y.Offset + l_Dialog_0.BALANCE_SIZE.Y.Offset), 
        OnButtonPressed = l_OnClose_0, 
        OnClose = l_OnClose_0 or function()
        end, 
        Title = v23
    }, {
        Container = v2.createElement(l_Pane_0, {
            AutomaticSize = Enum.AutomaticSize.XY, 
            Layout = Enum.FillDirection.Horizontal, 
            LayoutOrder = v24:getNextOrder(), 
            Spacing = 16, 
            VerticalAlignment = Enum.VerticalAlignment.Top
        }, {
            Thumbnail = if not l_Image_1 then nil else v2.createElement(l_Image_0, {
                Image = l_Image_1, 
                LayoutOrder = v24:getNextOrder(), 
                Size = l_Dialog_0.IMAGE_SIZE
            }), 
            TextContainer = v2.createElement(l_Pane_0, {
                AutomaticSize = if not v15() then Enum.AutomaticSize.XY else Enum.AutomaticSize.Y, 
                HorizontalAlignment = if not v15() then nil else Enum.HorizontalAlignment.Left, 
                Layout = Enum.FillDirection.Vertical, 
                LayoutOrder = v24:getNextOrder(), 
                Spacing = 8, 
                Size = if not not v15() and l_Image_1 then UDim2.new(1, -l_Dialog_0.IMAGE_SIZE.X.Offset - 16, 0, 0) else UDim2.new(1, 0, 0, 0), 
                VerticalAlignment = Enum.VerticalAlignment.Top
            }, {
                Header = v2.createElement(l_TextLabel_0, {
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    LayoutOrder = v24:getNextOrder(), 
                    Font = v10.FONT_BOLD, 
                    Size = UDim2.new(1, 0, 0, 0), 
                    Text = l_Header_0, 
                    TextColor = v18.purchaseDialog.promptText, 
                    TextWrapped = true, 
                    TextXAlignment = Enum.TextXAlignment.Left
                }), 
                Prompt = v2.createElement(l_TextLabel_0, {
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    LayoutOrder = v24:getNextOrder(), 
                    Size = UDim2.new(1, 0, 0, 0), 
                    Text = l_Description_0, 
                    TextColor = v18.purchaseDialog.promptText, 
                    TextWrapped = true, 
                    TextXAlignment = Enum.TextXAlignment.Left
                })
            })
        })
    });
end;
