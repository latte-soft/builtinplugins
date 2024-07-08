if plugin then
    local l_script_FirstAncestor_0 = script:FindFirstAncestor("AttenuationCurveEditor");
    require(l_script_FirstAncestor_0.Bin.Common.defineLuaFlags);
    local v1 = require(l_script_FirstAncestor_0.Packages.TestLoader);
    v1.launch("AttenuationCurveEditor", l_script_FirstAncestor_0.Src);
    if not v1.isCli() then
        if game:GetFastFlag("EnableDistanceAttenuationCurveEditorLua") then
            local v2 = require(l_script_FirstAncestor_0.Bin.Common.pluginType);
            local _ = require(l_script_FirstAncestor_0.Src.Types);
            local v4 = require(l_script_FirstAncestor_0.Src.Util.DistanceAttenuationUtil);
            local v5 = require(l_script_FirstAncestor_0.Src.Util.SerializationUtil);
            local v6 = {};
            local v7 = 0;
            local function v14(v8)
                for v9, v10 in v8, nil, nil do
                    if not v10:IsA("AudioEmitter") then
                        v8[v9] = nil;
                    end;
                end;
                if #v8 == 0 then
                    return ;
                else
                    v6 = v8;
                    local v11 = v8[1];
                    local v12 = v4.getDistanceAttenuation(v11);
                    local v13 = ("%* \"%*\""):format(v11.ClassName, v11.Name);
                    if #v8 > 1 then
                        v13 = ("%* (%* items)"):format(v11.ClassName, #v8);
                    end;
                    plugin:Invoke("OnOpen", v5.stringifyCurveTable(v12), v7, v13);
                    v7 = v7 + 1;
                    return ;
                end;
            end;
            plugin:OnInvoke("OnEdit", function(v15)
                local v16 = v5.destringifyCurveTable(v15);
                for _, v18 in v6, nil, nil do
                    if not (not v18 or not v18:IsA("AudioEmitter")) then
                        v4.setDistanceAttenuation(v18, v16);
                    end;
                end;
            end);
            plugin:OnInvoke("OnStopEditing", function()
                v6 = {};
            end);
            local v19 = nil;
            v19 = if not game:GetFastFlag("MoveAttenuationCurveEditorSignal") then game:GetService("GuiService").OpenAttenuationCurveEditor:Connect(v14) else game:GetService("SoundService").OpenAttenuationCurveEditorSignal:Connect(v14);
            if v2.get() ~= v2.asset then
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
