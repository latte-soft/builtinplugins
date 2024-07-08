local l_Parent_0 = script.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v2 = require(l_Packages_0.Roact);
local v3 = require(l_Packages_0.Framework);
local v4 = require(l_Parent_0.Core.Util.Constants);
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Checkbox_0 = v3.UI.Checkbox;
local l_GetTextSize_0 = v3.Util.GetTextSize;
local v9 = require(l_Parent_0.Core.Components.PluginWidget.Dialog);
local v10 = require(l_Parent_0.Core.Components.MessageBox.MessageBoxButton);
local _ = require(l_Parent_0.Core.ContextServices.ModalContext);
local v12 = v2.PureComponent:extend("ScriptConfirmationDialog");
v12.init = function(v13, _)
    v13.isDead = false;
    v13.onEnabledChanged = function(v15)
        if not v13.isDead then
            if not (v15.Enabled or not v13.props.onClose) then
                v13.props.onClose();
            end;
            return ;
        else
            return ;
        end;
    end;
    v13.onAncestryChanged = function(_, _, v18)
        if not v13.isDead then
            if not (v18 or not v13.props.onClose) then
                v13.props.onClose();
            end;
            return ;
        else
            return ;
        end;
    end;
    v13.onToggleShowAgain = function()
        local v19 = not v13.state.checked;
        v13:setState({
            checked = v19
        });
        v13.props.onChangeShowDialog(not v19);
    end;
    v13:setState({
        checked = false
    });
end;
v12.willUnmount = function(v20)
    v20.isDead = true;
end;
v12.render = function(v21)
    local l_props_0 = v21.props;
    local l_state_0 = v21.state;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local l_Info_0 = l_props_0.Info;
    local v26 = l_props_0.Localization:getText("ScriptWarning", "DetailText", {
        assetName = l_Info_0.assetName, 
        numScripts = l_Info_0.numScripts
    });
    local l_FONT_SIZE_MEDIUM_0 = v4.FONT_SIZE_MEDIUM;
    local l_FONT_BOLD_0 = v4.FONT_BOLD;
    local v29 = l_props_0.Localization:getText("ScriptWarning", "InstructionText") .. " " .. l_props_0.Localization:getText("ScriptWarning", "InstructionText2");
    local l_FONT_SIZE_MEDIUM_1 = v4.FONT_SIZE_MEDIUM;
    local l_FONT_0 = v4.FONT;
    local v32 = l_props_0.Localization:getText("ScriptWarning", "DontShowAgain");
    local l_FONT_SIZE_MEDIUM_2 = v4.FONT_SIZE_MEDIUM;
    local l_FONT_1 = v4.FONT;
    local v35 = l_props_0.Localization:getText("Common", "OK");
    local v36 = l_props_0.Localization:getText("Purchase", "Cancel");
    local v37 = l_props_0.Localization:getText("General", "ToolboxToolbarName");
    local v38 = math.max(math.max(v4.MESSAGE_BOX_BUTTON_WIDTH, 52 + math.max(math.min(l_GetTextSize_0(v26, l_FONT_SIZE_MEDIUM_0, l_FONT_BOLD_0, Vector2.new(0, 0)).X, 424), math.min(l_GetTextSize_0(v29, l_FONT_SIZE_MEDIUM_1, l_FONT_0, Vector2.new(0, 0)).X, 424), math.min(l_GetTextSize_0(v32, l_FONT_SIZE_MEDIUM_2, l_FONT_1, Vector2.new(0, 0)).X, 424) + 16)), 120);
    local v39 = v38 - 52;
    local v40 = l_GetTextSize_0(v26, l_FONT_SIZE_MEDIUM_0, l_FONT_BOLD_0, Vector2.new(v39, 1000));
    local v41 = l_GetTextSize_0(v29, l_FONT_SIZE_MEDIUM_1, l_FONT_0, Vector2.new(v39, 1000));
    local v42 = l_GetTextSize_0(v32, l_FONT_SIZE_MEDIUM_2, l_FONT_1, Vector2.new(v39 - 16, 1000));
    local l_Y_0 = v40.Y;
    local l_Y_1 = v41.Y;
    local l_Y_2 = v42.Y;
    local v46 = math.max(32, ((l_Y_0 + l_Y_2) + l_Y_1) + 8);
    return v2.createElement(v9, {
        Name = l_props_0.Name, 
        Title = v37, 
        Size = Vector2.new((12 + v38) + 12, (((8 + v46) + 12) + 23) + 12), 
        ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
        Modal = true, 
        plugin = v21.props.Plugin:get(), 
        [v2.Change.Enabled] = v21.onEnabledChanged, 
        [v2.Event.AncestryChanged] = v21.onAncestryChanged
    }, {
        Background = v2.createElement("Frame", {
            Position = UDim2.new(0, 0, 0, 0), 
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundColor3 = l_Stylizer_0.messageBox.backgroundColor
        }, {
            UIPadding = v2.createElement("UIPadding", {
                PaddingBottom = UDim.new(0, 12), 
                PaddingLeft = UDim.new(0, 12), 
                PaddingRight = UDim.new(0, 12), 
                PaddingTop = UDim.new(0, 8)
            }), 
            UIListLayout = v2.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                VerticalAlignment = Enum.VerticalAlignment.Top, 
                Padding = UDim.new(0, 12)
            }), 
            Information = v2.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, v46), 
                BackgroundTransparency = 1, 
                LayoutOrder = 1
            }, {
                UIListLayout = v2.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                    VerticalAlignment = Enum.VerticalAlignment.Top, 
                    Padding = UDim.new(0, 20), 
                    FillDirection = Enum.FillDirection.Horizontal
                }), 
                Icon = v2.createElement("ImageLabel", {
                    Size = UDim2.new(0, 32, 0, 32), 
                    BackgroundTransparency = 1, 
                    LayoutOrder = 0, 
                    Image = l_props_0.Icon
                }), 
                Texts = v2.createElement("Frame", {
                    LayoutOrder = 1, 
                    Size = UDim2.new(1, -52, 1, 0), 
                    BackgroundTransparency = 1
                }, {
                    UIListLayout = v2.createElement("UIListLayout", {
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                        VerticalAlignment = Enum.VerticalAlignment.Top, 
                        Padding = UDim.new(0, 8), 
                        FillDirection = Enum.FillDirection.Vertical
                    }), 
                    DetailLabel = v2.createElement("TextLabel", {
                        LayoutOrder = 0, 
                        Size = UDim2.new(1, 0, 0, l_Y_0), 
                        BackgroundTransparency = 1, 
                        Text = v26, 
                        Font = l_FONT_BOLD_0, 
                        TextSize = l_FONT_SIZE_MEDIUM_0, 
                        TextColor3 = l_Stylizer_0.messageBox.textColor, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        TextYAlignment = Enum.TextYAlignment.Top, 
                        TextWrapped = true
                    }), 
                    InstructionLabel = v2.createElement("TextLabel", {
                        LayoutOrder = 1, 
                        Size = UDim2.new(1, 0, 0, l_Y_1), 
                        BackgroundTransparency = 1, 
                        Text = v29, 
                        Font = l_FONT_0, 
                        TextSize = l_FONT_SIZE_MEDIUM_1, 
                        TextColor3 = l_Stylizer_0.messageBox.textColor, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        TextYAlignment = Enum.TextYAlignment.Top, 
                        TextWrapped = true
                    }), 
                    ShowAgainCheckbox = v2.createElement(l_Checkbox_0, {
                        LayoutOrder = 2, 
                        Text = v32, 
                        Font = l_FONT_1, 
                        TextSize = l_FONT_SIZE_MEDIUM_2, 
                        OnClick = v21.onToggleShowAgain, 
                        Size = UDim2.new(1, 0, 0, l_Y_2), 
                        Checked = l_state_0.checked
                    })
                })
            }), 
            Buttons = v2.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, 23), 
                BackgroundTransparency = 1, 
                LayoutOrder = 2
            }, {
                UIListLayout = v2.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Right, 
                    VerticalAlignment = Enum.VerticalAlignment.Top, 
                    FillDirection = Enum.FillDirection.Horizontal, 
                    Padding = UDim.new(0, 8)
                }), 
                OkButton = v2.createElement(v10, {
                    Text = v35, 
                    onButtonClicked = v21.props.onOkButtonClicked
                }), 
                CancelButton = v2.createElement(v10, {
                    Text = v36, 
                    onButtonClicked = v21.props.onCancel
                })
            })
        })
    });
end;
return (l_withContext_0({
    Plugin = l_ContextServices_0.Plugin, 
    Stylizer = l_ContextServices_0.Stylizer, 
    Localization = l_ContextServices_0.Localization
})(v12));
