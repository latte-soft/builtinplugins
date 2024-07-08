local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Src.Components.PlayRoot);
local v2 = require(l_Parent_0.Packages.React);
local v3 = require(l_Parent_0.Packages.ReactRoblox);
return function(v4)
    while game.Players.LocalPlayer == nil do
        game.Players:GetPropertyChangedSignal("LocalPlayer"):Wait();
    end;
    local l_LocalPlayer_0 = game.Players.LocalPlayer;
    local v6 = (l_LocalPlayer_0.Character or l_LocalPlayer_0.CharacterAdded:Wait()):WaitForChild("Humanoid", 20);
    if v6 then
        v6.StateChanged:Connect(function(_, v8)
            v4:Invoke("ChangeHumanoidState", v8);
        end);
    end;
    local v9 = v3.createRoot(Instance.new("Frame"));
    v9:render(v2.createElement(v1, {
        Plugin = v4
    }));
    return v9;
end;
