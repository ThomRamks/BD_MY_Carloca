package carloca.entities;

import javax.persistence.*;

@Entity
@Table(name = "CARROS")
public class Carro {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    private String cor;
    private String placa;
    private Integer ano;
    private String montadora;
    private String carro;
    @OneToOne(cascade = CascadeType.MERGE)
    @JoinColumn(name = "TIPO_CARRO")
    private TipoCarro tipoCarro;

    @Override
    public String toString() {
        return
                "'" + montadora + " " +
                        carro + '\'' +
                        ", Cor = '" + cor + '\'' +
                        ", Placa ='" + placa + '\'' +
                        ", Ano = " + ano +
                        ", Tipo de Carro = " + tipoCarro +
                        ", KM Atual = " + kmAtual + " KMs "
                        + " - ID = " + id + " - ";
    }

    @Column(name = "KM_ATUAL")
    private Integer kmAtual;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getCor() {
        return cor;
    }

    public void setCor(String cor) {
        this.cor = cor;
    }

    public String getPlaca() {
        return placa;
    }

    public void setPlaca(String placa) {
        this.placa = placa;
    }

    public Integer getAno() {
        return ano;
    }

    public void setAno(Integer ano) {
        this.ano = ano;
    }

    public String getMontadora() {
        return montadora;
    }

    public void setMontadora(String montadora) {
        this.montadora = montadora;
    }

    public String getCarro() {
        return carro;
    }

    public void setCarro(String carro) {
        this.carro = carro;
    }

    public TipoCarro getTipoCarro() {
        return tipoCarro;
    }

    public void setTipoCarro(TipoCarro tipoCarro) {
        this.tipoCarro = tipoCarro;
    }

    public Integer getKmAtual() {
        return kmAtual;
    }

    public void setKmAtual(Integer kmAtual) {
        this.kmAtual = kmAtual;
    }

}
