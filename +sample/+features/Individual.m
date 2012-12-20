classdef Individual < fsf.ga.Individual & handle
    %INDIVIDUAL: Individual for the feature selection
    
    properties(GetAccess = public)
        Features; % Vector of features. Used for feature selection
    end
    
    methods
        function this = Individual(factoryArgs)
            % Creates a sample.features.Individual instance.
            %
            % @param factoryArgs: the sample.features.IndividualFactoryArgs giving to the individuals.
            %
            % @return this: The sample.features.Individual instance.

            this@fsf.ga.Individual(factoryArgs);
        end        
    end
    
    methods(Access = public)       
        function individual = Clone(this)
            % Creates a clon of the object.
            %
            % @return clon: A clon of the object.
            
            individual = sample.features.Individual(this.FactoryArgs);
            individual.FactoryArgs = this.FactoryArgs;
            individual.Fitness = this.Fitness;
            individual.Features = this.Features;
        end
    end
end