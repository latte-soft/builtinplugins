if plugin then
    local l_Parent_0 = script.Parent.Parent.Parent;
    local v1 = require(script.Parent.Parent.Common.commonInit);
    v1();
    local v2 = require(l_Parent_0.Packages.TestLoader);
    v2.launch("Notifications", l_Parent_0.Src);
    if not v2.isCli() then
        local l_MultipleDocumentInterfaceInstance_0 = plugin.MultipleDocumentInterfaceInstance;
        local v4 = nil;
        local function _()
            if plugin.HostDataModelTypeIsCurrent then
                return ;
            else
                return ;
            end;
        end;
        (function()
            v1();
            local l_FocusedDataModelSession_0 = l_MultipleDocumentInterfaceInstance_0.FocusedDataModelSession;
            l_FocusedDataModelSession_0.CurrentDataModelTypeAboutToChange:Connect(function()
                if v4 then
                    v4:destroy();
                    v4 = nil;
                end;
            end);
            l_FocusedDataModelSession_0.CurrentDataModelTypeChanged:Connect(function()
                if plugin.HostDataModelTypeIsCurrent then
                    return ;
                else
                    return ;
                end;
            end);
            if plugin.HostDataModelTypeIsCurrent then
                return ;
            else
                return ;
            end;
        end)();
        return ;
    else
        return ;
    end;
else
    return ;
end;
