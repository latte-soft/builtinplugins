local v0 = {};
local v1 = require(script.Parent.Enum.Axis);
local v2 = require(script.Parent.DistanceLine);
local _ = require(script.Parent.Log);
local v4 = require(script.Parent.SelectionManager);
local v5 = nil;
local v6 = nil;
local v7 = nil;
local v8 = game:DefineFastFlag("UIEditorDistanceLinesDontUpdateForUnparentedObject", false);
local function _()
    v0:setVisible(false);
    v5 = nil;
end;
v0.onSelectionChanged = function(_)
    local v11 = v4:getFilteredSelection();
    if #v11 ~= 1 then
        v0:setVisible(false);
        v5 = nil;
        return ;
    else
        local v12 = v11[1];
        if v12.Parent:IsA("GuiBase2d") then
            v5 = v12;
            v0:update();
            v0:setVisible(true);
            return ;
        else
            v0:setVisible(false);
            v5 = nil;
            return ;
        end;
    end;
end;
v0.On = function(_)
    v6 = v2.new(v1.X);
    v7 = v2.new(v1.Y);
end;
v0.Off = function(_)
    v6:destroy();
    v7:destroy();
    v6 = nil;
    v7 = nil;
end;
v0.update = function(_)
    if v5 == nil then
        return ;
    else
        v6:update(v5);
        v7:update(v5);
        return ;
    end;
end;
v0.setVisible = function(_, v17)
    if v5 then
        if not v8 or v5.Parent then
            local v18 = math.abs(v5.AbsoluteRotation) >= 0.001;
            if not v17 or not v18 then
                v6:setVisible(v17);
                v7:setVisible(v17);
                return ;
            else
                v6:setVisible(false);
                v7:setVisible(false);
                return ;
            end;
        else
            return ;
        end;
    else
        return ;
    end;
end;
return v0;
