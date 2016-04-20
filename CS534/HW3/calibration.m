function [ A, R1, R2, R3, R4, t1, t2, t3, t4 ] = calibration( H1, H2, H3, H4 )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
rows_1 = createVrows(H1);
rows_2 = createVrows(H2);
rows_3 = createVrows(H3);
rows_4 = createVrows(H4);
V = [rows_1; rows_2; rows_3; rows_4];
[U_1, S_1, V_1] = svd(V);
b = V_1(:, 6);
B = [b(1), b(2), b(4); b(2), b(3), b(5); b(4), b(5), b(6)];
v0 = (b(2) .* b(4) - b(1) .* b(5)) ./ (b(1) .* b(3) - b(2)^2);
lambda = b(6) - (b(4)^2 + v0 .* (b(2) .* b(4) - b(1) .* b(5))) ./ b(1);
aplha = sqrt(lambda ./ b(1));
beta = sqrt(lambda .* b(1) ./ (b(1) .* b(3) - b(2)^2));
gamma = -b(2) * aplha^2 * beta ./ lambda;
u0 = gamma * v0 ./ aplha - b(4) .* aplha^2 ./ lambda;
A = [aplha, gamma, u0; 0, beta, v0; 0, 0, 1];
r1_1 = lambda .* inv(A) * H1(:,1);
r1_2 = lambda .* inv(A) * H1(:,2);
r1_3 = cross(r1_1, r1_2);
R1 = [r1_1, r1_2, r1_3];
t1 = lambda .* inv(A) * H1(:,3);

r2_1 = lambda .* inv(A) * H2(:,1);
r2_2 = lambda .* inv(A) * H2(:,2);
r2_3 = cross(r2_1, r2_2);
R2 = [r2_1, r2_2, r2_3];
t2  = lambda .* inv(A) * H2(:,3);

r3_1 = lambda .* inv(A) * H3(:,1);
r3_2 = lambda .* inv(A) * H3(:,2);
r3_3 = cross(r3_1, r3_2);
R3 = [r3_1, r3_2, r3_3];
t3 = lambda .* inv(A) * H3(:,3);

r4_1 = lambda .* inv(A) * H4(:,1);
r4_2 = lambda .* inv(A) * H4(:,2);
r4_3 = cross(r4_1, r4_2);
R4 = [r4_1, r4_2, r4_3];
t4 = lambda .* inv(A) * H4(:,3);
end

