Map<String, Customer> customersByDocument = new Map<String, Customer>();

customersByDocument.put ('18877615000166', new Customer ('18877615000166'));

customersByDocument.put ('87423854000169', new Customer ('87423854000169'));

customersByDocument.put ('18877615000166', new Customer ('18877615000166'));

// a última linha identificou que já existia uma 
// chave com o mesmo valor e trocou a referência
// do valor para a nova instância de Customer.

System.debug ( customersByDocument.size() ); // > 2

Customer customer = customersByDocument.get('18877615000166');

System.debug ( customer.getDocument() ); // > 18877615000166