local l_GuiService_0 = game:GetService("GuiService");
local l_Parent_0 = script.Parent.Parent.Parent;
local v2 = require(l_Parent_0.Packages.Roact);
local v3 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v3.ContextServices;
local v5 = game:DefineFastString("CursorGroupHelp", "https://create.roblox.com");
local l_UI_0 = v3.UI;
local l_Checkbox_0 = l_UI_0.Checkbox;
local l_Pane_0 = l_UI_0.Pane;
local l_TextLabel_0 = l_UI_0.TextLabel;
local v10 = require(script.Parent.CGEAlert);
local v11 = require(script.Parent.Parent.Constants);
local v12 = v2.Component:extend("GroupListView");
v12.getSelectedGroup = function(v13)
    local v14 = "";
    for _, v16 in ipairs(v13) do
        if v16.UISelected then
            return v16;
        end;
    end;
    return v14;
end;
v12.init = function(v17)
    v17.onCursorGroupLearnMoreClicked = function()
        l_GuiService_0:OpenBrowserWindow(v5);
    end;
end;
v12.render = function(v18)
    local l_props_0 = v18.props;
    local l_Localization_0 = l_props_0.Localization;
    local l_GroupListView_0 = l_props_0.Stylizer.GroupListView;
    local v22 = {};
    local v23 = v12.getSelectedGroup(l_props_0.Groups);
    if v23 == "" then
        return v2.createElement(l_Pane_0, {
            Padding = l_GroupListView_0.UnselectedViewPadding
        }, {
            TextLabel = v2.createElement(l_TextLabel_0, {
                Size = UDim2.fromScale(1, 1), 
                Text = l_Localization_0:getText("Info", "SelectAGroup"), 
                TextWrapped = true, 
                TextXAlignment = Enum.TextXAlignment.Center, 
                TextYAlignment = Enum.TextYAlignment.Center
            })
        });
    else
        local v24 = false;
        for v25, v26 in ipairs(l_props_0.Groups) do
            local l_Name_0 = v26.Name;
            local l_Name_1 = v26.Name;
            if l_Name_0 == v11.CursorGroupName then
                if not v26.UISelected then
                    l_Name_1 = ("%* (%*)"):format(l_Name_0, (l_Localization_0:getText("Groups", "CursorGroupText")));
                else
                    v24 = true;
                    continue;
                end;
            end;
            v22[l_Name_0] = v2.createElement(l_Pane_0, {
                LayoutOrder = v25 + 1, 
                Size = UDim2.new(1, 0, 0, v11.GroupListRowHeight), 
                Layout = Enum.FillDirection.Horizontal, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left
            }, {
                Button = v2.createElement(l_Checkbox_0, {
                    Checked = v23.GetCollidesWith(v26), 
                    Text = l_Name_1, 
                    OnClick = function(_)
                        v23.ToggleCollidesWith(v26);
                    end
                })
            });
        end;
        if v24 then
            v22.CursorGroupAlert = v2.createElement(l_Pane_0, {
                AutomaticSize = Enum.AutomaticSize.Y, 
                Size = UDim2.fromScale(1, 0), 
                LayoutOrder = 1, 
                Padding = {
                    Top = 10, 
                    Bottom = 6
                }
            }, {
                PaddedAlert = v2.createElement(v10, {
                    Title = l_Localization_0:getText("Groups", "CursorGroupTitle"), 
                    Body = l_Localization_0:getText("Groups", "CursorGroupInfo", {
                        (("<b>%*</b>"):format(v11.CursorGroupName))
                    }), 
                    OnClick = v18.onCursorGroupLearnMoreClicked
                })
            });
        end;
        return v2.createElement(l_Pane_0, {
            AutomaticSize = Enum.AutomaticSize.XY, 
            LayoutOrder = l_props_0.LayoutOrder, 
            Layout = Enum.FillDirection.Horizontal, 
            Padding = l_GroupListView_0.MainPanePadding
        }, {
            ListPane = v2.createElement(l_Pane_0, {
                AutomaticSize = Enum.AutomaticSize.XY, 
                Layout = Enum.FillDirection.Vertical
            }, v22)
        });
    end;
end;
v12 = l_ContextServices_0.withContext({
    Stylizer = l_ContextServices_0.Stylizer, 
    Localization = l_ContextServices_0.Localization
})(v12);
return v12;
