local l_Action_0 = script.Parent._IndexLegacy.Action.Packages.Action;
if l_Action_0.ClassName == "ModuleScript" then
    return require(l_Action_0);
else
    return l_Action_0;
end;
