classdef IndividualFactoryArgs < fsf.ga.IndividualFactoryArgs
    % INDIVIDUALFACTORYARGS Arguments need to create an individual

    properties
        Dimensions = 0; % Number of dimensions of the problem
    end
    
    methods
        function this = IndividualFactoryArgs(dimensions)
            % Creates a fsf.ga.IndividualFactoryArgs instance.
            %
            % @return this: The fsf.ga.IndividualFactoryArgs instance.
            
            this.Dimensions = dimensions;
        end
    end
end