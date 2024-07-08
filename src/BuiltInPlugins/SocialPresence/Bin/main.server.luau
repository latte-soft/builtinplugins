require(script.Parent.defineLuaFlags);
if plugin then
    local l_Parent_0 = script.Parent.Parent;
    local v1 = require(l_Parent_0.Packages.TestLoader);
    v1.launch("SocialPresence", l_Parent_0.Src);
    if not v1.isCli() then
        if game:GetFastFlag("EnableSocialPresence") then
            if game:GetFastFlag("SocialPresenceIxpExperimentation") then
                local l_IXPService_0 = game:GetService("IXPService");
                if l_IXPService_0:GetUserStatusForLayer("Studio.Collaboration.SocialPresence") == Enum.IXPLoadingStatus.Initialized then
                    l_IXPService_0:LogUserLayerExposure("Studio.Collaboration.SocialPresence");
                    if not l_IXPService_0:GetUserLayerVariables("Studio.Collaboration.SocialPresence").enabled then
                        return ;
                    end;
                else
                    return ;
                end;
            end;
            local v3 = require(l_Parent_0.Packages.React);
            local v4 = require(l_Parent_0.Packages.ReactRoblox);
            local v5 = require(l_Parent_0.Src.MainPlugin);
            local v6 = require(l_Parent_0.Src.RibbonPlugin);
            local v7 = nil;
            local v8 = nil;
            local function v13()
                plugin.Name = l_Parent_0.Name;
                local l_BindableEvent_0 = Instance.new("BindableEvent");
                local v10 = v3.createElement(v5, {
                    Plugin = plugin, 
                    EnableSignal = l_BindableEvent_0
                });
                v7 = v4.createRoot(Instance.new("Frame"));
                v7:render(v10);
                local l_plugin_QWidgetPluginGui_0 = plugin:CreateQWidgetPluginGui("RibbonWidget", {
                    Id = "RibbonWidget", 
                    InitialEnabled = true, 
                    MinSize = Vector2.new(27, 15), 
                    Panel = true, 
                    Resizable = true, 
                    Title = "RibbonWidget", 
                    Parent = "socialPresenceRibbonPlaceholder", 
                    AddToParentLayout = true
                });
                local v12 = v3.createElement(v6, {
                    Plugin = plugin, 
                    Widget = l_plugin_QWidgetPluginGui_0, 
                    OnClick = function()
                        l_BindableEvent_0:Fire();
                    end
                });
                v8 = v4.createRoot(l_plugin_QWidgetPluginGui_0);
                v8:render(v12);
            end;
            plugin.Unloading:Connect(function()
                if v7 then
                    v7:render(nil);
                    v7 = nil;
                end;
                if v8 then
                    v8:render(nil);
                    v8 = nil;
                end;
            end);
            v13();
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
