if not game:GetFastFlag("ImprovePluginSpeed_AssetManager") then
    return require(script.Parent.main)(plugin);
else
    return ;
end;
