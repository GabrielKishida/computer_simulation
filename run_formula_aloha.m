% Simulation parameters
lambda = 10;             % Average user connection rate per hour
mu = 0.5;                % Average amount of time user will stay
simulationLength = 24;   % Simulation length in hours
timeSlotLength = 0.01;   % Length of a time-slot in hours

accessProbs=0.1:0.1:0.9

iterations = 100;

avgThroughputPerAccessProb = zeros(1, length(accessProbs));
for i=1:iterations
    [throughputPerAccessProb] = simulate_formula_aloha(lambda, mu, simulationLength, timeSlotLength, accessProbs);
    avgThroughputPerAccessProb = avgThroughputPerAccessProb + throughputPerAccessProb;
end
avgThroughputPerAccessProb = avgThroughputPerAccessProb/iterations;

f=figure();
% Plot the average throughput as a function of time
plot(accessProbs, avgThroughputPerAccessProb,'o-');
xlabel('User Access Probability (p)');
ylabel('Average Throughput per Time Slot');
title('Formula Simulation Method');