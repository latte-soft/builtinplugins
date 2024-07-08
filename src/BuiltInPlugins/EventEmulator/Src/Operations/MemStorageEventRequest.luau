local l_MemStorageService_0 = game:GetService("MemStorageService");
local v1 = {};
local function _(v2)
    if not v2 then
        warn("Operation Invalid: Must provide key");
        return false;
    else
        return true;
    end;
end;
v1.GetValue = function(v4)
    local v5;
    if not v4 then
        warn("Operation Invalid: Must provide key");
        v5 = false;
    else
        v5 = true;
    end;
    if not v5 then
        return ;
    else
        return l_MemStorageService_0:GetItem(v4);
    end;
end;
v1.SetValue = function(v6, v7)
    local v8;
    if not v6 then
        warn("Operation Invalid: Must provide key");
        v8 = false;
    else
        v8 = true;
    end;
    if not v8 then
        return false;
    else
        l_MemStorageService_0:SetItem(v6, v7);
        return true;
    end;
end;
return v1;
