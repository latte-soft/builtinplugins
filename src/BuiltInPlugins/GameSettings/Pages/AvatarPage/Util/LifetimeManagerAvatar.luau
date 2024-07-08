local v0 = require(script.Parent.Parent.Util.Avatar);
local l_InsertService_0 = game:GetService("InsertService");
local v2 = {
    Handle = nil, 
    Loading = false, 
    WaitingToDestroy = false
};
local v3 = nil;
local v4 = nil;
game:DefineFastFlag("DisableGameSettingsAvatarPreview", false);
v2.apply = function(v5)
    if v2.Handle == nil then
        v4(v5);
        return ;
    else
        v2.Handle:applyTemplates(v5);
        return ;
    end;
end;
v4 = function(v6)
    v2.WaitingToDestroy = false;
    if not v2.Loading and v2.Handle == nil then
        v2.Loading = true;
        spawn(function()
            local v7 = nil;
            local v8 = nil;
            local l_status_0, l_result_0 = pcall(function()
                v7 = l_InsertService_0:LoadLocalAsset("rbxasset://avatar/morpherEditorR15.rbxmx");
                v8 = l_InsertService_0:LoadLocalAsset("rbxasset://avatar/morpherEditorR6.rbxmx");
            end);
            if not ((not l_status_0 or not v7) or not v8) then
                v2.Handle = v0.loadWithTemplates(v8, v7, v6);
                if v2.Handle then
                    v3(v2);
                end;
            end;
            if l_result_0 then
                warn(l_result_0);
            end;
            v2.Loading = false;
        end);
    end;
end;
local function _(v11)
    if v11.Handle ~= nil then
        v11.Handle:destroy();
        v11.Handle = nil;
    end;
end;
local function _(v13)
    if not (not v2.Loading or v2.WaitingToDestroy) then
        v2.WaitingToDestroy = true;
        spawn(function()
            while v2.Loading do
                wait();
            end;
            if v2.WaitingToDestroy then
                local l_v13_0 = v13;
                if l_v13_0.Handle ~= nil then
                    l_v13_0.Handle:destroy();
                    l_v13_0.Handle = nil;
                end;
                v2.WaitingToDestroy = false;
            end;
        end);
    end;
end;
v2.destroy = function(v16)
    if v16.Handle ~= nil then
        v16.Handle:destroy();
        v16.Handle = nil;
    end;
    if not (not v2.Loading or v2.WaitingToDestroy) then
        v2.WaitingToDestroy = true;
        spawn(function()
            while v2.Loading do
                wait();
            end;
            if v2.WaitingToDestroy then
                local l_v16_0 = v16;
                if l_v16_0.Handle ~= nil then
                    l_v16_0.Handle:destroy();
                    l_v16_0.Handle = nil;
                end;
                v2.WaitingToDestroy = false;
            end;
        end);
    end;
end;
v3 = function(v18)
    local l_CurrentCamera_0 = workspace.CurrentCamera;
    if not l_CurrentCamera_0 then
        v18.Handle:setPosition((CFrame.new((Vector3.new(0, 0, 0)))));
        return ;
    else
        local l_p_0 = (l_CurrentCamera_0.CFrame + l_CurrentCamera_0.CFrame.lookVector * 8).p;
        v2.Handle:setPosition(CFrame.new(l_p_0, l_p_0 - l_CurrentCamera_0.CFrame.lookVector.Unit));
        return ;
    end;
end;
return v2;
