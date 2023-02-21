package carloca.entities;

import javax.persistence.*;
import java.time.LocalDate;

@Entity
@Table(name = "DADOS_LOCACAO")
public class DadosLocacao {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    @OneToOne(cascade = CascadeType.MERGE)
    @JoinColumn(name = "ID_CARRO")
    private Carro idCarro;
    @OneToOne(cascade = CascadeType.MERGE)
    @JoinColumn(name = "ID_CLIENTE")
    private Cliente idCliente;
    @Column(name = "DATA_INICIO")
    private LocalDate dataInicio;

    @OneToOne(cascade = CascadeType.MERGE)
    @JoinColumn(name  = "ID_UNIDADE_CARLOCA_ORIGEM")
    private UnidadeCarloca idUnidadeCarlocaOrigem;
    private String situacao;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Carro getIdCarro() {
        return idCarro;
    }

    public void setIdCarro(Carro idCarro) {
        this.idCarro = idCarro;
    }

    public Cliente getIdCliente() {
        return idCliente;
    }

    public void setIdCliente(Cliente idCliente) {
        this.idCliente = idCliente;
    }

    public LocalDate getDataInicio() {
        return dataInicio;
    }

    public void setDataInicio(LocalDate dataInicio) {
        this.dataInicio = dataInicio;
    }

    public UnidadeCarloca getIdUnidadeCarlocaOrigem() {
        return idUnidadeCarlocaOrigem;
    }

    public void setIdUnidadeCarlocaOrigem(UnidadeCarloca idUnidadeCarlocaOrigem) {
        this.idUnidadeCarlocaOrigem = idUnidadeCarlocaOrigem;
    }

    public String getSituacao() {
        return situacao;
    }

    public void setSituacao(String situacao) {
        this.situacao = situacao;
    }


}
