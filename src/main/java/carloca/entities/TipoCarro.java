package carloca.entities;

import javax.persistence.*;

@Entity
@Table(name = "TIPOS_CARRO")
public class TipoCarro {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    @Column (name = "TIPO_CARRO")
    private String TipoCarro;

    @Override
    public String toString() {
        return "'" + TipoCarro + '\'' +
                ", Pacote = " + pacote +
                ", Valor diário = R$ " + valor + ",00";
    }

    @OneToOne (cascade = CascadeType.MERGE)
    @JoinColumn (name = "PACOTE")
    private Opcionais pacote;
    private Integer valor;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTipoCarro() {
        return TipoCarro;
    }

    public void setTipoCarro(String tipoCarro) {
        TipoCarro = tipoCarro;
    }

    public Opcionais getPacote() {
        return pacote;
    }

    public void setPacote(Opcionais pacote) {
        this.pacote = pacote;
    }

    public Integer getValor() {
        return valor;
    }

    public void setValor(Integer valor) {
        this.valor = valor;
    }


}
