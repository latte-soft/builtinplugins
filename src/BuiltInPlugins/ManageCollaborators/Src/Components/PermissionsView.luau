local l_COLLAB2850_FixMcTooltips_0 = game:GetFastFlag("COLLAB2850_FixMcTooltips");
local l_StudioPublishService_0 = game:GetService("StudioPublishService");
local l_StudioService_0 = game:GetService("StudioService");
local l_Parent_0 = script.Parent.Parent.Parent;
local v4 = require(l_Parent_0.Packages.Roact);
local v5 = require(l_Parent_0.Packages.RoactRodux);
local v6 = require(l_Parent_0.Packages.Cryo);
local v7 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v7.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Stylizer_0 = v7.Style.Stylizer;
local l_Localization_0 = l_ContextServices_0.Localization;
local l_UI_0 = v7.UI;
local l_ScrollingFrame_0 = l_UI_0.ScrollingFrame;
local l_Container_0 = l_UI_0.Container;
local l_LoadingIndicator_0 = l_UI_0.LoadingIndicator;
local l_StyledDialog_0 = v7.UI.StyledDialog;
local v17 = require(l_Parent_0.Src.Util.ShowDialog);
local v18 = require(l_Parent_0.Src.Components.CollaboratorsWidget);
local v19 = require(l_Parent_0.Src.Components.CollaboratorSearchWidget);
local v20 = require(l_Parent_0.Src.Components.Footer);
local v21 = require(l_Parent_0.Src.Thunks.SavePermissions);
local v22 = require(l_Parent_0.Src.Thunks.PermissionsLoader);
local v23 = require(l_Parent_0.Src.Util.LoadState);
local v24 = require(l_Parent_0.Src.Util.SaveState);
local v25 = require(l_Parent_0.Src.Selectors.GetHasCollaborators);
local v26 = require(l_Parent_0.Src.Selectors.GetHasCurrentEditCollaborators);
local v27 = require(l_Parent_0.Src.Util.IsTeamCreateEnabled);
local l_LayoutOrderIterator_0 = v7.Util.LayoutOrderIterator;
local v29 = require(l_Parent_0.Src.Util.Analytics);
local v30 = v4.PureComponent:extend("PermissionsView");
v30.isGroupGame = function(v31)
    return v31.props.OwnerType == Enum.CreatorType.Group;
end;
v30.isLoggedInUserGameOwner = function(v32)
    local l_l_StudioService_0_UserId_0 = l_StudioService_0:GetUserId();
    local l_props_0 = v32.props;
    local l_OwnerId_0 = l_props_0.OwnerId;
    local l_GroupOwnerUserId_0 = l_props_0.GroupOwnerUserId;
    if not v32:isGroupGame() then
        return l_l_StudioService_0_UserId_0 == l_OwnerId_0;
    else
        return l_l_StudioService_0_UserId_0 == l_GroupOwnerUserId_0;
    end;
end;
v30.init = function(v37)
    v37.scrollingFrameRef = v4.createRef();
    v37.contentHeightChanged = function(v38)
        local l_current_0 = v37.scrollingFrameRef.current;
        if l_current_0 then
            l_current_0.CanvasSize = UDim2.new(1, 0, 0, v38.AbsoluteContentSize.Y + v37.props.Stylizer.scrollingFrame.yPadding);
        end;
    end;
end;
v30.onSavePressed = function(v40)
    v40.props.SavePermissions(v40:isGroupGame());
    if not v27() then
        l_StudioPublishService_0:PublishThenTurnOnTeamCreate();
    end;
end;
v30.onCancelPressed = function(v41, v42)
    local l_props_1 = v41.props;
    local l_Plugin_0 = l_props_1.Plugin;
    local l_Localization_1 = l_props_1.Localization;
    local l_Stylizer_1 = l_props_1.Stylizer;
    local l_CloseWidget_0 = l_props_1.CloseWidget;
    v29.reportCancelPressed(v41:isGroupGame());
    if v42 then
        v17(l_Plugin_0, l_Localization_1, l_StyledDialog_0, {
            Buttons = {
                {
                    Key = "NO", 
                    Text = l_Localization_1:getText("Buttons", "No")
                }, 
                {
                    Key = "YES", 
                    Text = l_Localization_1:getText("Buttons", "Yes"), 
                    Style = "RoundPrimary"
                }
            }, 
            MinContentSize = l_Stylizer_1.cancelDialog.Size, 
            Style = "CancelDialog", 
            OnButtonPressed = function(v48)
                if v48 == "YES" then
                    l_CloseWidget_0();
                end;
            end, 
            OnClose = function()
            end, 
            Title = l_Localization_1:getText("Title", "DiscardChanges"), 
            Modal = true
        }, {
            Contents = v4.createElement("TextLabel", {
                BackgroundTransparency = 1, 
                TextSize = l_Stylizer_1.cancelDialog.Text.TextSize, 
                Text = l_Localization_1:getText("Description", "DiscardChanges"), 
                TextColor3 = l_Stylizer_1.cancelDialog.Text.TextColor3, 
                Font = l_Stylizer_1.cancelDialog.Text.Font, 
                Size = UDim2.fromScale(1, 1), 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Position = l_Stylizer_1.cancelDialog.Position
            })
        });
        return ;
    else
        l_CloseWidget_0();
        return ;
    end;
end;
v30.render = function(v49)
    local l_props_2 = v49.props;
    if l_props_2.Enabled then
        local l_Stylizer_2 = l_props_2.Stylizer;
        local l_Localization_2 = l_props_2.Localization;
        local l_SaveState_0 = l_props_2.SaveState;
        local l_LoadState_0 = l_props_2.LoadState;
        local l_HasCollaborators_0 = l_props_2.HasCollaborators;
        local l_HasCurrentEditCollaborators_0 = l_props_2.HasCurrentEditCollaborators;
        if l_SaveState_0 == v24.Saved then
            l_props_2.CloseWidget();
            return ;
        else
            local v57 = l_LoadState_0 == v23.Loaded;
            local v58 = false;
            local v59 = nil;
            if l_LoadState_0 == v23.Unloaded then
                l_props_2.LoadPermissions();
            end;
            if not (l_LoadState_0 ~= v23.LoadFailed) or l_SaveState_0 == v24.SaveFailed then
                v58 = true;
                v59 = if l_LoadState_0 == v23.LoadFailed then l_Localization_2:getText("FailureMessage", "LoadFailure") else l_Localization_2:getText("FailureMessage", "SaveFailure");
            end;
            local v60 = v49:isLoggedInUserGameOwner();
            local v61 = v57 and not v58;
            local v62 = v27();
            local v63 = (v61 and not v62) and (l_HasCollaborators_0 or l_HasCurrentEditCollaborators_0);
            local v64 = l_Localization_2:getText("Description", not l_HasCurrentEditCollaborators_0 and "SaveEnableTC" or "SaveEnableTcCurrentEditors");
            local l_height_0 = l_Stylizer_2.footer.height;
            if v63 then
                l_height_0 = l_height_0 + l_Stylizer_2.saveMessage.boxHeight;
            end;
            local v66 = l_LayoutOrderIterator_0.new();
            local v67 = l_LayoutOrderIterator_0.new();
            return v4.createElement("Frame", {
                Size = UDim2.new(1, 0, 1, 0), 
                BackgroundColor3 = l_Stylizer_2.backgroundColor
            }, {
                Layout = v61 and v4.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    Padding = UDim.new(0, l_Stylizer_2.permissionsView.Padding)
                }), 
                ScrollingFrame = v61 and v4.createElement(l_ScrollingFrame_0, {
                    LayoutOrder = v66:getNextOrder(), 
                    Size = UDim2.new(1, 0, 1, -l_height_0), 
                    Layout = Enum.FillDirection.Vertical, 
                    AutomaticCanvasSize = Enum.AutomaticSize.Y, 
                    Spacing = UDim.new(0, if not v60 then l_Stylizer_2.scrollingFrame.yPaddingNonOwner else l_Stylizer_2.scrollingFrame.yPadding)
                }, {
                    SearchBarWidget = v60 and v4.createElement(v19, {
                        LayoutOrder = v67:getNextOrder(), 
                        Writable = true, 
                        IsGroupGame = v49:isGroupGame()
                    }), 
                    Frame = not v60 and v4.createElement("Frame", {
                        BackgroundTransparency = 1
                    }), 
                    CollaboratorsWidget = v4.createElement(v18, {
                        LayoutOrder = v67:getNextOrder(), 
                        Writable = v60, 
                        IsGroupGame = if not l_COLLAB2850_FixMcTooltips_0 then nil else v49:isGroupGame()
                    })
                }), 
                TextFrame = if not v63 then nil else v4.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    BackgroundColor3 = l_Stylizer_2.backgroundColor, 
                    LayoutOrder = v66:getNextOrder(), 
                    Size = UDim2.new(1, 0, 0, l_Stylizer_2.saveMessage.boxHeight), 
                    BorderSizePixel = 0
                }, {
                    Text = v4.createElement("TextLabel", v6.Dictionary.join(l_Stylizer_2.saveMessage.textStyle, {
                        AnchorPoint = Vector2.new(0, 0.5), 
                        Position = l_Stylizer_2.saveMessage.InnerTextPosition, 
                        Text = v64, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        BorderSizePixel = 0, 
                        TextWrapped = true, 
                        Size = UDim2.new(0.55, 0, 1, 0), 
                        BackgroundTransparency = 1
                    }))
                }), 
                FooterContent = v61 and v4.createElement(l_Container_0, {
                    LayoutOrder = v66:getNextOrder(), 
                    Size = UDim2.new(1, 0, 0, l_Stylizer_2.footer.height)
                }, {
                    Footer = v4.createElement(v20, {
                        IsTeamCreateEnabled = v62, 
                        OnSavePressed = function()
                            v49:onSavePressed();
                        end, 
                        OnCancelPressed = function(v68)
                            v49:onCancelPressed(v68);
                        end
                    })
                }), 
                LoadingIndicator = (not v57 and not v58) and v4.createElement(l_LoadingIndicator_0, {
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    Position = UDim2.fromScale(0.5, 0.5)
                }), 
                FailureText = v58 and v4.createElement("TextLabel", {
                    Text = v59, 
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    Position = UDim2.fromScale(0.5, 0.25), 
                    TextColor3 = l_Stylizer_2.fontStyle.Normal.TextColor3, 
                    TextSize = l_Stylizer_2.fontStyle.Normal.TextSize, 
                    Font = l_Stylizer_2.fontStyle.Normal.Font
                })
            });
        end;
    else
        return ;
    end;
end;
return (v5.connect(function(v69, _)
    return {
        LoadState = v69.LoadState.CurrentLoadState or v23.Unloaded, 
        SaveState = v69.SaveState.CurrentSaveState or v24.Unsaved, 
        OwnerId = v69.GameOwnerMetadata.creatorId, 
        OwnerType = v69.GameOwnerMetadata.creatorType, 
        GroupOwnerUserId = v69.GameOwnerMetadata.groupOwnerId, 
        HasCollaborators = v25(v69), 
        HasCurrentEditCollaborators = v26(v69), 
        GroupRolePermissions = v69.GroupRolePermissions.PermissionsByRole
    };
end, function(v71)
    return {
        LoadPermissions = function()
            v71(v22:LoadPermissions());
        end, 
        SavePermissions = function(v72)
            v71(v21(v72));
        end
    };
end)((l_withContext_0({
    Stylizer = l_Stylizer_0, 
    Localization = l_Localization_0
})(v30))));
