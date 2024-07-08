local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Core.Actions.NetworkError);
local v2 = require(l_Parent_0.Core.Actions.UploadResult);
local v3 = require(l_Parent_0.Core.Util.DebugFlags);
local l_Promise_0 = require(l_Parent_0.Packages.Framework).Util.Promise;
return function(v5, v6, v7, v8)
    return function(v9)
        local function v10()
            v9:dispatch(v2(true));
        end;
        local function v12(_)
            if v3.shouldDebugWarnings() then
                warn("Lua toolbox: Could not configure tags");
            end;
            v9:dispatch(v1("Could not configure tags"));
            v9:dispatch(v2(false));
        end;
        local v13 = {};
        for _, v15 in pairs(v7) do
            v13[v15.tag.tagId] = true;
        end;
        local v16 = {};
        local v17 = {};
        if v8 then
            for _, v19 in pairs(v8) do
                v16[v19.tagId] = true;
                if not v13[v19.tagId] then
                    table.insert(v17, v19.tagId);
                end;
            end;
        end;
        local v20 = {};
        for _, v22 in pairs(v7) do
            if not v16[v22.tag.tagId] then
                table.insert(v20, v22.id);
            end;
        end;
        local v23 = {
            l_Promise_0.resolve()
        };
        for _, v25 in pairs(v20) do
            table.insert(v23, v5:deleteAssetItemTag(v25));
        end;
        l_Promise_0.all(unpack(v23)):andThen(function()
            local v26 = {
                l_Promise_0.resolve()
            };
            for _, v28 in pairs(v17) do
                table.insert(v26, v5:addAssetTag(v6, v28));
            end;
            l_Promise_0.all(unpack(v26)):andThen(v10, v12);
        end, v12);
    end;
end;
