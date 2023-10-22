/**
 * 
 * Based on https://salesforce.stackexchange.com/questions/1653/what-are-salesforce-ids-composed-of
 * Credits for https://www.gammone.com/programmazione/come-convertire-id-salesforce-da-15-a-18-caratteri
 * 
 * @author ercarval - topi/brq
 */
@isTest
public class IdGenerator {

    private static final Integer PREFIX_LENGTH = 3;
    private static final Integer ORG_INSTANCE_RESERVED_LENGTH = 5;
    
    private static final String BASE62_ALPHABET = '0123456789abcdefghijklmnopqrstuvwqyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
    
    private static Integer sequence = 0; 

    public static List<SObject> generate ( List<SObject> records ) {

        for (SObject record : records ) {
        
            generate ( record );            
        
        }

        return records;
    }


    public static SObject generate ( SObject record ) {

        record.Id = IdGenerator.generate( record.getSObjectType() );

        return record;
    }
    
    public static String generate ( Schema.SObjectType type ) {
        return generate(type.getDescribe().getKeyPrefix());
    }
    

    public static String generate (String objectPrefix) {   

        String prefix = objectPrefix + UserInfo.getUserId()
                                        .substring(PREFIX_LENGTH, ORG_INSTANCE_RESERVED_LENGTH)
                                         + '00000';

        String id = prefix + buildRandom() + (++sequence);

		return appendSufix(id);

    }

    private static String buildRandom() {

        String randomSequence = '';

        for ( Integer i = 0; i < 4; i++) {
            Integer idx = Math.mod(Math.abs(Crypto.getRandomInteger()), BASE62_ALPHABET.length());
            randomSequence += BASE62_ALPHABET.substring(idx, idx+1);
        }

        return randomSequence;

    }

    private static String appendSufix (String id) {

        String suffix = '';
        String baseChars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ012345';

        for(Integer i = 0; i < 3; i++) {

            Integer flags = 0;

            for(Integer j = 0; j < 5; j++) {

                String c = id.substring( i * 5 + j , i * 5 + j + 1);

                if((c.compareTo('A')>=0) && (c.compareTo('Z')<=0)){
                    flags += 1 << j;
                }

            }

            suffix += baseChars.substring(flags, flags+1);
        }

        return id + suffix;

    }


    
    @isTest
    static void givenSomeObjectPrefixWhenGenerateIdThenSuccessGenerateObjectInstanceWithId () {

        Order order = (Order) IdGenerator.generate( new Order () );

        System.assert ( order.Id != null );

        List<Contract> contracts = new List<Contract> {
            new Contract (),
            new Contract (),
            new Contract ()
        };

        IdGenerator.generate( contracts );

        System.assert ( contracts.get(0).Id != null );
        System.assert ( contracts.get(1).Id != null );
        System.assert ( contracts.get(2).Id != null );

        Account account = new Account ( Id = IdGenerator.generate( Account.getSObjectType().getDescribe().getKeyPrefix() ) );

        System.debug(account.Id);

        Contact contact = new Contact ( Id = IdGenerator.generate( Contact.getSObjectType().getDescribe().getKeyPrefix() ) );

        Opportunity opportunity = new Opportunity ( Id = IdGenerator.generate( Opportunity.getSObjectType().getDescribe().getKeyPrefix() ) );

        User user = new User ( Id = IdGenerator.generate( User.getSObjectType().getDescribe().getKeyPrefix() ) );

        System.debug(user.Id);
        System.debug(UserInfo.getUserId());

    }

    

}