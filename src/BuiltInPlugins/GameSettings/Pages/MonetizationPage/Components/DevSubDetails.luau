local l_StudioService_0 = game:GetService("StudioService");
local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = script.Parent.Parent.Parent.Parent;
local v3 = require(l_Parent_1.Src.Util.FileUtils);
local v4 = require(l_Parent_1.Src.Util.DEPRECATED_Constants);
local v5 = require(l_Parent_1.Src.Util.DeepMergeTables);
local v6 = require(l_Parent_1.Packages.Cryo);
local v7 = require(l_Parent_1.Packages.RoactRodux);
local v8 = require(l_Parent_1.Packages.Roact);
local v9 = require(l_Parent_1.Src.Components.UploadableIcon.UploadableIconWidget);
local v10 = require(l_Parent_1.Src.Components.Dialog.WarningDialog);
local v11 = require(l_Parent_1.Src.ContextServices.Dialog);
local v12 = require(script.Parent.DevSubListItemText);
local v13 = require(l_Parent_1.Src.Actions.AddChange);
local v14 = require(l_Parent_0.Thunks.AddDevSubKeyChange);
local v15 = require(l_Parent_0.Thunks.DevSubModeration);
local v16 = require(l_Parent_1.Packages.Framework);
local l_ContextServices_0 = v16.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_UI_0 = v16.UI;
local l_Button_0 = l_UI_0.Button;
local l_HoverArea_0 = l_UI_0.HoverArea;
local l_Image_0 = l_UI_0.Image;
local l_Pane_0 = l_UI_0.Pane;
local l_Separator_0 = l_UI_0.Separator;
local l_SelectInput_0 = l_UI_0.SelectInput;
local l_TextInput_0 = l_UI_0.TextInput;
local l_TitledFrame_0 = l_UI_0.TitledFrame;
local l_Util_0 = v16.Util;
local l_GetTextSize_0 = l_Util_0.GetTextSize;
local l_FitFrameOnAxis_0 = l_Util_0.FitFrame.FitFrameOnAxis;
local l_LayoutOrderIterator_0 = l_Util_0.LayoutOrderIterator;
local v32 = v8.Component:extend("DeveloperSubscriptionDetails");
local v33 = game:DefineFastInt("DeveloperSubscriptionsMaxRobuxPrice", 2000);
v32.init = function(v34)
    v34.state = {
        isNameDirty = false
    };
    v34.CheckName = function()
        if v34.state.isNameDirty then
            v34.props.ModerateDevSub(v34.props.DeveloperSubscription);
            return ;
        else
            return ;
        end;
    end;
    v34.onKeyChanged = function(v35, v36)
        local l_DeveloperSubscription_0 = v34.props.DeveloperSubscription;
        v34.props.SetDevSubKey(l_DeveloperSubscription_0.Key, v35, v36);
        l_DeveloperSubscription_0[v35] = v36;
        v34.props.OnDeveloperSubscriptionChanged(l_DeveloperSubscription_0);
    end;
    v34.onNameChanged = function(v38)
        v34.onKeyChanged("Name", v38);
        if not v34.state.isNameDirty then
            v34:setState({
                isNameDirty = true
            });
        end;
    end;
    v34.onNameFocusChanged = function(_)
        v34.CheckName();
    end;
    v34.onPriceChanged = function(v40)
        v34.onKeyChanged("Price", v40);
    end;
    v34.onImageChanged = function(v41)
        v34.onKeyChanged("Image", v41);
    end;
    v34.onPrepaidChanged = function(v42)
        v34.onKeyChanged("Prepaid", v42);
    end;
    v34.onBackButtonActivated = function()
        v34.props.OnEditFinished(false);
    end;
    v34.setImage = function()
        local v43 = v3.PromptForGameIcon(v34, v34.props.Localization);
        if v43 then
            v34.onImageChanged(v43);
        end;
    end;
    v34.onDeleteClicked = function()
        if not v34.props.DeveloperSubscription.IsNew then
            local l_Localization_0 = v34.props.Localization;
            if v34.props.Dialog.showDialog(v10, {
                Title = l_Localization_0:getText("General", "DevSubsDeleteTitle"), 
                Header = l_Localization_0:getText("General", "DevSubsDeleteHeader"), 
                Description = l_Localization_0:getText("General", "DevSubsDeleteDescription"), 
                Buttons = {
                    l_Localization_0:getText("General", "ButtonCancel"), 
                    l_Localization_0:getText("General", "DevSubsDeleteConfirm")
                }
            }):await() then
                v34.props.OnDevSubDeleted(v34.props.DeveloperSubscription);
            end;
            return ;
        else
            v34.props.OnDevSubDeleted(v34.props.DeveloperSubscription);
            v34.onBackButtonActivated();
            return ;
        end;
    end;
end;
v32.render = function(v45)
    local l_DeveloperSubscription_1 = v45.props.DeveloperSubscription;
    local l_ModeratedDevSub_0 = v45.props.ModeratedDevSub;
    local l_DevSubErrors_0 = v45.props.DevSubErrors;
    local l_Stylizer_0 = v45.props.Stylizer;
    local l_Localization_1 = v45.props.Localization;
    local v51 = l_DeveloperSubscription_1.IsNew or l_DeveloperSubscription_1.Active;
    local l_IsNew_0 = l_DeveloperSubscription_1.IsNew;
    local v53 = l_LayoutOrderIterator_0.new();
    local v54 = nil;
    local v55 = nil;
    local v56 = nil;
    if v51 then
        if l_DevSubErrors_0.Name then
            if not l_DevSubErrors_0.Name.Empty then
                if not (not l_DevSubErrors_0.Name.Moderated or not l_ModeratedDevSub_0) then
                    v54 = l_Localization_1:getText("General", "ErrorDevSubFiltered", {
                        filteredText = l_ModeratedDevSub_0.filteredName
                    });
                end;
            else
                v54 = l_Localization_1:getText("General", "ErrorNameEmpty");
            end;
        end;
        if not (not l_DeveloperSubscription_1.IsNew or not l_DevSubErrors_0.Price) then
            if not l_DevSubErrors_0.Price.NotANumber then
                if not (not v33 or not l_DevSubErrors_0.Price.AboveMaxRobuxAmount) then
                    v55 = l_Localization_1:getText("General", "ErrorDevSubMaxPrice", {
                        maxRobuxAmount = v33
                    });
                end;
            else
                v55 = l_Localization_1:getText("General", "ErrorDevSubInvalidPrice");
            end;
        end;
        if l_DevSubErrors_0.Image then
            v56 = l_Localization_1:getText("General", "ErrorImageRequired");
        end;
    end;
    local v57 = {
        {
            Id = 6, 
            Label = l_Localization_1:getText("General", "DevSubsDuration6Months")
        }, 
        {
            Id = 12, 
            Label = l_Localization_1:getText("General", "DevSubsDuration12Months")
        }
    };
    local v58 = l_GetTextSize_0(l_DeveloperSubscription_1.Id, l_Stylizer_0.fontStyle.Normal.TextSize, l_Stylizer_0.fontStyle.Normal.Font);
    local l_TextSize_0 = l_Stylizer_0.fontStyle.Normal.TextSize;
    return v8.createElement(l_Pane_0, {
        AutomaticSize = Enum.AutomaticSize.Y, 
        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
        LayoutOrder = v45.props.LayoutOrder or 1, 
        Layout = Enum.FillDirection.Vertical, 
        Spacing = UDim.new(0, v4.ELEMENT_PADDING)
    }, {
        HeaderFrame = v8.createElement(l_FitFrameOnAxis_0, {
            LayoutOrder = v53:getNextOrder(), 
            BackgroundTransparency = 1, 
            axis = l_FitFrameOnAxis_0.Axis.Vertical, 
            minimumSize = UDim2.new(1, 0, 0, 0), 
            contentPadding = UDim.new(0, l_Stylizer_0.settingsPage.headerPadding)
        }, {
            BackButton = v8.createElement("ImageButton", {
                Size = UDim2.new(0, l_Stylizer_0.backButton.size, 0, l_Stylizer_0.backButton.size), 
                LayoutOrder = 0, 
                Image = l_Stylizer_0.backButton.image, 
                BackgroundTransparency = 1, 
                [v8.Event.Activated] = function()
                    v45.onBackButtonActivated();
                end
            }, {
                v8.createElement(l_HoverArea_0, {
                    Cursor = "PointingHand"
                })
            }), 
            v8.createElement(l_Separator_0, {
                LayoutOrder = 1
            }), 
            Header = v8.createElement("TextLabel", v6.Dictionary.join(l_Stylizer_0.fontStyle.Title, {
                Size = UDim2.new(1, 0, 0, v4.HEADER_HEIGHT), 
                Text = not not l_DeveloperSubscription_1.IsNew and l_Localization_1:getText("General", "DevSubsNewHeader") or l_Localization_1:getText("General", "DevSubsEditHeader"), 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextYAlignment = Enum.TextYAlignment.Center, 
                LayoutOrder = 2
            }), {
                Padding = v8.createElement("UIPadding", {
                    PaddingRight = UDim.new(0, 12)
                }), 
                Layout = v8.createElement("UIListLayout", {
                    HorizontalAlignment = Enum.HorizontalAlignment.Right, 
                    VerticalAlignment = Enum.VerticalAlignment.Bottom
                }), 
                Button = v8.createElement(l_Button_0, {
                    Text = l_Localization_1:getText("General", "DevSubsDeleteAction"), 
                    OnClick = v45.onDeleteClicked, 
                    Style = "Round"
                })
            })
        }), 
        IdFrame = not l_IsNew_0 and v8.createElement(l_TitledFrame_0, {
            LayoutOrder = v53:getNextOrder(), 
            Title = l_Localization_1:getText("General", "DevSubsId")
        }, {
            Layout = v8.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Horizontal, 
                VerticalAlignment = Enum.VerticalAlignment.Top
            }), 
            Text = v8.createElement(v12, {
                Text = l_DeveloperSubscription_1.Id, 
                Size = UDim2.new(0, v58.X, 0.5, 0), 
                Alignment = Enum.TextXAlignment.Left, 
                LayoutOrder = 1
            }), 
            Button = v8.createElement("ImageButton", {
                BackgroundTransparency = 1, 
                Image = l_Stylizer_0.copyButton.image, 
                ImageColor3 = l_Stylizer_0.copyButton.imageColor, 
                Size = UDim2.new(0, 16, 0, 16), 
                SizeConstraint = Enum.SizeConstraint.RelativeYY, 
                LayoutOrder = 2, 
                [v8.Event.Activated] = function()
                    l_StudioService_0:CopyToClipboard(l_DeveloperSubscription_1.Id);
                end
            })
        }), 
        NameFrame = v8.createElement(l_TitledFrame_0, {
            LayoutOrder = v53:getNextOrder(), 
            Title = l_Localization_1:getText("General", "DevSubsName")
        }, {
            TextBox = v8.createElement(l_TextInput_0, {
                Disabled = not v51, 
                ErrorText = v54, 
                MaxLength = 32, 
                OnTextChanged = v45.onNameChanged, 
                OnFocusLost = v45.onNameFocusChanged, 
                Text = l_DeveloperSubscription_1.Name or ""
            })
        }), 
        Image = not not v51 and v8.createElement(v9, {
            Title = l_Localization_1:getText("General", "DevSubsImage"), 
            Enabled = true, 
            Icon = l_DeveloperSubscription_1.Image, 
            LayoutOrder = v53:getNextOrder(), 
            TutorialEnabled = false, 
            ErrorMessage = v56, 
            AddIcon = v45.setImage
        }) or v8.createElement(l_TitledFrame_0, {
            LayoutOrder = v53:getNextOrder(), 
            Title = l_Localization_1:getText("General", "DevSubsImage")
        }, {
            Image = v8.createElement("ImageLabel", {
                Image = l_DeveloperSubscription_1.Image, 
                Size = UDim2.new(0, 150, 0, 150)
            })
        }), 
        PriceFrame = v8.createElement(l_TitledFrame_0, {
            LayoutOrder = v53:getNextOrder(), 
            Title = l_Localization_1:getText("General", "DevSubsPrice")
        }, {
            Input = v8.createElement(l_TextInput_0, {
                Disabled = not l_DeveloperSubscription_1.IsNew, 
                ErrorText = v55, 
                MaxLength = 50000, 
                OnTextChanged = v45.onPriceChanged, 
                Text = tostring(l_DeveloperSubscription_1.Price), 
                Size = UDim2.new(0, 200, 0, 32), 
                LeadingComponent = l_Image_0, 
                LeadingComponentProps = {
                    Size = UDim2.new(0, l_TextSize_0, 0, l_TextSize_0), 
                    Image = l_Stylizer_0.robuxFeeBase.icon.image, 
                    ImageColor3 = Color3.fromRGB(25, 25, 25)
                }
            })
        }), 
        PrepaidFrame = v8.createElement(l_TitledFrame_0, {
            LayoutOrder = v53:getNextOrder(), 
            Title = l_Localization_1:getText("General", "DevSubsDuration")
        }, {
            Selector = v8.createElement(l_SelectInput_0, {
                Items = v57, 
                Enabled = l_DeveloperSubscription_1.Prepaid ~= nil, 
                SelectedId = l_DeveloperSubscription_1.Prepaid, 
                OnItemActivated = function(v60)
                    v45.onPrepaidChanged(v60.Id);
                end
            })
        }), 
        EarningFrame = not l_IsNew_0 and v8.createElement(l_TitledFrame_0, {
            LayoutOrder = v53:getNextOrder(), 
            Title = l_Localization_1:getText("General", "DevSubsPendingEarning")
        }, {
            Text = v8.createElement(v12, {
                Text = tostring(l_DeveloperSubscription_1.PendingEarning), 
                Size = UDim2.new(1, 0, 0.5, 0), 
                Alignment = Enum.TextXAlignment.Left
            })
        })
    });
end;
v32 = l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer, 
    Localization = l_ContextServices_0.Localization, 
    Dialog = v11
})(v32);
local v61 = require(l_Parent_1.Src.Networking.settingFromState);
return v7.connect(function(v62, _)
    local l_Errors_0 = v62.Settings.Errors;
    local v65 = (v62.Settings.Current or {}).DeveloperSubscriptions or {};
    local v66 = (v62.Settings.Changed or {}).DeveloperSubscriptions or {};
    local function _(v67)
        return v61(v62.Settings, v67);
    end;
    local v69 = v5.Merge(v65, v66) or {};
    local v70 = v61(v62.Settings, "editedSubscriptionKey");
    return {
        DeveloperSubscription = v69[v70], 
        ModeratedDevSubs = v62.DevSubModeration or {}, 
        DevSubErrors = (l_Errors_0.DeveloperSubscriptions or {})[v70] or {}
    };
end, function(v71)
    return {
        OnEditFinished = function()
            v71(v13("isEditingSubscription", false));
            v71(v13("editedSubscriptionKey", nil));
        end, 
        OnDevSubDeleted = function(v72)
            if not v72.IsNew then
                v71(v14(v72.Key, "Active", false));
            end;
        end, 
        ModerateDevSub = function(v73)
            v71(v15(v73));
        end
    };
end)(v32);
