classdef Population < fsf.matlab.system.IClonable & fsf.matlab.system.HiddenHandle
    % POPULATION: Genetic algorithm's population.
    
    properties
        Individuals = []; % The individuals in the population.
        Length; % The population length (number of individuals) in the population.
    end

    methods
        function this = Population(individuals)
            % Creates a fsf.ga.Population instance.
            %
            % @param individuals: The individuals of the population.
            %
            % @return this: The fsf.ga.Population instance.
            
            this.Individuals = individuals;
        end
        
        function value = get.Length(this), value = length(this.Individuals); end
    end
   
    methods(Access = public)
        function [orderedPopulation, indexes] = OrderByFitness(this)
            % Order the population according to the fitness of the individuals, so better individuals are first and worst individuals are last.
            %
            % @return orderedPopulation: The ordered population, where better individuals are first and worst individuals are last.
            % @ return indexes: The indexes applied during the ordering.
            
            [orderedIndividuals, indexes] = sort([this.Individuals], 'ascend');
            orderedPopulation = fsf.ga.Population(orderedIndividuals);
        end
        
        function OrderRandom(this)
            % Orders the population randomly.
            
            this.Individuals = this.Individuals(randperm(this.Length));
        end
        
        function bestIndividual = GetBestIndividual(this)
            % Gets the best individual of the population. 
            %
            % @return bestIndividual: The best individual of the population, according to its fitness.

            [orderedPopulation, ~] = this.OrderByFitness();
            bestIndividual = orderedPopulation.Individuals(1);
        end
        
        function PlotFitness(this, handle)
            % Plots the fitness of the population in the given figure handle'
            %
            % @param handle: a valid figure handle
            
            [orderedPopulation, ~] = this.OrderByFitness();
            fitValues = NaN(this.Length, 1);
            for iIndividual = 1:this.Length
                fitValues(iIndividual) = orderedPopulation.Individuals(iIndividual).Fitness.Value;
            end
            figure(handle);
            plot(fitValues);
            drawnow;
        end
        
        function population = Clone(this)
            % Clone a population.
            % 
            % @return population: A population clon of the current one.
            
            % TODO: Prealocate the space for the population
            for indexIndividual = 1:this.Length 
                tempIndividuals(indexIndividual) = this.Individuals(indexIndividual).Clone();
            end
            population = fsf.ga.Population(tempIndividuals);
        end
    end

end