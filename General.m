classdef (Abstract) General
    %GENERAL Every 10 iterations, the general receives updates about the
    %battle. The general then updates its instructions in the property
    %class.
    %   Detailed explanation goes here
    
    properties
        numShips
    end
    
    methods (Abstract)
        r = update(threats, ships) % Engine Script calls this method
    end
    
end

