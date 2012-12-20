classdef OperatorSet < fsf.matlab.system.HiddenHandle
% OPERATORSET: Container for the operators used during Genetic Algorithm execution.
% 
% The operators contained in this set are used during the Genetic Algorithm execution, in order to perform
% the selection, crossover, mutation and replacement of individuals during the generational evolution of the algorithm.

    properties(GetAccess = public)
        Selection;   % The selection operator for the Genetic Algorithm. See also fsf.ga.operators.Selection.
        Crossover;   % The crossover operator for the Genetic Algorithm. See also fsf.ga.operators.Crossover.
        Mutation;    % The mutation operator for the Genetic Algorithm. See also fsf.ga.operators.Mutation.
        Replacement; % The replacement operator for the Genetic Algorithm. See also fsf.ga.operators.Replacement.
    end
    
    methods
        function this = OperatorSet(selection, crossover, mutation, replacement)
            % Creates an fsf.ga.OperatorSet instance.
            %
            % @param selection: one implentation of fsf.ga.operators.Selection with the selection operator for the Genetic Algorithm.
            % @param crossover: one implentation of fsf.ga.operators.Crossover with the crossover operator for the Genetic Algorithm.
            % @param mutation: one implentation of fsf.ga.operators.Mutation with the mutation operator for the Genetic Algorithm.
            % @param replacement: one implentation of fsf.ga.operators.Replacement with the replacement operator for the Genetic Algorithm.
            %
            % @return this: The fsf.ga.OperatorSet instance.
            
            this.Selection = selection;
            this.Crossover = crossover;
            this.Mutation = mutation;
            this.Replacement = replacement;
        end
    end
end