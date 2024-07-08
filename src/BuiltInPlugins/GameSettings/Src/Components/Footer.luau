local l_game_FastInt_0 = game:GetFastInt("LuobuDevPublishAnalyticsHundredthsPercentage");
local l_Parent_0 = script.Parent.Parent.Parent;
local v2 = require(l_Parent_0.Packages.Roact);
local v3 = require(l_Parent_0.Packages.RoactRodux);
local v4 = require(l_Parent_0.Packages.Framework);
local l_Promise_0 = v4.Util.Promise;
local l_ContextServices_0 = v4.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v8 = require(l_Parent_0.Src.ContextServices.Dialog);
local v9 = require(l_Parent_0.Src.Util.DEPRECATED_Constants);
local v10 = require(l_Parent_0.Src.Util.isEmpty);
local v11 = require(l_Parent_0.Src.Components.ButtonBar);
local v12 = require(l_Parent_0.Src.Thunks.ConfirmAndSaveChanges);
local v13 = require(l_Parent_0.Src.Thunks.PostContactEmail);
local v14 = require(l_Parent_0.Src.Util.CurrentStatus);
local l_TextInputDialog_0 = v4.UI.TextInputDialog;
local l_shouldShowDevPublishLocations_0 = require(l_Parent_0.Src.Util.GameSettingsUtilities).shouldShowDevPublishLocations;
local l_sendAnalyticsToKibana_0 = require(l_Parent_0.Src.Util.GameSettingsUtilities).sendAnalyticsToKibana;
local v18 = require(l_Parent_0.Src.Util.KeyProvider);
local v19 = v18.getOptInLocationsKeyName();
local v20 = v18.getChinaKeyName();
local v21 = v18.getSelectedKeyName();
local v22 = v18.getFooterKeyName();
local v23 = v18.getLuobuStudioDevPublishKeyName();
local v24 = v2.PureComponent:extend("Footer");
v24.saveAllSettings = function(v25, v26)
    local l_props_0 = v25.props;
    v25.props.SaveAllSettings(v26, l_props_0.Localization, l_props_0.Dialog):andThen(function()
        v25.props.OnClose(v26);
    end);
end;
v24.init = function(v28)
    v28.shouldShowEmailDialog = function()
        local l_props_1 = v28.props;
        local l_CurrentOptInLocations_0 = l_props_1.CurrentOptInLocations;
        local l_ChangedOptInLocations_0 = l_props_1.ChangedOptInLocations;
        if l_CurrentOptInLocations_0 then
            if l_CurrentOptInLocations_0[v20][v21] or not l_ChangedOptInLocations_0 then
                return false;
            else
                assert(l_ChangedOptInLocations_0[v20][v21], "China should be selected in Changed");
                return true;
            end;
        else
            assert(not l_ChangedOptInLocations_0);
            return false;
        end;
    end;
    v28.state = {
        showEmailDialog = false, 
        userPressedSave = false, 
        bottomText = ""
    };
end;
v24.render = function(v32)
    local l_props_2 = v32.props;
    local l_Stylizer_0 = l_props_2.Stylizer;
    local l_Localization_0 = l_props_2.Localization;
    local l_SaveActive_0 = l_props_2.SaveActive;
    local l_CancelActive_0 = l_props_2.CancelActive;
    local l_PostContactEmail_0 = l_props_2.PostContactEmail;
    return v2.createElement("Frame", {
        BackgroundColor3 = l_Stylizer_0.backgroundColor, 
        BorderSizePixel = 0, 
        Size = UDim2.fromScale(1, 1), 
        ZIndex = 2
    }, {
        Gradient = v2.createElement("ImageLabel", {
            Size = UDim2.new(1, 0, 0, 3), 
            AnchorPoint = Vector2.new(0, 1), 
            Image = v9.GRADIENT_IMAGE, 
            ImageRectSize = v9.GRADIENT_RECT_SIZE, 
            BorderSizePixel = 0, 
            BackgroundTransparency = 1, 
            ImageColor3 = l_Stylizer_0.footer.gradient, 
            ImageTransparency = 0.9, 
            ZIndex = 1
        }), 
        SaveSettings = v2.createElement(v11, {
            ZIndex = 2, 
            Buttons = {
                {
                    Name = l_Localization_0:getText("General", "ButtonCancel"), 
                    Active = l_CancelActive_0, 
                    Value = false
                }, 
                {
                    Name = l_Localization_0:getText("General", "ButtonSave"), 
                    Default = true, 
                    Active = l_SaveActive_0, 
                    Value = true
                }
            }, 
            HorizontalAlignment = Enum.HorizontalAlignment.Right, 
            ButtonClicked = function(v39)
                if (not v39 or not l_shouldShowDevPublishLocations_0()) or not v32.shouldShowEmailDialog() then
                    if not (((not v39 or not l_shouldShowDevPublishLocations_0()) or not v32.props.CurrentOptInLocations) or not v32.props.CurrentOptInLocations[v20][v21]) then
                        local v40 = {
                            [v19] = v20
                        };
                        if v32.props.ChangedOptInLocations then
                            assert(not v32.props.ChangedOptInLocations[v20][v21]);
                            v40.selected = false;
                        else
                            v40.selected = true;
                        end;
                        l_sendAnalyticsToKibana_0(v23, l_game_FastInt_0, v22, v40);
                    end;
                    v32:saveAllSettings(v39);
                    return ;
                else
                    v32:setState({
                        showEmailDialog = true, 
                        userPressedSave = v39
                    });
                    return ;
                end;
            end
        }, {
            EmailDialog = v2.createElement(l_TextInputDialog_0, {
                Enabled = v32.state.showEmailDialog, 
                Size = Vector2.new(l_Stylizer_0.emailDialog.Size.X, l_Stylizer_0.emailDialog.Size.Y), 
                Title = l_Localization_0:getText(v19, "EmailDialogHeader"), 
                Header = l_Localization_0:getText(v19, "EmailDialogHeader"), 
                Buttons = {
                    {
                        Key = "Submit", 
                        Text = l_Localization_0:getText("General", "ButtonSubmit")
                    }, 
                    {
                        Key = "Cancel", 
                        Text = l_Localization_0:getText("General", "ButtonCancel")
                    }
                }, 
                Body = l_Localization_0:getText(v19, "EmailDialogBody"), 
                Description = l_Localization_0:getText(v19, "EmailDialogDescription"), 
                TextInput = {
                    {
                        PlaceholderText = l_Localization_0:getText(v19, "EmailAddress")
                    }, 
                    {
                        PlaceholderText = l_Localization_0:getText(v19, "ConfirmEmailAddress"), 
                        BottomText = v32.state.bottomText
                    }
                }, 
                OnClose = function()
                    v32:setState({
                        showEmailDialog = false, 
                        userPressedSave = false, 
                        bottomText = ""
                    });
                end, 
                OnButtonPressed = function(v41, v42, v43)
                    if not (v41 == "Submit") then
                        v32:setState({
                            showEmailDialog = false, 
                            userPressedSave = false, 
                            bottomText = ""
                        });
                        return ;
                    elseif v42 == v43 then
                        l_sendAnalyticsToKibana_0(v23, l_game_FastInt_0, v22, {
                            [v19] = v20, 
                            [v21] = true
                        });
                        local v44 = l_PostContactEmail_0(v42);
                        if v44 then
                            warn(l_Localization_0:getText(v19, "EmailSubmitFailure") .. v44);
                            return ;
                        else
                            v32:saveAllSettings(v32.state.userPressedSave);
                            v32:setState({
                                showEmailDialog = false, 
                                userPressedSave = false, 
                                bottomText = ""
                            });
                            return ;
                        end;
                    else
                        v32:setState({
                            bottomText = l_Localization_0:getText(v19, "ErrorEmailNotEqual")
                        });
                        return ;
                    end;
                end
            })
        })
    });
end;
return (v3.connect(function(v45, _)
    if v45 then
        local v47 = {};
        local v48 = not v10(v45.Settings.Changed);
        if v48 then
            v48 = false;
            if v45.Status == v14.Open then
                v48 = v10(v45.Settings.Errors);
            end;
        end;
        v47.SaveActive = v48;
        v47.CancelActive = v45.Status == v14.Open;
        v47.CurrentOptInLocations = v45.Settings.Current[v19];
        v47.ChangedOptInLocations = v45.Settings.Changed[v19];
        return v47;
    else
        return ;
    end;
end, function(v49)
    return {
        SaveAllSettings = function(v50, ...)
            if not v50 then
                return l_Promise_0.resolve();
            else
                return v49(v12(...));
            end;
        end, 
        PostContactEmail = function(v51)
            return v49(v13(v51));
        end
    };
end)((l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer, 
    Localization = l_ContextServices_0.Localization, 
    Dialog = v8
})(v24))));
