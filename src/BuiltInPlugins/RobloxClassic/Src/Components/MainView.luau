local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Src.Modules.NpcManager);
local v3 = require(l_Parent_0.Packages.Framework);
local l_UI_0 = v3.UI;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_Pane_0 = l_UI_0.Pane;
local l_Button_0 = l_UI_0.Button;
local l_LayoutOrderIterator_0 = v3.Util.LayoutOrderIterator;
local l_ContextServices_0 = v3.ContextServices;
local l_Analytics_0 = l_ContextServices_0.Analytics;
local l_Stylizer_0 = l_ContextServices_0.Stylizer;
local l_Localization_0 = l_ContextServices_0.Localization;
local v13 = require(l_Parent_0.Src.Components.LabeledToggleButton);
local v14 = require(l_Parent_0.Src.Util.scanNPCs);
local v15 = v1.PureComponent:extend("MainView");
local l_ChangeHistoryService_0 = game:GetService("ChangeHistoryService");
local l_StarterPlayer_0 = game:GetService("StarterPlayer");
v15.init = function(v18, v19)
    v18.doClassicScriptsExist = function()
        local l_StarterCharacterScripts_0 = l_StarterPlayer_0.StarterCharacterScripts;
        if not l_StarterCharacterScripts_0 then
            return false;
        else
            return v2.DoClassicScriptsExist(l_StarterCharacterScripts_0, v19.Localization);
        end;
    end;
    v18.onButtonClicked = function()
        v14(v18.props.Localization);
    end;
    v18:setState(function(_)
        if not v18.doClassicScriptsExist() then
            return {
                classicComponentsActive = false
            };
        else
            return {
                classicComponentsActive = true
            };
        end;
    end);
    v18.OnUndo = function(v22)
        if string.find(v22, "insert") == nil then
            v18:setState({
                classicComponentsActive = true
            });
            return ;
        else
            v18:setState({
                classicComponentsActive = false
            });
            return ;
        end;
    end;
    v18.OnRedo = function(v23)
        if string.find(v23, "insert") == nil then
            v18:setState({
                classicComponentsActive = false
            });
            return ;
        else
            v18:setState({
                classicComponentsActive = true
            });
            return ;
        end;
    end;
    l_ChangeHistoryService_0.OnUndo:connect(v18.OnUndo);
    l_ChangeHistoryService_0.OnRedo:connect(v18.OnRedo);
    v18.insertComponents = function()
        local l_Localization_1 = v19.Localization;
        local l_StarterCharacterScripts_1 = l_StarterPlayer_0.StarterCharacterScripts;
        if not l_StarterCharacterScripts_1 then
            warn(l_Localization_1:getText("InsertComponents", "NoStarter"));
            return ;
        elseif not v2.DoClassicScriptsExist(l_StarterCharacterScripts_1, l_Localization_1) then
            print(l_Localization_1:getText("InsertComponents", "AddingStarterChar"));
            v2.InsertComponents(l_StarterCharacterScripts_1, l_Localization_1, true);
            return ;
        else
            warn(string.format(l_Localization_1:getText("InsertComponents", "AlreadyExist"), "StarterCharacterScripts"));
            return ;
        end;
    end;
    v18.removeComponents = function()
        v2.RemoveComponents(v19.Localization);
    end;
end;
v15.render = function(v26)
    local l_props_0 = v26.props;
    local l_Localization_2 = l_props_0.Localization;
    local l_Stylizer_1 = l_props_0.Stylizer;
    local l_state_0 = v26.state;
    local v31 = l_LayoutOrderIterator_0.new();
    v26.toggleClassicComponentsActive = function()
        local v32 = "";
        if not v26.state.classicComponentsActive then
            v26.insertComponents();
            v32 = "insert RobloxClassic components";
            l_props_0.Analytics:report("classicPluginFlipped", {
                wasFlippedTo = tostring(true)
            });
        else
            v26.removeComponents();
            v32 = "remove RobloxClassic components";
            l_props_0.Analytics:report("classicPluginFlipped", {
                wasFlippedTo = tostring(false)
            });
        end;
        v26:setState({
            classicComponentsActive = not v26.state.classicComponentsActive
        });
        l_ChangeHistoryService_0:SetWaypoint(v32);
    end;
    return v1.createElement(l_Pane_0, {
        Size = UDim2.new(1, 0, 0, l_Stylizer_1.UIHeightPx), 
        LayoutOrder = v31:getNextOrder(), 
        Padding = l_Stylizer_1.PaddingPx
    }, {
        Label = v1.createElement(l_TextLabel_0, {
            Text = l_Localization_2:getText("Plugin", "RobloxClassicComponents"), 
            Size = UDim2.fromScale(1, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            LayoutOrder = v31:getNextOrder(), 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Top
        }), 
        GridLayoutArea = v1.createElement(l_Pane_0, {
            Size = UDim2.new(1, 0, 0, l_Stylizer_1.UIGridHeightPx), 
            LayoutOrder = v31:getNextOrder(), 
            Padding = l_Stylizer_1.UIGridTopMarginPx
        }, {
            Layout = v1.createElement("UIGridLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                CellPadding = l_Stylizer_1.UIGridPadding, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                VerticalAlignment = Enum.VerticalAlignment.Top, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                CellSize = l_Stylizer_1.UIGridCellSize
            }), 
            ClassicComponentsToggle = v1.createElement(v13, {
                Selected = l_state_0.classicComponentsActive, 
                OnClick = v26.toggleClassicComponentsActive, 
                Text = l_Localization_2:getText("ClassicComponents", "Active"), 
                LayoutOrder = v31:getNextOrder()
            }), 
            NPCButton = if not l_state_0.classicComponentsActive then nil else v1.createElement(l_Button_0, {
                Text = l_Localization_2:getText("ClassicComponents", "UpdateNPCs"), 
                OnClick = v26.onButtonClicked, 
                LayoutOrder = v31:getNextOrder()
            })
        })
    });
end;
return (l_ContextServices_0.withContext({
    Analytics = l_Analytics_0, 
    Stylizer = l_Stylizer_0, 
    Localization = l_Localization_0
})(v15));
