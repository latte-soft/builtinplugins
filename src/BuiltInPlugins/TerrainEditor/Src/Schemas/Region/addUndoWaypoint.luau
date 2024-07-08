return function(v0, v1, _)
    assert(v0.getMouseTarget == nil, "You accidentally called schema:addUndoWaypoint intead of schema.addUndoWaypoint");
    v0.addWaypoint(v1);
end;
