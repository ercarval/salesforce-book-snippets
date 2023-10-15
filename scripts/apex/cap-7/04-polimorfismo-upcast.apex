Advisor advisor = new Advisor();

Employee employee = advisor; // Advisor é um Employee!

Manager manager = (Manager) employee;  // Advisor não 
                                       // Não é um Manager