local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local v2 = require(l_script_FirstAncestor_0.Packages.React);
local l_useState_0 = v2.useState;
local l_UI_0 = v1.UI;
local l_Button_0 = l_UI_0.Button;
local l_ExpandablePane_0 = l_UI_0.ExpandablePane;
local l_Pane_0 = l_UI_0.Pane;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_TextWithLinks_0 = l_UI_0.TextWithLinks;
local l_LayoutOrderIterator_0 = v1.Util.LayoutOrderIterator;
local l_Localization_0 = v1.ContextServices.Localization;
local l_Stylizer_0 = v1.ContextServices.Stylizer;
local _ = require(l_script_FirstAncestor_0.Src.Resources.Theme);
local l_BrowserService_0 = game:GetService("BrowserService");
return function(v15)
    local v16 = l_Stylizer_0:use("UpgradeRenderer");
    local v17 = l_LayoutOrderIterator_0.new();
    local v18 = l_Localization_0:use();
    local l_Schema_0 = v15.Schema;
    local v20 = v18:getText(l_Schema_0.Id, "Description");
    local v21 = v18:getText(l_Schema_0.Id, "Explanation");
    local v22 = v18:getText(l_Schema_0.Id, "Title");
    local v23 = v18:getText("UpgradeSettings", "ActionButton");
    local v24 = v18:getText("UpgradeSettings", "LearnMore");
    local v25 = v18:getText("UpgradeSettings", "LearnMoreLink");
    local v26, v27 = l_useState_0(true);
    return v2.createElement(l_ExpandablePane_0, {
        Expanded = v26, 
        OnExpandedChanged = v27, 
        Text = v22
    }, {
        Blurb = v2.createElement(l_Pane_0, {
            AutomaticSize = Enum.AutomaticSize.Y, 
            Layout = Enum.FillDirection.Vertical, 
            LayoutOrder = v17:getNextOrder(), 
            Size = UDim2.fromScale(1, 0), 
            Spacing = v16.Spacing
        }, {
            Explanation = v2.createElement(l_TextLabel_0, {
                AutomaticSize = Enum.AutomaticSize.Y, 
                LayoutOrder = v17:getNextOrder(), 
                Size = UDim2.fromScale(1, 0), 
                Text = ("%*\n\n%*"):format(v20, v21), 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextWrapped = true
            }), 
            LearnMoreLink = v2.createElement(l_TextWithLinks_0, {
                AutomaticSize = Enum.AutomaticSize.Y, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                LayoutOrder = v17:getNextOrder(), 
                LinkMap = {
                    ["[link]"] = {
                        LinkText = v25, 
                        LinkCallback = function()
                            l_BrowserService_0:OpenBrowserWindow(l_Schema_0.URL);
                        end
                    }
                }, 
                MaxWidth = v16.MaxWidth, 
                Size = UDim2.fromScale(1, 0), 
                Text = v24, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextProps = {
                    Font = v16.Font, 
                    TextSize = v16.TextSize
                }
            })
        }), 
        Upgrade = v2.createElement(l_Button_0, {
            LayoutOrder = v17:getNextOrder(), 
            OnClick = l_Schema_0.OnClick, 
            Size = UDim2.new(1, 0, 0, 32), 
            Text = v23
        })
    });
end;
