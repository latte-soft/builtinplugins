Particle = require(script.Parent.class)(function(v0, v1, v2)
    v0.velocity = Vector3.new(0, 0, 0);
    v0.mass = v2;
    v0.acceleration = Vector3.new(0, 0, 0);
    v0.momentum = Vector3.new(0, 0, 0);
    v0.force = Vector3.new(0, 0, 0);
    v0.position = v1;
end);
Particle.addForce = function(v3, v4)
    v3.force = v3.force + v4;
end;
Particle.update = function(v5, v6, v7)
    v5.acceleration = (1 / v5.mass) * v5.force;
    v5.velocity = v5.velocity * (1 - 1.5E-4 * v6);
    v5.velocity = v5.velocity + v5.acceleration * v6;
    if not v7 then
        v5.position = v5.position + v5.velocity * v6;
    end;
    v5.force = Vector3.new(0, 0, 0);
end;
return Particle;
