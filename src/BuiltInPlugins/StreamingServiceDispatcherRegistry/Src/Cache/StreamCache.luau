local v0 = {};
local v1 = {};
local v2 = {};
local v3 = {};
local v4 = "";
v0.newRequest = function(v5)
    v1[v5] = {};
    v2[v5] = {};
end;
v0.activeStreamId = function()
    return v4;
end;
v0.setActiveStreamId = function(v6)
    v4 = v6;
end;
v0.requestStreamSubscription = function(v7, v8, v9, v10, v11, v12)
    v1[v7][v8] = {};
    v3[v8] = {
        handlePacket = v10, 
        startActiveStream = v11, 
        streamEnded = v12
    };
    if v9 then
        table.insert(v2[v7], v8);
        if v4 == "" then
            v4 = v8;
            v11(v7);
        end;
    end;
end;
v0.storeStreamPacket = function(v13, v14, v15)
    table.insert(v1[v13][v14], v15);
end;
v0.activeStreamEnded = function(v16, v17)
    if v3[v17].streamEnded then
        v3[v17].streamEnded();
    end;
    v4 = "";
    v1[v16][v17] = nil;
    v3[v17] = nil;
    table.remove(v2[v16], 1);
    local v18 = v2[v16][1];
    if v18 then
        v4 = v18;
        v3[v18].startActiveStream(v16);
    end;
    return v2[v16][1];
end;
v0.packetExists = function(v19, v20)
    if v1[v19][v20] and #v1[v19][v20] > 0 then
        return true;
    else
        return false;
    end;
end;
v0.handleEarliestPacketForStream = function(v21, v22)
    local v23 = table.remove(v1[v21][v22], 1);
    if v3[v22].handlePacket then
        v3[v22].handlePacket(v23);
    end;
    return v23;
end;
v0.requestEnded = function(v24)
    v1[v24] = nil;
    v2[v24] = nil;
    v4 = "";
end;
v0.clear = function()
    v1 = {};
    v2 = {};
    v3 = {};
    v4 = "";
end;
v0.getStreamCache = function()
    return v1;
end;
return v0;
