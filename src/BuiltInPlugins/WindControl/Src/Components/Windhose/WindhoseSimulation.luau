local l_RunService_0 = game:GetService("RunService");
local v1 = require(script.Parent.Particle);
local v2 = require(script.Parent.SpringDamper);
local v3 = require(script.Parent.constants);
local v4 = require(script.Parent.class);
local v5 = require(script.Parent.constructCFrameForBone);
local v7 = v4(function(v6)
    v6.initSucceded = false;
    v6.physicallyAnimate = not game:GetFastFlag("DisableWindControlAnimation");
    v6.windSpeed = 0;
    v6.windDir = Vector3.new(1, 1, 1);
    v6.skel = {};
    v6.numPoints = 0;
    v6.structurePoints = {};
    v6.bindWorldPose = {};
    v6.numSprings = 0;
    v6.structureSprings = {};
    v6.originalMountpoints = {};
    v6.worldModel = nil;
    v6.cone = nil;
    v6.lastTick = nil;
    v6.dt = nil;
    v6.rapTimeSoFar = 0;
    v6.spinY = 0;
    v6.spinX = 0;
    v6.windChanged = false;
    v6.isChangingYaw = false;
    v6.isChangingPitch = false;
    v6.tailBone = nil;
    v6.origCenter = Vector3.new(0, 0, 0);
    v6.lastDtIndex = 0;
    v6.lastDts = {};
end);
v7.init = function(v8, v9)
    if v9 == nil then
        return ;
    else
        v8.worldModel = v9;
        v8.cone = v8.worldModel:WaitForChild("Cone");
        local l_worldModel_0 = v8.worldModel;
        local l_cone_0 = v8.cone;
        local l_numPoints_0 = v8.numPoints;
        local l_structurePoints_0 = v8.structurePoints;
        local l_skel_0 = v8.skel;
        local l_numBones_0 = v3.numBones;
        local l_structureSprings_0 = v8.structureSprings;
        local l_numSprings_0 = v8.numSprings;
        local l_bindWorldPose_0 = v8.bindWorldPose;
        local l_originalMountpoints_0 = v8.originalMountpoints;
        if l_cone_0 == nil then
            return ;
        else
            l_worldModel_0.PrimaryPart = l_cone_0;
            local v20 = l_cone_0:GetChildren()[1];
            l_skel_0[1] = v20;
            if v20 == nil then
                return ;
            else
                local v21 = v20:GetChildren()[1];
                l_skel_0[2] = v21;
                if v21 == nil then
                    return ;
                else
                    local v22 = v21:GetChildren()[1];
                    l_skel_0[3] = v22;
                    if v22 == nil then
                        return ;
                    else
                        local v23 = v22:GetChildren()[1];
                        l_skel_0[4] = v23;
                        if v23 == nil then
                            return ;
                        else
                            local v24 = v23:GetChildren()[1];
                            l_skel_0[5] = v24;
                            if v24 == nil then
                                return ;
                            else
                                local v25 = v24:GetChildren()[1];
                                l_skel_0[6] = v25;
                                if v25 == nil then
                                    return ;
                                else
                                    for v26 = 1, l_numBones_0 do
                                        local v27 = 1 - (0.3 * v26) / 6;
                                        l_structurePoints_0[l_numPoints_0 + 1] = v1(l_skel_0[v26].WorldPosition + v3.radiusOfStructure * Vector3.new(0, -1, 0), v27);
                                        l_structurePoints_0[l_numPoints_0 + 2] = v1(l_skel_0[v26].WorldPosition + v3.radiusOfStructure * Vector3.new(v3.sqrt3on2, 0.5, 0), v27);
                                        l_structurePoints_0[l_numPoints_0 + 3] = v1(l_skel_0[v26].WorldPosition + v3.radiusOfStructure * Vector3.new(-v3.sqrt3on2, 0.5, 0), v27);
                                        if l_numPoints_0 == 0 then
                                            local v28 = ((l_structurePoints_0[1].position + l_structurePoints_0[2].position) + l_structurePoints_0[3].position) / 3;
                                            l_originalMountpoints_0[1] = l_structurePoints_0[1].position - v28;
                                            l_originalMountpoints_0[2] = l_structurePoints_0[2].position - v28;
                                            l_originalMountpoints_0[3] = l_structurePoints_0[3].position - v28;
                                        end;
                                        l_structureSprings_0[l_numSprings_0 + 1] = v2(l_structurePoints_0[l_numPoints_0 + 1], l_structurePoints_0[l_numPoints_0 + 2]);
                                        l_structureSprings_0[l_numSprings_0 + 2] = v2(l_structurePoints_0[l_numPoints_0 + 2], l_structurePoints_0[l_numPoints_0 + 3]);
                                        l_structureSprings_0[l_numSprings_0 + 3] = v2(l_structurePoints_0[l_numPoints_0 + 3], l_structurePoints_0[l_numPoints_0 + 1]);
                                        l_structureSprings_0[l_numSprings_0 + 1].springConstant = 58;
                                        l_structureSprings_0[l_numSprings_0 + 1].dampingFactor = 5;
                                        l_structureSprings_0[l_numSprings_0 + 2].springConstant = 58;
                                        l_structureSprings_0[l_numSprings_0 + 2].dampingFactor = 5;
                                        l_structureSprings_0[l_numSprings_0 + 3].springConstant = 58;
                                        l_structureSprings_0[l_numSprings_0 + 3].dampingFactor = 5;
                                        if l_numPoints_0 >= 3 then
                                            l_structureSprings_0[l_numSprings_0 + 4] = v2(l_structurePoints_0[(l_numPoints_0 + 1) - 3], l_structurePoints_0[l_numPoints_0 + 1]);
                                            l_structureSprings_0[l_numSprings_0 + 5] = v2(l_structurePoints_0[(l_numPoints_0 + 2) - 3], l_structurePoints_0[l_numPoints_0 + 2]);
                                            l_structureSprings_0[l_numSprings_0 + 6] = v2(l_structurePoints_0[(l_numPoints_0 + 3) - 3], l_structurePoints_0[l_numPoints_0 + 3]);
                                            for v29 = 1, 6 do
                                                l_structureSprings_0[l_numSprings_0 + v29].springConstant = 28;
                                                l_structureSprings_0[l_numSprings_0 + v29].dampingFactor = 7;
                                            end;
                                            l_structureSprings_0[l_numSprings_0 + 7] = v2(l_structurePoints_0[(l_numPoints_0 + 1) - 3], l_structurePoints_0[l_numPoints_0 + 2]);
                                            l_structureSprings_0[l_numSprings_0 + 8] = v2(l_structurePoints_0[(l_numPoints_0 + 2) - 3], l_structurePoints_0[l_numPoints_0 + 1]);
                                            l_structureSprings_0[l_numSprings_0 + 9] = v2(l_structurePoints_0[(l_numPoints_0 + 3) - 3], l_structurePoints_0[l_numPoints_0 + 2]);
                                            l_structureSprings_0[l_numSprings_0 + 10] = v2(l_structurePoints_0[(l_numPoints_0 + 2) - 3], l_structurePoints_0[l_numPoints_0 + 3]);
                                            l_structureSprings_0[l_numSprings_0 + 11] = v2(l_structurePoints_0[(l_numPoints_0 + 1) - 3], l_structurePoints_0[l_numPoints_0 + 3]);
                                            l_structureSprings_0[l_numSprings_0 + 12] = v2(l_structurePoints_0[(l_numPoints_0 + 3) - 3], l_structurePoints_0[l_numPoints_0 + 1]);
                                            if l_numSprings_0 == 3 then
                                                for v30 = 1, 12 do
                                                    l_structureSprings_0[l_numSprings_0 + v30].springConstant = 28;
                                                    l_structureSprings_0[l_numSprings_0 + v30].dampingFactor = 5;
                                                end;
                                            end;
                                            if l_numPoints_0 >= 6 then
                                                l_structureSprings_0[l_numSprings_0 + 13] = v2(l_structurePoints_0[(l_numPoints_0 + 1) - 6], l_structurePoints_0[l_numPoints_0 + 1]);
                                                l_structureSprings_0[l_numSprings_0 + 14] = v2(l_structurePoints_0[(l_numPoints_0 + 2) - 6], l_structurePoints_0[l_numPoints_0 + 2]);
                                                l_structureSprings_0[l_numSprings_0 + 15] = v2(l_structurePoints_0[(l_numPoints_0 + 3) - 6], l_structurePoints_0[l_numPoints_0 + 3]);
                                                l_structureSprings_0[l_numSprings_0 + 16] = v2(l_structurePoints_0[(l_numPoints_0 + 1) - 6], l_structurePoints_0[l_numPoints_0 + 2]);
                                                l_structureSprings_0[l_numSprings_0 + 17] = v2(l_structurePoints_0[(l_numPoints_0 + 2) - 6], l_structurePoints_0[l_numPoints_0 + 1]);
                                                l_structureSprings_0[l_numSprings_0 + 18] = v2(l_structurePoints_0[(l_numPoints_0 + 3) - 6], l_structurePoints_0[l_numPoints_0 + 2]);
                                                l_structureSprings_0[l_numSprings_0 + 19] = v2(l_structurePoints_0[(l_numPoints_0 + 2) - 6], l_structurePoints_0[l_numPoints_0 + 3]);
                                                l_structureSprings_0[l_numSprings_0 + 20] = v2(l_structurePoints_0[(l_numPoints_0 + 1) - 6], l_structurePoints_0[l_numPoints_0 + 3]);
                                                l_structureSprings_0[l_numSprings_0 + 21] = v2(l_structurePoints_0[(l_numPoints_0 + 3) - 6], l_structurePoints_0[l_numPoints_0 + 1]);
                                                for v31 = 13, 21 do
                                                    l_structureSprings_0[l_numSprings_0 + v31].springConstant = 24;
                                                    l_structureSprings_0[l_numSprings_0 + v31].dampingFactor = 7;
                                                end;
                                                l_numSprings_0 = l_numSprings_0 + 9;
                                            end;
                                            l_numSprings_0 = l_numSprings_0 + 9;
                                        end;
                                        l_numSprings_0 = l_numSprings_0 + 3;
                                        l_numPoints_0 = l_numPoints_0 + 3;
                                    end;
                                    v8.numSprings = l_numSprings_0;
                                    v8.numPoints = l_numPoints_0;
                                    for v32 = 1, l_numBones_0 do
                                        l_bindWorldPose_0[v32] = v5(v32, l_structurePoints_0):Inverse() * l_skel_0[v32].WorldCFrame;
                                    end;
                                    l_cone_0.CFrame = CFrame.new();
                                    l_cone_0.Size = l_cone_0.Size * 0.4;
                                    v8.lastTick = tick();
                                    v8.initSucceded = true;
                                    v8:afterCamera(0);
                                    l_RunService_0:BindToRenderStep("WindhoseAfterCamera", Enum.RenderPriority.Camera.Value + 1, function(v33)
                                        v8:afterCamera(v33);
                                    end);
                                    return ;
                                end;
                            end;
                        end;
                    end;
                end;
            end;
        end;
    end;
end;
v7.onRenderStepSock = function(v34, v35)
    local v36 = {};
    local l_numBones_1 = v3.numBones;
    local l_structurePoints_1 = v34.structurePoints;
    local l_structureSprings_1 = v34.structureSprings;
    local l_skel_1 = v34.skel;
    local l_windDir_0 = v34.windDir;
    local l_windSpeed_0 = v34.windSpeed;
    local l_numPoints_1 = v34.numPoints;
    local l_bindWorldPose_1 = v34.bindWorldPose;
    local l_spinY_0 = v34.spinY;
    local l_spinX_0 = v34.spinX;
    local l_originalMountpoints_1 = v34.originalMountpoints;
    local l_numSprings_1 = v34.numSprings;
    local l_rapTimeSoFar_0 = v34.rapTimeSoFar;
    for v50 = 1, l_numBones_1 do
        v36[v50] = v5(v50, l_structurePoints_1);
        local v51 = v36[v50] * l_bindWorldPose_1[v50];
        local _ = nil;
        l_skel_1[v50].CFrame = if v50 > 1 then l_skel_1[v50].Parent.WorldCFrame:Inverse() * v51 else l_skel_1[v50].Parent.CFrame:Inverse() * v51;
    end;
    local v53 = CFrame.fromEulerAnglesYXZ(0, l_spinY_0, 0) * CFrame.fromEulerAnglesYXZ(l_spinX_0, 0, 0);
    for v54 = 1, 3 do
        l_structurePoints_1[v54].position = v53:PointToWorldSpace(l_originalMountpoints_1[v54]) - 0.45 * v34.windDir;
    end;
    if v34.physicallyAnimate then
        local v55 = Vector3.new(0, 0, 0);
        if workspace.Gravity > 0 then
            v55 = Vector3.new(0, -math.min(v3.inverseStandardGravity * workspace.Gravity, 4), 0);
        end;
        for v56 = 4, l_numPoints_1 do
            l_structurePoints_1[v56]:update(v35, false);
        end;
        local v57 = math.min(math.min(30, (v3.spsToFudgedMps * l_windSpeed_0) * 2), v3.spsToFudgedMps * 1000);
        for v58 = 4, l_numPoints_1 do
            local v59 = math.floor(v58 / 3);
            l_structurePoints_1[v58]:addForce((v59 * (1 - v57 / 30)) * v55);
            local v60 = (v57 * v36[v59].RightVector) * math.sin(v57 * l_rapTimeSoFar_0) + v36[v59].UpVector * math.sin(v57 * l_rapTimeSoFar_0);
            if v59 == 5 then
                l_structurePoints_1[v58]:addForce(v60);
            end;
            l_structurePoints_1[v58]:addForce((((2 - math.max(0, l_windDir_0:Dot(v36[v59].LookVector))) * l_windDir_0) * 0.25) * v57);
        end;
        for v61 = 1, l_numSprings_1 do
            l_structureSprings_1[v61]:computeForce();
        end;
    end;
end;
v7.updateAndGetAvgDt = function(v62, v63)
    v63 = math.clamp(v63, 0.008333333333333333, 0.02);
    if 2 * v3.maxDtsToAvg <= v62.lastDtIndex then
        v62.lastDtIndex = v3.maxDtsToAvg;
    end;
    v62.lastDtIndex = v62.lastDtIndex + 1;
    v62.lastDts[(v62.lastDtIndex - 1) % v3.maxDtsToAvg + 1] = v63;
    local v64 = math.min(v3.maxDtsToAvg, v62.lastDtIndex);
    local v65 = 0;
    for v66 = 1, v64 do
        v65 = v65 + v62.lastDts[v66];
    end;
    return v65 / v64;
end;
v7.afterCamera = function(v67, v68)
    if v67.initSucceded then
        if v67.physicallyAnimate then
            local v69 = tick();
            local v70 = v69 - v67.lastTick;
            v67.lastTick = v69;
            v67:onRenderStepSock((v67:updateAndGetAvgDt(v68)));
            if v67.rapTimeSoFar > 3.141592653589793 then
                v67.rapTimeSoFar = v67.rapTimeSoFar - 3.141592653589793;
            end;
            v67.rapTimeSoFar = v67.rapTimeSoFar + v70;
        end;
        return ;
    else
        return ;
    end;
end;
v7.destroy = function(_)
    l_RunService_0:UnbindFromRenderStep("WindhoseAfterCamera");
end;
return v7;
