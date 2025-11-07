# 在网页环境运行与验证（Mesh/割集）MATLAB/Octave 代码

本仓库提供三种网页方式运行和验证：
1) GitHub Codespaces（推荐，零配置，浏览器即开即用）
2) GitHub Actions CI（推送后自动跑脚本并在日志中显示结果）
3) MATLAB Online / Octave Online（手工拷贝脚本也可运行）

## 一、使用 GitHub Codespaces（推荐）
前提：你的 GitHub 账户已开通 Codespaces（公开仓库通常可用）。

步骤：
1. 打开仓库页面，点击绿色“Code”按钮，选择“Create codespace on main”。
2. 环境会自动构建（约 1-3 分钟，Dockerfile 会安装 GNU Octave）。
3. 打开终端，执行：
   ```
   octave -qf run.m
   ```
4. 你将看到网孔矩阵法与割集矩阵法的求解输出，应一致。

## 二、使用 GitHub Actions（自动验证）
每次 push 到仓库，将自动执行 `.github/workflows/ci.yml`，在 Actions 日志中可查看运行输出及断言结果。

## 三、MATLAB Online / Octave Online
- MATLAB Online: https://matlab.mathworks.com/ （需账号/许可）
  - 新建脚本，把本仓库的 .m 文件内容粘贴进去，运行 `run.m`
- Octave Online: https://octave-online.net/
  - 新建文件粘贴 `run.m`、`mesh_matrix_method.m`、`cutset_matrix_method.m` 内容，运行 `run.m`

## 目录说明
- `run.m`：主脚本，调用两种方法计算并对比结果
- `mesh_matrix_method.m`：网孔矩阵法示例（单回路）
- `cutset_matrix_method.m`：割集矩阵法示例（同一电路）
- `.devcontainer/`：Codespaces 环境（自动安装 Octave）
- `.github/workflows/ci.yml`：CI 自动验证脚本

## 结果期望
默认参数：R1=10Ω, R2=20Ω, E=12V
理论电流：I = E / (R1 + R2) = 0.4 A  
两种方法输出应一致，并通过断言。

如需我继续添加更复杂电路（关联矩阵/环集矩阵法示例），请直接发我需求.