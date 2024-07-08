local v0 = require(script.Parent.Parent.Parent.Packages.Dash);
local l_collectArray_0 = v0.collectArray;
local l_collectSet_0 = v0.collectSet;
local l_copy_0 = v0.copy;
local l_forEach_0 = v0.forEach;
local l_reduce_0 = v0.reduce;
local function v10(v6, v7)
    return l_reduce_0(v7, function(v8, v9)
        if not v8 or not v8.Children then
            return nil;
        else
            return v8.Children[v9];
        end;
    end, v6);
end;
local function v11(v12, v13)
    if v12 then
        l_forEach_0(v13, function(v14, v15)
            local v16 = v12[v15];
            if v16 then
                if not v14.Children then
                    v14.Children = v16.Children;
                    return ;
                else
                    v14.Children = v11(v16.Children, v14.Children);
                    return ;
                end;
            else
                return ;
            end;
        end);
    end;
    return v13;
end;
return function(v17)
    local v20 = l_collectArray_0(v17.expanded, function(v18, v19)
        return not not v19 and v18.Path or nil;
    end);
    local v23 = l_collectArray_0(v17.selected, function(v21, v22)
        return not not v22 and v21.Path or nil;
    end);
    local v24 = nil;
    if #v17.path == 0 then
        v24 = {
            Children = v17.children
        };
    else
        v24 = l_copy_0(v17.root);
        local l_v24_0 = v24;
        do
            local l_l_v24_0_0 = l_v24_0;
            l_forEach_0(v17.path, function(v27)
                if not (l_l_v24_0_0 ~= nil) or l_l_v24_0_0.Children == nil then
                    return ;
                elseif not l_l_v24_0_0.Children[v27] then
                    l_l_v24_0_0 = nil;
                    return ;
                else
                    local v28 = l_copy_0(l_l_v24_0_0.Children[v27]);
                    l_l_v24_0_0.Children[v27] = v28;
                    l_l_v24_0_0 = v28;
                    return ;
                end;
            end);
            if l_l_v24_0_0 then
                local l_Children_0 = l_l_v24_0_0.Children;
                local l_children_0 = v17.children;
                if l_Children_0 then
                    l_forEach_0(l_children_0, function(v31, v32)
                        local v33 = l_Children_0[v32];
                        if v33 then
                            if not v31.Children then
                                v31.Children = v33.Children;
                                return ;
                            else
                                v31.Children = v11(v33.Children, v31.Children);
                                return ;
                            end;
                        else
                            return ;
                        end;
                    end);
                end;
                l_l_v24_0_0.Children = l_children_0;
            end;
        end;
    end;
    return {
        root = v24, 
        selected = l_collectSet_0(v23, function(_, v35)
            return v10(v24, v35);
        end), 
        expanded = l_collectSet_0(v20, function(_, v37)
            return v10(v24, v37);
        end)
    };
end;
