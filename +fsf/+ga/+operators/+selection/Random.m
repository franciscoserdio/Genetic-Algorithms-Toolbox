classdef Random < fsf.ga.operators.BaseSelection
    % RANDOM: Implements random selection of individuals. 
    % 
    % Implements random selection of individuals
    
    methods(Access = protected)
        % Implemetns the selection operator, determining how the individuals from a population 
        % are selected in order to be crossed using the crossover operator.
        %
        % @param population: The population from where to select individuals.
        %
        % @return selectedPopulation: The selected population to be crossed using the crossover operator.

        function selectedPopulation = SelectionImplementation(this, population)
            population.OrderRandom();
            selectedPopulation = population;
        end
    end    
end
    