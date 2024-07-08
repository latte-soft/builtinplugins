local l_testez_0 = script.Parent.Parent._Index.roblox_testez.testez;
if l_testez_0.ClassName == "ModuleScript" then
    return require(l_testez_0);
else
    return l_testez_0;
end;
