Account account = new Account ();

PurchaseOrder purchaseOrder = new PurchaseOrder ( account ,
                                new BillingAddress()
                                      .withStreet('Lot. Z.à. les Dagueys')
                                      .withAddressNumber('33500')
                                      .withCity('LIBOURNE')
                                      .withState('ZY')
                                      .withZipCode('3243342') );