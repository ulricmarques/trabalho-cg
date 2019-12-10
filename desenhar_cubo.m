function [cubo, faces] = desenhar_cubo()
  
  % vértices do cubo
  vertices = [1 1 0;
              0 1 0;
              0 1 1;
              1 1 1;
              0 0 1;
              1 0 1;
              1 0 0;
              0 0 0];

  % faces do cubo
  faces = [1 2 3 4;
           4 3 5 6;
           6 7 8 5;
           1 2 8 7;
           6 7 1 4;
           2 3 5 8];
 
  % tamanho em cada coordenada   
  X = 1.5;
  Y = 1.5;
  Z = 1.5;
  
  % origem do cubo
  CX = -X/2;
  CY = -Y/2;
  CZ = 0;
 
  cubo = [vertices(:,1)*X+CX,vertices(:,2)*Y+CY,vertices(:,3)*Z+CZ];
  patch('Faces',faces,'Vertices',cubo,'FaceColor','b');
end
