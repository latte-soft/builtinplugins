local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Roact);
local l_ContextServices_0 = require(l_script_FirstAncestor_0.Packages.Framework).ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local _ = require(l_script_FirstAncestor_0.Src.Util.Constants);
local v5 = require(l_script_FirstAncestor_0.Src.Components.TextEntryPrompt);
local v6 = v1.PureComponent:extend("ChangeGridSpeedPrompt");
v6.init = function(v7)
    v7.state = {
        noticeText = v1.None
    };
    v7.setNotice = function(v8)
        v7:setState({
            noticeText = v8
        });
    end;
    v7.onClose = function()
        v7.setNotice(v1.None);
        if v7.props.OnClose then
            v7.props.OnClose();
        end;
    end;
    v7.setGridSpeed = function(v9, _)
        if v9 ~= "" then
            local l_status_0, l_result_0 = pcall(function()
                return (tonumber(v9));
            end);
            if l_status_0 and l_result_0 ~= nil then
                v7.props.SetGridSpeed((math.ceil(l_result_0)));
                return true;
            end;
        end;
    end;
end;
v6.render = function(v13)
    local l_props_0 = v13.props;
    local l_state_0 = v13.state;
    local l_GridSpeed_0 = l_props_0.GridSpeed;
    local l_noticeText_0 = l_state_0.noticeText;
    local v18 = l_noticeText_0 ~= v1.None;
    local l_Localization_0 = v13.props.Localization;
    return v1.createElement(v5, {
        PromptText = " ", 
        InputText = l_Localization_0:getText("Title", "CustomGridSpeed"), 
        NoticeText = not not v18 and l_noticeText_0 or nil, 
        HasError = v18, 
        Text = l_GridSpeed_0, 
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
        OnTextSubmitted = function(v20)
            return v13.setGridSpeed(v20, l_Localization_0);
        end, 
        OnClose = v13.onClose
    });
end;
return (l_withContext_0({
    Localization = l_ContextServices_0.Localization
})(v6));
