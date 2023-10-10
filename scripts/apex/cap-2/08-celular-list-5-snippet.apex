Celular celularXyz = new Celular (11978654321L);
Celular celularBisso = new Celular (11987563412L);

List<Celular> celulares = new List<Celular>();
celulares.add ( celularXyz );
celulares.add ( celularBisso );

System.debug ( celulares.size() );// SHOW 2;

Celular primeiro = celulares.get(0);
System.debug ( primeiro.numero ); // show 11978654321

Celular segundo = celulares.get(1);
System.debug ( segundo.numero ); // show 11987563412