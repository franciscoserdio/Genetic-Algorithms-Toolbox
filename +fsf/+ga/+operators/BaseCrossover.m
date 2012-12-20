classdef BaseCrossover < fsf.ga.operators.BaseOperator
    % BASECROSSOVER: Determines how two individuals crossover in order to produce offsprings.

    methods
        function this = BaseCrossover()
            % Creates a fsf.ga.operators.BaseCrossover instance.
            %
            %  @return this: The new fsf.ga.Operators.BaseCrossover instance.

            this@fsf.ga.operators.BaseOperator();
        end
    end
    
    methods(Access = protected)
        function must = MustCrossover(this, crossoverRate)
            % Determines if crossover must be done according to a crossover rate.
            %
            %  @param crossoverRate: The crossover rate threshold, between [0, 1].
            %
            %  @return must: A boolean stating when to perform crossover or not.

            must = (random('Uniform', 0, 1) < crossoverRate);
        end
              
    end
    
    methods(Access = public)
        function crossedPopulation = ApplyCrossover(this, population, crossoverRate)
            % Applies the croosover operator to a population, according to the crossoverRate provided
            %
            % @param population: The population to apply the crossover to.
            % @param crossoverRate: The crossover rate used to determine when to apply crossover or not.
            %
            % @return crossedPopulation: The population result of apply crossover to the given population 
            %                            (only included the offsprings result of crossover).

            populationLength = population.Length;
            crossedIndividuals = [];
            for indexIndividual = 1:2:(populationLength-1)
                if(this.MustCrossover(crossoverRate))
                    father = population.Individuals(indexIndividual);
                    mother = population.Individuals(indexIndividual + 1);
                    [offspring1, offspring2] = this.CrossoverImplementation(father.Clone(), mother.Clone());
                    crossedIndividuals = [crossedIndividuals, offspring1, offspring2];
                end
            end
            crossedPopulation = fsf.ga.Population(crossedIndividuals);
        end
    end
    
    methods(Access = protected, Abstract)
        % Implements the crossover of two individuals, father and mother, to generate acouple of offsprings
        %
        % @param father: The father to be crossover.
        % @param mother: The mother to be crossover.
        %
        % @return offspring_1: The first offspring result of crossover
        % @return offspring_2: The second offspring result of crossover
        [offspring_1, offspring_2] = CrossoverImplementation(this, father, mother);
    end

end