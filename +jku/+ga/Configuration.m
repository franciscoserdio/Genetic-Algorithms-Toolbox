classdef Configuration
    % CONFIGURATION: Genetic algorithm configuration.
    
    properties
        MaximumIterations = 50; % Maximum of iterations to perform in the GA. Default value: 50.
        CrossoverRate = 0.8; % Crossover probability of the GA. Default value: 0.8 (80%).
        MutationRate = 0.03; % Mutation probability of the GA. Default value: 0.03 (3%).
        PopulationSize = 50; % Population size in the GA. Default value: 50.
        PopulationType = 'random'; % Population type of the GA. Possible values: 'random'/'custom'. Default value: 'random'.
    end
    
    methods
        function this = Configuration()
            % Creates a jku.ga.Configuration instance.
            %
            % @return this: The jku.ga.Configuration instance.
        end 
    end    
end