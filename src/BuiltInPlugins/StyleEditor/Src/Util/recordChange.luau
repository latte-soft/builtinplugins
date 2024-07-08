return function(v0)
    return function(v1)
        assert(v0 ~= nil, "Expecting a valid ChangeHistoryService service");
        if not (not v1 or not v1.Name) and v1.DoChange then
            local v2 = v0:TryBeginRecording(v1.DisplayName or v1.Name, v1.DisplayName);
            local l_status_0, l_result_0 = pcall(function()
                return v1.DoChange() or Enum.FinishRecordingOperation.Cancel;
            end);
            if v2 then
                v0:FinishRecording(v2, if not l_status_0 then Enum.FinishRecordingOperation.Cancel else l_result_0);
            end;
            if not l_status_0 then
                error(l_result_0);
            end;
            return ;
        else
            return ;
        end;
    end;
end;
