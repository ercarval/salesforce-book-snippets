Set<String> estados = new Set<String>();

estados.add ('SP'); 
estados.add ('RJ');
estados.add ('RJ'); // vai ignorar este elemento.

System.debug ( estados.size() ); // SHOW 2