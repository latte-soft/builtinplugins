local l_Http_0 = script.Parent._IndexLegacy.Http.Packages.Http;
if l_Http_0.ClassName == "ModuleScript" then
    return require(l_Http_0);
else
    return l_Http_0;
end;
