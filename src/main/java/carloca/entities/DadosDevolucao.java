package carloca.entities;

import javax.persistence.*;
import java.time.LocalDate;

@Entity
@Table(name = "DADOS_DEVOLUCAO")
public class DadosDevolucao {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    @OneToOne(cascade = CascadeType.MERGE)
    @JoinColumn(name = "ID_DADOS_LOCACAO")
    private DadosLocacao idDadosLocacao;
    @Column(name = "DATA_FIM")
    private LocalDate dataFim;
    @OneToOne(cascade = CascadeType.MERGE)
    @JoinColumn(name  = "ID_UNIDADE_CARLOCA_FIM")
    private UnidadeCarloca idUnidadeCarlocaFim;

    @Column(name = "KM_ATUALIZADO")
    private Integer kmAtual;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public DadosLocacao getIdDadosLocacao() {
        return idDadosLocacao;
    }

    public void setIdDadosLocacao(DadosLocacao idDadosLocacao) {
        this.idDadosLocacao = idDadosLocacao;
    }

    public LocalDate getDataFim() {
        return dataFim;
    }

    public void setDataFim(LocalDate dataFim) {
        this.dataFim = dataFim;
    }

    public UnidadeCarloca getIdUnidadeCarlocaFim() {
        return idUnidadeCarlocaFim;
    }

    public void setIdUnidadeCarlocaFim(UnidadeCarloca idUnidadeCarlocaFim) {
        this.idUnidadeCarlocaFim = idUnidadeCarlocaFim;
    }

    public Integer getKmAtual() {
        return kmAtual;
    }

    public void setKmAtual(Integer kmAtual) {
        this.kmAtual = kmAtual;
    }


}
