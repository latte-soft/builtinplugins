local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetAccess");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local v2 = require(l_script_FirstAncestor_0.Packages.React);
local l_DialogAction_0 = v1.Util.DialogAction;
local l_Localization_0 = v1.ContextServices.Localization;
local l_useDialog_0 = v1.UI.Hooks.useDialog;
local v6 = require(l_script_FirstAncestor_0.Src.Components.AssetMetadataTable);
local v7 = require(l_script_FirstAncestor_0.Src.Hooks.useShareDialogModel);
local function _(v8, v9)
    local v10 = table.clone(v8);
    for v11, v12 in v9, nil, nil do
        v10[v11] = v12;
    end;
    return v10;
end;
return function()
    local v14 = l_Localization_0.use();
    local v15, v16, v17 = v7();
    local v18 = {};
    if v15 and (not (v15.state ~= "Prompt" and v15.state ~= "Sharing") or v15.state == "CantShare") then
        v18 = v15.assetModels;
    end;
    local l_l_useDialog_0_0 = l_useDialog_0;
    local v20 = {
        Intent = "Warning", 
        Heading = v14:getText("ShareDialogView", "PromptHeading"), 
        Body = v14:getText("ShareDialogView", "PromptBody"), 
        Contents = v2.createElement(v6, {
            AssetModels = v18
        }), 
        ActionPrimary = if not not v15 and v15.state == "Prompt" then {
            Label = v14:getText("ShareDialogView", "PromptActionShare"), 
            OnActivated = v16, 
            Enabled = next(v18) ~= nil
        } else if not not v15 and v15.state == "Sharing" then {
            Label = v14:getText("ShareDialogView", "PromptActionSharing"), 
            Enabled = false
        } else nil
    };
    local l_CLOSE_0 = l_DialogAction_0.CLOSE;
    local v22 = {
        OnActivated = v17
    };
    local v23 = table.clone(l_CLOSE_0);
    for v24, v25 in v22, nil, nil do
        v23[v24] = v25;
    end;
    v20.ActionSecondary = v23;
    v20.Modal = true;
    v20.Width = 727;
    l_l_useDialog_0_0, v20 = l_l_useDialog_0_0(v20);
    local l_l_useDialog_0_1 = l_useDialog_0;
    l_CLOSE_0 = {
        Intent = "Error", 
        Heading = v14:getText("ShareDialogView", "CantShareHeading"), 
        Body = v14:getText("ShareDialogView", "CantShareBody"), 
        Contents = v2.createElement(v6, {
            AssetModels = v18
        })
    };
    v23 = l_DialogAction_0.OK;
    local v27 = {
        OnActivated = v17
    };
    local v28 = table.clone(v23);
    for v29, v30 in v27, nil, nil do
        v28[v29] = v30;
    end;
    l_CLOSE_0.ActionPrimary = v28;
    l_CLOSE_0.Modal = true;
    l_CLOSE_0.Width = 727;
    l_l_useDialog_0_1, l_CLOSE_0 = l_l_useDialog_0_1(l_CLOSE_0);
    v22 = l_useDialog_0;
    v23 = {
        Intent = "Error", 
        Heading = v14:getText("ShareDialogView", "UnexpectedErrorHeading"), 
        Body = v14:getText("ShareDialogView", "UnexpectedErrorBody")
    };
    v28 = l_DialogAction_0.OK;
    local v31 = {
        OnActivated = v17
    };
    local v32 = table.clone(v28);
    for v33, v34 in v31, nil, nil do
        v32[v33] = v34;
    end;
    v23.ActionPrimary = v32;
    v23.Modal = true;
    v22, v23 = v22(v23);
    v2.useEffect(function()
        if not v15 or v15.state == "Inactive" then
            return ;
        else
            if not (v15.state ~= "Prompt") or v15.state == "Sharing" then
                l_l_useDialog_0_0();
            elseif v15.state == "CantShare" then
                l_l_useDialog_0_1();
            elseif v15.state == "UnexpectedError" then
                v22();
            end;
            return function()
                v20();
                l_CLOSE_0();
                v23();
            end;
        end;
    end, {
        not v15 and "Inactive" or v15.state
    });
    return nil;
end;
