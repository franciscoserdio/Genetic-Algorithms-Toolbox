classdef BaseMutation < fsf.ga.operators.BaseOperator
    % BASEMUTATION: Determines how an individual is mutated.

    methods
        function this = BaseMutation()
            % Creates a fsf.ga.operators.BaseMutation instance.
            %
            %  @return this: The new fsf.ga.Operators.BaseMutation instance.

            this@fsf.ga.operators.BaseOperator();
        end
    end
    
    methods(Access = protected)
        function must = MustMutate(this, mutationRate)
            % Determines if mutation must be done according to a mutation rate.
            %
            %  @param mutationRate: The mutation rate threshold, between [0, 1].
            %
            %  @return must: A boolean stating when to perform mutation or not.
            
            must = (random('Uniform', 0, 1) < mutationRate);
        end
    end
    
    methods(Access = public)
        function mutatedPopulation = ApplyMutation(this, population, mutationRate)
            % Applies the mutation operator to a population, according to the mutationRate provided
            %
            % @param population: The population to apply the mutation to.
            % @param crossoverRate: The mutation rate used to determine when to apply mutation or not.
            %
            % @return mutatedPopulation: The population result of apply mutation to the given population 
            %                            (only included the mutated individuals).

            populationLength = population.Length;
            mutatedIndividuals = [];
            for indexIndividual = 1:(populationLength)
                if(this.MustMutate(mutationRate))
                    theIndividual = population.Individuals(indexIndividual);
                    mutatedIndividual = this.MutationImplementation(theIndividual.Clone());
                    mutatedIndividuals = [mutatedIndividuals, mutatedIndividual];
                end
            end
            mutatedPopulation = fsf.ga.Population(mutatedIndividuals);
        end
    end    
    
    methods(Access = protected, Abstract)
        % Implements the mutation of an individual to generate mutated individual.
        %
        % @param individual: The individual to be mutated.
        %
        % @return mutatedIndividual: The individual result of mutation of the given one.

        mutatedIndividual = MutationImplementation(this, individual);
    end

end