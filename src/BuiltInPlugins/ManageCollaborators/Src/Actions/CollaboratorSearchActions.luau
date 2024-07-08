local l_Action_0 = require(script.Parent.Parent.Parent.Packages.Framework).Util.Action;
return {
    LoadWebResults = l_Action_0("LoadWebResults", function(v1)
        return {
            searchTerm = v1
        };
    end), 
    LoadedWebResults = l_Action_0("LoadedWebResults", function(v2, v3, v4)
        return {
            success = v2, 
            key = v3, 
            results = v4
        };
    end), 
    SearchTextChanged = l_Action_0("SearchTextChanged", function(v5)
        return {
            text = v5
        };
    end)
};
