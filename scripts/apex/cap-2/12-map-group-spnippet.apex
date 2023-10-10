Map<String, List<ShippingAddress>> addressesByZipCode = new Map<String, List<ShippingAddress>>();

List<ShippingAddress> addresses = new List<ShippingAddress>();

addresses.add ( 
        new ShippingAddress('68908450'
                , 'Avenida Germano Silva Souza') );

addresses.add ( 
        new ShippingAddress('12220000' 
              , 'Avenida Juscelino Kubitschek') );

addresses.add ( 
        new ShippingAddress('68908450', 'Rua São Paulo') );

addresses.add ( 
        new ShippingAddress('68908450'
            , 'Rua XV de Novembro 786') );


for (ShippingAddress address : addresses) {
    
    String zipCode = address.getZipCode();

    if ( !addressesByZipCode.containsKey ( zipCode ) ) {
        
        addressesByZipCode.put ( address.getZipCode(),
                             new List<ShippingAddress>() );
    
    }

    // a partir daqui todas as chaves têm ao menos uma lista.
    // então podemos obter a lista de Address com a mesma 
    // chave e adicionar um novo elemento.
    addressesByZipCode.get (address.getZipCode()).add (address);
    
}

// SHOW 4 - total de endereços
System.debug ( addresses.size() ); 

// SHOW 2 - total de chaves
System.debug ( addressesByZipCode.size() ); 

List<ShippingAddress> foundAddresses = addressesByZipCode.get('68908450');

System.debug ( foundAddresses.size() ); // SHOW 3