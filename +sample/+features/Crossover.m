classdef Crossover < fsf.ga.operators.BaseCrossover
    %CROSSOVER Crossover for feature selection
    
    methods(Access = protected)
        function [offspring_1, offspring_2] = CrossoverImplementation(this, father, mother)
            % Implements the crossover of two individuals, father and mother, to generate acouple of offsprings
            % .-Performs uniform crossover in the vector of features
            %
            % @param father: The father to be crossover.
            % @param mother: The mother to be crossover.
            %
            % @return offspring_1: The first offspring result of crossover
            % @return offspring_2: The second offspring result of crossover            
            
            offspring_1 = father;
            offspring_2 = mother;
            
            %One single point crossover for the features
            crossoverPoint = (1+round((father.FactoryArgs.Dimensions-2) * rand()));
            offspring_1.Features(1:crossoverPoint) = (mother.Features(1:crossoverPoint));
            offspring_2.Features(crossoverPoint:end) = (father.Features(crossoverPoint:end));
        end
    end

end