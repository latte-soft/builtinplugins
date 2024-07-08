SpringDamper = require(script.Parent.class)(function(v0, v1, v2)
    v0.springConstant = 10;
    v0.dampingFactor = 2;
    v0.restingLength = (v1.position - v2.position).Magnitude;
    v0.p1 = v1;
    v0.p2 = v2;
end);
SpringDamper.computeForce = function(v3)
    local v4 = v3.p2.position - v3.p1.position;
    local l_Magnitude_0 = v4.Magnitude;
    local v6 = v4 / math.max(l_Magnitude_0, 1.0E-5);
    local v7 = (-v3.springConstant * math.clamp(v3.restingLength - l_Magnitude_0, -1, 1) - v3.dampingFactor * (v3.p1.velocity:Dot(v6) - v3.p2.velocity:Dot(v6))) * v6;
    local v8 = -v7;
    v3.p1:addForce(v7);
    v3.p2:addForce(v8);
end;
return SpringDamper;
