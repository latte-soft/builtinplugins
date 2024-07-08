local l_Selection_0 = game:GetService("Selection");
local l_PublishService_0 = game:GetService("PublishService");
return function(v2)
    local v3 = l_Selection_0:Get();
    if v3 then
        for _, v5 in ipairs(v3) do
            l_PublishService_0:PublishDescendantAssets(v5);
            l_Selection_0:Set({
                v5
            });
            v2:PromptSaveSelection(v5.Name);
        end;
        return ;
    else
        return ;
    end;
end;
