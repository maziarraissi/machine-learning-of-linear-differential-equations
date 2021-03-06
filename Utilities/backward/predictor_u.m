function [f, v] = predictor_u(x_star)

global ModelInfo

xu = ModelInfo.xu;
xf = ModelInfo.xf;
yu = ModelInfo.yu;
yf = ModelInfo.yf;
hyp = ModelInfo.hyp;

D = size(xf,2);

y = [yu; yf];

L=ModelInfo.L;

psi1 = k(x_star, xu, hyp(1:D+1),0);
psi2 = h(x_star, xf, hyp(1:D+1),0);
psi = [psi1 psi2];

% calculate prediction
f = psi*(L'\(L\y));

v = k(x_star, x_star, hyp(1:D+1),0) ...
    - psi*(L'\(L\psi'));

v = abs(diag(v));