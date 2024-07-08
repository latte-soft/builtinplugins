local v0 = require(script:FindFirstAncestor("Toolbox").Core.Util.findParentModelWithSourceAssetID);
return {
    raycastObjectsInSphere = function(v1)
        if v1 then
            local v2 = {};
            local v3 = 0;
            for v4 = 1, 256 do
                local v5 = math.acos(1 - (2 * v4 - 1) / 256);
                local v6 = 3.8832220774509327 * v4;
                local v7 = Ray.new(v1.CFrame.Position, Vector3.new(math.sin(v5) * math.cos(v6), math.sin(v5) * math.sin(v6), (math.cos(v5))) * 500);
                local v8 = workspace:Raycast(v7.Origin, v7.Direction * 500);
                if not (not v8 or not v8.Instance) then
                    local v9 = v0(v8.Instance);
                    if v9 then
                        local l_SourceAssetId_0 = v9.SourceAssetId;
                        if not (not (l_SourceAssetId_0 and l_SourceAssetId_0 ~= -1) or v2[l_SourceAssetId_0]) then
                            v3 = v3 + 1;
                            v2[l_SourceAssetId_0] = v8.Distance;
                            if not (v3 < 10) then
                                break;
                            end;
                        end;
                    end;
                end;
            end;
            return v2;
        else
            return {};
        end;
    end, 
    raycastObjectsVisibleInViewport = function(v11)
        if v11 then
            local l_ViewportSize_0 = v11.ViewportSize;
            local v13 = {};
            local v14 = 0;
            local v15 = 0;
            local v16 = 1;
            local v17 = 0;
            local v18 = 0;
            local v19 = 1;
            local v20 = 0;
            for _ = 1, 256 do
                local v22 = Vector2.new(((v15 + 0.5) + 7) * (l_ViewportSize_0.X / 16), ((v17 + 0.5) + 7) * (l_ViewportSize_0.Y / 16));
                local v23 = v11:ScreenPointToRay(v22.X, v22.Y);
                local v24 = workspace:Raycast(v23.Origin, v23.Direction * 500);
                if not (not v24 or not v24.Instance) then
                    local v25 = v0(v24.Instance);
                    if v25 then
                        local l_SourceAssetId_1 = v25.SourceAssetId;
                        if not (not (l_SourceAssetId_1 and l_SourceAssetId_1 ~= -1) or v13[l_SourceAssetId_1]) then
                            v14 = v14 + 1;
                            v13[l_SourceAssetId_1] = v24.Distance;
                            if not (v14 < 10) then
                                break;
                            end;
                        end;
                    end;
                end;
                v15 = v15 + v16;
                v17 = v17 + v18;
                v20 = v20 + 1;
                if v20 == v19 then
                    v20 = 0;
                    local l_v16_0 = v16;
                    v16 = -v18;
                    v18 = l_v16_0;
                    if v18 == 0 then
                        v19 = v19 + 1;
                    end;
                end;
            end;
            return v13;
        else
            return {};
        end;
    end
};
