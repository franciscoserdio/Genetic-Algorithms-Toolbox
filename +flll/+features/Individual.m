% Individual of a genetic algorithm's population
classdef Individual < jku.ga.Individual & handle
    %INDIVIDUAL Individual for the feature selection
    %   .- Vector of features. Used for feature selection
    
    % Private properties
    properties(GetAccess = public)
        Features;
    end
    
    methods
        % Creates an individual
        function this = Individual(factoryArgs)
            this@jku.ga.Individual(factoryArgs);
        end        
    end
    
    methods(Access = public)       
        % Factory method to clone an individual
        function individual = Clone(this)
            individual = flll.features.Individual(this.FactoryArgs);
            individual.FactoryArgs = this.FactoryArgs;
            individual.Fitness = this.Fitness;
            individual.Features = this.Features;
        end
    end
end