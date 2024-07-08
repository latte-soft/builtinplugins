return {
    formatDeviceOrientation = function(v0, v1, v2)
        if v1 == "default" then
            return v2:getText("RecordTabView", "ComputerEmulationDeviceOrientation");
        else
            return v0;
        end;
    end, 
    formatDeviceName = function(v3, v4)
        if v3 == "default" then
            return v4:getText("RecordTabView", "ComputerEmulationDeviceName");
        else
            return v3;
        end;
    end, 
    format2dResolution = function(v5, v6)
        return string.format("%d x %d %s", math.round(v5.X), math.round(v5.Y), v6);
    end
};
