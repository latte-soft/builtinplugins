local l_StudioFixPluginWidgetLocalizedIds_0 = game:GetFastFlag("StudioFixPluginWidgetLocalizedIds");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v2 = require(l_script_FirstAncestor_0.Packages.Roact);
local v3 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_UI_0 = v3.UI;
local l_Button_0 = l_UI_0.Button;
local l_DockWidget_0 = l_UI_0.DockWidget;
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v9 = require(l_script_FirstAncestor_0.Src.Util.Input);
local v10 = require(l_script_FirstAncestor_0.Src.Components.IK.IKTreeView);
local v11 = require(l_script_FirstAncestor_0.Src.Components.IK.IKModeButtons);
local v12 = v2.PureComponent:extend("IKWindow");
local v13 = Vector2.new(260, 440);
v12.init = function(v14)
    v14.state = {
        treeArray = {}
    };
    v14.hideTree = function()
        local l_props_0 = v14.props;
        if l_props_0.ShowTree then
            l_props_0.SetShowTree(false);
        end;
        if l_props_0.IKEnabled then
            l_props_0.SetIKEnabled(false);
        end;
    end;
    v14.onDockWidgetLoaded = function(v16)
        if v16:IsA("PluginGui") then
            v16:BindToClose(v14.hideTree);
        end;
    end;
    v14.onTreeUpdated = function(v17)
        v14:setState({
            treeArray = v17
        });
    end;
    v14.changeSelectedTrack = function(v18)
        local l_state_0 = v14.state;
        local l_props_1 = v14.props;
        local l_treeArray_0 = l_state_0.treeArray;
        local l_SelectedTrack_0 = l_props_1.SelectedTrack;
        local l_SetSelectedTracks_0 = l_props_1.SetSelectedTracks;
        local v24 = 0;
        for v25, v26 in ipairs(l_treeArray_0) do
            if l_SelectedTrack_0 and l_SelectedTrack_0[1] == v26 then
                v24 = v25;
                break;
            end;
        end;
        l_SetSelectedTracks_0({
            {
                l_treeArray_0[math.clamp(v24 + v18, 1, #l_treeArray_0)]
            }
        });
    end;
    v14.onInputBegan = function(_, v28)
        if v28.UserInputType == Enum.UserInputType.Keyboard then
            if not v9.isUp(v28.KeyCode) then
                if v9.isDown(v28.KeyCode) then
                    v14.changeSelectedTrack(1);
                end;
            else
                v14.changeSelectedTrack(-1);
                return ;
            end;
        end;
    end;
end;
v12.willUnmount = function(v29)
    v29.hideTree();
end;
v12.render = function(v30)
    local l_Localization_0 = v30.props.Localization;
    local l_props_2 = v30.props;
    local l_Stylizer_0 = l_props_2.Stylizer;
    local l_RootInstance_0 = l_props_2.RootInstance;
    local l_PinnedParts_0 = l_props_2.PinnedParts;
    local l_IsR15_0 = l_props_2.IsR15;
    local l_IKMode_0 = l_props_2.IKMode;
    local l_IKEnabled_0 = l_props_2.IKEnabled;
    return v2.createElement(l_DockWidget_0, {
        Id = if not l_StudioFixPluginWidgetLocalizedIds_0 then nil else "ManageIK", 
        Title = l_Localization_0:getText("Title", "ManageIK"), 
        Name = "ManageIK", 
        ZIndexBehavior = Enum.ZIndexBehavior.Global, 
        InitialDockState = Enum.InitialDockState.Left, 
        InitialEnabled = true, 
        InitialEnabledShouldOverrideRestore = true, 
        Size = v13, 
        MinSize = v13, 
        OnClose = v30.hideTree, 
        Enabled = true, 
        [v2.Ref] = v30.onDockWidgetLoaded
    }, {
        Container = v2.createElement("Frame", {
            BorderSizePixel = 0, 
            BackgroundColor3 = l_Stylizer_0.backgroundColor, 
            Size = UDim2.new(1, 0, 1, 0), 
            [v2.Event.InputBegan] = v30.onInputBegan
        }, {
            IKModeControls = (l_IsR15_0 and l_IKEnabled_0) and v2.createElement(v11, {
                Height = 32, 
                IKMode = l_IKMode_0, 
                SetIKMode = l_props_2.SetIKMode
            }), 
            TreeView = (l_RootInstance_0 and l_IKEnabled_0) and v2.createElement(v10, {
                Size = UDim2.new(1, 0, 1, not l_IsR15_0 and -56 or -96), 
                Position = UDim2.new(0, 0, 0, not l_IsR15_0 and 0 or 40), 
                RootInstance = l_RootInstance_0, 
                PinnedParts = l_PinnedParts_0, 
                TogglePinnedPart = l_props_2.TogglePinnedPart, 
                SelectedTrack = l_props_2.SelectedTrack, 
                SetSelectedTracks = l_props_2.SetSelectedTracks, 
                Chain = l_props_2.Chain, 
                IKMode = l_IKMode_0, 
                TreeArray = v30.state.treeArray, 
                OnTreeUpdated = v30.onTreeUpdated
            }), 
            EnableIKPrompt = not l_IKEnabled_0 and v2.createElement("TextLabel", {
                AnchorPoint = Vector2.new(0.5, 0.5), 
                BackgroundTransparency = 1, 
                Position = UDim2.new(0.5, 0, 0.5, 0), 
                Size = UDim2.new(1, -8, 1, -40), 
                TextXAlignment = Enum.TextXAlignment.Center, 
                TextYAlignment = Enum.TextYAlignment.Center, 
                TextSize = l_Stylizer_0.ikTheme.textSize, 
                TextColor3 = l_Stylizer_0.ikTheme.textColor, 
                TextWrapped = true, 
                Font = l_Stylizer_0.font, 
                Text = l_Localization_0:getText("IKMenu", "Prompt")
            }), 
            BottomFrame = v2.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, 48), 
                Position = UDim2.new(0, 0, 1, 0), 
                AnchorPoint = Vector2.new(0, 1), 
                BackgroundColor3 = l_Stylizer_0.ikTheme.headerColor, 
                BorderSizePixel = 1, 
                BorderColor3 = l_Stylizer_0.ikTheme.headerBorder
            }, {
                EnableIKButton = v2.createElement(l_Button_0, {
                    AnchorPoint = Vector2.new(0.5, 1), 
                    Position = UDim2.new(0.5, 0, 1, -8), 
                    IsRound = true, 
                    Size = UDim2.new(1, -8, 0, 32), 
                    OnClick = l_props_2.ToggleIKEnabled
                }, {
                    TextLabel = v2.createElement("TextLabel", {
                        BackgroundTransparency = 1, 
                        Size = UDim2.new(1, 0, 1, 0), 
                        TextYAlignment = Enum.TextYAlignment.Center, 
                        TextSize = l_Stylizer_0.ikTheme.textSize, 
                        Text = not not l_IKEnabled_0 and l_Localization_0:getText("IKMenu", "DisableIK") or l_Localization_0:getText("IKMenu", "EnableIK"), 
                        Font = l_Stylizer_0.font, 
                        TextColor3 = l_Stylizer_0.ikTheme.textColor
                    })
                })
            })
        })
    });
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer, 
    Localization = l_ContextServices_0.Localization, 
    Plugin = l_ContextServices_0.Plugin
})(v12));
