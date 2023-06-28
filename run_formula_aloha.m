% Simulation parameters
lambda = 10;
mu = 0.5;
simulationLength = 24;   % Simulation length in hours
timeSlotLength = 0.01;   % Length of a time-slot in hours

accessProbs=[0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9];

iterations = 1000;

avgThroughputPerAccessProb = zeros(1, length(accessProbs));
for i=1:iterations
    [throughputPerAccessProb] = simulate_formula_aloha(lambda, mu, simulationLength, timeSlotLength, accessProbs);
    avgThroughputPerAccessProb = avgThroughputPerAccessProb + throughputPerAccessProb;
end
avgThroughputPerAccessProb = avgThroughputPerAccessProb/iterations;

f=figure();
% Plot the average throughput as a function of time
plot(0.1:p(1):p(length(p)), avgThroughputPerAccessProb,'o-');
xlabel('User Access Probability (p)');
ylabel('Average Throughput per Time Slot');
title('Average Throughput vs. Access Probability');