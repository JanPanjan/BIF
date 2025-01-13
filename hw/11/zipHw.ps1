# PI.ps1

$compress = @{
  Path = "C:\Users\joene\Documents\progAAAAAAA\bioFizika\hw\11\benzene.dat", "C:\Users\joene\Documents\progAAAAAAA\bioFizika\hw\11\calculate_potential_3D.m", "C:\Users\joene\Documents\progAAAAAAA\bioFizika\hw\11\hw11_3D.m"
  CompressionLevel = "Fastest"
  DestinationPath = "C:\Users\joene\Documents\progAAAAAAA\bioFizika\hw\11\hw11jp.zip"
}
Compress-Archive @compress -update
