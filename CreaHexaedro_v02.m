function [ P ] = CreaHexaedro_v02( l1, l2,l3, inc, error)
% Funci�n que genera las coordenadas de puntos en la superficie de un
% hexaedro. Si los tres lados son iguales, genera un cubo.
% l1: lado 1 horizontal
% l2: lado 2 horizontal
% l3: lado 3 vertical
% inc: distancia entre puntos
% error: error gaussiano, es el valor de sigma*3 (99%)
%    Copyright (C) {2015}  {Adri�n Riquelme Guill, adririquelme@gmail.com}
%
%    This program is free software; you can redistribute it and/or modify
%    it under the terms of the GNU General Public License as published by
%    the Free Software Foundation; either version 2 of the License, or
%    any later version.
%
%    This program is distributed in the hope that it will be useful,
%    but WITHOUT ANY WARRANTY; without even the implied warranty of
%    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
%    GNU General Public License for more details.
%
%    You should have received a copy of the GNU General Public License along
%   with this program; if not, write to the Free Software Foundation, Inc.,
%   51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
%    Discontinuity Set Extractor, Copyright (C) 2015 Adri�n Riquelme Guill
%    Discontinuity Set Extractor comes with ABSOLUTELY NO WARRANTY.
%    This is free software, and you are welcome to redistribute it
%    under certain conditions.
P=[0 0 0]; %se inicia el vector
if l1~=0 && l2~=0 && l3~=0 && inc~=0
    % creamos la base horizontal
    S=l1*l2; Si=inc^2; n=S/Si;
    b1(:,1)=rand(n,1)*l1;
    b1(:,2)=rand(n,1)*l2;
    b1(:,3)=0;
    b2(:,1)=rand(n,1)*l1;
    b2(:,2)=rand(n,1)*l2;
    b2(:,3)=l3;   
    % creamos dos lados laterales
    b3(:,1)=rand(n,1)*l1;
    b3(:,3)=rand(n,1)*l3;
    b3(:,2)=0;
    b4(:,1)=rand(n,1)*l1;
    b4(:,3)=rand(n,1)*l3;
    b4(:,2)=l2;
    % creamos los otros dos lados laterales
    b5(:,2)=rand(n,1)*l2;
    b5(:,3)=rand(n,1)*l3;
    b5(:,1)=0;
    b6(:,2)=rand(n,1)*l2;
    b6(:,3)=rand(n,1)*l3;
    b6(:,1)=l1;    
    % componemos la matriz de puntos de salida
    P=[b1;b2;b3;b4;b5;b6];
    % le metemos el error
    P=P+rand(size(P))*error;
else
    disp('Los datos de entrada son incorrectos. R, h e inc deben ser no nulos')
    P=[0 0 0];
end

% guardamos en un archivo hexaedro.txt
%     fi = fopen('hexaedro.txt', 'w') ;
%     [n,p]=size(P);
%     for k=1:n
%         fprintf(fi,  '%f %f	%f \n', P(k,1),P(k,2),P(k,3)); 
%     end 
%     fclose(fi);
    % guardamos en un archivo puntos.txt
    fi = fopen('puntos.txt', 'w') ;
    [n,p]=size(P);
    for k=1:n
        fprintf(fi,  '%f %f	%f \n', P(k,1),P(k,2),P(k,3)); 
    end 
    fclose(fi);

end

