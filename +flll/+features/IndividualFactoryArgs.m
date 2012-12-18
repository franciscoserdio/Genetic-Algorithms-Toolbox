% Arguments for individual factories
classdef IndividualFactoryArgs < jku.ga.IndividualFactoryArgs
    % INDIVIDUALFACTORYARGS Arguments need to create an individual
    %   .- Number of dimensions of the problem
    properties
        Dimensions = 0;
    end
    
    methods
        function this = IndividualFactoryArgs(dimensions)
            this.Dimensions = dimensions;
        end
    end
end