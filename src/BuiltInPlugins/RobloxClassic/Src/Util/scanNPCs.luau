local v0 = require(script.Parent.Parent.Parent.Src.Modules.NpcManager);
return function(v1)
    print(v1:getText("InsertComponents", "AddingNPCs"));
    local v2 = v0.GetNpcs();
    local l_BindableEvent_0 = Instance.new("BindableEvent");
    local v4 = 0 + 1;
    for _, v6 in v2, nil, nil do
        task.delay(0, function()
            v0.UpdateModel(v6, v1);
            v4 = v4 - 1;
            if v4 == 0 then
                l_BindableEvent_0:Fire();
            end;
        end);
    end;
    l_BindableEvent_0.Event:Wait();
end;
