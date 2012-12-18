classdef GeneticAlgorithm < handle
    % GENETICALGORITHM: Implements a genetic algorithm.
    %
    % Implements a genetic algorithm, providing the necesary framework you need in order to fast implement whatever type of Genetic Algorithm you want.
    % Through the customization of individuals, factories of individuals, genetic operators, etc. this frameworks allows you to develop a genetic solution for all type of problems at hand.
    
    events
        IterationEnds; % Event raised when a GA iteration ends.
    end
   
    properties(Access = public)
        Configuration; % The Genetic Algorithm's configuration. See also: jku.ga.Configuration.
        Operators; % The Genetic Algorithm's operators. See also: jku.ga.OperatorSet.
        FitnessEvaluator; % The Genetic Algorithm's fitness evaluator. See also: jku.ga.FitnessEvaluator.
        IndividualFactory; % The Genetic Algorithm's individual factory. See also: jku.ga.IndividualFactory.
    end

    methods
        function this = GeneticAlgorithm(configuration, operators, fitnessEvaluator, individualFactory)
            % Creates a jku.ga.GeneticAlgorithm instance.
            %
            % @param configuration: The Genetic Algorithm's configuration.
            % @param operators: The Genetic Algorithm's operators.
            % @param fitnessEvaluator: The Genetic Algorithm's fitness evaluator.
            % @param individualFactory: The Genetic Algorithm's individual factory.
            %
            % @return this: The jku.ga.GeneticAlgorithm instance.
            %
            % See also:
            %   jku.ga.Configuration jku.ga.OperatorSet jku.ga.FitnessEvaluator jku.ga.IndividualFactory jku.ga.Result

            this.Configuration = configuration;
            this.Operators = operators;
            this.FitnessEvaluator = fitnessEvaluator;
            this.IndividualFactory = individualFactory;
        end
        
        function result = Execute(this)
            % Executes the Genetic algorithm.
            %
            % @return result: The Genetic Algorithm's result containing the best individual by iteration and the last best individual.
            
            result = jku.ga.Result();
            stepPopulation = this.IndividualFactory.CreatePopulation(this.Configuration.PopulationSize, this.Configuration.PopulationType);
            
            this.FitnessEvaluator.EvaluatePopulation(stepPopulation);
            
            iterations = 0;
            stopCondition = (this.Configuration.MaximumIterations <= iterations); 
            
            while (~ stopCondition)
                fprintf('Running GA - Iteration: %d \n ', iterations+1);
                selectedPopulation = this.Operators.Selection.ApplySelection(stepPopulation);

                crossoverPopulation = this.Operators.Crossover.ApplyCrossover(selectedPopulation, this.Configuration.CrossoverRate);
                mutatedPopulation = this.Operators.Mutation.ApplyMutation(crossoverPopulation, this.Configuration.MutationRate);
                
                this.FitnessEvaluator.EvaluatePopulation(crossoverPopulation);
                this.FitnessEvaluator.EvaluatePopulation(mutatedPopulation);
                
                stepPopulation = this.Operators.Replacement.ApplyReplacement(stepPopulation, crossoverPopulation, mutatedPopulation, this.Configuration.PopulationSize);
                
                delete(selectedPopulation);
                delete(crossoverPopulation);
                delete(mutatedPopulation);

                iterations = iterations + 1;
                stopCondition = (this.Configuration.MaximumIterations <= iterations);
                
                result.AddBestByIteration(stepPopulation.GetBestIndividual());
                
                this.OnIterationEnds(jku.ga.events.IterationEndsEventArgs(stepPopulation, result));
            end
            result.Best = stepPopulation.GetBestIndividual();
        end
    end
    
    methods(Access = protected)
        function OnIterationEnds(this, eventData)
            % Raises the 'IterationEnds' event.
            %
            % @param eventData: The data of the event.
            %
            % See also: jku.ga.events.IterationEndsEventArgs
            
            this.notify('IterationEnds', eventData);
        end
    end
end