local l_TextureGenerationService_0 = game:GetService("TextureGenerationService");
return function(v1, v2)
    local l_status_0, l_result_0 = pcall(function()
        return l_TextureGenerationService_0:GetQuotasAsync();
    end);
    if not l_status_0 or typeof(l_result_0) ~= "table" then
        warn("Error getting quotas:", l_result_0);
        return ;
    else
        v1.setQuota(l_result_0.generationQuota);
        v1.setTotal(l_result_0.generationTotal);
        v2.setQuota(l_result_0.previewQuota);
        v2.setTotal(l_result_0.previewTotal);
        return ;
    end;
end;
