local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Framework);
local l_Actions_0 = l_Parent_0.Src.Actions;
local v3 = require(l_Actions_0.SetSmoothVoxelsUpgradePercent);
local v4 = require(l_Actions_0.SetSmoothVoxelsUpgradePossible);
local v5 = require(l_Actions_0.SetSmoothVoxelsUpgradeSuggestion);
local v6 = v1.ContextServices.ContextItem:extend("SmoothVoxelsController");
v6.new = function(v7, v8, v9, v10, v11)
    local v12 = setmetatable({
        _changeHistoryService = game:GetService("ChangeHistoryService"), 
        _smoothVoxelsUpgraderService = game:GetService("SmoothVoxelsUpgraderService"), 
        _analytics = v7, 
        _plugin = v8, 
        _store = v9, 
        _terrain = v10, 
        _mock = v11
    }, v6);
    if not v11 then
        local v13 = v12._terrain:get();
        v12._onSmoothVoxelsUpgradedChanged = v13:GetPropertyChangedSignal("SmoothVoxelsUpgraded"):Connect(function()
            v12:checkUpgradeCapability();
        end);
        v12._onShorelinesUpgradedChanged = v13:GetPropertyChangedSignal("ShorelinesUpgraded"):Connect(function()
            v12:checkUpgradeCapability();
        end);
        v12._dontAsk = v12._plugin:GetSetting("UpgradeSmoothVoxels_DontAsk");
        v12:checkUpgradeCapability();
        return v12;
    else
        return v12;
    end;
end;
v6.destroy = function(v14)
    if not v14._mock then
        if v14._onSmoothVoxelsUpgradedChanged then
            v14._onSmoothVoxelsUpgradedChanged:Disconnect();
        end;
        if v14._onShorelinesUpgradedChanged then
            v14._onShorelinesUpgradedChanged:Disconnect();
        end;
        return ;
    else
        return ;
    end;
end;
v6.dismiss = function(v15, v16)
    if not v15._mock then
        v15._dismiss = true;
        v15._dontAsk = v16;
        v15._plugin:SetSetting("UpgradeSmoothVoxels_DontAsk", v16);
        v15._analytics:report("upgradeSmoothVoxelsDismiss", v16);
        v15:checkUpgradeCapability();
        return ;
    else
        return ;
    end;
end;
v6.checkUpgradeCapability = function(v17)
    if not v17._mock then
        local v18 = v17._terrain:get();
        local v19 = v18 and v18:CanSmoothVoxelsBeUpgraded();
        v17._store:dispatch(v4(v19));
        v17._store:dispatch(v5(((not v17._dontAsk and not v17._dismiss) and not v17._updating) and v19));
        return ;
    else
        return ;
    end;
end;
v6.cancel = function(v20)
    if not v20._mock then
        v20._updating = false;
        local l_SmoothVoxelsUpgradePercent_0 = v20._store:getState().Tools.SmoothVoxelsUpgradePercent;
        if not (l_SmoothVoxelsUpgradePercent_0 < 0) or l_SmoothVoxelsUpgradePercent_0 < 1 then
            v20._smoothVoxelsUpgraderService:Cancel();
            v20._analytics:report("upgradeSmoothVoxelsCancel");
            v20._store:dispatch(v3(-1));
        end;
        return ;
    else
        return ;
    end;
end;
v6.start = function(v22, v23)
    if not v22._mock then
        v22._updating = true;
        v22._smoothVoxelsUpgraderService:Start();
        v22._smoothVoxelsUpgraderService.Status:Connect(function(v24)
            v22._store:dispatch(v3(v24));
            v22:checkUpgradeCapability();
        end);
        v22._analytics:report("upgradeSmoothVoxelsAction", v23);
        return ;
    else
        return ;
    end;
end;
return v6;
