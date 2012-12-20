classdef BaseReplacement < fsf.ga.operators.BaseOperator
    % BASEREPLACEMENT: Determines how the previous population together with crossed and mutated individuals
    % are combined in other to create a new population for the genetic algorithm next iteration.

    methods
        function this = BaseReplacement()
            % Creates a fsf.ga.operators.BaseReplacement instance.
            %
            %  @return this: The new fsf.ga.Operators.BaseReplacement instance.

            this@fsf.ga.operators.BaseOperator();
        end
    end
    
    methods(Access = public)
        function replacedPopulation = ApplyReplacement(this, previousPopulation, crossedPopulation, mutatedPopulation, maxIndividuals)
            % Applies the replacement operator, combining the previous population together with the crossed and mutated individuals, 
            % creating a new population for the genetic algorithm next iteration.
            %
            % @param previousPopulation: The population passed from the previous iteration of the genetic algoritm.
            % @param crossedPopulation: The population with the individuals result of crossover operator.
            % @param mutatedPopulation: The population with the individuals result of mutation operator.
            % @param maxIndividuals: The maximum number of individuals in the new population for the genetic algorithm next iteration.
            %
            % @return replacedPopulation: The new population for the genetic algorithm next iteration.

            replacedPopulation = this.ReplacementImplementation(previousPopulation, crossedPopulation, mutatedPopulation, maxIndividuals);
        end
    end 

    methods(Access = protected, Abstract)
        % Implements the replacement operator, combining the previous population together with the crossed and mutated individuals, 
        % creating a new population for the genetic algorithm next iteration.
        %
        % @param previousPopulation: The population passed from the previous iteration of the genetic algoritm.
        % @param crossedPopulation: The population with the individuals result of crossover operator.
        % @param mutatedPopulation: The population with the individuals result of mutation operator.
        % @param maxIndividuals: The maximum number of individuals in the new population for the genetic algorithm next iteration.
        %
        % @return replacedPopulation: The new population for the genetic algorithm next iteration.

        replacedPopulation = ReplacementImplementation(this, previousPopulation, crossedPopulation, mutatedPopulation, maxIndividuals);
    end    
end
    