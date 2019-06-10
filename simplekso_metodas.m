function [x_rezultatas, f_rezultatas, iteracija] = simplekso_metodas(x_0, n, alfa)
    %Apsirašome pradinius kintamuosius
    m = 100; %Didžiausias galimas iteracij? skai?ius
    iteracija = 0;
    pabaiga = 0; 
    sigma_1 = (sqrt(n+1) + n - 1)* alfa/(n * sqrt(2)); %Apskai?iuojame sigma1
    sigma_2 = (sqrt(n+1) - 1) * alfa/(n * sqrt(2)); %Apskai?iuojame sigma2  
    for i = 1:n %Apskai?iuojame kitas virš?nes     
        for j = 1:n
            if j == i
              x_1(j) =  x_0(j) + sigma_2;
            else
              x_1(j) =  x_0(j) + sigma_1;
            end
        end
       x{i} = x_1;
    end    
    while pabaiga == 0 %Vykdysime cikl?, kol yra tenkinamos s?lygos:
        %Randamos funkcijos reikšm?s visiems taškams
        f_x_0 = tikslo_f(x_0);
        for i = 1:n
           f_x(i) = tikslo_f(x{i});
        end
        %Randamos virsuniu svorio centro koordinates
        for i = 1:n
            x_c(i) = 0;
            for j = 1:n
                x_c(i) = x_c(i) + x{i}(j);
            end
            x_c(i) = x_c(i) / n;
        end                
        naujas_x = -x_0 + 2 * x_c; %Apskai?iuojame nauj? simplekso virš?n?
        f_naujas_x = tikslo_f(naujas_x);%Randame funkcijos reikšm? naujoje simplekso virš?n?je        
        %Randame maksimalios funkcijos reikšm?
        max_i = 1;
        f_max_x = f_x(max_i); 
        for i = 1:n
            if(f_x(i) > f_max_x)
                f_max_x = f_x(i); %Nustatome maksimali? funkcijos reikšm?
                max_i = i;
            end
        end 
        if(iteracija > m)%Patikriname ar neviršyjame iteracij? skai?iaus
            pabaiga = 1;%Jei viršyjame, tuomet nutraukiame cikl?
        end        
        if(f_max_x < f_naujas_x)%Patikriname, ar f-jos reiškm? naujoje simplekso virš?n?je yra didesne negu kitose virš?n?se
            pabaiga = 1;%Jeigu didesn?, tuomet nutraukiame cikl?
        else 
            x{max_i} = naujas_x;%Jeigu mažesn?, priskiriame nauj? reiškm?
        end        
        iteracija = iteracija + 1;%Prisidedame atlikt? iteracij?
    end 
    %Randme minimalios funkcijos reikšm? 
    min_i = 1;
    f_min_x = f_x(max_i);    
    for i = 1:n
        if(f_x(i) < f_min_x)
            f_min_x = f_x(i);%Minimali f-jos reikšm?
            i_min = i;
        end
    end 
    x_rezultatas = x{min_i};%minimaliausia koordinat?
    f_rezultatas = f_min_x;%minimaliausias rezultatas
end
