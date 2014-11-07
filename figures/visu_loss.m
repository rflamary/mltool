close all
clear all

%% classification loss

err=-2:0.01:2;


% class loss

hinge = @(err) max(0,1-err);
hinge2 = @(err) max(0,1-err).^2;
reglog = @(err) log(1+exp(-err));
loss01 = @(err) err<0;
sigmoid = @(err) (1-tanh(err))/2;


lw=2;
fs=18;

figure(1)
set(gcf,'defaulttextinterpreter','latex');
clf
hold on
plot(err,loss01(err),'k','LineWidth',lw)
plot(err,hinge(err),'b','LineWidth',lw)
plot(err,hinge2(err),'g','LineWidth',lw)
plot(err,reglog(err),'r','LineWidth',lw)
plot(err,sigmoid(err),'m','LineWidth',lw)
hold off
axis([-2 2 0 3])
xlabel('$yf(\mathbf{x})$','interpreter','Latex','FontSize',fs)
ylabel('$L(y,f(\mathbf{x}))$','interpreter','Latex','FontSize',fs)
title('Co\^uts de classification','interpreter','Latex','FontSize',fs)
l=legend('Co\^ut 0-1','Hinge','Hinge$^2$','Logistique','Sigmoid')
set(l,'Interpreter','Latex','Fontsize',fs);
print('-depsc','visuloss_class.eps')

