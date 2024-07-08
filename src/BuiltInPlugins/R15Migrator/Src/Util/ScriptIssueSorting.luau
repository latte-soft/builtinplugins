local l_deepCopy_0 = require(script:FindFirstAncestor("R15Migrator").Packages.Framework).Util.deepCopy;
return {
    addScriptIssue = function(v1, v2, v3, v4, v5)
        if not (not v2.scriptId or v3[v2.scriptId]) then
            v3[v2.scriptId] = {};
        end;
        if v2.range then
            if not v5[v2.scriptId] then
                table.insert(v3[v2.scriptId], l_deepCopy_0(v2));
            end;
            return ;
        else
            v3[v2.scriptId] = v1:sortDiagListForConversion(v4[v2.scriptId]);
            v5[v2.scriptId] = true;
            return ;
        end;
    end, 
    sortSelectionForConversion = function(v6, v7, v8)
        local v9 = {};
        local v10 = {};
        for _, v12 in v7, nil, nil do
            v6:addScriptIssue(v12, v9, v8, v10);
        end;
        for v13, v14 in v9, nil, nil do
            if not v10[v13] then
                v6:sortScriptItemsByRange(v14);
            end;
        end;
        return v9;
    end, 
    sortScriptItemsByRange = function(_, v16)
        table.sort(v16, function(v17, v18)
            return v18.range < v17.range;
        end);
    end, 
    sortDiagListForConversion = function(v19, v20)
        if v20 then
            local v21 = l_deepCopy_0(v20:Get());
            v19:sortScriptItemsByRange(v21);
            return v21;
        else
            return {};
        end;
    end
};
