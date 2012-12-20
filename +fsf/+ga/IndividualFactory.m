classdef IndividualFactory < fsf.matlab.system.HiddenHandle
    % INDIVIDUALFACTORY: Factory for create individuals of a Genetic Algorithm population.

    properties
        FactoryArgs; % The arguments used to create individuals. Allow to parametrize how the individuals are created.
    end
    
    methods
        function this = IndividualFactory(factoryArgs)
            % Creates a fsf.ga.IndividualFactory instance.
            %
            % @param factoryArgs: the fsf.ga.IndividualFactoryArgs parametrizing how the individuals are created.
            %
            % @return this: The fsf.ga.IndividualFactory instance.
            
            this.FactoryArgs = factoryArgs;
        end 
    end
    
    methods(Access = public, Abstract)       
        % Factory method to creates an individual randomly.
        %
        % @return individual: The randomly created individual.
        
        individual = CreateRandomIndividual(this);
    end
    
    methods(Access = private)       
        function population = CreateRandomPopulation(this, populationSize)
            % Factory method to creates a population randomly.
            % 
            % @param populationSize: The size of the population to be created randomly.
            %
            % @return population: The created population composed of random individuals.
            
            for individualCount = 1:populationSize
                tempPopulation(individualCount) = this.CreateRandomIndividual();
            end
            population = fsf.ga.Population(tempPopulation(randperm(populationSize)));
        end
     end
    
    methods(Access = protected)       
        function population = CreateCustomPopulation(this, populationSize)
            % Factory method to creates a custom population (no random individuals).
            %
            % @param populationSize: The size of the population to be created customly.
            %
            % @return population: The created population composed of custom individuals.
            %
            % Remarks: When no implementation is provided, an error is raised.
            
            error('fsf:DefaultImplementation', 'There is no implementation for "createCustomPopulation". \n');
        end
    end
    
    methods(Access = public, Sealed = true)
        function population = CreatePopulation(this, populationSize, populationType)
            % Factory method to create a population.
            %
            % @param populationSize: The size of the population to be created.
            % @param populationType: 
            %   'random' (default value): The population is created randomly.
            %   'custom':   The population is created customly, according to the 'createCustomPopulation' implementation provided. 
            %
            % @return population: The created population composed of random or custom individuals, depending on 'populationType' parameter.
            %
            % Remarks: When 'thePopulationType'=='custom' and no 'createCustomPopulation' implementation is provided, an error is raised.
            switch populationType
                case {'random', ''}
                    population = this.CreateRandomPopulation(populationSize);
                case 'custom'
                    population = this.CreateCustomPopulation(populationSize);
                otherwise
                    error(['Invalid population type ' populationType]);
            end
        end
    end
end