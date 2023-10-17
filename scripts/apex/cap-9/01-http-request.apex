HttpRequest request = new HttpRequest();

request.setEndPoint('https://viacep.com.br/ws/01001000/json/');

request.setMethod('GET');

request.setHeader('Content-Type', 'application/json; charset=utf-8');

Http http = new Http();

HttpResponse response = http.send( request );

if (response.getStatusCode() == 200) {

    System.debug (response.getBody());

}