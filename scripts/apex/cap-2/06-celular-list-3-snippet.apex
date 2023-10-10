List<Celular> celulares = new List<Celular>();
celulares.add ( new Celular ());

System.debug ( celulares.size() );// SHOW 1;

celulares.clear();// limpa todo conteúdo da lista.

System.debug ( celulares.size() );// SHOW 0;

System.debug ( celulares.isEmpty() );// SHOW true;