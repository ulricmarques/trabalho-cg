function [piramide, faces] = desenhar_piramide()
  
  % vértices da pirâmide
  vertices = [0 0 0;
              0 1 0;
              1 1 0;
              1 0 0;
              0.5 0.5 1];

  % faces da pirâmide
  faces = [1 2 3 4;
           1 5 2 1;
           2 5 3 2;
           3 5 4 3;
           4 5 1 4];
 
  % tamanho em cada coordenada   
  X = 2;
  Y = 2;
  Z = 3;
  
  % origem da pirâmide
  CX = -X/2;
  CY = -Y/2;
  CZ = 0;
  
  % matriz de rotação
  MR = [1 0 0; 0 cos(pi/4) -sin(pi/4); 0 sin(pi/4) cos(pi/4)];
  
  % matriz de escala
  ME = [2 0 0; 0 2 0; 0 0 3];

  vertices = vertices * ME * MR;

  piramide = [vertices(:,1)+CX,vertices(:,2)+CY,vertices(:,3)+CZ];
  patch('Faces',faces,'Vertices',piramide,'FaceColor','m');
end