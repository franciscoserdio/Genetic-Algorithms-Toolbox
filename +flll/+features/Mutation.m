classdef Mutation < jku.ga.operators.BaseMutation
    %MUTATION Mutation for the box-cox transformation
    %   .- Swaps a feature selection flag in a single point
    
    methods(Access = protected)
        % Implements the mutation of an individual
        function mutatedIndividual = MutationImplementation(this, individual)
            mutatedIndividual = individual;
            mutationPoint = (1+round((individual.FactoryArgs.Dimensions-1) * rand()));
            mutatedIndividual.Features(mutationPoint) = ~mutatedIndividual.Features(mutationPoint);
        end
    end

end