local v0 = {};
v0.__index = v0;
v0.new = function(v1)
    return (setmetatable({
        __networking = v1
    }, v0));
end;
local function _(v2)
    return v2:get("apis", "/user-agreements/v1/agreements-resolution/App");
end;
local function v7(v4, v5, v6)
    return v4:post("apis", "/studio-moderation/v1/" .. v5 .. "/contacts", {
        Body = {
            email = v6
        }
    });
end;
v0.getPlayerAcceptances = function(v8)
    return next(v8.__networking:get("apis", "/user-agreements/v1/agreements-resolution/App"):await().responseBody) == nil;
end;
v0.postContactEmail = function(v9, v10, v11)
    assert(type(v10) == "number", string.format("universeId must be a number, received %s", (type(v10))));
    assert(type(v11) == "string", string.format("contactemail must be a string, received %s", (type(v11))));
    local l___networking_0 = v9.__networking;
    local v13 = nil;
    v7(l___networking_0, v10, v11):catch(function(v14)
        v13 = v14.responseCode;
    end):await();
    return v13;
end;
return v0;
