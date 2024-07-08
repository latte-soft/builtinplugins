local l_RunService_0 = game:GetService("RunService");
local l_Parent_0 = script.Parent.Parent;
local l_DraggerFramework_0 = l_Parent_0.Packages.DraggerFramework;
local v3 = require(l_Parent_0.Packages.Roact);
local v4 = require(l_Parent_0.Packages.DraggerSchemaCore.DraggerSchema);
local v5 = require(l_DraggerFramework_0.Implementation.DraggerContext_PluginImpl);
local v6 = require(l_DraggerFramework_0.DraggerTools.DraggerToolComponent);
if not require(l_DraggerFramework_0.Utility.isCli)() then
    local v7 = nil;
    local v8 = false;
    local v9 = nil;
    local v10 = nil;
    local function v12(v11)
        if not v9 then
            v8 = true;
            plugin:Activate(true);
            v10:SetActive(true);
            v9 = v3.mount(v3.createElement(v6, {
                Mouse = plugin:GetMouse(), 
                DraggerContext = v7, 
                DraggerSchema = v4, 
                DraggerSettings = {
                    AnalyticsName = "Select", 
                    AllowDragSelect = true, 
                    AllowFreeformDrag = true
                }, 
                WasAutoSelected = v11
            }));
            return ;
        else
            warn("Plugin handle already exists");
            return ;
        end;
    end;
    local function _()
        v8 = false;
        v10:SetActive(false);
        if v9 then
            v3.unmount(v9);
            v9 = nil;
        end;
    end;
    (function()
        plugin.Name = "SelectDragger";
        v10 = plugin:CreateToolbar("Home"):CreateButton("Select", "Select an Object", "", "Select");
        v7 = v5.new(plugin, game, settings(), v4.Selection.new());
        plugin.Deactivation:connect(function()
            if v8 then
                v8 = false;
                v10:SetActive(false);
                if v9 then
                    v3.unmount(v9);
                    v9 = nil;
                end;
            end;
        end);
        v10.Click:Connect(function()
            if not v8 then
                v12(false);
            else
                v8 = false;
                v10:SetActive(false);
                if v9 then
                    v3.unmount(v9);
                    v9 = nil;
                    return ;
                end;
            end;
        end);
    end)();
    if not (l_RunService_0:IsRunning() and not l_RunService_0:IsRunMode()) then
        v12(true);
    end;
    return ;
else
    return ;
end;
