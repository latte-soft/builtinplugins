local l_GuiService_0 = game:GetService("GuiService");
local l_Parent_0 = script.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v3 = require(l_Packages_0.Framework);
local v4 = require(l_Packages_0.Roact);
local l_UI_0 = v3.UI;
local l_CaptureFocus_0 = l_UI_0.CaptureFocus;
local l_Button_0 = l_UI_0.Button;
local v8 = require(l_Packages_0.Dash);
local l_HoverArea_0 = l_UI_0.HoverArea;
local l_LayoutOrderIterator_0 = v3.Util.LayoutOrderIterator;
local l_LinkText_0 = l_UI_0.LinkText;
local l_Pane_0 = l_UI_0.Pane;
local _ = l_UI_0.Image;
local l_TextLabel_0 = l_UI_0.TextLabel;
local v15 = require(l_Parent_0.Core.ContextServices.IXPContext);
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local _ = v3.Util.formatLocalDateTime;
local l_Util_0 = l_Parent_0.Core.Util;
local v20 = require(l_Util_0.Analytics.Analytics);
local v21 = require(l_Util_0.Images);
local v22 = require(l_Util_0.ToolboxUtilities);
local v23 = require(l_Util_0.getUserId);
local l_withAbsoluteSize_0 = v3.Wrappers.withAbsoluteSize;
local v25 = require(l_Parent_0.Core.ContextServices.Settings);
local v26 = require(l_Parent_0.Core.ContextServices.ModalContext);
local v27 = UDim2.fromOffset(110, 30);
local v28 = UDim2.fromOffset(264, 110);
local v29 = v4.PureComponent:extend("AnnouncementDialog");
v29.init = function(v30, _)
    v30.state = {
        isEnabled = true, 
        openStartTime = 0
    };
    v30.shouldShowAnnouncementDialog = function()
        local l_state_0 = v30.state;
        local l_props_0 = v30.props;
        local v34 = l_props_0.Settings:get("Plugin"):getLastAnnouncementViewedKey();
        local v35 = v22.getAnnouncementConfiguration();
        local v36 = v35.Date or "";
        local v37 = false;
        local v38 = false;
        local v39 = false;
        local l_IXPComparisonDefinitionKey_0 = v35.IXPComparisonDefinitionKey;
        local l_IXPComparisonVariableKey_0 = v35.IXPComparisonVariableKey;
        if ((l_IXPComparisonDefinitionKey_0 ~= nil and l_IXPComparisonDefinitionKey_0 ~= "") and l_IXPComparisonVariableKey_0 ~= nil) and l_IXPComparisonVariableKey_0 ~= "" then
            local l_checkUserInIXP_0 = l_props_0.checkUserInIXP;
            local v43 = false;
            if l_checkUserInIXP_0 ~= nil then
                v43 = l_checkUserInIXP_0(l_props_0.IXP, l_IXPComparisonDefinitionKey_0, l_IXPComparisonVariableKey_0);
            end;
            v39 = v43;
        else
            v39 = true;
        end;
        if v36 ~= "" then
            local v44, v45, v46, v47, v48, v49 = v36:match("(%d+)-(%d+)-(%d+) (%d+):(%d+):(%d+)");
            if math.floor(os.difftime(os.time(), (os.time({
                year = tonumber(v44), 
                month = tonumber(v45), 
                day = tonumber(v46), 
                hour = tonumber(v47), 
                min = tonumber(v48), 
                sec = tonumber(v49)
            }))) / 86400) > 30 then
                v37 = true;
            end;
        end;
        local l_LatestUserId_0 = v35.LatestUserId;
        if l_LatestUserId_0 and l_LatestUserId_0 ~= "" then
            v38 = tonumber(l_LatestUserId_0) < v23();
        end;
        local l_isEnabled_0 = l_state_0.isEnabled;
        if l_isEnabled_0 then
            l_isEnabled_0 = false;
            if v36 ~= "" then
                l_isEnabled_0 = false;
                if v34 ~= v36 then
                    l_isEnabled_0 = (not v37 and not v38) and v39;
                end;
            end;
        end;
        return l_isEnabled_0;
    end;
    v30.onClose = function()
        local l_props_1 = v30.props;
        local v53 = v22.getAnnouncementConfiguration().Date or "";
        l_props_1.Modal.onAssetPreviewToggled(false);
        l_props_1.Settings:get("Plugin"):setLastAnnouncementViewedKey(v53);
        v30:setState(function(v54)
            if not v54.isEnabled then
                return ;
            else
                return {
                    isEnabled = false
                };
            end;
        end);
    end;
    v30.onClickLink = function()
        l_GuiService_0:OpenBrowserWindow(v22.getAnnouncementConfiguration().LinkLocation);
        local v55 = v30.getAnnouncementConfigurationOrDefault();
        v20.AnnouncementLinkClicked(v55.ButtonKey, v55.Date, v55.DescriptionKey, v55.HeaderKey, v55.LinkKey, v55.LinkLocation);
    end;
    v30.onClickXButton = function()
        local v56 = v30.getAnnouncementConfigurationOrDefault();
        v20.AnnouncementClosed(v56.ButtonKey, v56.Date, v56.DescriptionKey, v56.HeaderKey, v56.LinkKey, v56.LinkLocation, (tick() - v30.state.openStartTime) * 1000);
        v30.onClose();
    end;
    v30.onClickAcknowledgeButton = function()
        local v57 = v30.getAnnouncementConfigurationOrDefault();
        v20.AnnouncementAcknowledged(v57.ButtonKey, v57.Date, v57.DescriptionKey, v57.HeaderKey, v57.LinkKey, v57.LinkLocation, (tick() - v30.state.openStartTime) * 1000);
        v30.onClose();
    end;
    v30.getAnnouncementConfigurationOrDefault = function(_)
        local v59 = v22.getAnnouncementConfiguration();
        return {
            ButtonKey = v59.ButtonKey or "Button_Default", 
            Date = v59.Date or "", 
            DescriptionKey = v59.DescriptionKey or "", 
            HeaderKey = v59.HeaderKey or "Header_Default", 
            Image = v59.Image, 
            LinkKey = v59.LinkKey or "LinkText_Default", 
            LinkLocation = v59.LinkLocation
        };
    end;
end;
v29.didMount = function(v60)
    if v60.shouldShowAnnouncementDialog() then
        v60.props.Modal.onAssetPreviewToggled(true);
        v60:setState({
            openStartTime = tick()
        });
        local v61 = v60.getAnnouncementConfigurationOrDefault();
        v20.AnnouncementViewed(v61.ButtonKey, v61.Date, v61.DescriptionKey, v61.HeaderKey, v61.LinkKey, v61.LinkLocation);
    end;
end;
v29.render = function(v62)
    if v62.shouldShowAnnouncementDialog() then
        local _ = v62.state;
        local v64 = l_LayoutOrderIterator_0.new();
        local l_props_2 = v62.props;
        local l_Localization_0 = l_props_2.Localization;
        local _ = l_props_2.Settings:get("Plugin");
        local l_Stylizer_0 = l_props_2.Stylizer;
        local l_WrapperProps_0 = l_props_2.WrapperProps;
        local l_announcementDialog_0 = l_Stylizer_0.announcementDialog;
        local v71 = v62.getAnnouncementConfigurationOrDefault();
        local l_ButtonKey_0 = v71.ButtonKey;
        local l_DescriptionKey_0 = v71.DescriptionKey;
        local l_HeaderKey_0 = v71.HeaderKey;
        local l_Image_1 = v71.Image;
        local l_LinkKey_0 = v71.LinkKey;
        local l_LinkLocation_0 = v71.LinkLocation;
        local v78 = l_Localization_0:getText("Announcement", l_ButtonKey_0);
        local v79 = l_Localization_0:getText("Announcement", l_DescriptionKey_0);
        local v80 = l_Localization_0:getText("Announcement", l_HeaderKey_0);
        local v81 = l_Localization_0:getText("Announcement", l_LinkKey_0);
        local v82 = l_props_2.AbsoluteSize.X > 400;
        local v83 = nil;
        v83 = if not v82 then UDim.new(1, 0) else UDim.new(0, 400);
        return v4.createElement(l_CaptureFocus_0, {
            OnFocusLost = function()
            end
        }, {
            Overlay = v4.createElement("Frame", {
                BackgroundColor3 = l_announcementDialog_0.overlayColor, 
                BackgroundTransparency = l_announcementDialog_0.overlayTransparency, 
                Size = UDim2.new(1, 0, 1, 0)
            }, {
                Contents = v4.createElement(l_Pane_0, v8.join({
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    Layout = Enum.FillDirection.Vertical, 
                    Padding = 20, 
                    Size = UDim2.new(1, 0, 1, 0), 
                    Spacing = 10, 
                    VerticalAlignment = Enum.VerticalAlignment.Top
                }, l_WrapperProps_0), {
                    CloseButtonContainer = v4.createElement(l_Pane_0, {
                        AutomaticSize = Enum.AutomaticSize.XY, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Right, 
                        Layout = Enum.FillDirection.Horizontal, 
                        LayoutOrder = v64:getNextOrder(), 
                        Size = UDim2.new(v83, UDim.new(0, 0))
                    }, {
                        CloseButton = v4.createElement("ImageButton", {
                            AutoButtonColor = false, 
                            BackgroundTransparency = 1, 
                            Image = v21.CLOSE_ICON, 
                            ImageColor3 = l_announcementDialog_0.closeIconColor, 
                            Size = UDim2.fromOffset(28, 28), 
                            LayoutOrder = 1, 
                            [v4.Event.Activated] = v62.onClickXButton
                        }, {
                            HoverArea = v4.createElement(l_HoverArea_0, {
                                Cursor = "PointingHand"
                            })
                        })
                    }), 
                    AnnouncementDialog = v4.createElement("Frame", {
                        AutomaticSize = Enum.AutomaticSize.Y, 
                        BackgroundColor3 = l_announcementDialog_0.backgroundColor, 
                        LayoutOrder = v64:getNextOrder(), 
                        Size = UDim2.new(v83, UDim.new(0, 0))
                    }, {
                        Contents = v4.createElement(l_Pane_0, {
                            AutomaticSize = Enum.AutomaticSize.Y, 
                            HorizontalAlignment = Enum.HorizontalAlignment.Right, 
                            Layout = Enum.FillDirection.Vertical, 
                            Padding = {
                                Bottom = 20, 
                                Left = 16, 
                                Right = 16, 
                                Top = 20
                            }, 
                            Spacing = 10, 
                            Size = UDim2.new(1, 0, 0, 0), 
                            VerticalAlignment = Enum.VerticalAlignment.Top
                        }, {
                            Header = v4.createElement(l_TextLabel_0, {
                                AutomaticSize = Enum.AutomaticSize.Y, 
                                Font = Enum.Font.SourceSansSemibold, 
                                LayoutOrder = v64:getNextOrder(), 
                                RichText = true, 
                                Size = UDim2.new(1, 0, 0, 0), 
                                Text = v80 or "", 
                                TextColor = l_announcementDialog_0.headerTextColor, 
                                TextWrapped = true, 
                                TextXAlignment = Enum.TextXAlignment.Left
                            }), 
                            Description = v4.createElement(l_TextLabel_0, {
                                AutomaticSize = Enum.AutomaticSize.Y, 
                                LayoutOrder = v64:getNextOrder(), 
                                RichText = true, 
                                Size = UDim2.new(1, 0, 0, 0), 
                                Text = v79 or "", 
                                TextColor = l_announcementDialog_0.descriptionColor, 
                                TextWrapped = true, 
                                TextXAlignment = Enum.TextXAlignment.Left
                            }), 
                            ActionContainer = v4.createElement(l_Pane_0, {
                                AutomaticSize = Enum.AutomaticSize.XY, 
                                LayoutOrder = v64:getNextOrder(), 
                                Padding = {
                                    Top = 10
                                }, 
                                Size = UDim2.new(1, 0, 0, 0)
                            }, {
                                LinkContainer = if not not l_LinkLocation_0 and l_LinkLocation_0 ~= "" then v4.createElement(l_Pane_0, {
                                    AutomaticSize = Enum.AutomaticSize.X, 
                                    LayoutOrder = v64:getNextOrder(), 
                                    Size = UDim2.new(0, 0, 0, v27.Y.Offset), 
                                    Layout = Enum.FillDirection.Horizontal, 
                                    VerticalAlignment = Enum.VerticalAlignment.Center
                                }, {
                                    LinkText = v4.createElement(l_LinkText_0, {
                                        LayoutOrder = v64:getNextOrder(), 
                                        OnClick = v62.onClickLink, 
                                        Style = "Underlined", 
                                        Text = v81
                                    })
                                }) else nil, 
                                Button = v4.createElement(l_Button_0, {
                                    AnchorPoint = Vector2.new(1, 0), 
                                    Position = UDim2.new(1, 0, 0, 0), 
                                    LayoutOrder = v64:getNextOrder(), 
                                    OnClick = v62.onClickAcknowledgeButton, 
                                    Size = v27, 
                                    Style = "RoundPrimary", 
                                    Text = v78
                                }, {
                                    HoverArea = v4.createElement(l_HoverArea_0, {
                                        Cursor = "PointingHand"
                                    })
                                })
                            }), 
                            ImageContainer = if not not l_Image_1 and l_Image_1 ~= "" then v4.createElement(l_Pane_0, {
                                AutomaticSize = Enum.AutomaticSize.Y, 
                                ClipsDescendants = true, 
                                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                                Layout = Enum.FillDirection.Vertical, 
                                LayoutOrder = v64:getNextOrder(), 
                                Size = UDim2.new(1, 0, 0, 0)
                            }, {
                                Image = v4.createElement("ImageLabel", {
                                    AutomaticSize = Enum.AutomaticSize.Y, 
                                    BackgroundTransparency = 1, 
                                    Image = l_Image_1, 
                                    Size = v28
                                })
                            }) else nil
                        })
                    })
                })
            })
        });
    else
        return ;
    end;
end;
v29 = l_withContext_0({
    IXP = v15, 
    Localization = l_ContextServices_0.Localization, 
    Settings = v25, 
    Stylizer = l_ContextServices_0.Stylizer, 
    Modal = v26
})(v29);
TypedComponent = function(v84, v85)
    return v4.createElement(v29, v84, v85);
end;
return l_withAbsoluteSize_0(TypedComponent);
