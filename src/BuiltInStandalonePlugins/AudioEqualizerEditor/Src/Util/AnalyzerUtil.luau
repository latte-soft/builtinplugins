local _ = script:FindFirstAncestor("AudioEqualizerEditor");
local v1 = {
    OnStartAnalyzing = "OnStartAnalyzing", 
    OnSpectrumChanged = "OnSpectrumChanged", 
    IsAnalyzing = "IsAnalyzing", 
    InstanceContainer = "AudioEqualizerEditor_Container", 
    Frame = "Frame", 
    Analyzer = "AudioAnalyzer", 
    Wire = "Wire"
};
local v2 = {};
local v3 = nil;
v2.setPlugin = function(v4)
    assert(v4, "Plugin doesn't exist");
    v3 = v4;
end;
local v5 = nil;
v2.disconnectStartAnalyzing = function()
    if v5 then
        v5:Disconnect();
        v5 = nil;
    end;
end;
local v6 = nil;
v2.disconnectRunService = function()
    if v6 then
        v6:Disconnect();
        v6 = nil;
    end;
end;
v2.createInstances = function(v7, v8)
    if v3 then
        local l_v8_FirstChild_0 = v8:FindFirstChild(v1.InstanceContainer);
        if not l_v8_FirstChild_0 then
            local v10 = Instance.new(v1.Frame);
            v10.Name = v1.InstanceContainer;
            v10.Parent = v8;
            l_v8_FirstChild_0 = v10;
        end;
        local l_l_v8_FirstChild_0_0 = l_v8_FirstChild_0;
        local l_l_l_v8_FirstChild_0_0_FirstChild_0 = l_l_v8_FirstChild_0_0:FindFirstChild(v1.Analyzer);
        if not (not l_l_l_v8_FirstChild_0_0_FirstChild_0 or l_l_l_v8_FirstChild_0_0_FirstChild_0:IsA(v1.Analyzer)) then
            l_l_l_v8_FirstChild_0_0_FirstChild_0:Destroy();
            l_l_l_v8_FirstChild_0_0_FirstChild_0 = nil;
        end;
        if not l_l_l_v8_FirstChild_0_0_FirstChild_0 then
            local v13 = Instance.new(v1.Analyzer);
            v13.Parent = l_l_v8_FirstChild_0_0;
            l_l_l_v8_FirstChild_0_0_FirstChild_0 = v13;
        end;
        local l_l_l_l_v8_FirstChild_0_0_FirstChild_0_0 = l_l_l_v8_FirstChild_0_0_FirstChild_0;
        local l_l_l_v8_FirstChild_0_0_FirstChild_1 = l_l_v8_FirstChild_0_0:FindFirstChild(v1.Wire);
        if not (not l_l_l_v8_FirstChild_0_0_FirstChild_1 or l_l_l_v8_FirstChild_0_0_FirstChild_1:IsA(v1.Wire)) then
            l_l_l_v8_FirstChild_0_0_FirstChild_1:Destroy();
            l_l_l_v8_FirstChild_0_0_FirstChild_1 = nil;
        end;
        if not l_l_l_v8_FirstChild_0_0_FirstChild_1 then
            local v16 = Instance.new(v1.Wire);
            v16.Parent = l_l_v8_FirstChild_0_0;
            v16.TargetInstance = l_l_l_l_v8_FirstChild_0_0_FirstChild_0_0;
            l_l_l_v8_FirstChild_0_0_FirstChild_1 = v16;
        end;
        l_l_l_v8_FirstChild_0_0_FirstChild_1.SourceInstance = v7;
        v2.disconnectStartAnalyzing();
        v5 = v3:OnInvoke(v1.OnStartAnalyzing, function()
            v3:SetItem(v1.IsAnalyzing, true);
            v2.disconnectRunService();
            v6 = game:GetService("RunService").Heartbeat:Connect(function()
                if v3:GetItem(v1.IsAnalyzing) then
                    v3:Invoke(v1.OnSpectrumChanged, (l_l_l_l_v8_FirstChild_0_0_FirstChild_0_0:GetSpectrum()));
                    return ;
                else
                    v2.disconnectRunService();
                    return ;
                end;
            end);
        end);
        return ;
    else
        return ;
    end;
end;
v2.destroyInstances = function(v17)
    if v3 then
        v2.disconnectSpectrumChanged();
        v3:SetItem(v1.IsAnalyzing, false);
        local l_v17_FirstChild_0 = v17:FindFirstChild(v1.InstanceContainer);
        if l_v17_FirstChild_0 then
            l_v17_FirstChild_0:Destroy();
        end;
        return ;
    else
        return ;
    end;
end;
local v19 = nil;
v2.disconnectSpectrumChanged = function()
    if v19 then
        v19:Disconnect();
        v19 = nil;
    end;
end;
v2.startAnalyzing = function(v20)
    if v3 then
        v3:Invoke(v1.OnStartAnalyzing);
        v2.disconnectSpectrumChanged();
        v19 = v3:OnInvoke(v1.OnSpectrumChanged, v20);
        return ;
    else
        return ;
    end;
end;
v2.stopAnalyzing = function()
    if v3 then
        v2.disconnectSpectrumChanged();
        v3:SetItem(v1.IsAnalyzing, false);
        return ;
    else
        return ;
    end;
end;
return v2;
