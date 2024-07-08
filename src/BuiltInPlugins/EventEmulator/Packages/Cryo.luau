local l_cryo_0 = script.Parent._Index.roblox_cryo.cryo;
if l_cryo_0.ClassName == "ModuleScript" then
    return require(l_cryo_0);
else
    return l_cryo_0;
end;
