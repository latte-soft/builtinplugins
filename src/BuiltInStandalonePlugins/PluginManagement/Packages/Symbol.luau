local l_Symbol_0 = script.Parent._IndexLegacy.Symbol.Packages.Symbol;
if l_Symbol_0.ClassName == "ModuleScript" then
    return require(l_Symbol_0);
else
    return l_Symbol_0;
end;
