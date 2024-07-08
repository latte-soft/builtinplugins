local l_Parent_0 = script.Parent.Parent;
if not require(l_Parent_0.Src.Util.DebugFlags).RunningUnderCLI() then
    local l_MultipleDocumentInterfaceInstance_0 = plugin.MultipleDocumentInterfaceInstance;
    local v2 = require(script.Parent.Parent.Common.commonInit);
    local l_status_0, l_result_0 = pcall(function()
        return game:GetService("StudioService"):HasInternalPermission();
    end);
    if not l_status_0 then
        l_result_0 = false;
    end;
    local v5 = nil;
    local function _()
        if plugin.HostDataModelTypeIsCurrent then
            if l_result_0 then
                v5 = require(l_Parent_0.Packages.Framework).DeveloperTools.forPlugin(l_Parent_0.Name, plugin);
                v5:addPluginRouter(plugin);
            end;
            return ;
        else
            return ;
        end;
    end;
    (function()
        v2();
        local l_FocusedDataModelSession_0 = l_MultipleDocumentInterfaceInstance_0.FocusedDataModelSession;
        l_FocusedDataModelSession_0.CurrentDataModelTypeAboutToChange:Connect(function()
            if v5 then
                v5:destroy();
                v5 = nil;
            end;
        end);
        l_FocusedDataModelSession_0.CurrentDataModelTypeChanged:Connect(function()
            if plugin.HostDataModelTypeIsCurrent then
                if l_result_0 then
                    v5 = require(l_Parent_0.Packages.Framework).DeveloperTools.forPlugin(l_Parent_0.Name, plugin);
                    v5:addPluginRouter(plugin);
                end;
                return ;
            else
                return ;
            end;
        end);
        if plugin.HostDataModelTypeIsCurrent then
            if l_result_0 then
                v5 = require(l_Parent_0.Packages.Framework).DeveloperTools.forPlugin(l_Parent_0.Name, plugin);
                v5:addPluginRouter(plugin);
            end;
            return ;
        else
            return ;
        end;
    end)();
    return ;
else
    return ;
end;
