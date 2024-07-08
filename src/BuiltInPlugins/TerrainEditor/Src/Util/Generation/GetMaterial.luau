local v0 = require(script:FindFirstAncestor("TerrainEditor").Src.Types);
return {
    FromPreset = function(v1, v2)
        local v3 = v1.Unit == v0.MaterialUnit.Percentage;
        local l_MaterialList_0 = v1.MaterialList;
        local l_FillMaterial_0 = v1.FillMaterial;
        if not l_MaterialList_0 or #l_MaterialList_0 == 0 then
            return nil;
        else
            local l_HeightInPercentage_0 = v2.HeightInPercentage;
            local l_HeightInStud_0 = v2.HeightInStud;
            local l_Position_0 = v2.Position;
            local l_Slope_0 = v2.Slope;
            if not (not v2.FillBottom or not l_FillMaterial_0) and l_Slope_0 < 10 then
                return l_FillMaterial_0;
            else
                local v10 = {};
                for _, v12 in l_MaterialList_0, nil, nil do
                    local l_MinHeight_0 = v12.MinHeight;
                    local l_MaxHeight_0 = v12.MaxHeight;
                    local v15 = if not v3 then l_HeightInStud_0 else l_HeightInPercentage_0;
                    if l_MinHeight_0 <= v15 and v15 <= l_MaxHeight_0 then
                        table.insert(v10, v12);
                    end;
                end;
                if #v10 <= 0 then
                    return nil;
                elseif #v10 == 1 then
                    return v10[1].Material;
                else
                    local v16 = {};
                    for _, v18 in v10, nil, nil do
                        local l_MinSlope_0 = v18.MinSlope;
                        local l_MaxSlope_0 = v18.MaxSlope;
                        if l_MinSlope_0 <= l_Slope_0 and l_Slope_0 <= l_MaxSlope_0 then
                            table.insert(v16, v18);
                        end;
                    end;
                    if #v16 == 1 then
                        return v16[1].Material;
                    else
                        local v21 = if #v16 > 1 then v16 else v10;
                        return v21[math.ceil((math.clamp(math.noise(l_Position_0.X, l_Position_0.Z, 0.12345), -1, 1) * 0.5 + 0.5) * #v21)].Material;
                    end;
                end;
            end;
        end;
    end, 
    Blend = function(v22, v23, v24)
        local l_BlendingFactor_0 = v24.BlendingFactor;
        local l_EdgePosition_0 = v24.EdgePosition;
        local l_Width_0 = v24.Width;
        local v28 = l_EdgePosition_0 - l_Width_0 / 2;
        local v29 = l_EdgePosition_0 + l_Width_0 / 2;
        if l_BlendingFactor_0 < v28 then
            return v22;
        elseif v29 < l_BlendingFactor_0 then
            return v23;
        elseif (l_BlendingFactor_0 - v28) / (v29 - v28) < math.random() then
            return v22;
        else
            return v23;
        end;
    end
};
