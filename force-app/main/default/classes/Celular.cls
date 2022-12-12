/**
 * Classe responsável por representar o aparelho de Celular
 * @author: eduardo.bisso
 */
public class Celular {

    public Integer numeroNucleosProcessador;

    public String marca;

    public String fabricante;

    public Long numero;

    public String modelo;

    public Boolean ligado;
    
    public Celular () {

        ligado = false;

    }

    public Celular (Long numero) {
        this.numero = numero; // isso pode Arnaldo?
    }

    public void discar (String numeroDestino) {

        System.debug ('Ligando para ' 
                        + numeroDestino
                        + '\n De : ' + numero
                        + '\n Marca/Modelo : ' 
                        + marca + '/' + modelo);            
    }


    public void enviarMensagem (String numero, String mensagem) {

        System.debug ('Enviado a mensagem para ' 
                        + numero + '\n'
                        + mensagem );            
    }

}