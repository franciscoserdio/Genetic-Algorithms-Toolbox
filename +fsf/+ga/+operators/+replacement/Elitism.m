classdef Elitism < fsf.ga.operators.BaseReplacement
    % ELITISM: Implements replacement operator with elitism. 
    % 
    % Implements replacement operator with elitism:
    %   1.- Combine the previous population + crossed individuals + mutated individuals together    
    %   2.- Sort them by fitness
    %   3.- Pick up the best ones
    
    methods(Access = protected)
        function replacedPopulation = ReplacementImplementation(this, previousPopulation, crossedPopulation, mutatedPopulation, maxIndividuals)
            % Implements the replacement operator, combining the previous population together with the crossed and mutated individuals, 
            % creating a new population for the genetic algorithm next iteration.
            %
            % @param previousPopulation: The population passed from the previous iteration of the genetic algoritm.
            % @param crossedPopulation: The population with the individuals result of crossover operator.
            % @param mutatedPopulation: The population with the individuals result of mutation operator.
            % @param maxIndividuals: The maximum number of individuals in the new population for the genetic algorithm next iteration.
            %
            % @return replacedPopulation: The new population for the genetic algorithm next iteration.
            
            replacedPopulation = fsf.ga.Population([previousPopulation.Individuals, crossedPopulation.Individuals, mutatedPopulation.Individuals]);
            replacedPopulation = replacedPopulation.OrderByFitness();
            replacedPopulation = fsf.ga.Population(replacedPopulation.Individuals(1:maxIndividuals));
        end
    end 
end