function [throughputPerAccessProb] = simulate_brute_force_aloha(lambda, mu, simulationLength, timeSlotLength, accessProbs)
    % Calculate the number of time slots
    numTimeSlots = simulationLength / timeSlotLength;
    % Initialize variables
    existingUsers = zeros(1, numTimeSlots);
    throughput = zeros(1, numTimeSlots);   % Average throughput array

    % Simulation loop
    for t = 1:numTimeSlots
        % Calculate the number of arrivals in the current time slot
        numArrivals = poissrnd(lambda * timeSlotLength);
        % Simulate each arrival
        for i = 1:numArrivals
            % User connects, calculate the service time
            serviceTime = exprnd(mu);
            % Calculate the time slot index when the user will depart
            departTimeSlot = t + ceil(serviceTime / timeSlotLength);
            for j = t:min(numTimeSlots,departTimeSlot)
                existingUsers(j)=existingUsers(j)+1;
            end
        end
    end

    
    throughputPerAccessProb=zeros(1,length(accessProbs));
    for k=1:length(accessProbs)
        for t=1:numTimeSlots
            isUserAccessing = zeros(1,existingUsers(t));
            for user=1:existingUsers(t)
                if rand <= accessProbs(k)
                    isUserAccessing(user) = 1;
                end
            end
            index=find(isUserAccessing(:)==1);
            if length(index) == 1
                throughput(t) = 1;
            else
                throughput(t) = 0;
            end
        end
        iter_mean_throughput = mean(throughput);
        throughputPerAccessProb(k)=iter_mean_throughput;
    end
end
