local v0 = require(script.Parent.Parent.Parent.Packages.Dash);
local l_join_0 = v0.join;
local v2 = {};
v2.new = function(v3, v4, v5, v6)
    local v7 = {
        connections = {}, 
        updateHierarchy = v4, 
        connectedProperties = v5, 
        instanceTypes = v6 or {
            "StyleBase"
        }
    };
    v7.isFilteredType = function(v8)
        for _, v10 in v7.instanceTypes, nil, nil do
            if v8:IsA(v10) then
                return true;
            end;
        end;
        return false;
    end;
    v7.removeInstanceConnections = function(v11)
        if v7.connections[v11] then
            for _, v13 in v7.connections[v11], nil, nil do
                if v13 then
                    v13:Disconnect();
                end;
            end;
            v7.connections[v11] = nil;
        end;
    end;
    v7.addInstanceConnections = function(v14)
        local l_connectedProperties_0 = v7.connectedProperties;
        if l_connectedProperties_0 and v14 then
            local v16 = {};
            for _, v18 in l_connectedProperties_0, nil, nil do
                if pcall(function()
                    local _ = v14[v18];
                end) then
                    v16[v18] = v14:GetPropertyChangedSignal(v18):Connect(function()
                        if v14.Parent == nil then
                            v7.removeInstanceConnections(v14);
                        end;
                        v7.updateHierarchy(v14, "PropertyChanged", v18);
                    end);
                end;
            end;
            if v14:IsA("StyleRule") then
                v16.StyleRulePropertyChanged = v14.StyleRulePropertyChanged:Connect(function()
                    v7.updateHierarchy(v14, "PropertyChanged");
                end);
            end;
            if v14:IsA("StyleSheet") then
                v16.StyleSheetCategoryChanged = v14:GetAttributeChangedSignal("StyleCategory"):Connect(function()
                    v7.updateHierarchy(v14, "AttributeChanged");
                end);
            end;
            if not v7.connections[v14] then
                v7.connections[v14] = v16;
                return ;
            else
                v7.connections[v14] = l_join_0(v7.connections[v14], v16);
                return ;
            end;
        else
            return ;
        end;
    end;
    v7.addRootInstanceConnections = function(v20)
        if v20 then
            v7.connections[v20] = {
                descendantAdded = v20.DescendantAdded:Connect(function(v21)
                    v7.addInstanceConnections(v21);
                    v7.updateHierarchy(v20, "DescendantAdded", v21);
                end), 
                descendantRemoving = v20.DescendantRemoving:Connect(function(v22)
                    v7.removeInstanceConnections(v22);
                    v7.updateHierarchy(v20, "DescendantRemoving", v22);
                end), 
                instanceDestroying = v20.Destroying:Connect(function()
                    v7.removeInstanceConnections(v20);
                    v7.updateHierarchy(v20, "Destroying");
                end)
            };
            v7.addInstanceConnections(v20);
            for _, v24 in (v20:GetDescendants()), nil, nil do
                if v7.isFilteredType(v24) then
                    v7.addInstanceConnections(v24);
                end;
            end;
            return ;
        else
            return ;
        end;
    end;
    v7.removeAllConnections = function()
        if v7.connections then
            for v25, v26 in v7.connections, nil, nil do
                for _, v28 in v26, nil, nil do
                    if v28 then
                        v28:Disconnect();
                    end;
                end;
                v7.connections[v25] = nil;
            end;
            return ;
        else
            return ;
        end;
    end;
    v7.destroyListener = function()
        v7.removeAllConnections();
        v7.connectedProperties = {};
        v7.updateHierarchy = v0.noop;
    end;
    for _, v30 in v3, nil, nil do
        v7.addRootInstanceConnections(v30);
    end;
    return (setmetatable(v7, {
        __index = v2
    }));
end;
return v2;
