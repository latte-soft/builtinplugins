local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v2.ContextServices;
local l_Promise_0 = v2.Util.Promise;
local v5 = require(l_Parent_0.Src.Resources.PluginTheme);
local _ = Vector2.new(300, 370);
return function(v7, v8, _, v10)
    return function(v11, v12, v13)
        return l_Promise_0.new(function(v14, _)
            spawn(function()
                local v16 = nil;
                local l_v7_QWidgetPluginGui_0 = v7:CreateQWidgetPluginGui(v11, {
                    Size = v12, 
                    Modal = true
                });
                l_v7_QWidgetPluginGui_0.Enabled = true;
                l_v7_QWidgetPluginGui_0.Title = v11;
                local function v18()
                    v1.unmount(v16);
                    l_v7_QWidgetPluginGui_0:Destroy();
                    v14(true);
                end;
                local function v19()
                    v1.unmount(v16);
                    l_v7_QWidgetPluginGui_0:Destroy();
                    v14(false);
                end;
                l_v7_QWidgetPluginGui_0:GetPropertyChangedSignal("Enabled"):connect(function()
                    v1.unmount(v16);
                    l_v7_QWidgetPluginGui_0:Destroy();
                    v14(false);
                end);
                v16 = v1.mount(l_ContextServices_0.provide({
                    v8, 
                    v5(), 
                    v10
                }, {
                    Content = v13(v18, v19)
                }), l_v7_QWidgetPluginGui_0);
            end);
        end);
    end;
end;
