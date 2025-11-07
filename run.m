% 参数
R1 = 10; R2 = 20; E = 12;

% 网孔矩阵法
I_mesh = mesh_matrix_method(R1, R2, E);

% 割集矩阵法
I_cutset = cutset_matrix_method(R1, R2, E);

% 环集矩阵法
I_loop = loop_matrix_method(R1, R2, E);

% 关联矩阵法
I_incidence = incidence_matrix_method(R1, R2, E);

% 输出对比
fprintf('网孔矩阵法电流: %.4f A\n', I_mesh);
fprintf('割集矩阵法电流: %.4f A\n', I_cutset);
fprintf('环集矩阵法电流: %.4f A\n', I_loop);
fprintf('关联矩阵法电流: %.4f A\n', I_incidence);

% 断言
assert(abs(I_mesh-I_cutset)<1e-6);
assert(abs(I_mesh-I_loop)<1e-6);
assert(abs(I_mesh-I_incidence)<1e-6);