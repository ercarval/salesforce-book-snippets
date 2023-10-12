List<Account> accounts = new List<Account> {
    new Account (Name= 'Bisso Capital INC'),
    new Account (Name= 'Bisso Capital INC.'),
    new Account (Name= 'Bisso Capital')
};

insert accounts;

Account masterAccount = accounts.get(1);

List<Account> accountsToMerge = new List<Account> {
    accounts.get(0),
    accounts.get(2)
};

merge masterAccount accountsToMerge;