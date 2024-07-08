local l_ServiceWrapper_0 = require(script.Parent.Parent.Parent.Packages.Framework).TestHelpers.ServiceWrapper;
return function()
    return l_ServiceWrapper_0.new("MaterialGenerationService", true):asService();
end;
