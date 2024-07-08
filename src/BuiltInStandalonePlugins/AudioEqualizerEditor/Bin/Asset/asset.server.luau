if plugin then
    local l_script_FirstAncestor_0 = script:FindFirstAncestor("AudioEqualizerEditor");
    local v1 = require(l_script_FirstAncestor_0.Packages.TestLoader);
    v1.launch("AudioEqualizerEditor", l_script_FirstAncestor_0.Src);
    if not v1.isCli() then
        if require(l_script_FirstAncestor_0.Bin.Common.defineLuaFlags).getFFlagEnableAudioEqualizerEditor() then
            local v2 = require(l_script_FirstAncestor_0.Bin.Common.pluginType);
            local v3 = require(l_script_FirstAncestor_0.Src.Util.AnalyzerUtil);
            v3.setPlugin(plugin);
            local _ = require(l_script_FirstAncestor_0.Src.Types);
            local v5 = {};
            local v6 = nil;
            local v7 = 0;
            local v8 = nil;
            local l_GuiService_0 = game:GetService("GuiService");
            local _ = game:GetService("SoundService").OpenAudioEqualizerEditorSignal:Connect(function(v10)
                for v11 = #v10, 1, -1 do
                    local v12 = v10[v11];
                    if not (v12 and v12:IsA("AudioEqualizer")) then
                        table.remove(v10, v11);
                    end;
                end;
                if #v10 == 0 then
                    return ;
                else
                    v5 = v10;
                    local v13 = v10[1];
                    v8 = {
                        LowGain = v13.LowGain, 
                        MidGain = v13.MidGain, 
                        HighGain = v13.HighGain, 
                        MidRange = v13.MidRange, 
                        Bypass = v13.Bypass
                    };
                    local v14 = ("%* \"%*\""):format(v13.ClassName, v13.Name);
                    if #v10 > 1 then
                        v14 = ("%* (%* items)"):format(v13.ClassName, #v10);
                    end;
                    v3.createInstances(v13, l_GuiService_0);
                    plugin:Invoke("OnOpen", v8, v7, v14);
                    if v6 then
                        v6:Disconnect();
                    end;
                    v6 = v13.Changed:Connect(function(v15)
                        local l_v13_0 = v13;
                        if not v8 or v8[v15] ~= l_v13_0[v15] then
                            v8 = {
                                LowGain = v13.LowGain, 
                                MidGain = v13.MidGain, 
                                HighGain = v13.HighGain, 
                                MidRange = v13.MidRange, 
                                Bypass = v13.Bypass
                            };
                            plugin:Invoke("OnInstanceChanged", v8);
                        end;
                    end);
                    v7 = v7 + 1;
                    return ;
                end;
            end);
            plugin:OnInvoke("OnEdit", function(v18)
                v8 = v18;
                for _, v20 in v5, nil, nil do
                    if not (not v20 or not v20:IsA("AudioEqualizer")) then
                        v20.LowGain = v18.LowGain;
                        v20.MidGain = v18.MidGain;
                        v20.HighGain = v18.HighGain;
                        v20.MidRange = v18.MidRange;
                        v20.Bypass = v18.Bypass;
                    end;
                end;
            end);
            plugin:OnInvoke("OnStopEditing", function()
                v5 = {};
                if v6 then
                    v6:Disconnect();
                    v6 = nil;
                end;
                v8 = nil;
                v3.destroyInstances(l_GuiService_0);
            end);
            if v2.get() ~= v2.Asset then
                return ;
            else
                require(l_script_FirstAncestor_0.Bin.Common.setup)(plugin, (require(l_script_FirstAncestor_0.Bin.Common.setupMain)));
                return ;
            end;
        else
            return ;
        end;
    else
        return ;
    end;
else
    return ;
end;
