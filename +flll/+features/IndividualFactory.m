classdef IndividualFactory < jku.ga.IndividualFactory & handle
    %INDIVIDUALFACTORY Implements how the individuals of a population are created
    
    methods
        function this = IndividualFactory(individualFactoryArgs)
            % Creates an individual factory
            this@jku.ga.IndividualFactory(individualFactoryArgs);
        end 
    end
    
    methods(Access = public)       
        % Factory method to creates a random individual
        function individual = CreateRandomIndividual(this)
            individual = flll.features.Individual(this.FactoryArgs);
            individual.Features = logical(round(rand(1, this.FactoryArgs.Dimensions)));
        end
        
        % Factory method to creates a custom population (no random individuals)
%         function population = createCustomPopulation(this, thePopulationSize)
%             CREATES YOU CUSTOM POPULATION HERE IF YOU HAVE A CLEVER METHOD TO DO IT
%         end
        
    end
    
end