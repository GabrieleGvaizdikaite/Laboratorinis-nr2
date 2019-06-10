function [x_0, alfa, x, f_val, x_rezultatas, f_rezultatas, iteracija] = sprendimas(x)
   %Nusirodome pateiktus kintamuosius:
   stud_nr = 20145120;
   x_0 = [1,1]
   alfa = 0.5; 
   n = 2; 
   %Apsirašome strukt?r? fminsearch funkcijai 
   options = optimset('Display', 'iter' , 'TolX', alfa, 'PlotFcns',@optimplotfval);   
   %Piešiame grafik?
   [X_1, X_2] = meshgrid(-4:0.1:4, -4:0.1:4);
   %Surandame y reikšmes
   y = 100.*(X_2-X_1.^2).^2 + (1-X_1).^2; 
    surf(X_1,X_2,y);
    xlabel('x_1');
    ylabel('x_2');
    zlabel('F(x_1,x_2)');
    title('F(x_1,x_2)=100*(x_2-x_1^2)^2+(1-x_1)^2');    
  [x,f_val] = fminsearch(@tikslo_f, x_0, options)%fminsearch funkcijos atlikimas     
  [x_rezultatas, f_rezultatas, iteracija] = simplekso_metodas(x_0, n, alfa) %simplekso metodas atlikimas   
end
