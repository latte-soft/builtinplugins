local l_script_FirstAncestor_0 = script:FindFirstAncestor("StreamingServiceDispatcherRegistry");
local v1 = require(l_script_FirstAncestor_0.Src.Utils.CliAdapter).GetService("ScriptEditorService");
local v2 = require(l_script_FirstAncestor_0.Src.Utils.Utils);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v4 = require(l_script_FirstAncestor_0.Src.Commands.BuilderCommands.BuilderNameMap);
local v5 = require(l_script_FirstAncestor_0.Src.ContextCollectors.RecentInstancesContext);
local v6 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagCAPRecentInstancesContextV2);
local function _(v7, v8)
    if v7:IsA("BasePart") then
        if typeof(v8) == "string" then
            v7.Color = Color3.fromHex(v8);
            return ;
        else
            v7.Color = Color3.fromRGB(v8.r, v8.g, v8.b);
        end;
    end;
end;
local function v15(v10, v11)
    if v10 then
        local v12 = v4.get(v10, v11);
        if not v12 then
            local l_status_0, l_result_0 = pcall(game.GetService, game, v10);
            if not l_status_0 or not l_result_0 then
                if v10 == "workspace" then
                    return workspace;
                elseif v10 == "StarterPlayerScripts" then
                    return game:GetService("StarterPlayer"):FindFirstChildWhichIsA("StarterPlayerScripts");
                elseif v10 == "StarterCharacterScripts" then
                    return game:GetService("StarterPlayer"):FindFirstChildWhichIsA("StarterCharacterScripts");
                end;
            else
                return l_result_0;
            end;
        else
            return v12;
        end;
    end;
end;
return function(v16)
    local l_requestId_0 = v16.requestId;
    local l_arguments_0 = v16.arguments;
    local l_direct_instance_0 = l_arguments_0.direct_instance;
    local v20 = l_direct_instance_0 or v4.get(l_arguments_0.newInstanceId or l_arguments_0.instanceId, l_requestId_0);
    if v20 then
        assert(v20, "Luau");
        if not l_direct_instance_0 then
            v4.StartRecordingActions(l_requestId_0);
        end;
        local v21 = l_arguments_0.properties or {};
        if v21.instanceName then
            v20.Name = v21.instanceName;
        end;
        local v22 = v15(v21.parentInstanceId, l_requestId_0);
        if v22 then
            v20.Parent = v22;
        end;
        if not (not v21.size or not v20:IsA("BasePart")) then
            v20.Size = Vector3.new(v21.size.x, v21.size.y, v21.size.z);
        end;
        if v20:IsA("Model") then
            if v21.scale and v21.scale > 0 then
                v20:ScaleTo(v20:GetScale() * v21.scale);
            elseif v21.height and v21.height > 0.1 then
                local _, v24 = v2.getWorldBoundingBox(v20);
                if v24.Y > 0.1 then
                    v20:ScaleTo(v21.height / v24.Y);
                end;
            elseif v21.size and v21.size.y > 0.1 then
                local _, v26 = v2.getWorldBoundingBox(v20);
                if v26.Y > 0.1 and v21.size.y > 0.1 then
                    v20:ScaleTo(v21.size.y / v26.Y);
                end;
            end;
        end;
        if not (not v21.source or not v20:IsA("Script") and not v20:IsA("ModuleScript")) then
            v1:UpdateSourceAsync(v20, function(_)
                return v21.source;
            end);
        end;
        if v21.color then
            local l_color_0 = v21.color;
            if v20:IsA("BasePart") then
                if typeof(l_color_0) == "string" then
                    v20.Color = Color3.fromHex(l_color_0);
                else
                    v20.Color = Color3.fromRGB(l_color_0.r, l_color_0.g, l_color_0.b);
                end;
            end;
            for _, v30 in v20:GetDescendants() do
                local l_color_1 = v21.color;
                if v30:IsA("BasePart") then
                    if typeof(l_color_1) == "string" then
                        v30.Color = Color3.fromHex(l_color_1);
                    else
                        v30.Color = Color3.fromRGB(l_color_1.r, l_color_1.g, l_color_1.b);
                    end;
                end;
            end;
        end;
        if not (not v21.material or not v20:IsA("BasePart")) then
            v20.Material = Enum.Material[v21.material];
        end;
        if (((l_direct_instance_0 or v21.position) or v21.elevation) or v21.rotation) or v21.referenceInstance then
            v2.getWorldBoundingBox(v20, function(v32)
                local v33 = nil;
                v33 = if not v21.position then CFrame.new(0, 0, 0) else CFrame.new(v21.position.x or 0, 0, v21.position.z or 0);
                local l_positionOrigin_0 = v21.positionOrigin;
                local v35 = v4.get(v21.referenceInstance, l_requestId_0);
                local v36, v37 = v2.getWorldBoundingBox(v35);
                local v38 = CFrame.new();
                local v39 = nil;
                local v40 = nil;
                if l_positionOrigin_0 == "absolute" then
                    v38 = CFrame.new();
                elseif not (l_positionOrigin_0 == "relative") or not v35 then
                    if not (l_positionOrigin_0 == "onTop") or not v35 then
                        local v41, v42 = v2.getRequestCFrame(l_requestId_0);
                        v38 = v41;
                        v40 = v42;
                    else
                        v38 = CFrame.new(v36.Position);
                        v39 = v35;
                    end;
                else
                    v38 = CFrame.new(v36.Position);
                end;
                local v43 = v38:ToWorldSpace(v33);
                local v44 = (-v43.Position.Y + v2.getGroundLevelAt(v43.Position, v39, v37, v40)) + v32:GetExtentsSize().Y / 2;
                if v21.elevation then
                    v44 = v44 + v21.elevation;
                end;
                v43 = v43 + Vector3.new(0, v44, 0);
                if v21.rotation then
                    v43 = CFrame.fromEulerAngles(0, math.rad(v21.rotation), 0) * v43.Rotation + v43.Position;
                end;
                v32:PivotTo(v43);
            end);
        end;
        if not l_direct_instance_0 then
            v4.EndRecordingActions(l_requestId_0);
        end;
        if not v6() then
            v5.registerInstance(v20);
            return ;
        else
            v5.registerInstanceV2(v20, l_requestId_0, v5.getInstanceTypes().Created);
            return ;
        end;
    else
        return ;
    end;
end;
