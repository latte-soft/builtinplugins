local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Roact);
local l_ContextServices_0 = require(l_script_FirstAncestor_0.Packages.Framework).ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v4 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local v5 = require(l_script_FirstAncestor_0.Src.Components.EditEventsDialog.FocusedPrompt);
local v6 = v1.PureComponent:extend("PromoteToCurvesPrompt");
v6.init = function(v7)
    v7.onPromote = function()
        if v7.props.OnPromote then
            v7.props.OnPromote();
        end;
    end;
    v7.onClose = function()
        if v7.props.OnClose then
            v7.props.OnClose();
        end;
    end;
end;
v6.render = function(v8)
    local l_Localization_0 = v8.props.Localization;
    return v1.createElement(v5, {
        PromptText = l_Localization_0:getText("Dialog", "PromotePrompt1"), 
        Size = UDim2.new(0, v4.PROMPT_SIZE.Width.Offset, 0, 180), 
        Buttons = {
            {
                Key = false, 
                Text = l_Localization_0:getText("Dialog", "Cancel"), 
                Style = "Round"
            }, 
            {
                Key = true, 
                Text = l_Localization_0:getText("Dialog", "Confirm"), 
                Style = "RoundPrimary"
            }
        }, 
        OnButtonClicked = function(v10)
            v8.onClose();
            if v10 then
                v8.onPromote();
            end;
        end, 
        OnClose = v8.onClose
    });
end;
return (l_withContext_0({
    Localization = l_ContextServices_0.Localization
})(v6));
