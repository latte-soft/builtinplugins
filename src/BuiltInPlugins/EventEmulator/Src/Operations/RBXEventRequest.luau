local l_VirtualInputManager_0 = game:GetService("VirtualInputManager");
return function(v1)
    l_VirtualInputManager_0:sendRobloxEvent(v1.Namespace, v1.Detail, v1.DetailType);
end;
