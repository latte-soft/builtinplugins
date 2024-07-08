local v0 = require(script:FindFirstAncestor("TerrainEditor").Src.Util.Operations.BaseOperation);
return function(v1, v2, v3, v4)
    return v0.new({
        AllowCancel = true, 
        Description = v2, 
        Name = v1, 
        OnCancel = function()
            v3.ShorelineUpgraderService:Cancel();
            v4(v3.Terrain and v3.Terrain:CanShorelinesBeUpgraded());
        end, 
        OnFinish = function()
            v3.ChangeHistoryService:SetWaypoint("Upgrade Shorelines");
            v4(v3.Terrain and v3.Terrain:CanShorelinesBeUpgraded());
        end, 
        OnStart = function(v5, _)
            v3.ShorelineUpgraderService:Start();
            v3.ShorelineUpgraderService.Status:Connect(function(v7)
                assert(v5.State, "Tried to update the state without it existing.");
                v5.State.Percent = v7;
            end);
            v5.State = {
                Percent = 0
            };
        end, 
        OnStep = function(v8, _)
            assert(v8.State, "Tried to step without starting first.");
            local l_State_0 = v8.State;
            v4(v3.Terrain and v3.Terrain:CanShorelinesBeUpgraded());
            return l_State_0.Percent < 1, l_State_0.Percent;
        end
    });
end;
