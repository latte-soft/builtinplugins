if plugin then
    local l_Parent_0 = script.Parent.Parent.Parent;
    require(script.Parent.Parent.Common.defineLuaFlags);
    local v1 = require(l_Parent_0.Packages.TestLoader);
    v1.launch("Tutorials", l_Parent_0.Src);
    if not v1.isCli() then
        if game:GetFastFlag("EnableStudioTutorials") then
            local l_TutorialService_0 = game:GetService("TutorialService");
            if l_TutorialService_0:ShouldLaunchTutorial() then
                local l_RunService_0 = game:GetService("RunService");
                local v4 = nil;
                local v5 = require(l_Parent_0.Packages.React);
                local v6 = require(l_Parent_0.Packages.ReactRoblox);
                local v7 = require(l_Parent_0.Src.Util.setupPlay);
                local l_StudioSpotlight_0 = game:GetFastFlag("StudioSpotlight");
                local v9 = require(l_Parent_0.Src.Components.AssetRoot);
                (function()
                    plugin.Name = l_Parent_0.Name;
                    if (not (l_TutorialService_0:GetTutorialIDToLaunch() == "StudioTour") or not l_RunService_0:IsRunning()) or not plugin.HostDataModelTypeIsCurrent then
                        if not l_RunService_0:IsRunning() or not plugin.HostDataModelTypeIsCurrent then
                            if l_RunService_0:IsEdit() then
                                local v10 = v5.createElement(v9, {
                                    Plugin = plugin
                                });
                                v4 = v6.createRoot(Instance.new("Frame"));
                                v4:render(v10);
                            end;
                            return ;
                        else
                            v4 = v7(plugin);
                            return ;
                        end;
                    else
                        return ;
                    end;
                end)();
                plugin.Unloading:Connect(function()
                    if v4 then
                        v4:render(nil);
                        v4 = nil;
                    end;
                    if l_StudioSpotlight_0 then
                        game:GetService("StudioWidgetsService"):HideSpotlight();
                    end;
                end);
                return ;
            else
                return ;
            end;
        else
            return ;
        end;
    else
        return ;
    end;
else
    return ;
end;
