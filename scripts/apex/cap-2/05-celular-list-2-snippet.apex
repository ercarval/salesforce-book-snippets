List<Celular> motorolas = new List<Celular>();

motorolas.add (new Celular());

List<Celular> iphones = new List<Celular>();

iphones.add (new Celular());

List<Celular> celulares = new List<Celular>();
celulares.addAll ( motorolas ); 
celulares.addAll ( iphones );

System.debug ( celulares.size() );// SHOW 2;