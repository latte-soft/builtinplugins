if plugin then
    local l_Parent_0 = script.Parent.Parent;
    local v1 = require(l_Parent_0.Src.MainPlugin);
    local v2 = nil;
    local v3 = nil;
    local function _()
        plugin.Name = l_Parent_0.Name;
        v2 = v1.new();
        v2:renderSelection();
    end;
    local function _()
        if v2 then
            v2:destroy();
            v2 = nil;
        end;
    end;
    local function _()
        if not settings().Studio["Show Light Guides"] then
            if v2 then
                v2:destroy();
                v2 = nil;
            end;
            return ;
        else
            plugin.Name = l_Parent_0.Name;
            v2 = v1.new();
            v2:renderSelection();
            return ;
        end;
    end;
    plugin.Unloading:Connect(function()
        if not (not v2 or not v2) then
            v2:destroy();
            v2 = nil;
        end;
        if v3 then
            v3:Disconnect();
            v3 = nil;
        end;
    end);
    v3 = settings().Studio:GetPropertyChangedSignal("Show Light Guides"):Connect(function()
        if not settings().Studio["Show Light Guides"] then
            if v2 then
                v2:destroy();
                v2 = nil;
            end;
            return ;
        else
            plugin.Name = l_Parent_0.Name;
            v2 = v1.new();
            v2:renderSelection();
            return ;
        end;
    end);
    if not settings().Studio["Show Light Guides"] then
        if v2 then
            v2:destroy();
            v2 = nil;
        end;
    else
        plugin.Name = l_Parent_0.Name;
        v2 = v1.new();
        v2:renderSelection();
    end;
    return ;
else
    return ;
end;
