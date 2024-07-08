return function()
    local l_status_0, l_result_0 = pcall(function()
        return settings().Studio.Theme.Name;
    end);
    if not l_status_0 or not l_result_0 then
        return "Dark";
    else
        return l_result_0;
    end;
end;
