local l_BrowserService_0 = game:GetService("BrowserService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v2 = require(l_script_FirstAncestor_0.Packages.Dash);
local v3 = require(l_script_FirstAncestor_0.Packages.Framework);
local v4 = require(l_script_FirstAncestor_0.Packages.React);
local _ = require(l_script_FirstAncestor_0.Packages.UGCValidation);
local v6 = require(l_script_FirstAncestor_0.Src.Components.UGCValidationContext);
local _ = require(l_script_FirstAncestor_0.Src.Resources.Theme);
local v8 = require(l_script_FirstAncestor_0.Src.Util.exhaustiveMatch);
local v9 = require(l_script_FirstAncestor_0.Src.Util.localizePlural);
local v10 = game:DefineFastString("AvatarPreviewerAgeIDVerificationLink", "https://en.help.roblox.com/hc/en-us/articles/4407282410644-Age-ID-Verification");
local v11 = game:DefineFastString("AvatarPreviewerPremiumLink", "https://www.roblox.com/premium/membership");
local l_UI_0 = v3.UI;
local l_Image_0 = l_UI_0.Image;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_TextWithLinks_0 = l_UI_0.TextWithLinks;
local l_Pane_0 = l_UI_0.Pane;
local l_ScrollingFrame_0 = l_UI_0.ScrollingFrame;
local l_StyledDialog_0 = l_UI_0.StyledDialog;
local l_LayoutOrderIterator_0 = v3.Util.LayoutOrderIterator;
local l_Localization_0 = v3.ContextServices.Localization;
local l_Stylizer_0 = v3.ContextServices.Stylizer;
return function(v22)
    local v23 = l_LayoutOrderIterator_0.new();
    local v24 = l_Localization_0:use();
    local v25 = l_Stylizer_0:use("UGCValidationErrorDialog");
    local v26, v27 = v4.useState(0);
    local v29 = v4.useCallback(function(v28)
        v27(v28.AbsoluteSize.Y);
    end, {});
    local v30, v31 = v4.useState(0);
    local v33 = v4.useCallback(function(v32)
        v31(v32.AbsolutePosition.Y);
    end, {});
    local v34 = v4.useContext(v6.Context);
    local v35 = if v34.canUploadBundles ~= nil and v34.canUploadBundles.type == "notAllowed" then v34.canUploadBundles.denyReason else nil;
    local l_createElement_0 = v4.createElement;
    local l_l_StyledDialog_0_0 = l_StyledDialog_0;
    local v38 = {
        Style = "Alert", 
        Title = v24:getText("UGCValidation", "AlertTitle"), 
        MinContentSize = v25.AlertMinContentSize, 
        Resizable = true, 
        Buttons = {
            {
                Key = "ok", 
                Text = "OK"
            }
        }, 
        OnButtonPressed = v22.OnClose, 
        OnClose = v22.OnClose
    };
    local v39 = {};
    local l_createElement_1 = v4.createElement;
    local l_l_Pane_0_0 = l_Pane_0;
    local v42 = {
        Layout = Enum.FillDirection.Horizontal, 
        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
        VerticalAlignment = Enum.VerticalAlignment.Top
    };
    local v43 = {
        LeftColumn = v4.createElement(l_Pane_0, {
            Size = UDim2.fromOffset(v25.TextSize + v25.IconTextSpacing, v25.TextSize), 
            LayoutOrder = v23:getNextOrder()
        }, {
            Image = v4.createElement(l_Image_0, {
                Image = v25.WarningImage, 
                ImageColor3 = v25.WarningColor, 
                Size = UDim2.fromOffset(v25.TextSize, v25.TextSize)
            })
        })
    };
    local l_createElement_2 = v4.createElement;
    local l_l_Pane_0_1 = l_Pane_0;
    local v46 = {
        Size = UDim2.new(1, -v25.TextSize, 1, 0), 
        LayoutOrder = v23:getNextOrder(), 
        Layout = Enum.FillDirection.Vertical, 
        Spacing = v25.TitleDetailsSpacing, 
        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
        VerticalAlignment = Enum.VerticalAlignment.Top, 
        [v4.Change.AbsoluteSize] = v29
    };
    local v47 = {
        WarningLabel = v4.createElement(l_TextLabel_0, {
            AutomaticSize = Enum.AutomaticSize.Y, 
            Font = v25.WarningFont, 
            Size = UDim2.fromScale(1, 0), 
            Text = v9(v24, "UGCValidation", "WarningLongTitle", #v22.Errors + (v35 == nil and 0 or 1)), 
            TextColor = v25.WarningColor, 
            TextSize = v25.TextSize, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextWrapped = true
        })
    };
    local l_createElement_3 = v4.createElement;
    local l_l_ScrollingFrame_0_0 = l_ScrollingFrame_0;
    local v50 = {
        AutomaticCanvasSize = Enum.AutomaticSize.Y, 
        Size = UDim2.new(1, 0, 0, v26 - v30), 
        Layout = Enum.FillDirection.Vertical, 
        Spacing = UDim.new(0, v25.DetailsSpacing), 
        [v4.Change.AbsolutePosition] = v33
    };
    local v51 = {};
    local v52 = v35 and v4.createElement(v4.Fragment, {}, {
        Header = v4.createElement(l_TextLabel_0, {
            Text = v24:getText("UGCValidation", "PermissionsRequiredHeader"), 
            Style = "Bold", 
            AutomaticSize = Enum.AutomaticSize.Y, 
            Size = UDim2.fromScale(1, 0), 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextSize = v25.TextSize, 
            TextWrapped = true, 
            LayoutOrder = v23:getNextOrder()
        }), 
        ErrorText = v4.createElement(l_TextWithLinks_0, {
            LayoutOrder = v23:getNextOrder(), 
            Text = if v35 == "MissingIdVerification" then v24:getText("UGCValidation", "UploadBundleDenied_MissingIdVerification_Text") else if v35 == "MissingPremiumSubscriptionTier" then v24:getText("UGCValidation", "UploadBundleDenied_MissingPremiumSubscriptionTier_Text") else v24:getText("UGCValidation", "UploadBundleDenied_UnknownError", {
                errorCode = v35
            }), 
            TextProps = {
                Font = Enum.Font.SourceSans, 
                TextSize = v25.TextSize, 
                TextXAlignment = Enum.TextXAlignment.Left
            }, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            LinkMap = {
                ["[Age_Verified]"] = {
                    LinkText = v24:getText("UGCValidation", "UploadBundleDenied_MissingIdVerification_Link"), 
                    LinkCallback = function()
                        l_BrowserService_0:OpenBrowserWindow(v10);
                    end
                }, 
                ["[Premium_1000_Or_2200_Subscription]"] = {
                    LinkText = v24:getText("UGCValidation", "UploadBundleDenied_MissingPremiumSubscriptionTier_Link"), 
                    LinkCallback = function()
                        l_BrowserService_0:OpenBrowserWindow(v11);
                    end
                }
            }
        })
    });
    local v53 = false;
    if #v22.Errors > 0 then
        v53 = v4.createElement(v4.Fragment, {}, {
            Header = v4.createElement(l_TextLabel_0, {
                Text = v24:getText("UGCValidation", "ValidationErrorsHeader"), 
                Style = "Bold", 
                AutomaticSize = Enum.AutomaticSize.Y, 
                Size = UDim2.fromScale(1, 0), 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextSize = v25.TextSize, 
                TextWrapped = true, 
                LayoutOrder = v23:getNextOrder()
            })
        }, v2.map(v22.Errors, function(v54, v55)
            return v4.createElement(l_TextLabel_0, {
                key = ("Error%*"):format(v55), 
                AutomaticSize = Enum.AutomaticSize.Y, 
                Size = UDim2.fromScale(1, 0), 
                Text = if v54.error.type == "message" then v54.error.message else if v54.error.type == "notFound" then v24:getText("UGCValidation", "AssetNotFound", {
                    asset = v24:getText("AssetType", assert(v54.assetType, "notFound sent with no error type").Name)
                }) else v8(v54.error.type), 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextSize = v25.TextSize, 
                TextWrapped = true, 
                LayoutOrder = v23:getNextOrder()
            });
        end));
    end;
    setlist { ['R027[1 to 2]'] = 'R028 to R029' };
    v47.Warnings = l_createElement_3(l_l_ScrollingFrame_0_0, v50, v51);
    v43.RightColumn = l_createElement_2(l_l_Pane_0_1, v46, v47);
    v39.Contents = l_createElement_1(l_l_Pane_0_0, v42, v43);
    return l_createElement_0(l_l_StyledDialog_0_0, v38, v39);
end;
