local l_Players_0 = game:GetService("Players");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v2 = require(l_script_FirstAncestor_0.Packages.React);
local v3 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v5 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagDebugAvatarPreviewerMockAutoSetup);
local v6 = game:DefineFastFlag("AvatarAutosetupUseSurfaceAppearance", false);
local function v10(v7)
    v7(2);
    task.wait(1);
    v7(1);
    task.wait(1);
    local l_l_Players_0_HumanoidModelFromUserId_0 = l_Players_0:CreateHumanoidModelFromUserId(24941);
    while true do
        local l_Accessory_0 = l_l_Players_0_HumanoidModelFromUserId_0:FindFirstChildWhichIsA("Accessory");
        if l_Accessory_0 ~= nil then
            assert(l_Accessory_0 ~= nil, v3.LUAU_ANALYZE_ERROR);
            l_Accessory_0:Destroy();
        else
            break;
        end;
    end;
    return l_l_Players_0_HumanoidModelFromUserId_0;
end;
local function v14(v11, v12)
    local l_SurfaceAppearance_0 = v12:FindFirstChildWhichIsA("SurfaceAppearance");
    if l_SurfaceAppearance_0 == nil then
        v11:Clone().Parent = v12;
        return ;
    else
        if l_SurfaceAppearance_0.ColorMap == "" then
            l_SurfaceAppearance_0.ColorMap = v11.ColorMap;
        end;
        if l_SurfaceAppearance_0.NormalMap == "" then
            l_SurfaceAppearance_0.NormalMap = v11.NormalMap;
        end;
        if l_SurfaceAppearance_0.MetalnessMap == "" then
            l_SurfaceAppearance_0.MetalnessMap = v11.MetalnessMap;
        end;
        if l_SurfaceAppearance_0.RoughnessMap == "" then
            l_SurfaceAppearance_0.RoughnessMap = v11.RoughnessMap;
        end;
        return ;
    end;
end;
local function v19(v15, v16)
    for _, v18 in v16:GetDescendants() do
        if v18:IsA("MeshPart") then
            v14(v15, v18);
        end;
    end;
end;
local v25 = v2.createContext({
    startAutoSetupAsync = function(v20, v21)
        if not v5() then
            local l_StudioAssetService_0 = game:GetService("StudioAssetService");
            if not v6 then
                return l_StudioAssetService_0:RequestAvatarAutosetupAsync(v20.MeshId, v20.TextureID, v21);
            else
                local l_SurfaceAppearance_1 = v20:FindFirstChildWhichIsA("SurfaceAppearance");
                local v24 = l_StudioAssetService_0:RequestAvatarAutosetupAsync(v20.MeshId, if not not l_SurfaceAppearance_1 and l_SurfaceAppearance_1.ColorMap ~= "" then l_SurfaceAppearance_1.ColorMap else v20.TextureID, v21);
                if l_SurfaceAppearance_1 ~= nil then
                    v19(l_SurfaceAppearance_1, v24);
                end;
                return v24;
            end;
        else
            return (v10(v21));
        end;
    end, 
    autoSetupClickedSignal = nil
});
return {
    Context = v25, 
    MockProviders = {
        Success = function(v26)
            return v2.createElement(v25.Provider, {
                value = {
                    startAutoSetupAsync = v2.useCallback(function(_, v28)
                        local v29 = v26.updateEtaSignal and v26.updateEtaSignal:Connect(v28);
                        if v26.signal ~= nil then
                            v26.signal:Wait();
                        end;
                        if v29 ~= nil then
                            v29:Disconnect();
                        end;
                        return v26.result;
                    end, {
                        v26.signal, 
                        v26.result, 
                        v26.updateEtaSignal
                    }), 
                    autoSetupClickedSignal = v26.autoSetupClickedSignal
                }
            }, v26.children);
        end, 
        FailsOnce = function(v30)
            local v31 = v2.useRef(false);
            return v2.createElement(v25.Provider, {
                value = {
                    startAutoSetupAsync = v2.useCallback(function()
                        v30.signal:Wait();
                        if not v31.current then
                            v31.current = true;
                            return error("Mock error");
                        else
                            return v30.result;
                        end;
                    end, {
                        v30.signal
                    }), 
                    autoSetupClickedSignal = v30.autoSetupClickedSignal
                }
            }, v30.children);
        end
    }
};
