return function(v0, v1)
    local l_Parent_0 = script.Parent.Parent;
    local v3 = require(l_Parent_0.Packages.Framework);
    local _, l_result_0 = pcall(function()
        return game:GetService("StudioService"):HasInternalPermission();
    end);
    local _, _ = pcall(function()
        return game:GetService("RunService"):IsEdit();
    end);
    local v8 = require(l_Parent_0.Packages.Roact);
    local l_Networking_0 = v3.Http.Networking;
    local v10 = require(l_Parent_0.Src.MainPlugin);
    local v11 = require(l_Parent_0.Src.Util.SoundAssetChecker);
    local v12 = nil;
    local v13 = nil;
    local v14 = nil;
    if l_result_0 then
        v14 = v3.DeveloperTools.forPlugin(l_Parent_0.Name, v0);
    end;
    local function v15()
        v0.Name = l_Parent_0.Name;
        v13 = v11.new((l_Networking_0.new({
            isInternal = true
        })));
        v13:start();
        v12 = v8.mount((v8.createElement(v10, {
            Plugin = v0, 
            pluginLoaderContext = v1, 
            SoundAssetChecker = v13
        })));
        if v14 then
            v14:addRoactTree("Roact tree", v12);
        end;
    end;
    v0.Unloading:Connect(function()
        if v13 then
            v13:destroy();
            v13 = nil;
        end;
        if v14 then
            v14:destroy();
        end;
        if v12 then
            v8.unmount(v12);
            v12 = nil;
        end;
    end);
    v15();
end;
