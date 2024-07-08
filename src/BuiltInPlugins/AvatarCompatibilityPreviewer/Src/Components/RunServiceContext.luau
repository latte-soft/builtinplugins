local l_RunService_0 = game:GetService("RunService");
return (require(script:FindFirstAncestor("AvatarCompatibilityPreviewer").Packages.React).createContext({
    isRunning = function()
        return l_RunService_0:IsRunning();
    end
}));
