local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local v2 = require(l_script_FirstAncestor_0.Packages.React);
local v3 = require(script.Survey);
local _ = require(l_script_FirstAncestor_0.Src.Resources.Theme);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local l_UI_0 = v1.UI;
local l_StyledDialog_0 = l_UI_0.StyledDialog;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_Localization_0 = v1.ContextServices.Localization;
local l_Stylizer_0 = v1.ContextServices.Stylizer;
local l_StyleModifier_0 = v1.Util.StyleModifier;
return function(v12)
    local v13 = l_Localization_0:use();
    local v14 = l_Stylizer_0:use("SurveyDialog");
    local v15, v16 = v2.useState({
        rating = nil, 
        message = "", 
        problems = {}
    });
    local v17, v18 = v2.useState(100);
    local v19, v20 = v2.useState(false);
    if not v19 then
        return v2.createElement(l_StyledDialog_0, {
            key = "Survey", 
            Enabled = true, 
            Modal = true, 
            Title = v13:getText("Survey", "Title"), 
            MinContentSize = Vector2.new(v14.Width, v17), 
            Buttons = {
                {
                    Key = "send", 
                    Text = v13:getText("SurveyDialog", "SendFeedback"), 
                    Style = "RoundPrimary", 
                    StyleModifier = if v15.rating == nil then l_StyleModifier_0.Disabled else nil
                }
            }, 
            OnButtonPressed = function()
                v12.submitResults(v15);
                v20(true);
            end, 
            OnClose = v12.close
        }, v2.createElement(v3, {
            results = v15, 
            setResults = v16, 
            setHeight = v18
        }));
    else
        return v2.createElement(l_StyledDialog_0, {
            key = "Finish", 
            Enabled = true, 
            Modal = true, 
            Title = v13:getText("Survey", "Title"), 
            MinContentSize = v14.FinishDialogSize, 
            Buttons = {
                {
                    Key = "close", 
                    Text = v13:getText("SurveyDialog", "Close")
                }
            }, 
            OnButtonPressed = v12.close, 
            OnClose = v12.close
        }, {
            Label = v2.createElement(l_TextLabel_0, {
                Text = v13:getText("SurveyDialog", "FinishAlert")
            })
        });
    end;
end;
