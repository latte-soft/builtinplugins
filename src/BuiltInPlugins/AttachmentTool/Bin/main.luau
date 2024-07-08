local l_script_FirstAncestor_0 = script:FindFirstAncestor("AttachmentTool");
local v1 = require(l_script_FirstAncestor_0.Packages.DraggerFramework.Flags.getFFlagDraggerImprovements);
return function(v2, v3)
    local v4 = require(l_script_FirstAncestor_0.Packages.Roact);
    local l_DraggerFramework_0 = l_script_FirstAncestor_0.Packages.DraggerFramework;
    local v6 = require(l_script_FirstAncestor_0.Packages.DraggerSchemaCore.DraggerSchema);
    local v7 = require(l_DraggerFramework_0.Implementation.DraggerContext_PluginImpl);
    local v8 = require(l_script_FirstAncestor_0.Src.Components.AttachmentToolComponent);
    local v9 = nil;
    local v10 = false;
    local v11 = nil;
    local function v12()
        v10 = false;
        v3.mainButton:SetActive(false);
        if v11 then
            v4.unmount(v11);
            v11 = nil;
        end;
    end;
    local function v13()
        if not v11 then
            v10 = true;
            v2:Activate(true);
            v3.mainButton:SetActive(true);
            v11 = v4.mount(v4.createElement(v8, {
                Mouse = v2:GetMouse(), 
                ClosePluginCallback = v12, 
                DraggerContext = v9, 
                DraggerSchema = v6, 
                DraggerSettings = {
                    AnalyticsName = "AttachmentTool", 
                    AllowDragSelect = true, 
                    ShowLocalSpaceIndicator = true, 
                    ShowPivotIndicator = true
                }
            }));
            return ;
        else
            warn("Plugin handle already exists");
            return ;
        end;
    end;
    (function()
        v9 = v7.new(v2, game, settings(), v6.Selection.new());
        v2.Deactivation:Connect(function()
            if v10 then
                v10 = false;
                v3.mainButton:SetActive(false);
                if v11 then
                    v4.unmount(v11);
                    v11 = nil;
                end;
            end;
        end);
        v3.mainButtonClickedSignal:Connect(function()
            if not v10 then
                if v1() then
                    v13();
                end;
            else
                v10 = false;
                v3.mainButton:SetActive(false);
                if v11 then
                    v4.unmount(v11);
                    v11 = nil;
                    return ;
                end;
            end;
        end);
    end)();
end;
