local l_status_0, l_result_0 = pcall(function()
    return game:GetService("RbxAnalyticsService");
end);
return {
    reportEvent = function(_, v3)
        if l_status_0 and l_result_0 then
            l_result_0:TrackEvent("Studio", "UIEditorAction", v3);
            return ;
        else
            return ;
        end;
    end
};
