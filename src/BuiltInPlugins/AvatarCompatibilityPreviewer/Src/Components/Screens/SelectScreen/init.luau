local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local v2 = require(l_script_FirstAncestor_0.Packages.React);
local v3 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAvatarPreviewerAddGeoToSelection);
local v4 = v3();
local v5 = require(l_script_FirstAncestor_0.Src.Hooks.useSelection);
local _ = require(l_script_FirstAncestor_0.Src.Resources.Theme);
local v7 = require(script.CurrentPlacePage);
local l_UI_0 = v1.UI;
local l_IconButton_0 = l_UI_0.IconButton;
local l_Pane_0 = l_UI_0.Pane;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_Analytics_0 = v1.ContextServices.Analytics;
local l_Localization_0 = v1.ContextServices.Localization;
local l_Stylizer_0 = v1.ContextServices.Stylizer;
local l_LayoutOrderIterator_0 = v1.Util.LayoutOrderIterator;
return function()
    local v16 = l_Analytics_0:use();
    local v17 = l_Localization_0:use();
    local v18 = l_Stylizer_0:use("SelectScreen");
    local v19, v20 = v2.useState(nil);
    local v21 = v2.useCallback(function()
        v20(nil);
    end, {});
    local v22 = nil;
    if v4 then
        v22 = v5();
    end;
    if v19 == "CurrentPlace" then
        return v2.createElement(v7, {
            GoBack = v21
        });
    else
        local v23 = l_LayoutOrderIterator_0.new();
        local v24;
        if not v3() then
            v24 = false;
        else
            v24 = false;
            if #v22 == 1 then
                v24 = v22[1]:IsA("MeshPart");
            end;
        end;
        return v2.createElement(l_Pane_0, {
            Layout = Enum.FillDirection.Vertical, 
            Spacing = v18.Spacing, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            VerticalAlignment = Enum.VerticalAlignment.Center
        }, {
            ImportCharacterFrom = if v3() then nil else v2.createElement(l_TextLabel_0, {
                AutomaticSize = Enum.AutomaticSize.XY, 
                LayoutOrder = v23:getNextOrder(), 
                Text = v17:getText("SelectScreen", "ImportCharacterFrom")
            }), 
            Buttons = v2.createElement(l_Pane_0, {
                AutomaticSize = Enum.AutomaticSize.XY, 
                Layout = if not v3() then Enum.FillDirection.Horizontal else Enum.FillDirection.Vertical, 
                Spacing = if not v3() then nil else v18.Spacing, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                LayoutOrder = v23:getNextOrder()
            }, {
                AddSelected = if not v3() then nil else v2.createElement(l_IconButton_0, {
                    AutomaticSize = Enum.AutomaticSize.X, 
                    LayoutOrder = v23:getNextOrder(), 
                    OnClick = if not v24 then nil else function()
                        local v25 = v22[1];
                        v25.Name = v25.Name .. "_Geo";
                    end, 
                    Size = UDim2.fromOffset(0, v18.ButtonHeight), 
                    Text = v17:getText("SelectScreen", "AddSelected"), 
                    TooltipText = if v24 then nil else v17:getText("SelectScreen", "AddSelectedTooltip")
                }), 
                CurrentPlace = v2.createElement(l_IconButton_0, {
                    AutomaticSize = Enum.AutomaticSize.X, 
                    LayoutOrder = v23:getNextOrder(), 
                    OnClick = function()
                        v16:report("selectScreenChoice", "CurrentPlace");
                        v20("CurrentPlace");
                    end, 
                    Size = UDim2.fromOffset(0, v18.ButtonHeight), 
                    Text = if not v3() then v17:getText("SelectScreen", "CurrentPlace") else v17:getText("SelectScreen", "BrowseCurrentPlace")
                })
            })
        });
    end;
end;
