GetAddressOutboundService service = new GetAddressOutboundService();

ViaCepAddressResponse addressResponse = service.findAddressByZipCode ('01001000');

System.debug ( addressResponse );