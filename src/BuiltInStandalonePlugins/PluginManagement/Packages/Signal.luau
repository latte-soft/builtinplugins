local l_Signal_0 = script.Parent._IndexLegacy.Signal.Packages.Signal;
if l_Signal_0.ClassName == "ModuleScript" then
    return require(l_Signal_0);
else
    return l_Signal_0;
end;
