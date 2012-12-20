classdef FitnessEvaluator < fsf.matlab.system.HiddenHandle
    % FITNESSEVALUATOR: Measures how good an individual is (fitness of the individual) with respect to a given problem
    %
    % Measures how good an individual is (fitness of the individual) with respect to a given problem. 
    % Then, the FitnessEvaluator class must be redifined according to the problem at hand. 

    properties(GetAccess = public)
        FitnessSort = 'lower_best'; % How the fitness is sorted: 'lower_best' / 'greater_best'.
    end
    
    properties(Access = private)
        Inversor = NaN; % Transform minimization problems in maximization problems.
    end
    
    methods
        function this = FitnessEvaluator(fitnessSort)
            % Creates a fsf.ga.FitnessEvaluator instance.
            %
            % @param fitnessSort: How the fitness is sorted: 'lower_best' / 'greater_best'
            %
            % @return this: The fsf.ga.FitnessEvaluator instance.
            
            switch(fitnessSort)
                case 'lower_best'
                    this.Inversor = 1;
                case 'greater_best'
                    this.Inversor = -1;
                otherwise
                    error(['Invalid FitnessSort: "' fitnessSort '". Expected "lower_best" or "greater_best"']);
            end
            this.FitnessSort = fitnessSort;
        end
    end
    
    methods(Sealed = true)
        function EvaluatePopulation(this, population)
            % Evaluate the fitness value for all the individuals in a population.
            %
            % @param population: The population to whom the fitness of the individuals will be evaluated.
            
            for indexIndividual = 1:1:population.Length
                currentIndividual = population.Individuals(indexIndividual);
                currentIndividual.Fitness = this.EvaluateIndividual(currentIndividual);
                currentIndividual.Fitness.SortingValue = (this.Inversor * currentIndividual.Fitness.Value);
            end
        end
    end
    
    methods(Access = public, Abstract)
        % Evaluates the fitness of an individual
        %
        % @param individual: The individual to whom the fitness will be evaluated.
        %
        % @return fitness: The fitness of the individual.
        
        fitness = EvaluateIndividual(this, individual);
    end    
end