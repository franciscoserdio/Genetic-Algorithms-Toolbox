classdef Crossover < jku.ga.operators.BaseCrossover
    %CROSSOVER Crossover for feature selection
    %   .- Performs uniform crossover in the vector of features
    
    methods(Access = protected)
        % Implements the crossover of father and mother to generate a couple of offsprings
        function [offspring_1, offspring_2] = CrossoverImplementation(this, father, mother)
            offspring_1 = father;
            offspring_2 = mother;
            
            %One single point crossover for the features
            crossoverPoint = (1+round((father.FactoryArgs.Dimensions-2) * rand()));
            offspring_1.Features(1:crossoverPoint) = (mother.Features(1:crossoverPoint));
            offspring_2.Features(crossoverPoint:end) = (father.Features(crossoverPoint:end));
        end
    end

end