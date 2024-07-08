local l_script_FirstAncestor_0 = script:FindFirstAncestor("StreamingServiceDispatcherRegistry");
local v1 = require(l_script_FirstAncestor_0.Src.Utils.CliAdapter);
local v2 = v1.GetService("StreamingService");
local v3 = v1.GetService("ChatbotUIService");
local v4 = v1.GetService("ConversationalAIAcceptanceService");
local v5 = v1.GetService("ChangeHistoryService");
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v7 = require(l_script_FirstAncestor_0.Src.Localization.Localization);
local v8 = require(l_script_FirstAncestor_0.Src.Commands.BuilderCommands.BuilderNameMap);
local v9 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagConvAICodeRunner);
local v10 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagConvAICodeRunnerTelemetry);
local v11 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagConvAICodeRunnerUndoTelemetry);
local v12 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagConvAICodeRunnerUX);
local v13 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagConvAISettingAutoRunCode);
local v14 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagConvAICodeRunnerUseThemeColors);
local v15 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagConvAICodeRunnerBetterResultMessages);
local v16 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagConvAICodeRunnerUniqueRecordings);
local v17 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagConvAICodeRunnerLocalAutorunWarning);
local v18 = require(l_script_FirstAncestor_0.Src.Flags.getFStringConvAICodeRunnerAutorunDisabledWarning);
local v19 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagConvAIStreamableCommands);
local v20 = {};
local v21 = 1;
local v22 = {};
local function _(v23)
    assert(v16(), "Local recordings are not available - CodeRunner Unique Recordings");
    return {
        requestId = v23, 
        hasBeenUndone = false, 
        hasBeenRedone = false
    };
end;
local function v25(v26, v27, v28, v29)
    assert(v15(), "Feature is not turned on - RunCode Better Result Messages");
    v3:DisplayContent("TransformContent", {
        requestId = v26, 
        transformFunction = function(v30)
            for v31, v32 in v30, nil, nil do
                if string.find(v32, v27) then
                    v30[v31] = v28;
                end;
            end;
            return v30;
        end, 
        completeCallback = function(v33)
            if not v33 then
                task.defer(function()
                    local v34 = (v29 or 0) + 1;
                    if v34 > 10 then
                        warn("[RunCode] updateResultMessage: Exceeded maximum depth");
                        return ;
                    else
                        v25(v26, v27, v28, v34);
                        return ;
                    end;
                end);
                return ;
            else
                return ;
            end;
        end
    });
end;
local function v57(v35)
    assert(v9(), "Feature is not turned on - RunCode command");
    local l_arguments_0 = v35.arguments;
    local l_code_0 = l_arguments_0.code;
    if not (not if not v19() then l_arguments_0.localStreamId else l_arguments_0.isLocalCommand or not l_code_0) then
        local v38 = if not v19() then l_arguments_0.localStreamId else l_arguments_0.syncStreamId;
        assert(v38, "Local command must have a streamId");
        local v39 = (v22[v38] or 0) + 1;
        v22[v38] = v39;
        l_arguments_0.runCodeGuid = v38 .. "_" .. v39;
        v3:DisplayContent("AddTextDropdown", {
            requestId = v35.requestId, 
            streamId = v38, 
            content = ("```lua\n%s\n```"):format(l_code_0), 
            closedTitle = v7:getText("RunCode", "CodeDropdownClosedTitle"), 
            openedTitle = v7:getText("RunCode", "CodeDropdownOpenedTitle")
        });
    end;
    local l_v3_Settings_0 = v3:GetSettings();
    if not l_arguments_0.isManualRun then
        local l_status_0, l_result_0 = pcall(function()
            return v2:BindCodeToGuid(l_arguments_0.runCodeGuid, l_code_0);
        end);
        if not l_status_0 then
            warn(l_result_0);
        elseif v10() then
            v4:CodeRunnerActivated(v35.requestId, l_code_0, not l_arguments_0.noAutorun, l_v3_Settings_0.AutoRunCode, l_v3_Settings_0.AutoExpandDropdowns);
        end;
    end;
    local v43 = l_arguments_0.noAutorun or v13() and not l_v3_Settings_0.AutoRunCode;
    if l_arguments_0.isManualRun or not v43 then
        local v44 = nil;
        local v45 = nil;
        local v46 = nil;
        if not v16() then
            v8.StartRecordingActions(v35.requestId);
        else
            if l_arguments_0.isManualRun then
                v44 = ("%* %*"):format("Assistant Code Runner", v21);
            end;
            v21 = v21 + 1;
            local l_requestId_0 = v35.requestId;
            assert(v16(), "Local recordings are not available - CodeRunner Unique Recordings");
            v45 = {
                requestId = l_requestId_0, 
                hasBeenUndone = false, 
                hasBeenRedone = false
            };
            v46 = v8.StartRecordingActions(v35.requestId, v44);
        end;
        local l_status_1, l_result_1 = pcall(function()
            return v2:RunSandboxedCode(l_arguments_0.runCodeGuid, v35.requestId);
        end);
        if v16() then
            local v50 = v8.EndRecordingActions(v35.requestId, v44);
            if not ((not v46 or not v50) or not v44) then
                v20[v44] = v45;
            end;
        end;
        local v51 = not v12() and "StreamText" or "StreamTextInNewMessage";
        local v52 = not v12() and "p" or "span";
        if not l_status_1 then
            local v53 = not v14() and "style = \"color:#ff3838\"" or "class=\"errorText\"";
            if not v15() then
                v3:DisplayContent(v51, {
                    requestId = v35.requestId, 
                    content = ("\n<%* %*>%*</%*>\n"):format(v52, v53, l_result_1, v52)
                });
            else
                l_result_1 = string.gsub(l_result_1, "([<>&])", "\\%1");
                local v54 = ("id='runCodeResult_%*'"):format(l_arguments_0.runCodeGuid);
                v25(v35.requestId, v54, (("\n<%* %* %*>%*</%*>\n"):format(v52, v53, v54, l_result_1, v52)));
            end;
        else
            local v55 = not v14() and "style = \"color:#73ff57\"" or "class=\"successText\"";
            if not v15() then
                v3:DisplayContent(v51, {
                    requestId = v35.requestId, 
                    content = ("\n<%* %*>Code executed successfullyformat(v52, v55, v52)
                });
            else
                local v56 = ("id='runCodeResult_%*'"):format(l_arguments_0.runCodeGuid);
                v25(v35.requestId, v56, (("\n<%* %* %*>Code executed successfullyformat(v52, v55, v56, v52)));
            end;
        end;
        if v10() then
            v4:CodeRunnerCompleted(v35.requestId, l_status_1, l_result_1 or "");
        end;
        if not v16() then
            v8.EndRecordingActions(v35.requestId);
        end;
        return ;
    else
        if not (((not v17() or l_arguments_0.noAutorun) or not v13()) or v3:GetSettings().AutoRunCode) then
            v3:DisplayContent("StreamText", {
                requestId = v35.requestId, 
                content = ("<span class=\"warningText\">%*</span>"):format((v18()))
            });
        end;
        return ;
    end;
end;
if not (not v11() or not v16()) then
    v5.OnUndo:Connect(function(v58)
        local v59 = v20[v58];
        if not (not v59 or v59.hasBeenUndone) then
            v59.hasBeenUndone = true;
            task.delay(5, function()
                if not v59.hasBeenRedone then
                    v4:CodeRunnerUndone(v59.requestId);
                    return ;
                else
                    return ;
                end;
            end);
        end;
    end);
    v5.OnRedo:Connect(function(v60)
        local v61 = v20[v60];
        if not (not v61 or v61.hasBeenRedone) then
            v61.hasBeenRedone = true;
        end;
    end);
end;
return v57;
