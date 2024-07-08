return {
    fetchOldColumnSizes = function(v0, v1, v2, v3)
        local v4 = {};
        for v5 = 1, #v2 do
            v4[v2[v5]] = v3[v5];
        end;
        for v6 = #v2 + 1, v0 do
            v4[v1[v6 - #v2]] = v3[v6];
        end;
        return v4;
    end, 
    fetchDeletedColumnsSize = function(v7, v8, v9, v10, v11)
        local v12 = 0;
        for v13 = v7 + 1, v8 do
            if v11[v9[v13 - v7]] == nil then
                v12 = v12 + v10[v9[v13 - v7]].Scale;
            end;
        end;
        return v12;
    end, 
    updatedSizesAfterRemovingColumns = function(v14, v15, v16, v17, v18)
        local v19 = {};
        local v20 = 1 - v15;
        for v21 = 1, v14 do
            table.insert(v19, (UDim.new(v16[if not v17[v21] then v18[v21 - #v17] else v17[v21]].Scale / v20, 0)));
        end;
        return v19;
    end, 
    updatedSizesAfterAddingColumns = function(v22, v23, v24, v25, v26)
        local v27 = {};
        local v28 = v22 - v23;
        local v29 = UDim.new(1 / v22, 0);
        for v30 = 1, v22 do
            local v31 = if not v26[v30] then v25[v30 - #v26] else v26[v30];
            if v24[v31] == nil then
                table.insert(v27, v29);
            else
                table.insert(v27, (UDim.new(v24[v31].Scale * (1 - v28 * v29.Scale), 0)));
            end;
        end;
        return v27;
    end, 
    fetchScaleFromColumnSizes = function(v32)
        local v33 = {};
        for _, v35 in ipairs(v32) do
            table.insert(v33, v35.Scale);
        end;
        return v33;
    end, 
    fetchSizesFromColumnScales = function(v36)
        local v37 = {};
        for _, v39 in ipairs(v36) do
            table.insert(v37, UDim.new(v39, 0));
        end;
        return v37;
    end
};
