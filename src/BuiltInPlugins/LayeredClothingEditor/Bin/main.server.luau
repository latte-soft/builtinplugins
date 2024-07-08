local l_RunService_0 = game:GetService("RunService");
local l_StudioService_0 = game:GetService("StudioService");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
require(script.Parent.defineLuaFlags);
local l_Parent_0 = script.Parent.Parent;
local v4 = require(l_Parent_0.Src.Components.InExperiencePreviewer.InExperiencePreviewerClient);
local v5 = require(l_Parent_0.Src.Components.InExperiencePreviewer.InExperiencePreviewerServer);
local v6 = require(l_Parent_0.Packages.Roact);
local v7 = require(l_Parent_0.Src.Util.DebugFlags);
if require(l_Parent_0.Src.Flags.GetAccessoryToolEngineFeature)() then
    local v8 = v7.RunTests() or v7.RunRhodiumTests();
    v6.setGlobalConfig({});
    if not v8 then
        local v9 = require(l_Parent_0.Src.Components.LayeredClothingEditorPlugin);
        local v10 = nil;
        local function _()
            local l_LayeredClothingEditorPreview_0 = l_ReplicatedStorage_0:FindFirstChild("LayeredClothingEditorPreview");
            if l_LayeredClothingEditorPreview_0 then
                local l_l_LayeredClothingEditorPreview_0_FirstChild_0 = l_LayeredClothingEditorPreview_0:FindFirstChild((tostring(l_StudioService_0:GetUserId())));
                if l_l_LayeredClothingEditorPreview_0_FirstChild_0 then
                    l_l_LayeredClothingEditorPreview_0_FirstChild_0:Destroy();
                end;
                return ;
            else
                return ;
            end;
        end;
        local function v16()
            if not l_RunService_0:IsRunning() then
                if l_RunService_0:IsEdit() then
                    local l_LayeredClothingEditorPreview_1 = l_ReplicatedStorage_0:FindFirstChild("LayeredClothingEditorPreview");
                    if l_LayeredClothingEditorPreview_1 then
                        local l_l_LayeredClothingEditorPreview_1_FirstChild_0 = l_LayeredClothingEditorPreview_1:FindFirstChild((tostring(l_StudioService_0:GetUserId())));
                        if l_l_LayeredClothingEditorPreview_1_FirstChild_0 then
                            l_l_LayeredClothingEditorPreview_1_FirstChild_0:Destroy();
                        end;
                    end;
                end;
                v10 = v6.mount((v6.createElement(v9, {
                    plugin = plugin
                })));
                return ;
            elseif not l_RunService_0:IsClient() then
                v5:init();
                return ;
            else
                v4:init();
                return ;
            end;
        end;
        plugin.Unloading:Connect(function()
            if not l_RunService_0:IsRunning() then
                if v10 then
                    v6.unmount(v10);
                end;
                return ;
            elseif not l_RunService_0:IsClient() then
                v5:shutdown();
                return ;
            else
                v4:shutdown();
                return ;
            end;
        end);
        v16();
        return ;
    else
        return ;
    end;
else
    return ;
end;
