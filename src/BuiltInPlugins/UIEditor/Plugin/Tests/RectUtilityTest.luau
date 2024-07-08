local v0 = require(script.Parent.Parent.Log);
local v1 = require(script.Parent.Parent.RectUtility);
local function v2()
    assert(v1:containsPoint(Rect.new(Vector2.new(1, 1), Vector2.new(3, 3)), (Vector2.new(2, 2))) == true, "Point was not inside rectangle");
end;
local function v3()
    assert(v1:containsPoint(Rect.new(Vector2.new(1, 1), Vector2.new(3, 3)), (Vector2.new(2, 1))) == true, "Point was not inside rectangle");
end;
local function v4()
    assert(v1:containsPoint(Rect.new(Vector2.new(1, 1), Vector2.new(3, 3)), (Vector2.new(0, 0))) == false, "Point was not outside rectangle");
end;
local function v5()
    assert(v1:containsPoint(Rect.new(Vector2.new(1, 1), Vector2.new(3, 3)), (Vector2.new(2, 0.5))) == false, "Point was not outside rectangle");
end;
local function v6()
    assert(v1:containsPoint(Rect.new(Vector2.new(1, 1), Vector2.new(3, 3)), (Vector2.new(2, 3.5))) == false, "Point was not outside rectangle");
end;
local function v7()
    assert(v1:containsPoint(Rect.new(Vector2.new(1, 1), Vector2.new(3, 3)), (Vector2.new(0.5, 2))) == false, "Point was not outside rectangle");
end;
local function v8()
    assert(v1:containsPoint(Rect.new(Vector2.new(1, 1), Vector2.new(3, 3)), (Vector2.new(0.5, 2))) == false, "Point was not outside rectangle");
end;
local function _()
    v0:log("Running RectUtilityTest");
    v2();
    v3();
    v4();
    v5();
    v6();
    v7();
    v8();
end;
v0:log("Running RectUtilityTest");
v2();
v3();
v4();
v5();
v6();
v7();
v8();
