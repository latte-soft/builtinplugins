return {
    convertQualityFilterDataToTagsCSV = function(v0)
        local v1 = nil;
        if v0 then
            local v2 = {};
            for v3, v4 in pairs(v0) do
                if v4 then
                    table.insert(v2, v3);
                end;
            end;
            v1 = table.concat(v2, ",");
        end;
        return v1;
    end, 
    convertQualityFilterDataToQueryStrings = function(v5)
        local v6 = nil;
        if v5 then
            local v7 = {};
            for v8, v9 in pairs(v5) do
                if v9 then
                    table.insert(v7, v8);
                end;
            end;
            local v10 = 0;
            for _, v12 in ipairs(v7) do
                local v13 = {};
                for v14 in string.gmatch(v12, "[^.]+") do
                    table.insert(v13, v14);
                end;
                if #v13 == 2 then
                    if not v6 then
                        v6 = {};
                    end;
                    v6["qualityFilter[" .. v10 .. "].category"] = v13[1];
                    v6["qualityFilter[" .. v10 .. "].value"] = v13[2];
                    v10 = v10 + 1;
                end;
            end;
        end;
        return v6;
    end
};
