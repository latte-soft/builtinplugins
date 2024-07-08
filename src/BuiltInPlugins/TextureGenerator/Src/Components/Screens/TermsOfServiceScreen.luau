local l_script_FirstAncestor_0 = script:FindFirstAncestor("TextureGenerator");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_Localization_0 = v2.ContextServices.Localization;
local l_UI_0 = v2.UI;
local l_Alert_0 = l_UI_0.Alert;
local l_Pane_0 = l_UI_0.Pane;
local l_Button_0 = l_UI_0.Button;
local l_Stylizer_0 = v2.Style.Stylizer;
local l_LayoutOrderIterator_0 = v2.Util.LayoutOrderIterator;
local v10 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local l_GuiService_0 = game:GetService("GuiService");
return function(v12)
    local v13 = l_Localization_0:use();
    local v14 = l_LayoutOrderIterator_0.new();
    local v15 = l_Stylizer_0:use("TermsOfServiceScreen");
    return v1.createElement(l_Pane_0, {
        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
        Layout = Enum.FillDirection.Vertical, 
        VerticalAlignment = Enum.VerticalAlignment.Top
    }, {
        AlertPane = v1.createElement(l_Pane_0, {
            AutomaticSize = Enum.AutomaticSize.XY, 
            Size = v15.AlertSize, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            Layout = Enum.FillDirection.Vertical, 
            VerticalAlignment = Enum.VerticalAlignment.Top, 
            LayoutOrder = v14:getNextOrder()
        }, {
            TermsAlert = v1.createElement(l_Alert_0, {
                Title = v13:getText("TermsOfService", "Title"), 
                Description = v13:getText("TermsOfService", "Description"), 
                LinkMap = {
                    ["[link]"] = {
                        LinkText = v13:getText("TermsOfService", "LinkText"), 
                        LinkCallback = function()
                            l_GuiService_0:OpenBrowserWindow(v10.TERMS_OF_SERVICE_URL);
                        end
                    }
                }, 
                Style = "Notice", 
                ZIndex = 2
            })
        }), 
        ButtonPane = v1.createElement(l_Pane_0, {
            Size = v15.ButtonPaneSize, 
            HorizontalAlignment = Enum.HorizontalAlignment.Right, 
            Layout = Enum.FillDirection.Vertical, 
            VerticalAlignment = Enum.VerticalAlignment.Top, 
            LayoutOrder = v14:getNextOrder()
        }, {
            AcceptButton = v1.createElement(l_Button_0, {
                AnchorPoint = v15.ButtonAnchorPoint, 
                Text = v13:getText("TermsOfService", "Accept"), 
                Size = v15.ButtonSize, 
                Style = "RoundPrimary", 
                OnClick = function()
                    v12.Plugin:SetSetting(v10.TEXTURE_GENERATOR_LEGAL_ACCEPT, true);
                    v12.AcceptedButtonEnable();
                end
            })
        })
    });
end;
