local l_Players_0 = game:GetService("Players");
local l_RunService_0 = game:GetService("RunService");
local v2 = require(script:FindFirstAncestor("CompositorDebugger").Packages.React).PureComponent:extend("PlayerListener");
v2.init = function(v3)
    v3.onCharacterAdded = function(v4)
        if v3.characterAddedEvent then
            v3.characterAddedEvent:Disconnect();
            v3.characterAddedEvent = nil;
        end;
        if not v3.props.IsSelectedInstanceValid(v4) then
            v3.descendantAddedEvent = v4.DescendantAdded:Connect(function(v5)
                if not (not v5:IsA("Script") and not v5:IsA("BindableEvent") or not v3.props.IsSelectedInstanceValid(v4)) then
                    v3.descendantAddedEvent:Disconnect();
                    v3.descendantAddedEvent = nil;
                    v3.props.OnValidSelection(v4);
                end;
            end);
            return ;
        else
            v3.props.OnValidSelection(v4);
            return ;
        end;
    end;
    v3.onPlayerAdded = function(v6)
        if v3.onPlayerAddedEvent then
            v3.onPlayerAddedEvent:Disconnect();
            v3.onPlayerAddedEvent = nil;
        end;
        if not v6.Character then
            v3.characterAddedEvent = v6.CharacterAdded:Connect(v3.onCharacterAdded);
            return ;
        else
            v3.onCharacterAdded(v6.Character);
            return ;
        end;
    end;
end;
v2.didMount = function(v7)
    if l_RunService_0:IsRunning() then
        if not l_RunService_0:IsClient() then
            local l_l_Players_0_Players_0 = l_Players_0:GetPlayers();
            if not l_l_Players_0_Players_0[1] then
                v7.onPlayerAddedEvent = l_Players_0.PlayerAdded:Connect(v7.onPlayerAdded);
                return ;
            else
                v7.onPlayerAdded(l_l_Players_0_Players_0[1]);
                return ;
            end;
        else
            v7.onPlayerAdded(l_Players_0.LocalPlayer);
            return ;
        end;
    else
        return ;
    end;
end;
v2.render = function(_)
    return nil;
end;
return v2;
