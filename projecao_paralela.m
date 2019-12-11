function [cubo_projecao, faces_cubo, ...
  piramide_projecao, faces_piramide, ...
  paralelepipedo_projecao,faces_paralelepipedo, ...
  tronco_projecao, faces_tronco] = projecao_paralela()

  % recebendo as coordenadas dos sólidos no SCM
  [cubo_camera, faces_cubo, ...
  piramide_camera, faces_piramide, ...
  paralelepipedo_camera,faces_paralelepipedo, ...
  tronco_camera, faces_tronco] = sistema_camera();
  
  % limpa a figura anterior
  clf; 
 
  % montando a matriz de projeção, eliminando o eixo Z
  matriz_projecao = [1 0 0; 0 1 0; 0 0 0];
  
  % calculando as coordenadas dos sólidos na projeção
  cubo_projecao = cubo_camera * matriz_projecao;
  piramide_projecao = piramide_camera * matriz_projecao;
  
  patch('Faces',faces_cubo,'Vertices',cubo_projecao,'FaceColor','none', 'EdgeColor', 'b');
  patch('Faces',faces_piramide,'Vertices',piramide_projecao,'FaceColor','none', 'EdgeColor', 'm');

end 