local l_ChangeHistoryService_0 = game:GetService("ChangeHistoryService");
local l_GeometryService_0 = game:GetService("GeometryService");
local l_Workspace_0 = game:GetService("Workspace");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v4 = require(l_script_FirstAncestor_0.Packages.Dash);
local v5 = require(l_script_FirstAncestor_0.Packages.Framework);
local v6 = require(l_script_FirstAncestor_0.Packages.React);
local v7 = require(l_script_FirstAncestor_0.Src.Util.AvatarScalingTypes);
local v8 = require(l_script_FirstAncestor_0.Src.Components.AutoSetupContext);
local v9 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local v10 = require(l_script_FirstAncestor_0.Src.Util.SelectionWrapper);
local v11 = require(l_script_FirstAncestor_0.Src.Util.assetUriToId);
local v12 = require(l_script_FirstAncestor_0.Src.Util.findUnderlyingMeshAssetIds);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v14 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAvatarPreviewerAutoSetupDisablePublish);
local v15 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAvatarPreviewerFixMeshSwitching);
local v16 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAvatarPreviewerScaleAfterAutosetup);
local v17 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAvatarPreviewerAutoSetupTelemetry);
local v18 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAvatarPreviewerAutoSetupTelemetryV2);
local l_Analytics_0 = v5.ContextServices.Analytics;
local function _(v20)
    if v20 == nil then
        return {
            type = "none"
        };
    else
        return {
            type = "hasSelection", 
            target = v20
        };
    end;
end;
local function v36(v22, v23)
    local v24 = v4.keys(v7.types);
    table.sort(v24, function(v25, v26)
        return v7.types[v25].GuessMaxHeight < v7.types[v26].GuessMaxHeight;
    end);
    local v27 = nil;
    local v28 = nil;
    for _, v30 in v24, nil, nil do
        local v31 = v7.types[v30];
        if v23.ExtentsSize.Y < v31.GuessMaxHeight then
            v27 = v30;
            v28 = v31;
            break;
        end;
    end;
    assert(v28 ~= nil, "No scaling type info chosen");
    v7.setAvatarPartScaleTypeValueObjects(v22, v27);
    local l_BodyTypeScale_0 = v22.Humanoid:FindFirstChild("BodyTypeScale");
    local v33 = false;
    if l_BodyTypeScale_0 ~= nil then
        v33 = l_BodyTypeScale_0:IsA("NumberValue");
    end;
    assert(v33, "Couldn't find BodyTypeScale");
    l_BodyTypeScale_0.Value = v28.BodyTypeScale;
    local l_BodyProportionScale_0 = v22.Humanoid:FindFirstChild("BodyProportionScale");
    local v35 = false;
    if l_BodyProportionScale_0 ~= nil then
        v35 = l_BodyProportionScale_0:IsA("NumberValue");
    end;
    assert(v35, "Couldn't find BodyProportionScale");
    l_BodyProportionScale_0.Value = v28.BodyProportionScale;
end;
return function(v37)
    local v38 = l_Analytics_0:use();
    local v39 = v6.useContext(v8.Context);
    local v40 = v10:use():get();
    local v41, v42 = v6.useState(if v37 == nil then {
        type = "none"
    } else {
        type = "hasSelection", 
        target = v37
    });
    if v15() then
        v6.useEffect(function()
            v42(function(v43)
                if v43.type == "none" then
                    local l_v37_0 = v37;
                    if l_v37_0 == nil then
                        return {
                            type = "none"
                        };
                    else
                        return {
                            type = "hasSelection", 
                            target = l_v37_0
                        };
                    end;
                elseif v43.type == "hasSelection" then
                    if v37 == nil then
                        return v43;
                    else
                        return {
                            type = "hasSelection", 
                            target = v37
                        };
                    end;
                else
                    return v43;
                end;
            end);
        end, {
            v37
        });
    end;
    local v45 = v6.useRef({});
    assert(v45.current ~= nil, v9.LUAU_ANALYZE_ERROR);
    local v52 = v6.useCallback(function(v46)
        assert(v37 ~= nil, "Inserting body with no target");
        l_ChangeHistoryService_0:SetWaypoint("Avatar Auto Setup");
        local v47 = v37.intendedName or v37.bodies[1].Name;
        if v47:lower():match((("%*$"):format(v9.BODY_MESH_SUFFIX))) then
            v47 = v47:sub(1, #v47 - #v9.BODY_MESH_SUFFIX);
        end;
        v46.Name = v47;
        assert(v46.PrimaryPart ~= nil, "Auto setup returned model with no primary part");
        if v16() then
            v46:ScaleTo((v37.bodies[1].Size / v37.bodies[1].MeshSize).X);
        end;
        v46.Parent = l_Workspace_0;
        v46.PrimaryPart.PivotOffset = v46:GetBoundingBox() * v46.PrimaryPart.CFrame:Inverse();
        v46:PivotTo(v37.bodies[1].ExtentsCFrame);
        v36(v46, v37.bodies[1]);
        for _, v49 in v37.otherChildren, nil, nil do
            v49:Clone().Parent = v46;
        end;
        local l_CFrame_0 = assert(l_Workspace_0.CurrentCamera, "No Workspace Camera").CFrame;
        local v51 = (l_CFrame_0.Position + l_CFrame_0.LookVector * 10) + Vector3.new(0, v37.bodies[1].Size.Y * 0.5, 0);
        if not v14() and not v18() then
            v46:SetAttribute(v9.ATTRIBUTE_PREFIX .. v9.ATTRIBUTE_CREATED_BY_AUTO_SETUP, true);
        else
            v46:SetAttribute(v9.ATTRIBUTE_CREATED_BY_AUTO_SETUP, true);
        end;
        if v18() then
            v46:SetAttribute(v9.ATTRIBUTE_AUTO_SETUP_INPUT_ASSET, v11(v37.bodies[1].MeshId));
        end;
        v46:PivotTo(CFrame.lookAt(v51, (Vector3.new(l_CFrame_0.Position.X, v51.Y, l_CFrame_0.Position.Z))));
        v40:Set({
            v46
        });
        v42({
            type = "none"
        });
    end, {
        v37
    });
    local v53 = v6.useRef(nil);
    v6.useEffect(function()
        if v53.current == nil then
            return ;
        else
            assert(v53.current ~= nil, v9.LUAU_ANALYZE_ERROR);
            task.cancel(v53.current);
            return ;
        end;
    end, {});
    local v60 = v6.useCallback(function()
        if v41.type ~= "hasSelection" and v41.type ~= "error" then
            return ;
        else
            if v53.current ~= nil then
                task.cancel(v53.current);
                v53.current = nil;
            end;
            assert(v37 ~= nil, "performAutoSetup called with no target");
            local v54 = assert(v37.bodies[1], "Auto setup target has no bodies");
            local v55 = l_GeometryService_0:HashMeshAsync(v54.MeshId);
            local v56 = v45.current[v55];
            if v56 ~= nil then
                v52(v56);
                if v39.autoSetupClickedSignal ~= nil then
                    v39.autoSetupClickedSignal:Fire();
                end;
                return ;
            else
                v42({
                    type = "inAutoSetup", 
                    target = v37
                });
                v53.current = task.spawn(function()
                    local v57 = os.clock();
                    local l_status_0, l_result_0 = pcall(v39.startAutoSetupAsync, v54, function()
                    end);
                    if not l_status_0 then
                        warn("Something went wrong while performing auto setup.\n" .. l_result_0);
                        v42({
                            type = "error", 
                            target = v37, 
                            error = "ErrorSourceFail"
                        });
                        v38:report("autoSetupFailure", os.clock() - v57, v54.MeshId);
                    else
                        v45.current[v55] = l_result_0:Clone();
                        v52(l_result_0);
                        v38:report("autoSetupFinish", os.clock() - v57, v54.MeshId);
                        if v17() then
                            v38:report("autoSetupAssetsGenerated", v11(v54.MeshId), v12(l_result_0));
                            return ;
                        end;
                    end;
                end);
                if v39.autoSetupClickedSignal ~= nil then
                    v39.autoSetupClickedSignal:Fire();
                end;
                return ;
            end;
        end;
    end, {
        v41, 
        v39.startAutoSetupAsync, 
        v37, 
        v52
    });
    local v62 = v6.useCallback(function()
        if v53.current ~= nil then
            task.cancel(v53.current);
        end;
        v42(function(v61)
            if v61.type == "none" then
                return v61;
            else
                return {
                    type = "hasSelection", 
                    target = v61.target
                };
            end;
        end);
    end, {});
    v6.useEffect(function()
        if v37 == nil and (not (v41.type ~= "hasSelection") or v41.type == "none") then
            v42({
                type = "none"
            });
        end;
        v42(function(v63)
            if v37 == nil then
                if not (v63.type ~= "hasSelection") or v63.type == "none" then
                    return {
                        type = "none"
                    };
                end;
            elseif v37 ~= nil and v63.type == "none" then
                return {
                    type = "hasSelection", 
                    target = v37
                };
            end;
            return v63;
        end);
    end, {
        v37
    });
    if v37 ~= nil and #v37.bodies > 1 then
        v41 = {
            type = "error", 
            target = v37, 
            error = "ErrorMultipleBodies"
        };
    end;
    return {
        state = v41, 
        cancelAutoSetup = v62, 
        startAutoSetup = v60
    };
end;
