local l_BulkImportService_0 = game:GetService("BulkImportService");
return function(v1)
    return function(_)
        local l_status_0, l_result_0 = pcall(function()
            l_BulkImportService_0:LaunchBulkImport(v1);
        end);
        if not l_status_0 then
            warn(l_result_0);
        end;
    end;
end;
