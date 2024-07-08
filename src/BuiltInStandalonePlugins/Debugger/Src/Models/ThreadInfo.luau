return {
    new = function()
        return {
            threadId = -1, 
            displayString = ""
        };
    end, 
    fromData = function(v0)
        return {
            threadId = v0.threadId or -1, 
            displayString = v0.displayString or ""
        };
    end
};
