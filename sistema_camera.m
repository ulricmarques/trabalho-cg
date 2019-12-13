function [cubo_camera, faces_cubo, ...
  piramide_camera, faces_piramide, ...
  paralelepipedo_camera, faces_paralelepipedo, ...
  tronco_camera, faces_tronco] = sistema_camera()
  
  % recebendo as coordenadas dos s�lidos no SCM
  [cubo_mundo, faces_cubo, ...
  piramide_mundo, faces_piramide, ...
  paralelepipedo_mundo,faces_paralelepipedo, ...
  tronco_mundo, faces_tronco] = sistema_mundo();

  % limpa a figura anterior
  clf; 

  % origem da câmera escolhida
  origem_camera = [-5 -5 5];

  % cálculo do centro do cubo e da pirâmide
  centro_cubo = [(max(cubo_mundo(:, 1))+min(cubo_mundo(:, 1)))/2 ...
                 (max(cubo_mundo(:, 2))+min(cubo_mundo(:, 2)))/2 ...
                 (max(cubo_mundo(:, 3))+min(cubo_mundo(:, 3)))/2];
                 
  centro_piramide = [(max(piramide_mundo(:, 1))+min(piramide_mundo(:, 1)))/2 ...
                 (max(piramide_mundo(:, 2))+min(piramide_mundo(:, 2)))/2 ...
                 (max(piramide_mundo(:, 3))+min(piramide_mundo(:, 3)))/2];

  % cálculo do ponto médio entre os centros do cubo e da pirâmide               
  ponto_medio_centros = [(centro_cubo(1)+centro_piramide(1))/2 ...
                         (centro_cubo(2)+centro_piramide(2))/2 ...
                         (centro_cubo(3)+centro_piramide(3))/2 ]           

                         
  % vetor normal, aqui chamado de w. um dos vetores que compõem a base do SCC                       
  camera_vetor_w = ponto_medio_centros - origem_camera;  
  
  vetor_auxiliar = [10 15 1];

  % vetor u, obtido ao fazer o produto vetorial entre o vetor w e um vetor auxiliar qualquer(não-colinear)
  camera_vetor_u = cross(camera_vetor_w, vetor_auxiliar);

  % vetor v, obtido ao fazer o produto vetorial entre w e u.
  camera_vetor_v = cross(camera_vetor_w, camera_vetor_u);

  % tranformando em vetores unitários         
  camera_vetor_w = camera_vetor_w / (sqrt(dot(camera_vetor_w, camera_vetor_w))); 
  camera_vetor_u = camera_vetor_u / (sqrt(dot(camera_vetor_u, camera_vetor_u)));
  camera_vetor_v = camera_vetor_v / (sqrt(dot(camera_vetor_v, camera_vetor_v)));

  % formando a base vetorial do SCC com os três vetores ortonormais calculados
  base_camera = [camera_vetor_w; camera_vetor_u; camera_vetor_v];
  
  % cálculo das novas coordenadas dos sólidos após a mudança de base
  cubo_camera = cubo_mundo * inv(base_camera);
  piramide_camera = piramide_mundo * inv(base_camera);
  paralelepipedo_camera = paralelepipedo_mundo * inv(base_camera);
  tronco_camera = tronco_mundo * inv(base_camera);

  patch('Faces',faces_cubo,'Vertices',cubo_camera,'FaceColor','b');
  patch('Faces',faces_piramide,'Vertices',piramide_camera,'FaceColor','m');
  patch('Faces',faces_paralelepipedo,'Vertices',paralelepipedo_camera,'FaceColor','r');
  patch('Faces',faces_tronco,'Vertices',tronco_camera,'FaceColor','y');
end




                  
             
                  

                  
                      

           

               


