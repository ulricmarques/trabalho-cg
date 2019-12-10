function [paralelepipedo, faces] = desenhar_paralelepipedo()
  
  % vértices do paralelepipedo
  vertices = [1 1 0;
              0 1 0;
              0 1 1;
              1 1 1;
              0 0 1;
              1 0 1;
              1 0 0;
              0 0 0];

  % faces do paralelepipedo
  faces = [1 2 3 4;
           4 3 5 6;
           6 7 8 5;
           1 2 8 7;
           6 7 1 4;
           2 3 5 8];
 
  % tamanho em cada coordenada   
  X = 1.5;
  Y = 5.0;
  Z = 2.5;
  
  % origem do paralelepipedo
  CX = -X;
  CY = 0;
  CZ = 0;
 
  paralelepipedo = [vertices(:,1)*X+CX,vertices(:,2)*Y+CY,vertices(:,3)*Z+CZ];
  patch('Faces',faces,'Vertices',paralelepipedo,'FaceColor','r');
end