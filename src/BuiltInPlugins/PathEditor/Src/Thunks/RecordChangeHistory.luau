local l_Parent_0 = script.Parent.Parent.Parent;
local l_ChangeHistoryService_0 = game:GetService("ChangeHistoryService");
local v2 = require(l_Parent_0.Src.Actions.SetRecording);
return function(v3)
    return function(v4)
        local l_ChangeHistoryServiceRecording_0 = v4:getState().PathReducer.ChangeHistoryServiceRecording;
        if v3 == nil then
            if l_ChangeHistoryService_0:IsRecordingInProgress() then
                if l_ChangeHistoryServiceRecording_0 ~= nil then
                    l_ChangeHistoryService_0:FinishRecording(l_ChangeHistoryServiceRecording_0, Enum.FinishRecordingOperation.Commit);
                else
                    l_ChangeHistoryService_0:FinishRecording("", Enum.FinishRecordingOperation.Cancel);
                end;
            end;
            v4:dispatch(v2(nil));
            return ;
        else
            if v3 ~= nil and l_ChangeHistoryServiceRecording_0 == nil then
                l_ChangeHistoryServiceRecording_0 = l_ChangeHistoryService_0:TryBeginRecording(v3);
                if l_ChangeHistoryServiceRecording_0 then
                    v4:dispatch(v2(l_ChangeHistoryServiceRecording_0));
                end;
            end;
            return ;
        end;
    end;
end;
