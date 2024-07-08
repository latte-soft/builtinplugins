local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local v2 = require(l_script_FirstAncestor_0.Packages.React);
local _ = require(l_script_FirstAncestor_0.Src.Resources.Theme);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v5 = require(l_script_FirstAncestor_0.Src.Components.StudioAssetServiceContext);
local v6 = require(script.SubmitInner);
local v7 = require(script.useAvailableSubmitChoices);
local l_StyledDialog_0 = v1.UI.StyledDialog;
local l_Localization_0 = v1.ContextServices.Localization;
local l_Stylizer_0 = v1.ContextServices.Stylizer;
local l_StyleModifier_0 = v1.Util.StyleModifier;
return function(v12)
    local v13 = l_Localization_0:use();
    local v14 = l_Stylizer_0:use("SubmitDialog");
    local v15 = v7(v12.avatar);
    local v16, v17 = v2.useState(v15);
    local v18 = v2.useContext(v5);
    v2.useEffect(function()
        v17(v15);
        if #v15 == 1 then
            task.spawn(function()
                local v19 = v15[1];
                v18.showSaveToRoblox({
                    v19.instance
                }, v19.assetType);
            end);
            v12.close();
        end;
    end, {
        v15
    });
    local v20, v21 = v2.useState(0);
    assert(#v15 > 0, "No available publish choices");
    if #v15 == 1 then
        return nil;
    else
        return v2.createElement(l_StyledDialog_0, {
            key = "SubmitDialog", 
            Enabled = true, 
            Modal = true, 
            Title = v13:getText("SubmitDialog", "Title"), 
            MinContentSize = Vector2.new(v14.Width, v20), 
            Buttons = {
                {
                    Key = "cancel", 
                    Text = v13:getText("SubmitDialog", "Cancel")
                }, 
                {
                    Key = "ok", 
                    Text = v13:getText("SubmitDialog", "OK"), 
                    Style = "RoundPrimary", 
                    StyleModifier = if next(v16) == nil then l_StyleModifier_0.Disabled else nil
                }
            }, 
            OnButtonPressed = function(v22)
                v12.close();
                if v22 == "cancel" then
                    return ;
                else
                    task.spawn(function()
                        for v23, v24 in v16, nil, nil do
                            v18.showSaveToRoblox({
                                v24.instance
                            }, v24.assetType, v23 ~= #v16);
                            if v18.onUGCSubmitCompleted:Wait() then
                                break;
                            end;
                        end;
                    end);
                    return ;
                end;
            end, 
            OnClose = v12.close
        }, v2.createElement(v6, {
            avatar = v12.avatar, 
            setHeight = v21, 
            availableChoices = v15, 
            publishChoices = v16, 
            setPublishChoices = v17
        }));
    end;
end;
