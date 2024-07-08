return function(v0, v1, v2)
    local l_v0_PluginMenu_0 = v0:CreatePluginMenu(v2);
    for _, v5 in v1, nil, nil do
        l_v0_PluginMenu_0:AddNewAction(v5.Text, v5.Text).Triggered:connect(v5.OnClick);
    end;
    l_v0_PluginMenu_0:ShowAsync();
    l_v0_PluginMenu_0:Destroy();
end;
