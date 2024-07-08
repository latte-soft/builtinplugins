local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Framework);
local l_Actions_0 = l_Parent_0.Src.Actions;
local v3 = require(l_Actions_0.SetShorelinesUpgradePercent);
local v4 = require(l_Actions_0.SetShorelinesUpgradePossible);
local v5 = require(l_Actions_0.SetShorelinesUpgradeSuggestion);
local v6 = v1.ContextServices.ContextItem:extend("ShorelineController");
v6.new = function(v7, v8, v9, v10, v11)
    local v12 = setmetatable({
        _changeHistoryService = game:GetService("ChangeHistoryService"), 
        _shorelineUpgraderService = game:GetService("ShorelineUpgraderService"), 
        _analytics = v7, 
        _plugin = v8, 
        _store = v9, 
        _terrain = v10, 
        _mock = v11
    }, v6);
    if not v11 then
        v12._onShorelinesUpgradedChanged = v12._terrain:get():GetPropertyChangedSignal("ShorelinesUpgraded"):Connect(function()
            v12:checkUpgradeCapability();
        end);
        v12._dontAsk = v12._plugin:GetSetting("UpgradeShorelines_DontAsk");
        v12:checkUpgradeCapability();
        return v12;
    else
        return v12;
    end;
end;
v6.destroy = function(v13)
    if not v13._mock then
        if v13._onShorelinesUpgradedChanged then
            v13._onShorelinesUpgradedChanged:Disconnect();
        end;
        return ;
    else
        return ;
    end;
end;
v6.dismiss = function(v14, v15)
    if not v14._mock then
        v14._dismiss = true;
        v14._dontAsk = v15;
        v14._plugin:SetSetting("UpgradeShorelines_DontAsk", v15);
        v14._analytics:report("upgradeShorelinesDismiss", v15);
        v14:checkUpgradeCapability();
        return ;
    else
        return ;
    end;
end;
v6.checkUpgradeCapability = function(v16)
    if not v16._mock then
        local v17 = v16._terrain:get();
        local v18 = v17 and v17:CanShorelinesBeUpgraded();
        v16._store:dispatch(v4(v18));
        v16._store:dispatch(v5(((not v16._dontAsk and not v16._dismiss) and not v16._updating) and v18));
        return ;
    else
        return ;
    end;
end;
v6.cancel = function(v19)
    if not v19._mock then
        v19._updating = false;
        local l_ShorelinesUpgradePercent_0 = v19._store:getState().Tools.ShorelinesUpgradePercent;
        if not (l_ShorelinesUpgradePercent_0 < 0) or l_ShorelinesUpgradePercent_0 < 1 then
            v19._shorelineUpgraderService:Cancel();
            v19._analytics:report("upgradeShorelinesCancel");
            v19._store:dispatch(v3(-1));
        end;
        return ;
    else
        return ;
    end;
end;
v6.start = function(v21, v22)
    if not v21._mock then
        v21._updating = true;
        v21._shorelineUpgraderService:Start();
        v21._shorelineUpgraderService.Status:Connect(function(v23)
            v21._store:dispatch(v3(v23));
            v21:checkUpgradeCapability();
        end);
        v21._analytics:report("upgradeShorelinesAction", v22);
        return ;
    else
        return ;
    end;
end;
return v6;
