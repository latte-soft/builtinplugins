local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Cryo);
return require(l_Parent_0.Packages.Framework).Util.Action(script.Name, function(v2, v3)
    assert(type(v2) == "table", string.format("SetAssets requires a table, not %s", (type(v2))));
    local l_assets_0 = v2.assets;
    local l_nextPageCursor_0 = v2.nextPageCursor;
    local l_previousPageCursor_0 = v2.previousPageCursor;
    local l_pageNumber_0 = v2.pageNumber;
    assert(type(l_assets_0) == "table", string.format("SetAssets requires a places table, not %s", (type(l_assets_0))));
    if l_nextPageCursor_0 then
        assert(type(l_nextPageCursor_0) == "string", string.format("SetAssets requires a string, not %s", (type(l_nextPageCursor_0))));
    end;
    if l_previousPageCursor_0 then
        assert(type(l_previousPageCursor_0) == "string", string.format("SetAssets requires a string, not %s", (type(l_previousPageCursor_0))));
    end;
    if l_pageNumber_0 then
        assert(type(l_pageNumber_0) == "number", string.format("SetAssets requires a number, not %s", (type(l_pageNumber_0))));
    end;
    if v3 then
        assert(type(v3) == "number", string.format("SetAssets requires index to be a number, not %s", (type(v3))));
    end;
    return {
        assetsTable = {
            assets = l_assets_0, 
            nextPageCursor = l_nextPageCursor_0 or v1.None, 
            previousPageCursor = l_previousPageCursor_0 or v1.None, 
            pageNumber = l_pageNumber_0 or v1.None, 
            index = v3 ~= nil and v3 or nil
        }
    };
end);
