local l_script_FirstAncestor_0 = script:FindFirstAncestor("ModerationDialog");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_Localization_0 = v2.ContextServices.Localization;
local l_useDialog_0 = v2.UI.Hooks.useDialog;
local l_LayoutOrderIterator_0 = v2.Util.LayoutOrderIterator;
local l_Components_0 = l_script_FirstAncestor_0.Src.Components;
local v7 = require(l_Components_0.Checkbox);
local v8 = require(l_Components_0.Reason);
local v9 = require(l_Components_0.ReviewedNote);
local v10 = require(l_script_FirstAncestor_0.Src.Util.AbuseTypeToString);
local v11 = game:DefineFastString("ModerationDialogToULink", "https://en.help.roblox.com/hc/articles/115004647846-Roblox-Terms-of-Use");
local function v17(v12, v13, v14)
    local v15 = l_Localization_0:use();
    local v16 = l_LayoutOrderIterator_0.new();
    return {
        DialogContainer = v1.createElement("Frame", {
            LayoutOrder = v16:getNextOrder(), 
            [v1.Tag] = "X-Fill X-Column Component-DialogContainer"
        }, {
            ReviewedNote = v1.createElement(v9, {
                ReviewDateTime = v12.ReviewDateTime, 
                ModeratorNote = v12.ModeratorNote, 
                LayoutOrder = v16:getNextOrder()
            }), 
            Separator1 = v1.createElement("Frame", {
                LayoutOrder = v16:getNextOrder(), 
                [v1.Tag] = "Separator"
            }), 
            Reason = v1.createElement(v8, {
                Reason = v10(v15, v12.Reason.abuseType), 
                OffensiveItem = v12.Reason.utteranceText, 
                LayoutOrder = v16:getNextOrder()
            }), 
            Separator2 = v1.createElement("Frame", {
                LayoutOrder = v16:getNextOrder(), 
                [v1.Tag] = "Separator"
            }), 
            GuidelinesAndToU = v1.createElement("TextLabel", {
                Text = v15:getText("Agreement", "GuidelinesAndToU"), 
                LayoutOrder = v16:getNextOrder(), 
                [v1.Tag] = "X-FitY"
            }), 
            AgreeCheckBox = v1.createElement(v7, {
                LayoutOrder = v16:getNextOrder(), 
                Text = v15:getText("Agreement", "IAgree"), 
                Checked = v13, 
                OnChecked = function()
                    v14(not v13);
                end, 
                [v1.Tag] = "X-FitY"
            })
        })
    };
end;
return function(v18)
    local v19 = l_Localization_0:use();
    local v20, v21 = v1.useState(false);
    v1.useEffect(l_useDialog_0({
        Intent = "Warning", 
        Heading = v19:getText("WarningHeader", "WarningHeader"), 
        Body = v19:getText("WarningHeader", "WarningBody"), 
        Contents = v17(v18, v20, v21), 
        ActionPrimary = v1.useMemo(function()
            return table.freeze({
                Label = v19:getText("Buttons", "Reactivate"), 
                Enabled = v20, 
                OnActivated = function()
                    print("reactivate");
                end
            });
        end, {
            v20, 
            v19.locale
        }), 
        ActionSecondary = v1.useMemo(function()
            return table.freeze({
                Label = v19:getText("Buttons", "LogOut"), 
                OnActivated = function()
                    print("logout");
                end
            });
        end, {
            v19.locale
        }), 
        ActionTertiary = v1.useMemo(function()
            return table.freeze({
                Label = v19:getText("Buttons", "TermsOfUse"), 
                OnActivated = function()
                    game:GetService("StudioService"):OpenInBrowser_DONOTUSE(v11);
                end
            });
        end, {
            v19.locale
        }), 
        Modal = false, 
        Width = 475
    }), {});
    return nil;
end;
