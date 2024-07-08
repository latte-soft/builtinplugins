return function(v0, v1)
    require(script.Parent.defineLuaFlags);
    local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
    local v3 = require(l_script_FirstAncestor_0.Packages.Dev.DeveloperTools);
    local v4 = require(l_script_FirstAncestor_0.Src.Util.DebugFlags);
    local v5 = require(l_script_FirstAncestor_0.Packages.Roact);
    local v6 = require(l_script_FirstAncestor_0.Src.Components.AnimationClipEditorPlugin);
    if not v4.RunTests() and not v4.RunRhodiumTests() then
        local v7 = nil;
        local v8 = nil;
        local function v11()
            v8 = v5.mount((v5.createElement(v6, {
                plugin = v0, 
                pluginLoaderContext = v1
            })));
            local l_status_0, l_result_0 = pcall(function()
                return game:GetService("StudioService"):HasInternalPermission();
            end);
            if not (not l_status_0 or not l_result_0) then
                v7 = v3.forPlugin("AnimationClipEditor", v0);
                v7:addRoactTree("Roact tree", v8, v5);
            end;
        end;
        v0.Unloading:Connect(function()
            if v8 then
                v5.unmount(v8);
            end;
            if v7 then
                v7:destroy();
            end;
        end);
        v11();
        return ;
    else
        return ;
    end;
end;
