classdef IClonable < handle
    %ICLONABLE Interface for clonable classes

    methods(Abstract)
        clon = Clone(this);
        % Creates a clon of the object.
        %
        % @return clon: A clon of the object.
        
    end
end

